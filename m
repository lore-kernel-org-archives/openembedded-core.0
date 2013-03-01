Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UBN1a-0002Ka-Tu
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Mar 2013 11:17:15 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r21A0lDR025248
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 1 Mar 2013 02:00:47 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.328.9; Fri, 1 Mar 2013 02:00:46 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 18:02:13 +0800
Message-ID: <2e3619405410954ad2677d905217ae92254be40b.1362123438.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1362123438.git.kai.kang@windriver.com>
References: <cover.1362123438.git.kai.kang@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] package_rpm.bbclass: add more description for pre/post scriptlets
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
X-List-Received-Date: Fri, 01 Mar 2013 10:17:18 -0000
Content-Type: text/plain

When write rpm spec file, one description line

"# pkgname - script_type"

is added to pre/post scriptlets for base package but no such line
writted for subpackage.

Add similiar line to subpackage to facilitate handling the pre/post
scriptlets.

Signed-off-by: Kang Kai <kai.kang@windriver.com>
---
 meta/classes/package_rpm.bbclass |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 7a1da33..99c4d1a 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -778,19 +778,23 @@ python write_specfile () {
         # Now process scriptlets
         if splitrpreinst:
             spec_scriptlets_bottom.append('%%pre -n %s' % splitname)
+            spec_scriptlets_bottom.append('# %s - preinst' % splitname)
             spec_scriptlets_bottom.append(splitrpreinst)
             spec_scriptlets_bottom.append('')
         if splitrpostinst:
             spec_scriptlets_bottom.append('%%post -n %s' % splitname)
+            spec_scriptlets_bottom.append('# %s - postinst' % splitname)
             spec_scriptlets_bottom.append(splitrpostinst)
             spec_scriptlets_bottom.append('')
         if splitrprerm:
             spec_scriptlets_bottom.append('%%preun -n %s' % splitname)
+            spec_scriptlets_bottom.append('# %s - prerm' % splitname)
             scriptvar = wrap_uninstall(splitrprerm)
             spec_scriptlets_bottom.append(scriptvar)
             spec_scriptlets_bottom.append('')
         if splitrpostrm:
             spec_scriptlets_bottom.append('%%postun -n %s' % splitname)
+            spec_scriptlets_bottom.append('# %s - postrm' % splitname)
             scriptvar = wrap_uninstall(splitrpostrm)
             spec_scriptlets_bottom.append(scriptvar)
             spec_scriptlets_bottom.append('')
-- 
1.7.5.4



