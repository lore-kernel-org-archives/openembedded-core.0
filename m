Return-Path: <fahad.usman@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 293976ACBA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:17:31 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fa1so23248836pad.27
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 01:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZjR8f42oesaCPjt/zz8ro6iEC7K975ihxVYXqb+8lx8=;
	b=o9L2ZPmgQaBk8XTvnC8sGjl5bzRO1YX1lwheI6vF6Kg7+leXbOJ+JqNcL8QkmRky0d
	YKRP3fY+kKbbzwS1W1mTPFG4NqpqGm638W/9csRuW/tnQAdHhXDED6D7nWonpbMoNuJ6
	z5O9K99QlEpinvjvDnCKBa8UtTDyMd9+/kyJuNcflnevcat8WVrvRwNnc5ARAhv51nhy
	gP2ySTZppXnebnygwAIAQJ5P/GpivMHmZ4Joc/MEf122/s3dIkRUuvAhyGnwozPr5TO8
	wZ4J+xgKsTOsOWSpbo8+EaccEkKnYEgtF/3rSMGkDyEwOE/l67bavDPefYaUp2HQ6zJa
	HqTA==
X-Received: by 10.68.68.131 with SMTP id w3mr35185692pbt.90.1409041052684;
	Tue, 26 Aug 2014 01:17:32 -0700 (PDT)
Received: from svr-pkl-eng-06.pkl.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id ek9sm3392317pdb.55.2014.08.26.01.17.29
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 26 Aug 2014 01:17:31 -0700 (PDT)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:16:49 +0500
Message-Id: <1409041009-49315-2-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1409041009-49315-1-git-send-email-fahad_usman@mentor.com>
References: <1409041009-49315-1-git-send-email-fahad_usman@mentor.com>
Subject: [PATCH v2 2/2] logrotate: add packageconfigs
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
X-List-Received-Date: Tue, 26 Aug 2014 08:17:36 -0000

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


