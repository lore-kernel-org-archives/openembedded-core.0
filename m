Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DDF2B78655
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 15:21:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v8DFL2Wu012569
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 08:21:02 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 13 Sep 2017 08:21:01 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 10:15:06 -0500
Message-ID: <1505315706-8937-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
References: <1505315706-8937-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] bitbake.conf: Add default FILESYSTEM_PERMS_TABLES
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
X-List-Received-Date: Wed, 13 Sep 2017 15:21:02 -0000
Content-Type: text/plain

If FILESYSTEM_PERMS_TABLES was not defined, the default was selected by the
packages.bbclass.  This made it difficult for a recipe or layer to 'append'
to the default.

Copy the default into the bitbake.conf, allowing future _append and += style
actions.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 444c53f..791aee0 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -330,6 +330,10 @@ FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE', False))}"
 # This default was only used for checking
 FILESEXTRAPATHS ?= "__default:"
 
+# Following is a duplication of the default defined in packages.bbclass,
+# both should be kept in sync
+FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar('VOLATILE_LOG_DIR', True)) else 'files/fs-perms-persistent-log.txt'}"
+
 ##################################################################
 # General work and output directories for the build system.
 ##################################################################
-- 
1.8.3.1


