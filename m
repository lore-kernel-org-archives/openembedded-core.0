Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1Trm47-0002Gb-Gr
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Jan 2013 09:58:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r068hdWB007321
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 6 Jan 2013 00:43:39 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 6 Jan 2013 00:43:39 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 6 Jan 2013 16:43:34 +0800
Message-ID: <3dad51b86a16d1bc44a8ac69c8a0efac870768e1.1357461730.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357461730.git.hongxu.jia@windriver.com>
References: <cover.1357461730.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Sun, 06 Jan 2013 08:58:51 -0000
Content-Type: text/plain

The file of apt.conf.sample is kept in outdir, and outdir is assigned
by "os.path.join" with the params of ${D}, ${sysconfdir} and "apt". But
${sysconfdir} is an absolute dir and that is not allowed by "os.path.join".

The following is the help on function os.path.join(a, *p):
    Join two or more pathname components, inserting '/' as needed.
    If any component is an absolute path, all previous path components
    will be discarded.

So remove "/" in ${sysconfdir} to create "apt.conf.sample" if it doesn't
exist, not by the existance of prefix dir.

[YOCTO #3677]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/apt/apt-native.inc |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index ab89f71..0de159a 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -20,14 +20,17 @@ python do_install_config () {
 
     data = d.expand(data)
 
-    outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True), 'apt')
+    # os.path.join does not allow sysconfdir to be a absolute dir
+    outdir = os.path.join(d.getVar('D', True), d.getVar('sysconfdir', True)[1:], 'apt')
     if not os.path.exists(outdir):
         os.makedirs(outdir)
-        outpath = os.path.join(outdir, 'apt.conf.sample')
 
+    outpath = os.path.join(outdir, 'apt.conf.sample')
+    if not os.path.exists(outpath):
         outfile = file(outpath, 'w')
         outfile.write(data)
         outfile.close()
+        bb.note("create %s" %outpath)
 }
 
 do_install_base () {
-- 
1.7.10.4



