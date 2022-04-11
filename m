X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Ferry Toth" <fntoth@gmail.com>
Subject: package_manager: support for signed DEB package feeds
Date: Mon, 11 Apr 2022 22:42:21 +0200
Message-Id: <20220411204221.8126-1-fntoth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, Xavier Berger <xavier.berger@biologic.net>, Alexander Kanavin <alex@linutronix.de>

[PATCH v3 1/1] apt: add apt selftest to test signed package feeds

Since Gatesgarth apt (1.8.2) has become more strict and doesn’t allow unsigned repositories by default.
Currently when building images this requirement is worked around by using [allow-insecure=yes] and
equivalently when performing selftest.
    
Patches "gpg-sign: Add parameters to gpg signature function" and "package_manager: sign deb package feeds"
(in master) enabled signed deb package feeds. 

This patch adds a runtime test for apt derived from the test_testimage_dnf test. When called from 
`oe-selftest -r runtime_test.TestImage.test_testimage_apt` it creates a signed deb package feed, 
runs a qemu image to install the key and performs some package management. To be able to install 
the key the gnupg package is added to the testimage.

Changes in V3:
 - Changed to original behavior when called from `bitbake core-image-sato -c testimage` and no 
   signed feed was created (Richard Purdie)

Changes in V2:
 - Added runtime test for signed deb package feeds (Richard Purdie)

