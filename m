Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4D7056158F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 11:12:59 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hf12so3780876vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 04:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gBVEu1qOcyZ6x85OiLqJEhuR+C18yr+71N8fR7dWZeY=;
	b=W2nJ8EMV2XTRg114ivDPFETaBOEGunccWjDJvIOZC4a6RZHAXnkmWb4cgnDTo1jemx
	DwH+nwADSOJVuzV8SLM6UZFDYId3T6+QSwU4XpUp9kju2msUREehWAgnNbOOcxfWIRia
	Mn4JhWxonwH6f1ligHCZ6m2qoLMaAOf6rT7/BKAClzJffKGvabiCvfVCRBDm0p9VYQr+
	ih2PUeIQXwGV5XjN9pv/L9qqJzokquyZdTdPzqw+8DNDiYK8srMESCIaNDxcegsGU++T
	2+KPvsDB8n8+T5JpirRJzW+/avCCAX+rljKbye0Ajo7AbHEc1Ek18vk6ox7nsj6HIiJJ
	2ZPg==
X-Gm-Message-State: ALoCoQmyEZyu7MB98ec/lCfebwd6Oqia3Y4jhR2EWw2KuKSk+JOVBxhLni3cm6ie76P2zxsIHrMq
X-Received: by 10.221.64.17 with SMTP id xg17mr31822565vcb.5.1379416380887;
	Tue, 17 Sep 2013 04:13:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 17 Sep 2013 04:12:40 -0700 (PDT)
In-Reply-To: <5237B876.2080203@windriver.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
	<CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
	<CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
	<5237B876.2080203@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 12:12:40 +0100
Message-ID: <CAJTo0LY2DZn2WBhQMZiBe1KFHnpZwT+C6u742reGvE3GLY4LnQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] telepathy-mission-control: do_compile failed (race issue)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Sep 2013 11:12:59 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2013 03:03, Robert Yang <liezhi.yang@windriver.com> wrote:
> I don't think that the commit you mentioned is a correct fix, he changed:
>
> gen/gtypes.h _gen/gtypes-body.h: _gen/stable-spec.xml
>
> To:
>
> gen/gtypes.h: _gen/gtypes-body.h
>         @:
> gen/gtypes-body.h: _gen/stable-spec.xml
>
> Now if we run "make gen/gtypes.h gen/gtypes-body.h", the gen/gtypes-body.h
> will only run once, this is incorrect.

But the Python script used in the second rule generates *both* files,
which is why the current rules in telepathy-mission-control are
incorrect:

~/Local/mess/37/telepathy-mission-control/src
$ ls _gen/gtypes*
_gen/gtypes-body.h  _gen/gtypes.h

~/Local/mess/37/telepathy-mission-control/src
$ rm _gen/gtypes* -f

~/Local/mess/37/telepathy-mission-control/src
$ make _gen/gtypes.h
/usr/bin/python ../tools/glib-gtypes-generator.py \
_gen/mcd.xml _gen/gtypes mc

~/Local/mess/37/telepathy-mission-control/src
$ ls _gen/gtypes*
_gen/gtypes-body.h  _gen/gtypes.h

The anti-pattern of:

foo bar:
  this-script-generates-both-files.sh

is wrong in parallel builds.

Ross

