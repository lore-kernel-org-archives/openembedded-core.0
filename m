Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TyIEW-00083F-A9
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 09:32:34 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8GtKm024271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 00:16:55 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 24 Jan 2013 00:16:55 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 16:16:50 +0800
Message-ID: <51b47719df22862467f093b23558f946928de757.1359014474.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1359014474.git.Qi.Chen@windriver.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 10/12] dropbear: inherit volatiles to support read-only rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Jan 2013 08:32:45 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Inherit volatiles.bbclass to support read-only rootfs.

[YOCTO #3406]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/dropbear/dropbear.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/dropbear/dropbear.inc
index 3a39c95..efc685c 100644
--- a/meta/recipes-core/dropbear/dropbear.inc
+++ b/meta/recipes-core/dropbear/dropbear.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Dropbear is a lightweight SSH and SCP implementation"
 HOMEPAGE = "http://matt.ucc.asn.au/dropbear/dropbear.html"
 SECTION = "console/network"
 
-INC_PR = "r2"
+INC_PR = "r3"
 
 # some files are from other projects and have others license terms:
 #   public domain, OpenSSH 3.5p1, OpenSSH3.6.1p2, PuTTY
@@ -26,11 +26,14 @@ PAM_SRC_URI = "file://dropbear-enable-pam.patch \
                file://dropbear-configuration-file.patch \
                file://dropbear"
 
-inherit autotools update-rc.d
+inherit autotools update-rc.d volatiles
 
 INITSCRIPT_NAME = "dropbear"
 INITSCRIPT_PARAMS = "defaults 10"
 
+VOLATILE_DIR = "/var/volatile/lib/dropbear"
+VOLATILE_LINK = "/var/lib/dropbear"
+
 CFLAGS_prepend = " -I. "
 LD = "${CC}"
 
-- 
1.7.9.5



