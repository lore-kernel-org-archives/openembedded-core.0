Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f182.google.com (mail-vc0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 465F9605F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 23:50:00 +0000 (UTC)
Received: by mail-vc0-f182.google.com with SMTP id hf12so3395969vcb.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 16:50:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=q55ElWw72y0HrVVvfL384WYK3ksyG9hyH9gGIhQ3OCM=;
	b=Ktk696waBs/9B8W2eqNaPlkNAM0BsUEMeI8sXBPg04PtWKodchRgvYn7WTQkxnws7c
	OnYA/cIyxiGgK+Jix86KW2TKZ8h3R9nkFYIMxWkv1ZKGQXgRYh+59WVztl6HSpldbyeb
	SDhgPuLm4nSboXuOk1UrmQQp2XX9TKen/w6NeqYckJnZZc3QZ92fnUkrdMne78DSQ5jk
	3O2N7Z3QZrvPHVvBEP3RTlhYZfg5XFz776Ts6humFFO7x0OChZ3cJsjC0k8OxZE8QTRP
	/krmWkzf3Dc2mLW9VzFa1cByqYvrNc016JJul1sJa9xTcu3OcrBh4CDqphojDNJda4n+
	8a1Q==
X-Gm-Message-State: ALoCoQk0T9jg+E3gX2Dd8140uVC4Zx/JuXGueniutMDMjfH5IgxU5MyKaqdXQ4crjNKawt9vZALx
X-Received: by 10.58.136.4 with SMTP id pw4mr29814670veb.10.1379375401718;
	Mon, 16 Sep 2013 16:50:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 16 Sep 2013 16:49:41 -0700 (PDT)
In-Reply-To: <CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
References: <cover.1379148332.git.liezhi.yang@windriver.com>
	<3b4c037e41f6678845fb29d97aae5f48f07a68c7.1379148332.git.liezhi.yang@windriver.com>
	<CAJTo0LbRYeWRB-zOb3NvyH3ZtsOyQMeqKmm8a7xLCs7mpeG-jA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Sep 2013 00:49:41 +0100
Message-ID: <CAJTo0LZPhGjLrffo3coy_GSWLF+XhHpgyE6zTUxsPU30S72Z9Q@mail.gmail.com>
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
X-List-Received-Date: Mon, 16 Sep 2013 23:50:01 -0000
Content-Type: text/plain; charset=UTF-8

On 17 September 2013 00:08, Burton, Ross <ross.burton@intel.com> wrote:
>> This is a race issue, the _gen/gtypes.h and _gen/gtypes-body.h may
>> write(remove/rename) _gen/gtypes.tmp at the same time, then there would
>> be the error.
>>
>> Use ".NOTPARALLEL: _gen/gtypes.h _gen/gtypes-body.h" will fix the
>> problem.
>
> This is going to be a game of whack-a-mole as the root cause is the
> bad temporary filename assignment in libtpcodegen.py.  Is there an
> upstream bug for this?

Had a quick look - there's a trivial race in the utility code that a
bit of tempfile can fix, but the more correct fix for
telepathy-mission-control is to do the same fix that telepathy-glib
did here:

http://cgit.freedesktop.org/telepathy/telepathy-glib/commit/?id=36c2a545c9c1d1cc6db205bfc33d980d29b0a0f6

https://bugs.freedesktop.org/show_bug.cgi?id=69446 is the upstream bug
I just filed for this.

Ross

