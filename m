Return-Path: <asb@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7761BD29FE2
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 10:27:23 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7181.1768386441424287364
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 02:27:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=fiF921Lf;
 spf=pass (domain: igalia.com, ip: 213.97.179.56, mailfrom: asb@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=bRnDbWp35AdeuIaCVgr5uRLLi3XgyHftnh0rt3IStVo=; b=fiF921LfhnP0R9WR0x2fk6FSg+
	LhoOPBk0X3cwkJ1I0FfjOZ6l77MeKqC8qWM1W3Ri+x6iQup6odH6RiLxCy7S6tXmYiHsTzHfDxNBE
	OS5k3kMURSvt3F00P+Fy2PqmoQdBPNp0ufxvYeOURQWiwY5cmdnJl6kUvihWF69t9geVfiwEXaxC3
	VtMmMvpGTIMA3gI+JHOqcCdZ0a7Vex4IPQDYGDyhEfeNIkJ73j/m4ygLw3hhM1qcLAYw5f5/Lg6kp
	wPYD1mn1X6bkMMvRLNgnwuHw/zWTWax8t3y0k3FzfXdOpp3555WSMubwOYiW8IbQWDyD5f5JeQWo/
	/RBY+uow==;
Received: from 82-69-92-151.dsl.in-addr.zen.co.uk ([82.69.92.151] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vfy5u-005EQB-1e; Wed, 14 Jan 2026 11:27:18 +0100
From: Alex Bradbury <asb@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Bradbury <asb@igalia.com>
Subject: [PATCH] runqemu-extract-sdk: support tar.zst format
Date: Wed, 14 Jan 2026 10:26:11 +0000
Message-ID: <20260114102611.831284-1-asb@igalia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 10:27:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229316

Building `core-image-minimal-dev` with Poky Whinlatter, the rootfs
tarball is compressed with zstd by default, meaning this script won't
work out of the box with it.

Signed-off-by: Alex Bradbury <asb@igalia.com>
---
 scripts/runqemu-extract-sdk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu-extract-sdk b/scripts/runqemu-extract-sdk
index db05da25f2..528ef76430 100755
--- a/scripts/runqemu-extract-sdk
+++ b/scripts/runqemu-extract-sdk
@@ -52,12 +52,15 @@ fi
 if [[ "$ROOTFS_TARBALL" =~ tar\.gz$ ]]; then
 	TAR_OPTS="--numeric-owner -xzf"
 fi
+if [[ "$ROOTFS_TARBALL" =~ tar\.zst$ ]]; then
+	TAR_OPTS="--numeric-owner --zstd -xf"
+fi
 if [[ "$ROOTFS_TARBALL" =~ \.tar$ ]]; then
 	TAR_OPTS="--numeric-owner -xf"
 fi
 if [ -z "$TAR_OPTS" ]; then
 	echo "Error: Unable to determine sdk tarball format"
-	echo "Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz"
+	echo "Accepted types: .tar / .tar.gz / .tar.bz2 / .tar.xz / tar.zst"
 	exit 1
 fi
 
-- 
2.52.0


