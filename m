Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U8aNq-000612-5w
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Feb 2013 18:56:39 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1LHeOhp014786
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Feb 2013 09:40:24 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 21 Feb 2013 09:40:24 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Feb 2013 11:40:22 -0600
Message-ID: <da66b07f031b6522b25dc353724b3c656d7511e1.1361468282.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1361468282.git.peter.seebach@windriver.com>
References: <cover.1361468282.git.peter.seebach@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] More n32 fixups
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
X-List-Received-Date: Thu, 21 Feb 2013 17:56:43 -0000
Content-Type: text/plain

For perfectly sound reasons, n32 MIPS is a mips64 subset denoted by an
ABI change, thus, "mips64-vendor-linux-gnun32" rather than
"mips-vendor-linux-gnu". A previous change had fixed up insane.bbclass
to recognize these, which mostly worked, but left SITEINFO_BITS set to
64.

Since bit-32 is processed first, and there are specific checks for
linux-gnun32, modify the mips64-linux-gnun32 lines to specify "bit-32",
so things that check SITEINFO_BITS get the right answer. Also, drop
the mips{,el}-linux-gnun32 lines, because that's not a valid combination;
n32 only makes sense for mips64.

Also, the insane.bbclass change spelled "mips64el" as "mipsel64", which
no one noticed because no one's using little-endian n32, apparently.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>
---
 meta/classes/insane.bbclass   |    2 +-
 meta/classes/siteinfo.bbclass |    6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index f52fcea..3eff4df 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -107,7 +107,7 @@ def package_qa_get_machine_dict():
                       },
             "linux-gnun32" :       {
                         "mips64":       ( 8,     0,    0,          False,         32),
-                        "mipsel64":     ( 8,     0,    0,          True,          32),
+                        "mips64el":     ( 8,     0,    0,          True,          32),
                       },
         }
 
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index e09d16a..09f88c6 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -67,10 +67,8 @@ def siteinfo_data(d):
         "arm-linux-uclibceabi": "arm-linux-uclibc",
         "armeb-linux-gnueabi": "armeb-linux",
         "armeb-linux-uclibceabi": "armeb-linux-uclibc",
-        "mips-linux-gnun32": "mips-linux",
-        "mipsel-linux-gnun32": "mipsel-linux",
-        "mips64-linux-gnun32": "mips-linux",
-        "mips64el-linux-gnun32": "mipsel-linux",
+        "mips64-linux-gnun32": "mips-linux bit-32",
+        "mips64el-linux-gnun32": "mipsel-linux bit-32",
         "powerpc-linux": "powerpc32-linux",
         "powerpc-linux-uclibc": "powerpc-linux powerpc32-linux",
         "powerpc-linux-gnuspe": "powerpc-linux powerpc32-linux",
-- 
1.7.0.4



