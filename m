Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id C17EB65C9C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 17:27:16 +0000 (UTC)
Received: by pdbqd1 with SMTP id qd1so59650070pdb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 10:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VbP9FYm1iQSjInf2LVky3be6TigNC9fEXgavvE2hvGE=;
	b=ERkOvmAwiyZC8U+GL0qqoGaBRYZQMmjMKb4k2EzTS+kzeg1M+idX63c4nUEogEclbN
	l/N2ssR94qzH5wJK8YRxRH20I2ppkNEsidwmhM1fBK2k2hAU3H4TaSXJFt9ual2tedOX
	cuR00HKR+5ws+O+cobprwoethew3PZZLzJcWQPT/uF7bv8ZhLxadHYivjol4g0y798vf
	Y52uLQj5RKgSte+s/ubS7Mme1pgfwi3swQIc86Mfwbp2HwvkK2BalYVHloW4+CT4PD+4
	GAqKzWyBTxkQuyNYa141hkBhYIzUaS8IrX51CNYmekNIDVQD/BBqpuhCO9ic14cmGpVc
	8c6w==
MIME-Version: 1.0
X-Received: by 10.68.247.168 with SMTP id yf8mr47317429pbc.168.1429118837860; 
	Wed, 15 Apr 2015 10:27:17 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Wed, 15 Apr 2015 10:27:17 -0700 (PDT)
In-Reply-To: <CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAJTo0LYB+2tqXJj5KbpCSvW8TyPHeoZo78f9UrK0S6Z9X9MfKA@mail.gmail.com>
	<552E2FBF.9030701@windriver.com>
	<CAJTo0LY=ZiJUSD+gTJqqvok8+RyskJKR0BjvJb0pjR97ZSfrcw@mail.gmail.com>
Date: Wed, 15 Apr 2015 19:27:17 +0200
Message-ID: <CALbNGRQXPWs8TEYpveP7ugcXGuCU0pJfg_1fLZ+aTQc-ZNd7Ng@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 17:27:19 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Apr 15, 2015 at 11:37 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 15 April 2015 at 10:30, Robert Yang <liezhi.yang@windriver.com> wrote:
>>
>> +DEPENDS = "util-macros virtual/egl virtual/libx11"
>
>
> This means we can't build GTK+ without X11 (eg core-image-weston with x11
> removed from DISTRO_FEATURES), as gtk+3 will depend on libepoxy which will
> depend on libx11 which will refuse to build as x11 isn't in DISTRO_FEATURES.
>
> libepoxy does conditional checks so the libx11 dependency can be condtional
> on DISTRO_FEATURES.  That's no idea but better than nothing.
>
> Ross
After all these discussions I remmeber better what I went through
building libepoxy in meta-qt5-extra.
So my first suggestion is back - with the patches in meta-qt5-extra I
have managed to build libepoxy in x-less environments and without
depending on util-macros.

Patch [1]: util-macros no more required in DEPENDS
Patch [2]: allow build for x-less environments

I don't have time to prepare patches, but maybe somebody wants to take a look.

Ahh before I forget: libepoxy should inherit pythonnative - all source
file creation is done by pythonscripts.

Andreas

[1] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-support/libepoxy/files/0001-configure.ac-don-t-rely-on-Xorg.macros.patch
[2] https://github.com/schnitzeltony/meta-qt5-extra/blob/master/recipes-support/libepoxy/files/0002-take-configuration-into-consideration-when-selecting.patch

