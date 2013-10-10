Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 71C906CF23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 14:22:15 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id hu8so1689253vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 07:22:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Yz0ecL8e6geQtldWhLF12n09avn74rCVTAuK/mz/xo4=;
	b=OZW3aXUVW+l6mdrv2Ua+J4ppwJ3T2KeHt9EKvJfJyjeUIV1GbRPXZC0cMYbUSfWn+p
	oOsvmU6NmZQei8NiPRnzI2Bk6kAZlBRxwkZzdevxLyOapas06lQXMtV8uVGAxfzWQ+vq
	VijDNFcnbzL85j/MYG4hbC7tYDqwl7o0KFg8nqkcRQq9cV2ZgI46zixLzDxtDFPHkbpo
	NSD2GChbIsoRz62/GzWovX7tkHniV1K1Gb4hqsg3m3+iyaIOJNHS0DE9aU2Nu06eIBB6
	jlVi9XlCOl2UC7Mzwn/u3a9+uFV+ktAac5yIaIqD72oiwJRvmhnGizKTds3pJgMB2A/F
	PBPw==
X-Gm-Message-State: ALoCoQmiGAtT+3goE0JGWCgO59kgdHSHJg3nlmSf2NSVSjwU6Kjrk5J/pKkpZC5p19Z7PNYuAy6L
X-Received: by 10.52.98.66 with SMTP id eg2mr11799433vdb.24.1381414936817;
	Thu, 10 Oct 2013 07:22:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 10 Oct 2013 07:21:56 -0700 (PDT)
In-Reply-To: <1381407802-16852-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1381407802-16852-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
	<1381407802-16852-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 10 Oct 2013 15:21:56 +0100
Message-ID: <CAJTo0Lbrxo53NLmNgK0Ur9vSbJFUqX1XXJ1PiMKebmYTVA_fcQ@mail.gmail.com>
To: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 2/2] weston : Bump to 1.2.0 version
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
X-List-Received-Date: Thu, 10 Oct 2013 14:22:15 -0000
Content-Type: text/plain; charset=UTF-8

On 10 October 2013 13:23, Ewan LE BIDEAU-CANEVET
<Ewan.LEBIDEAU-CANEVET@eurogiciel.fr> wrote:

Apologies if the formatting is messed up here, the patch wasn't sent
with -M so I had to re-generate the diff and manually add quotation
marks.

> SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
>            file://install-examples.patch \
>-           file://weston-launch-shell.patch \
>-           file://groups.patch \
>            file://weston.png \
>            file://weston.desktop"

When removing patches, please say why.

>-DEPENDS += "wayland virtual/mesa virtual/egl pango"
>-
>+DEPENDS += "wayland mesa virtual/egl pango"

You've probably inadvertently reverted a fix here: the dependency
should be virtual/mesa.

>+BBCLASSEXTEND = "native"

Why do you need a native weston?

>-                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
>-PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev mesa mtdev"
>+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
>-# weston-launch
>-PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
>+

Another revert.

This is why we ask for patches with -M: it makes it easy to see what
the changes are.  In this case there are several fixes lost that were
made in between your original change and the re-submission

Ross

