Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8D6396AED2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:49:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7nNIl024564
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Jun 2013 00:49:23 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Fri, 28 Jun 2013 00:49:22 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Fri, 28 Jun 2013 15:48:46 +0800
Message-ID: <c037877ab9366fab092b29efe28b0371bf6ab503.1372403777.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1372403777.git.kai.kang@windriver.com>
References: <cover.1372403777.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] qt4*.bbclass: disable build qt on mips64 with 64 bits userspace
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
X-List-Received-Date: Fri, 28 Jun 2013 07:49:24 -0000
Content-Type: text/plain

Qt/qt-embedded build fails on mips64 with 64 bits userspace. Set
COMPATIBLE_HOST in qt4e.bbclass and qt4x11.bbclass to disable build
qt/qt-embedded and packages which inherit these two classes on mips64
with 64 bits userspace.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/classes/qt4e.bbclass   |    3 +++
 meta/classes/qt4x11.bbclass |    3 +++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta/classes/qt4e.bbclass b/meta/classes/qt4e.bbclass
index de2a68d..d7f5df8 100644
--- a/meta/classes/qt4e.bbclass
+++ b/meta/classes/qt4e.bbclass
@@ -18,3 +18,6 @@ EXTRA_QMAKEVARS_PRE += " QT_LIBINFIX=${QT_LIBINFIX} "
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
+
+# Qt4 could NOT be built on MIPS64 with 64 bits userspace
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
diff --git a/meta/classes/qt4x11.bbclass b/meta/classes/qt4x11.bbclass
index b06e15d..65d196a 100644
--- a/meta/classes/qt4x11.bbclass
+++ b/meta/classes/qt4x11.bbclass
@@ -9,3 +9,6 @@ QT_LIBINFIX = ""
 
 # Qt4 uses atomic instructions not supported in thumb mode
 ARM_INSTRUCTION_SET = "arm"
+
+# Qt4 could NOT be built on MIPS64 with 64 bits userspace
+COMPATIBLE_HOST_mips64 = "mips64.*-linux-gnun32"
-- 
1.7.5.4


