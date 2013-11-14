Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3F8C06D5BA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 13:07:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAED7cfl026774
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2013 05:07:38 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Thu, 14 Nov 2013 05:07:37 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Nov 2013 21:07:46 +0800
Message-ID: <a86f7984cd1b08978d4358f862ff97d3d5cd3fb7.1384433183.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1384433183.git.Qi.Chen@windriver.com>
References: <cover.1384433183.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] sanity.bbclass: check for validity of TMPDIR
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
X-List-Received-Date: Thu, 14 Nov 2013 13:07:36 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

TMPDIR must be an absolute path, otherwise, the build will fail.
Special characters in TMPDIR will also cause build failures.

This patch enables checking for the validity of TMPDIR.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/sanity.bbclass |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 83378b0..e45906e 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -672,6 +672,13 @@ def check_sanity_everybuild(status, d):
         with open(checkfile, "w") as f:
             f.write(tmpdir)
 
+    # Check if TMPDIR contains invalid characters, and check if it is an absolute path
+    valid_tmpdir_regexp = "^/[a-zA-Z0-9\-_/.~]+$"
+    import re
+    valid_pattern = re.compile(valid_tmpdir_regexp)
+    if not valid_pattern.match(tmpdir):
+        status.addresult("Error, you have special characters in TMPDIR directory path or your TMPDIR is not an absolute path. The TMPDIR should match the this regexp: ^/[a-zA-Z0-9\-_/.~]$")
+
 def check_sanity(sanity_data):
     import subprocess
 
-- 
1.7.9.5


