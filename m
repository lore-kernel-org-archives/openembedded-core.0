Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6D25D6AC7B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Jul 2014 05:39:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s645cvjb008817
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 3 Jul 2014 22:38:58 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 3 Jul 2014 22:38:56 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 3 Jul 2014 22:38:55 -0700
Message-ID: <c16e5647966901f79b9520ba0565220ebcd0fa3d.1404452300.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1404452300.git.liezhi.yang@windriver.com>
References: <cover.1404452300.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bitbake: update help message for dump-signatures
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
X-List-Received-Date: Fri, 04 Jul 2014 05:39:01 -0000
Content-Type: text/plain

The bitbake -S had been updated which always reuires an argument, so
update the help info:
- Add the two args in the help message: none and printdiff

- Use type="choice" so that we can get more friendly error messages,
  for example:
  bitbake: error: option -S: invalid choice: 'printdiffX' (choose from 'none', 'printdiff')

- dump-signatures=DUMP_SIGNATURES -> dump-signatures=SIGNATURE_HANDLER

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 bitbake/bin/bitbake |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bitbake/bin/bitbake b/bitbake/bin/bitbake
index b3acbe1..5c25a9d 100755
--- a/bitbake/bin/bitbake
+++ b/bitbake/bin/bitbake
@@ -139,8 +139,8 @@ class BitBakeConfigParameters(cookerdata.ConfigParameters):
         parser.add_option("-n", "--dry-run", help = "Don't execute, just go through the motions.",
                    action = "store_true", dest = "dry_run", default = False)
 
-        parser.add_option("-S", "--dump-signatures", help = "Dump out the signature construction information, with no task execution. Parameters are passed to the signature handling code, use 'none' if no specific handler is required.",
-                   action = "append", dest = "dump_signatures", default = [])
+        parser.add_option("-S", "--dump-signatures", help = "Dump out the signature construction information, with no task execution. The SIGNATURE_HANDLER can be none or printdiff, while none means only dump the signature, printdiff means compare the dumped signature with the cached one.",
+                   action = "append", dest = "dump_signatures", default = [], type="choice", choices=("none", "printdiff"), metavar="SIGNATURE_HANDLER")
 
         parser.add_option("-p", "--parse-only", help = "Quit after parsing the BB recipes.",
                    action = "store_true", dest = "parse_only", default = False)
-- 
1.7.9.5


