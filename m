Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F2D3573860
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 21:36:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t22LagYb005500
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 2 Mar 2015 13:36:43 -0800 (PST)
Received: from yow-bashfiel-d4.wrs.com (128.224.56.94) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Mon, 2 Mar 2015 13:36:42 -0800
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 2 Mar 2015 16:36:38 -0500
Message-ID: <e805e2dc48296a15541d9cc6878017270c486094.1425331960.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1425331960.git.bruce.ashfield@windriver.com>
References: <cover.1425331960.git.bruce.ashfield@windriver.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto: fix qemux86-64 config warning
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
X-List-Received-Date: Mon, 02 Mar 2015 21:36:46 -0000
Content-Type: text/plain

During the 3.19 update a 32 bit option in the 64 bit config was missed,
which results in the option being dropped (and reported as a warning):

  Value requested for CONFIG_PCI_GOANY not in final ".config"
  Requested value: "CONFIG_PCI_GOANY=y"
  Actual value set: ""

So we split the 32bit only drivers out of the common driver include and
the problem goes away.

[YOCTO: 7354]

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_3.19.bb      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
index dba163e006d3..1997e30a2589 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_3.19.bb
@@ -9,7 +9,7 @@ LINUX_VERSION ?= "3.19"
 KMETA = "meta"
 
 SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_meta ?= "8897ef68b30e7426bc1d39895e71fb155d694974"
+SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.19.bb b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
index 044ee7f524ca..f856d19f938f 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.19.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.19.bb
@@ -19,7 +19,7 @@ SRCREV_machine_qemux86 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
 SRCREV_machine_qemux86-64 ?= "43b9eced9ba8a57add36af07736344dcc383f711"
 SRCREV_machine_qemumips64 ?= "b7ab9d4bac55415f125c81f529dbbefb07de98ad"
 SRCREV_machine ?= "43b9eced9ba8a57add36af07736344dcc383f711"
-SRCREV_meta ?= "8897ef68b30e7426bc1d39895e71fb155d694974"
+SRCREV_meta ?= "f7a81274b461d0c748964d75c24bea8574d350fb"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto-3.19.git;bareclone=1;branch=${KBRANCH},${KMETA};name=machine,meta"
 
-- 
2.1.0


