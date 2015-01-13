Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2B67360167
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 18:47:09 +0000 (UTC)
Received: by mail-oi0-f44.google.com with SMTP id a141so3744742oig.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=1WQ/yCsbUNf2eNP/ARNGL6kkHxytiIGOOh7azMXAc7Q=;
	b=O4O7FjMhh6lDi0pz605xeO8ytpMjSoNoUtXhHs4Js0KbdD2PfoTZE/XhFl+qhmLsye
	V1/eNJ55WB3Vhg3CDwPbx386TuiOk+lFJle/BMyeU/LUSmsxFcMJF3zrK1Hwvls6b3h/
	OXOz7Jm7Q9kRg0JfFqfI1JyGzMqBdqQk6sZ+LqI9+AsqAPTC6wkLWXwvNFcyuaS0eZA2
	UnReXY/oOs82WDFifGv+2eN08eJWcnq90a9Pan+j/Vw6MJxl8KSdcRm60X6mONXvh82+
	62c738n2U8TMJ0qAM0QIldaUxXtHVU/38s+1RxEwyaq3rgFa+7GBzjyTRE8Ks6/YbKqW
	5ySw==
MIME-Version: 1.0
X-Received: by 10.182.197.163 with SMTP id iv3mr22003195obc.64.1421174830002; 
	Tue, 13 Jan 2015 10:47:10 -0800 (PST)
Received: by 10.202.227.10 with HTTP; Tue, 13 Jan 2015 10:47:09 -0800 (PST)
In-Reply-To: <20150113083517.GA9496@ad.chargestorm.se>
References: <1421110587-23245-1-git-send-email-armccurdy@gmail.com>
	<20150113083517.GA9496@ad.chargestorm.se>
Date: Tue, 13 Jan 2015 10:47:09 -0800
Message-ID: <CAJ86T=XRTEYnzfPWJPR_AY9rUvE0QrH+4Wy6jZd2Qx6v-Ehx=Q@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] logrotate: fix missing acl and libselinux dependencies
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
X-List-Received-Date: Tue, 13 Jan 2015 18:47:14 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 13, 2015 at 12:35 AM, Anders Darander <anders@chargestorm.se> wrote:
> * Andre McCurdy <armccurdy@gmail.com> [150113 01:57]:
>> +# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
>> +# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
>
> It might well be worth adding autotools support right now.
>
>>  DEPENDS="coreutils popt"
>
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
>> @@ -21,6 +24,9 @@ PACKAGECONFIG ?= "\
>>      ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>>  "
>
>> +PACKAGECONFIG[acl] = ",,acl"
>> +PACKAGECONFIG[selinux] = ",,libselinux"
>
> The problem with these two lines, are that you're not explicitly
> enabling and disabling those two features; thus our builds won't be
> deterministic.

Currently the configure task for logrotate is a no-op, so the normal
way of constructing a configure command line via PACKAGECONFIG doesn't
work.

We do however need to include acl and libselinux in DEPENDS if enabled
- which wasn't happening before and is what the patch attempts to fix,

There are no floating dependencies since acl and selinux are enabled
explicitly during compile, by options passed on the make command line
via EXTRA_OEMAKE.

> Depending on how the actual tests are performed in the logrotate
> sources, it might happen that you're enabling the features just by
> making sure that they're going to be built prior to logrotate. Though,
> there's no guarantee that this will work (without looking at the source
> code).
>
> However, if that enabling works, then we have the problem that the
> features will always be activated regardless of whether we add acl and
> selinux to PACKAGECONFIG, if these exists in the sysroot. Thus, the
> build is undeterministic.
>
> Could you please look at enabling / disabling those features explicitly?
>
> Cheers,
> Anders
> --
> Anders Darander
> ChargeStorm AB / eStorm AB

