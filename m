Return-Path: <pavel@zhukoff.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A07C433EF
	for <webhook@archiver.kernel.org>; Sun, 17 Jul 2022 20:09:37 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by mx.groups.io with SMTP id smtpd.web12.19531.1658088571170118236
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Jul 2022 13:09:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@zhukoff.net header.s=fm3
 header.b=Wwvb319s;
 spf=pass (domain: zhukoff.net, ip: 64.147.123.24,
 mailfrom: pavel@zhukoff.net)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.west.internal (Postfix) with ESMTP id 2426932004ED;
	Sun, 17 Jul 2022 16:09:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 17 Jul 2022 16:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zhukoff.net; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1658088569; x=1658174969; bh=ezZSlUQdTGHnyPFsBw5DcqZEk
	xLaZV+S9/X6Yt+71Qk=; b=Wwvb319s7CPUjcgySl6+cKNnRjEPfTpmEV6SbPNNi
	t2VwUjPWvmx2+mvh9FwDsTW5h1wWzRku3/+4dMwzJ7v8P4Q9Ycz79MMqfmWFMn2s
	xASqt9SLwEmxDWtL+23MmChE1owLQ5U09RFQX6TVVjQ12SxTzShNVEvbRclbfC6l
	1YziRk5XcyPs49YctqxWdo/wMmHw9EQoKyTQP0XJ26sdtivG+1bFBTqYS+udZOLh
	lSrVjtIXaA/94COClE06fpi+gGDyKrBHW45tE3/Sds/3RPKnubrCvzxcqpFwgpV9
	h540l867Mr6AtZfnVC2loYhf2JqM/1zVQcgCC0Vzp41SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1658088569; x=1658174969; bh=ezZSlUQdTGHnyPFsBw5DcqZEkxLaZV+S9/X
	6Yt+71Qk=; b=fODrD3W6RH5gQs6nhnmRQJJrKEAB3MW4O5ysiod8Rq4g4S87kkV
	zWIFEIDU6ctgK2f2LscX+Yuhpsfm+8/TL4lTtuBc8dAGQ7QqjEGVFtleQQpv9vF8
	+egvd8Q9GbXLScpHCTPbMXfAuxXoEWuYy57fd/N+uAD7RFmjvGwO5W2UiSlhp2Zc
	3d3oNLLRzH+I5ZMwjOeONo+KGOYP7KWyaASIGOO5hM64Nwa1luT2ahN0g9W3zCiH
	GBjANPm+iMtjld/uJ0T8avoIhQkK90UjAPLigzDT5cXUH3X1bRTi4DKuGDG8Zfyn
	BDowaWk74oKDj6HwTbFqB+vYUsQ3kRe84JQ==
X-ME-Sender: <xms:eWzUYpLwTB_CMTRT8_RpJfk-uMzmXZXJg5ovJHo87vJeRlKLZGwuRA>
    <xme:eWzUYlK2cx6U4EEGcB_O4lUdBKk-MBTTVGye-GzcoVGx_m7lN04RJ0PiqDP8SHqmG
    qqjrbzW0t2E46DhKJE>
X-ME-Received: 
 <xmr:eWzUYhulChR4EocHaIApRYPBq1JMLVz2RiJ6ZHzSkEsdfq-ewG9Lvfer-DUbQoHJtq0OfDkGXr4XNY6BlD94SAw>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudekiedgudegjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefrrghvvghl
    ucgkhhhukhhovhcuoehprghvvghlseiihhhukhhofhhfrdhnvghtqeenucggtffrrghtth
    gvrhhnpedtveetkeejudduhefhtdfhtefhvdffheelffdtffeileefudelieeuffdvffdt
    ieenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepphgrvhgvlhesiihhuhhkohhffhdrnhgvth
X-ME-Proxy: <xmx:eWzUYqb6pfxxV4Db6Gf_QtmNsbJRgQg8uGBHXblUt_n1LM8OXB5fjw>
    <xmx:eWzUYgahKPMZy-E5jwFURihG3N5rQSMqxJdPV29A6jYv76kGVrtxkA>
    <xmx:eWzUYuCPZi90AKViT4H8PhCF-3hYwUo-r2Ba0OBnfBEDqK4uyGWyog>
    <xmx:eWzUYvmI6FD8omLZEFj-yNP_X8N0BnyS4cLTmsGU3vS4n4PyeiUthA>
Feedback-ID: ib94946c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 17 Jul 2022 16:09:28 -0400 (EDT)
From: Pavel Zhukov <pavel@zhukoff.net>
To: openembedded-core@lists.openembedded.org
Cc: Steve Sakoman <steve@sakoman.com>,
	pavel@zhukoff.net,
	Pavel Zhukov <pavel.zhukov@huawei.com>
Subject: [kirkstone][PATCH] harfbuzz:  Fix compilation with clang
Date: Sun, 17 Jul 2022 22:07:18 +0200
Message-Id: <20220717200717.16540-1-pavel@zhukoff.net>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Jul 2022 20:09:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168163

Fixup commit for prevous CVE-2022-33068 fix.

Fixes:
| In file included from ../harfbuzz-4.0.1/src/hb-ot-face.cc:39:
4429| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: error: use of bitwise '|' with boolean operands [-Werror,-Wbitwise-instead-of-logical]
4430|       if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
4431|           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
4432|                                    ||
4433| ../harfbuzz-4.0.1/src/hb-ot-color-sbix-table.hh:301:11: note: cast one or both operands to int to silence this warning
4434| 1 error generated.

Signed-off-by: Pavel Zhukov <pavel.zhukov@huawei.com>
---
 .../harfbuzz/0001-Fix-conditional.patch       | 25 +++++++++++++++++++
 .../harfbuzz/harfbuzz_4.0.1.bb                |  3 ++-
 2 files changed, 27 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
new file mode 100644
index 0000000000..0f9b86973b
--- /dev/null
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
@@ -0,0 +1,25 @@
+From e421613e8f825508afa9a0b54d33085557c37441 Mon Sep 17 00:00:00 2001
+From: Behdad Esfahbod <behdad@behdad.org>
+Date: Wed, 1 Jun 2022 09:07:57 -0600
+Subject: [PATCH] [sbix] Fix conditional
+
+Signed-off: Pavel Zhukov <pavel.zhukov@huawei.com>
+Upstream-Status: Backport [e421613e8f825508afa9a0b54d33085557c37441]
+
+---
+ src/hb-ot-color-sbix-table.hh | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/hb-ot-color-sbix-table.hh b/src/hb-ot-color-sbix-table.hh
+index 6efae43cda..d0e2235fb2 100644
+--- a/src/hb-ot-color-sbix-table.hh
++++ b/src/hb-ot-color-sbix-table.hh
+@@ -298,7 +298,7 @@ struct sbix
+ 
+       const PNGHeader &png = *blob->as<PNGHeader>();
+ 
+-      if (png.IHDR.height >= 65536 | png.IHDR.width >= 65536)
++      if (png.IHDR.height >= 65536 || png.IHDR.width >= 65536)
+       {
+ 	hb_blob_destroy (blob);
+ 	return false;
diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
index 81518a53ea..e18727bcfc 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_4.0.1.bb
@@ -12,7 +12,8 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz\
-           file://CVE-2022-33068.patch"
+           file://CVE-2022-33068.patch
+           file://0001-Fix-conditional.patch"
 SRC_URI[sha256sum] = "98f68777272db6cd7a3d5152bac75083cd52a26176d87bc04c8b3929d33bce49"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
-- 
2.35.1


