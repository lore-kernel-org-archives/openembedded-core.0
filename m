X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: RFC [v2]: Make kernel upgrades via dnf work like on Red Hat
Date: Wed, 29 Sep 2021 07:33:51 +0200
Message-Id: <20210929053353.600644-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

I have observed two issues when upgrading to kernel versions
successively.

One is that when installonly_limit is reached in dnf, only the
main kernel package was removed. Patch 1 fixes this by adding
extra RDEPENDS to the kernel subpackages on the main kernel package.
This circular dependency helps dnf to remove all subpackages.

dnf.conf settings "installonlypkgs", "installonly_limit" and
others are documented at https://dnf.readthedocs.io/en/latest/conf_ref.html

The second issue is that when the oldest kernel version is
removed by dnf, the /boot/bzImage symlink is also gone.

Fix this by using update-alternatives instead of hardcoded ln -s
and rm -f. This is configurable via a new variable.

This is only an RFC at this point, because
1) The first fix is only applied in the KERNEL_SPLIT_MODULES=0 case,
   it may need its own knob or applied unconditionally.

2) There's an extra issue I found while implementing the second patch:
   instead of using KERNEL_VERSION, I had to resort to using PV
   because the former is dynamically set via a python function
   and it changes its value at some point between build phases.
   AFAIK, there are kernel recipes out there using only the major
   version with two numbers in PV instead of the full version triplet.
   I can live with this as my kernel recipe uses the version triplet.

3) The new knob name for patch #2 is KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES.
   It is admittedly too chatty, it can be renamed if someone suggests
   a better name.

Please advise how to fix and make it final so these fixes can be
accepted into openembedded-core.

Best regards,
Zoltán Böszörményi


