X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Subject: RFC: Make kernel upgrades via dnf work like on Red Hat
Date: Tue, 28 Sep 2021 16:10:46 +0200
Message-Id: <20210928141048.576425-1-zboszor@pr.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

I have observed two issues when upgrading to kernel versions
successively.

One is that when installonly_limit is reached in dnf, only the
main kernel package was removed. Patch 1 fixes this by adding
extra RDEPENDS to the kernel subpackages on the main kernel package.
This circular dependency helps dnf to remove all subpackages.

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

Please advise how to fix and make it final so these fixes can be
accepted into openembedded-core.

Best regards,
Zoltán Böszörményi


