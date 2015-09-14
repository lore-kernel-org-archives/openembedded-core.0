Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id DB8BE76FED
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 16:31:35 +0000 (UTC)
Received: by qgev79 with SMTP id v79so119335645qge.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=NTPuxHOy0aOps9Z9Ou6ydhaCf0g9PoCrgpqwVobwGrQ=;
	b=DrCFsSrbmRR1uZUlr7WWdr5vm38zXFnQbUWpkwBgwLAAU1cAqaQ6Ebibtqd54cm7DT
	17fAH/9z9D3VUrbNnNHu5YP1BkcOU5D8v8h6VeIbRrVuHHDnt5Ovh0unmIWhgn4gRy+x
	/E8SXkWP5L1fxdmBZEqKGnuZjiqdUaF2L72UHtJuzps3wyTko/lXQpGKaq4y7M6rBIDH
	RKipc9vsn2Eu8a/7vxOXyCso0zDSk1d8rQDGS2oZ7NxnIEcxW9IS/qTVu+acXogEsYA2
	i4vYkwZWPGA07Dm0omj6YZcSzx38quIDsDKp67ir68Rr+x7J94qO+YQM2KmP4L9FcG4s
	vzlQ==
X-Received: by 10.140.234.78 with SMTP id f75mr24931213qhc.20.1442248295784;
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w138sm6172059qkw.40.2015.09.14.09.31.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 09:31:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 16:31:24 +0000
Message-Id: <1e0bbf9af05b607f0cdcf6952539e5ff1e90854e.1442248108.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
References: <cd66976d7a276b7c39d20f37242c7331386b301e.1442248108.git.raj.khem@gmail.com>
In-Reply-To: <cover.1442248108.git.raj.khem@gmail.com>
References: <cover.1442248108.git.raj.khem@gmail.com>
Subject: [PATCH 09/12] quota: Replace using -I= with STAGING_INCDIR
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
X-List-Received-Date: Mon, 14 Sep 2015 16:31:36 -0000

-I= is gcc specific, using STAGING_INCDIR makes it compiler independent
Update posix types patch to include new u_int -> uint32_t changes

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../quota/quota/remove_non_posix_types.patch                | 13 +++++++++++++
 meta/recipes-extended/quota/quota_4.02.bb                   |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
index 5442d98..06ff13c 100644
--- a/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
+++ b/meta/recipes-extended/quota/quota/remove_non_posix_types.patch
@@ -183,3 +183,16 @@ Index: quota-tools/quot.h
  } du_t;
  
  #define	NDU	60000
+Index: quota-tools/rquota_server.c
+===================================================================
+--- quota-tools.orig/rquota_server.c
++++ quota-tools/rquota_server.c
+@@ -60,7 +60,7 @@ extern char nfs_pseudoroot[PATH_MAX];
+  */
+ extern struct authunix_parms *unix_cred;
+ 
+-int in_group(gid_t * gids, u_int len, gid_t gid)
++int in_group(gid_t * gids, uint32_t len, gid_t gid)
+ {
+ 	gid_t *gidsp = gids + len;
+ 
diff --git a/meta/recipes-extended/quota/quota_4.02.bb b/meta/recipes-extended/quota/quota_4.02.bb
index 124b0a3..673d584 100644
--- a/meta/recipes-extended/quota/quota_4.02.bb
+++ b/meta/recipes-extended/quota/quota_4.02.bb
@@ -23,7 +23,7 @@ DEPENDS = "gettext-native e2fsprogs"
 
 inherit autotools-brokensep gettext pkgconfig
 
-CFLAGS += "-I=${includedir}/tirpc"
+CFLAGS += "-I${STAGING_INCDIR}/tirpc"
 LDFLAGS += "-ltirpc"
 ASNEEDED = ""
 EXTRA_OEMAKE += 'STRIP=""'
-- 
2.5.2


