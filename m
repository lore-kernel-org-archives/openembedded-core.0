Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 72E6D65C7B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jan 2015 00:56:53 +0000 (UTC)
Received: by mail-ie0-f170.google.com with SMTP id rd18so177006iec.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Jan 2015 16:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PQy+twXh3EW7Uww4PXTmDnNRp0azFZ72ytHd2o1O3LE=;
	b=LoA9kbjGGgGnBq7w3y7VQHhhMhJKjApxkqJrvoPSHinfhguV7njrvEs4u2omfYZ92u
	GqGxQq7Bex4JdogLmGZgbRze6MxRXi1U1Czs/rQmwaGKRSPCuD1x1l2hlmEk/aAbhvG9
	IjCsAT2reN7DXjeEgfb1ec+fT5h4qP2q83mlknltvOxwhcRECS2ChJ/w3IW0SAvSDpaK
	/AZWXmLhMX9dJ2duoNtXCgEYd4bvzxde5XJ+ao64bb+BcF3+d61rjkQxKqzrCxfeOfkM
	5bGR4XO17AvDb1f2DbtvYu4VdTgNPkshlth05oClCvPBz4cAqAfqJjzcHkxzWestFiTq
	vBcA==
X-Received: by 10.107.14.12 with SMTP id 12mr31360305ioo.65.1421110614299;
	Mon, 12 Jan 2015 16:56:54 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id n36sm9435781ioe.4.2015.01.12.16.56.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 12 Jan 2015 16:56:53 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Jan 2015 16:56:27 -0800
Message-Id: <1421110587-23245-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] logrotate: fix missing acl and libselinux dependencies
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
X-List-Received-Date: Tue, 13 Jan 2015 00:56:56 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.8.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
index 133f6d7..00432de 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.8.bb
@@ -3,6 +3,9 @@ SECTION = "console/utils"
 HOMEPAGE = "https://fedorahosted.org/logrotate/"
 LICENSE = "GPLv2"
 
+# TODO: logrotate 3.8.8 adds autotools/automake support, update recipe to use it.
+# TODO: Document coreutils dependency. Why not RDEPENDS? Why not busybox?
+
 DEPENDS="coreutils popt"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=18810669f13b87348459e611d31ab760"
@@ -21,6 +24,9 @@ PACKAGECONFIG ?= "\
     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
 "
 
+PACKAGECONFIG[acl] = ",,acl"
+PACKAGECONFIG[selinux] = ",,libselinux"
+
 # If RPM_OPT_FLAGS is unset, it adds -g itself rather than obeying our
 # optimization variables, so use it rather than EXTRA_CFLAGS.
 EXTRA_OEMAKE = "\
-- 
1.9.1


