Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 222A2770EE
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 10:20:01 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id b35so218716719qge.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=zlssQ+ljclRPlhw9ByoE8Xi+4wyQNFopMv0tORzh6RQ=;
	b=NwgNRcL0ZqVW2D7CEATH3Zg9yO3a/MkgfoOpf6mOoeU8DMNWFvkRjGqrcxRBubnZVV
	kb/Khnjjg2J5BWOC9pniLgKc67tFdsnJ0T+fETG2PUyazT9gaYS3fmI0BhHpET1r3pzI
	9B2XPIYLCn2tGcufo7OspbTJeuUJNYWy0cpzh8TwnTcvjdSihlOAHEX60L8nYc5w+Lpj
	gEMFcgcnDGrESiKx825G6X7fa5hsrHZ6fAfryet8PrUjPZMv3IFeXDxSd6zdP6N9CfRW
	A/OFao8RIoFhnuJ1rcHJ3zsgKDYUpYiTTbAv5kjIqof60nBnsJnwF0+JxStrk2iY2NaS
	OaOw==
X-Received: by 10.140.159.194 with SMTP id f185mr6236721qhf.72.1452248402708; 
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	d129sm48549987qka.31.2016.01.08.02.20.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 Jan 2016 02:20:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  8 Jan 2016 10:19:20 +0000
Message-Id: <57a2344d28477ff6ae8943214cf7a97104497aa8.1452248145.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
References: <604bc7909e229178e6723a5323f99ae33cf7ec7f.1452248145.git.raj.khem@gmail.com>
In-Reply-To: <cover.1452248145.git.raj.khem@gmail.com>
References: <cover.1452248145.git.raj.khem@gmail.com>
Subject: [PATCH 52/53] portmap: Point to tirpc headers and libraries on musl
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
X-List-Received-Date: Fri, 08 Jan 2016 10:20:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-connectivity/portmap/portmap_6.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/portmap/portmap_6.0.bb b/meta/recipes-connectivity/portmap/portmap_6.0.bb
index e727fe3..999b4a9 100644
--- a/meta/recipes-connectivity/portmap/portmap_6.0.bb
+++ b/meta/recipes-connectivity/portmap/portmap_6.0.bb
@@ -1,5 +1,7 @@
 require portmap.inc
 
+DEPENDS_append_libc-musl = " libtirpc "
+
 PR = "r9"
 
 SRC_URI = "http://www.sourcefiles.org/Networking/Tools/Miscellanenous/portmap-6.0.tgz \
@@ -19,6 +21,8 @@ PACKAGECONFIG[tcp-wrappers] = ",,tcp-wrappers"
 CPPFLAGS += "-DFACILITY=LOG_DAEMON -DENABLE_DNS -DHOSTS_ACCESS"
 CFLAGS += "-Wall -Wstrict-prototypes -fPIC"
 EXTRA_OEMAKE += "'NO_TCP_WRAPPER=${@bb.utils.contains('PACKAGECONFIG', 'tcp-wrappers', '', '1', d)}'"
+CFLAGS_append_libc-musl = " -I${STAGING_INCDIR}/tirpc "
+LDFLAGS_append_libc-musl = " -ltirpc "
 
 do_install() {
     install -d ${D}${mandir}/man8/ ${D}${base_sbindir} ${D}${sysconfdir}/init.d
-- 
2.7.0


