X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: RFC [v3]: Make kernel upgrades via dnf work like on Red Hat
Date: Thu, 30 Sep 2021 16:14:42 +0200
Message-Id: <20210930141444.698139-1-zboszor@pr.hu>
In-Reply-To: <16A93426652F9306.27626@lists.openembedded.org>
References: <16A93426652F9306.27626@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>, Bruce Ashfield <bruce.ashfield@gmail.com>, Richard Purdie <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>

I have observed two issues when upgrading kernel versions
successively.

One is that when installonly_limit is reached in dnf, only the
main kernel package was removed. Patch 1 fixes this by adding
extra RDEPENDS to the kernel subpackages on the main kernel package.
This circular dependency helps package managers to remove all subpackages.
Only rpm packages was build tested, the dependencies are in place for
both 0 and 1 for KERNEL_SPLIT_MODULES. dnf upgrade is doing the
right thing now with removing all subpackages of the oldest
kernel version.

dnf.conf settings "installonlypkgs", "installonly_limit" and
others are documented at https://dnf.readthedocs.io/en/latest/conf_ref.html

The second issue is that when the oldest kernel version is
removed by dnf, the /boot/bzImage symlink is also gone.
It seems that with dnf, postrm of the old version is run later
than postinst of the new one.

Fix this by using update-alternatives instead of hardcoded ln -s
and rm -f. This is configurable via a new variable.

This is still an RFC.

1) The first fix is applied in both cases of KERNEL_SPLIT_MODULES=0 and 1.
   It's applied unconditionally.

2) The new knob name for patch #2 is KERNEL_IMAGEDEST_USE_UPDATE_ALTERNATIVES.
   It is admittedly too chatty, it can be renamed if someone suggests
   a better name.

2) There's an extra issue I found while implementing the second patch:
   even with moving generating the alternative priority value to
   a python function and using a non-expanded substitution, it's
   still expanded during early parsing. The result is thrown away
   so it doesn't cause basehash issues, but still, the function
   needs to protect itself against KERNEL_VERSION being unset.

Please comment.

Best regards,
Zoltán Böszörményi


