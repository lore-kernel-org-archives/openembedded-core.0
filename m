Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0CFDF766E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 09:28:57 +0000 (UTC)
Received: by iods203 with SMTP id s203so14010622iod.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Aug 2015 02:28:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:content-type:mime-version
	:content-transfer-encoding;
	bh=YxJfcP+gYbNac+jP98XfcVYebnflNyQ3eW0Uf4dJ39Q=;
	b=hgL+C+TMfUK+9QH4IeyyVxggRSEl9Vb7b7UVkMlv3qgO4JP4YH5ciNpxB795rTA1SI
	8c6cQ7jlLCKxx4EgUGDp1ZNMxgpfoNodajCyqSua4Cebgv1/Frh9NFh6cQ0bxQpP1yVK
	JBdlzfEhW4OM+uPcwwXoF4N4KrEvvxG8DRiorIilNC4WTEPAfP405FJf2/g3Gb0CkBLe
	72Qqzno5sxMGOMtwP82aHh1+7zsZAz68AHqd+Y45HubPpvrMw4NGNySFPuA5SUr5SrlM
	bqLz7vKBGFGDVkcmt/SfJfa3eGzOBOqG2CfKnso0WfcmvqaAwur6YS3rmTwnNYJ3pfyO
	Iqeg==
X-Gm-Message-State: ALoCoQmLPf0Z4YfNqR2k9RzwqPZZ7pJRqg1DFqCN9nACsSeDxRTa6xt1bfFc5QuuKXBen5UqBgek
X-Received: by 10.107.9.11 with SMTP id j11mr20256667ioi.191.1439371737385;
	Wed, 12 Aug 2015 02:28:57 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8D086.dip0.t-ipconnect.de. [93.232.208.134])
	by smtp.gmail.com with ESMTPSA id r8sm3500426ioi.10.2015.08.12.02.28.54
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 12 Aug 2015 02:28:55 -0700 (PDT)
Message-ID: <1439371732.28153.27.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 12 Aug 2015 11:28:52 +0200
In-Reply-To: <CAJTo0LZSK7oknJ5taH4J2ma-5hMqWSCbW2qZnOcfzjh3g26kSw@mail.gmail.com>
References: <cover.1439281753.git.patrick.ohly@intel.com>
	<CAJTo0LZSK7oknJ5taH4J2ma-5hMqWSCbW2qZnOcfzjh3g26kSw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] preserve xattrs in images
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
X-List-Received-Date: Wed, 12 Aug 2015 09:28:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-08-11 at 15:29 +0100, Burton, Ross wrote:
> Hi Patrick,
> 
> On 11 August 2015 at 09:44, Patrick Ohly <patrick.ohly@intel.com>
> wrote:
>         The default does not get changed because supporting xattrs
>         causes a
>         certain overhead (need to build GNU tar, additional system
>         calls when
>         creating the images).
> 
> 
> Two questions:
> 1) Do enough host distributions not enable xattrs in tar that we need
> to depend on tar-replacement-native?

Yes, some of the currently supported host distributions (like Debian 7)
have a GNU tar which is too old.

> 2) Have you timed the overhead of enabling xattr archiving on an image
> that doesn't use xattrs?  (subtext: does this need to be an option).

I hadn't, because my concern was that there might be other build
configurations (for example, with less RAM for the page cache) where the
effect will be more pronounced than on my own system.

Anyway, some benchmark data: with a rootfs of around 400MB and 14000
files and directories and xattrs on all regular files, "tar
-cf /dev/null" takes around 1s wall clock time when the entire rootfs
tree is already in the page cache. With archiving xattrs, it is around 3
seconds. If there no xattrs on the file, that last value drops a bit to
something between 2 and 3.

So the relative runtime overhead is noticeable, but it is negligible in
absolute terms.

More important is that GNU tar needs to be built. That takes about a
minute of wall clock time here (most of it in configure, actual
compilation is parallel and fast thanks for many cores).

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




