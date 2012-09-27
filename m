Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1TH9bC-0005qV-EE
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 10:37:34 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8R8OgAq002885
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 01:24:43 -0700 (PDT)
Received: from usp-ub1204-32.corp.ad.wrs.com (128.224.163.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Thu, 27 Sep 2012 01:24:41 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Sep 2012 16:23:37 +0800
Message-ID: <ae8afc91a951339570a19ea607c8452037078a73.1348734058.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1348734058.git.wenzong.fan@windriver.com>
References: <cover.1348734058.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 1/1] autotools.bbclass: using relative paths for acpaths
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
X-List-Received-Date: Thu, 27 Sep 2012 08:37:34 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix autotools.bbclass to use relative paths for acpaths instead of
absolute ones. Since absolute paths may cause potential autoreconf
error like:

    Can't exec "/bin/sh": Argument list too long ...

This error occurs while building coreutils with long TMPDIR, because
it has bunch of m4 files need to be expanded.

[YOCTO #2766]

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta/classes/autotools.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/autotools.bbclass b/meta/classes/autotools.bbclass
index e4e034b..874e01d 100644
--- a/meta/classes/autotools.bbclass
+++ b/meta/classes/autotools.bbclass
@@ -130,7 +130,8 @@ autotools_do_configure() {
 		if [ x"${acpaths}" = xdefault ]; then
 			acpaths=
 			for i in `find ${S} -maxdepth 2 -name \*.m4|grep -v 'aclocal.m4'| \
-				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u`; do
+				grep -v 'acinclude.m4' | sed -e 's,\(.*/\).*$,\1,'|sort -u| \
+				sed -e 's,${S},\.,'`; do
 				acpaths="$acpaths -I $i"
 			done
 		else
-- 
1.7.9.5



