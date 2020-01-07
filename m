Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 900C07FC9A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jan 2020 22:10:46 +0000 (UTC)
IronPort-SDR: mwiLTr4gSAVGf5yhrnpRX7EFn9sGUoYvEQ9Wp6WGIfXKLVjFeeKN7x5c9dEoGuXy1KO/tDsF2S
	Tl2U5qpYvfy8/j8NNGNQv+w8qyY+uBCYjPTiWQay4nBpfX8f/ostd3LSlYbr85KPvUOJyKwN2a
	fRLPJjL+cmIvG1Qqpjz0I0d1Yx7Px0+3U/224CX1HJyR/8Znn+Dogj/45TH6ogpBuv9WBzIDvT
	u5lYBsO3JLrFWKWw6uBPGN61vofgnESQxHRlNqjvcZp0AzUax+BMOa807WezQnaRiOXHYMc7H+
	I60=
X-IronPort-AV: E=Sophos;i="5.69,407,1571695200"; 
   d="scan'208";a="4034964"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jan 2020 23:10:43 +0100
Message-Id: <20200107221043.18575-2-pkj@axis.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200107221043.18575-1-pkj@axis.com>
References: <20200107221043.18575-1-pkj@axis.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: [master][zeus][warrior][PATCH 2/2] populate_sdk_ext.bbclass: No longer needed to clean away conf/sanity_info
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
X-List-Received-Date: Tue, 07 Jan 2020 22:10:47 -0000
Content-Transfer-Encoding: 8bit

Since the sanity_info file has moved from the conf directory to the
cache directory, there is no longer any need to clean it away
explicitly in clean_esdk_builddir() since the whole cache directory is
already cleaned away anyway.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index af6e1b6e6a..9511e553f5 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -124,7 +124,7 @@ SDK_TITLE_task-populate-sdk-ext = "${@d.getVar('DISTRO_NAME') or d.getVar('DISTR
 def clean_esdk_builddir(d, sdkbasepath):
     """Clean up traces of the fake build for create_filtered_tasklist()"""
     import shutil
-    cleanpaths = 'cache conf/sanity_info tmp'.split()
+    cleanpaths = ['cache', 'tmp']
     for pth in cleanpaths:
         fullpth = os.path.join(sdkbasepath, pth)
         if os.path.isdir(fullpth):
-- 
2.21.1


