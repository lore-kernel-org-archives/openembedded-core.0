Return-Path: <peter@berginkonsult.se>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C70C32772
	for <webhook@archiver.kernel.org>; Tue, 23 Aug 2022 08:57:00 +0000 (UTC)
Received: from mailrelay2-2.pub.mailoutpod1-cph3.one.com
 (mailrelay2-2.pub.mailoutpod1-cph3.one.com [46.30.212.1])
 by mx.groups.io with SMTP id smtpd.web12.29134.1661245017789868854
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Aug 2022 01:56:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@berginkonsult.se header.s=rsa1 header.b=ZoyqCS/K;
 spf=none, err=permanent DNS error (domain: berginkonsult.se, ip: 46.30.212.1,
 mailfrom: peter@berginkonsult.se)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=CD9LwuwLdpdcJa7szNze6twh98rHvEAvTbG5kpHjA6s=;
	b=ZoyqCS/KBgW9301OY0hP1Hl5M9GTtH/PBwXyDg8mr3SyEFZNi10ke4/1uQDyOKXxQvQs+TphP10Fa
	 KWywE3km7IO2azmEBixDwEaSgmNhoGYyQhX0ACJGewB78E1AuEkOxatwDBu29hGyL5iHAIkVpr+EcO
	 TrlDkaZTop9Y21xGUqLbx5EfByb/AFCL4QSBsHQIaSXSJ6yV7Dj2jZSQBZkpEO1iTCoJk6YX7Vajox
	 b8qvY0x9g3INIXKBQw1yhwO9f56M9uTYjPOOvqEVHgkAEomUhbfa+hGM9b8PqYptytGjy6j/C6tR6P
	 HOBGC72ZPMWMFqzN60uPGuh6H0qPn8g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=berginkonsult.se; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=CD9LwuwLdpdcJa7szNze6twh98rHvEAvTbG5kpHjA6s=;
	b=FRFc+IaPSHxMCKw+RdLag3nXic9yvqZJV4MXIFzaJY0ATdtzWDH/dTPEyu4U/UqVRpRD/p0cnQOzs
	 ajq/lmKBw==
X-HalOne-Cookie: 21199ce8f876e1b72a7f6f6023c645cb864517f2
X-HalOne-ID: 87ceadd0-22c1-11ed-a91d-d0431ea8a290
Received: from pbergin-7420.localdomain (unknown [83.218.73.98])
	by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
	id 87ceadd0-22c1-11ed-a91d-d0431ea8a290;
	Tue, 23 Aug 2022 08:56:55 +0000 (UTC)
From: Peter Bergin <peter@berginkonsult.se>
To: openembedded-core@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>
Subject: [PATCH 1/2] packagegroup-rust-cross-canadian: add native compiler
 environment
Date: Tue, 23 Aug 2022 10:56:35 +0200
Message-Id: <20220823085636.30868-1-peter@berginkonsult.se>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Aug 2022 08:57:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169697

When building rust crates it is quite common to have a build script [1]
that is compiled for the host machine and then used during build for target.
Currently when adding packagegroup-rust-cross-canadian this does not work
without having the native compiler and linker added to the SDK.
Add those packages to the packagegroup to make it easier to handle.

The reason for having glibc-dev and libgcc-dev is to have version match
with the used tools. Otherwise it will work on hosts that have compatible
gcc and glibc versions but not on all.

[1] https://doc.rust-lang.org/cargo/reference/build-scripts.html

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
---
 .../packagegroups/packagegroup-rust-cross-canadian.bb         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index 42f85f0eb38..bb10a2d34f2 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -9,6 +9,10 @@ RUST="rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 RDEPENDS:${PN} = " \
     ${@all_multilib_tune_values(d, 'RUST')} \
+    nativesdk-binutils \
+    nativesdk-gcc \
+    nativesdk-glibc-dev \
+    nativesdk-libgcc-dev \
     nativesdk-rust \
     nativesdk-cargo \
     nativesdk-rust-tools-clippy \
-- 
2.34.1


