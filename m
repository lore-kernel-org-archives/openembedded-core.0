Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA7D865D4A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jun 2014 00:28:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s5P0SDer024228
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jun 2014 17:28:13 -0700 (PDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 24 Jun 2014 17:28:12 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 24 Jun 2014 19:28:07 -0500
Message-ID: <f9dc89ac10b9500ff75a40d2c16b59770a2a8d10.1403655933.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1403655933.git.mark.hatle@windriver.com>
References: <cover.1403655933.git.mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] lib/oe/package_manager.py: Add processing for alternative SDK_OS
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
X-List-Received-Date: Wed, 25 Jun 2014 00:28:14 -0000
Content-Type: text/plain

For the meta-mingw layer, we need to process alternative SDK_OS, since this
is not a Linux based OS.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/lib/oe/package_manager.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 1c64205..18eb792 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -739,11 +739,15 @@ class RpmPM(PackageManager):
 
         channel_priority = 5
         platform_dir = os.path.join(self.etcrpm_dir, "platform")
+        sdkos = self.d.getVar("SDK_OS", True)
         with open(platform_dir, "w+") as platform_fd:
             platform_fd.write(platform + '\n')
             for pt in platform_extra:
                 channel_priority += 5
-                platform_fd.write(re.sub("-linux.*$", "-linux.*\n", pt))
+                if sdkos:
+                    tmp = re.sub("-%s$" % sdkos, "-%s\n" % sdkos, pt)
+                tmp = re.sub("-linux.*$", "-linux.*\n", tmp)
+                platform_fd.write(tmp)
 
         # Tell RPM that the "/" directory exist and is available
         bb.note("configuring RPM system provides")
-- 
1.9.3


