Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1TsWa9-0007iC-AC
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 11:39:17 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r08ANk8U001575
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 8 Jan 2013 02:23:46 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.131) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 8 Jan 2013 02:23:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 8 Jan 2013 18:23:42 +0800
Message-ID: <b26787f62090d0760758b854627e94de25d6ccca.1357640488.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1357640488.git.hongxu.jia@windriver.com>
References: <cover.1357640488.git.hongxu.jia@windriver.com>
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
X-List-Received-Date: Tue, 08 Jan 2013 10:39:21 -0000
X-List-Received-Date: Tue, 08 Jan 2013 10:39:21 -0000
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
 meta/recipes-devtools/apt/apt-native.inc |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native.inc b/meta/recipes-devtools/apt/apt-native.inc
index ab89f71..ae03f6e 100644
--- a/meta/recipes-devtools/apt/apt-native.inc
+++ b/meta/recipes-devtools/apt/apt-native.inc
@@ -20,11 +20,13 @@ python do_install_config () {
 
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
-- 
1.7.10.4



