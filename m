Return-Path: <fahad.usman@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id CA0E5601A8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 16:22:46 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id x48so13585913wes.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZjR8f42oesaCPjt/zz8ro6iEC7K975ihxVYXqb+8lx8=;
	b=CJhhr/Oi9VyAS9TbyzOWm/H4Oxoec43nmpw1oCyFmMId050HphRZItKWveOow1r0/g
	l1fZ3rwL/Q2M/HIYkpk+LSNJW45Z8sc+0oRsy66EW3/zhyYNm9Xc9QABQAV5731YM7un
	A6b9PiQU7O3MQtzcLcgtQDf93InhaFfK0AyLwk1x2PBmO53OffFLHbyEvUInnc+ZpVyC
	sKDAfBTXytvrY1pcw3Rq1QuOek7tmTx6HBIk6t6UoXuixR7KgjjSHdobZzZN7Mqb5yT7
	HyaTNiLp7A+ka83U4XUgi+TrQ+vBLkAw0dp0mqdj2j1nJiGYL4HM3KS51+a2fvRkcktM
	bKqw==
X-Received: by 10.180.77.83 with SMTP id q19mr6535158wiw.83.1408983766981;
	Mon, 25 Aug 2014 09:22:46 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id fy1sm2186140wic.6.2014.08.25.09.22.41
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 25 Aug 2014 09:22:46 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 21:22:05 +0500
Message-Id: <1408983725-45864-2-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
References: <1408983725-45864-1-git-send-email-fahad_usman@mentor.com>
Subject: [PATCH 2/2] logrotate: add packageconfigs
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
X-List-Received-Date: Mon, 25 Aug 2014 16:22:51 -0000

add packageconfigs for acl and selinux.

Signed-off-by: Fahad Usman <fahad.usman@gmail.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index 42cd764..faa8e02 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -16,6 +16,11 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
 SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
 SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
 
+PACKAGECONFIG ?= "\
+    ${@base_contains('DISTRO_FEATURES', 'acl', 'acl', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
+"
+
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
 EXTRA_OEMAKE = "\
@@ -25,6 +30,9 @@ EXTRA_OEMAKE = "\
     'CC=${CC}' \
     'RPM_OPT_FLAGS=${CFLAGS}' \
     'EXTRA_LDFLAGS=${LDFLAGS}' \
+    \
+    ${@base_contains('PACKAGECONFIG', 'acl', 'WITH_ACL=yes', '', d)} \
+    ${@base_contains('PACKAGECONFIG', 'selinux', 'WITH_SELINUX=yes', '', d)} \
 "
 
 # OS_NAME in the makefile defaults to `uname -s`. The behavior for
-- 
1.7.9.5


