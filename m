Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TtDGU-0005Hi-HA
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Jan 2013 09:13:33 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0A7wGGK004677
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Jan 2013 23:58:16 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Wed, 9 Jan 2013 23:58:16 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Jan 2013 15:58:10 +0800
Message-ID: <afd12099abb637398c7af294282cb2131f0bc2ee.1357801217.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357801217.git.hongxu.jia@windriver.com>
References: <cover.1357801217.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] apt-native: fix the creation of apt.conf.sample
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
X-List-Received-Date: Thu, 10 Jan 2013 08:13:35 -0000
Content-Type: text/plain

1.The file of "apt.conf.sample" is in the outdir, and outdir is assigned
by "os.path.join" with the params of ${D}, ${sysconfdir} and "apt". But
${sysconfdir} is an absolute dir and that let ${D} be discarded.

The following is the help on function os.path.join(a, *p):
     Join two or more pathname components, inserting '/' as needed.
     If any component is an absolute path, all previous path components
     will be discarded.
Use oe.path.join instead which don't have this problem.

2. Create apt.conf.sample if it doesn't exist.

[YOCTO #3677]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/apt/apt-native.inc |    7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index ab89f71..c7e7e42 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -14,17 +14,18 @@ python do_install () {
 
 python do_install_config () {
     indir = os.path.dirname(d.getVar('FILE',1))
-    infile = file(os.path.join(indir, 'files', 'apt.conf'), 'r')
+    infile = file(oe.path.join(indir, 'files', 'apt.conf'), 'r')
     data = infile.read()
     infile.close()
 
     data = d.expand(data)
 
-    outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
+    outdir = oe.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
     if not os.path.exists(outdir):
         os.makedirs(outdir)
-        outpath = os.path.join(outdir, 'apt.conf.sample')
 
+    outpath = oe.path.join(outdir, 'apt.conf.sample')
+    if not os.path.exists(outpath):
         outfile = file(outpath, 'w')
         outfile.write(data)
         outfile.close()
-- 
1.7.10.4



