Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6703E791F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 04:29:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H4TdKS021611
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 21:29:39 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 16 Aug 2018 21:29:39 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 21:29:38 -0700
Message-ID: <20180817042938.59347-2-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180817042938.59347-1-zhixiong.chi@windriver.com>
References: <20180817042938.59347-1-zhixiong.chi@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] sdk: don't install glibc locales for mingw32
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
X-List-Received-Date: Fri, 17 Aug 2018 04:29:38 -0000
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/lib/oe/sdk.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/sdk.py b/meta/lib/oe/sdk.py
index 153b07d76b..5d7e4ed2ac 100644
--- a/meta/lib/oe/sdk.py
+++ b/meta/lib/oe/sdk.py
@@ -88,6 +88,10 @@ class Sdk(object, metaclass=ABCMeta):
         if self.d.getVar("TCLIBC") != "glibc":
             return
 
+        # Don't install locales for mingw32 SDK_OS
+	    if self.d.getVar("SDK_OS") == "mingw32":
+            return
+
         linguas = self.d.getVar("SDKIMAGE_LINGUAS")
         if linguas:
             import fnmatch
-- 
2.17.1


