Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UBiky-0008Ov-4e
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 10:29:29 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r229D4Oi019408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 2 Mar 2013 01:13:04 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Sat, 2 Mar 2013 01:13:02 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 2 Mar 2013 17:12:58 +0800
Message-ID: <e2868d95026f84923a67646d706ebf2ef67c0ffa.1362215186.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1362215186.git.hongxu.jia@windriver.com>
References: <cover.1362215186.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] package_deb.bbclass:fix the arch (replace "_" with "-") in deb package control
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
X-List-Received-Date: Sat, 02 Mar 2013 09:29:29 -0000
Content-Type: text/plain

when build deb image, such as building meta-toolchain-sdk in x86_64 host,
there is warning like that:
...
'x86_64' is not a valid architecture name: character `_' not allowed
(only letters, digits and characters `-')
...

The params in deb package control file don't allow character `_', only
letters, digits and characters `-' allowed. Change the arch's "_" to "-"
in the deb package's control file at the control file creation time. Such
as `x86_64'-->`x86-64'

[YOCTO #3721]

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/package_deb.bbclass |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index eea15e7..309c48d 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -82,6 +82,9 @@ package_install_internal_deb () {
 
 	tac ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev > ${STAGING_ETCDIR_NATIVE}/apt/sources.list
 
+	# The params in deb package control don't allow character `_', so
+	# change the arch's `_' to `-' in it.
+	dpkg_arch=`echo ${dpkg_arch} | sed 's/_/-/g'`
 	cat "${STAGING_ETCDIR_NATIVE}/apt/apt.conf.sample" \
 		| sed -e "s#Architecture \".*\";#Architecture \"${dpkg_arch}\";#" \
 		| sed -e "s:#ROOTFS#:${target_rootfs}:g" \
@@ -259,6 +262,11 @@ python do_package_deb () {
                     raise KeyError(f)
                 if i == 'DPKG_ARCH' and d.getVar('PACKAGE_ARCH', True) == 'all':
                     data = 'all'
+                elif i == 'PACKAGE_ARCH' or i == 'DPKG_ARCH':
+                   # The params in deb package control don't allow character
+                   # `_', so change the arch's `_' to `-'. Such as `x86_64'
+                   # -->`x86-64'
+                   data = data.replace('_', '-')
                 l2.append(data)
             return l2
 
-- 
1.7.10.4



