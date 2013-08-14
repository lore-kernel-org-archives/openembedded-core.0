Return-Path: <mark.hatle@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id 5656D6B7B1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 20:29:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7EKTTU6026630
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 16:29:29 -0400 (EDT)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 14 Aug 2013 13:29:28 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Aug 2013 15:30:09 -0500
Message-ID: <1376512209-11622-12-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
References: <1376512209-11622-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 11/11] package_ipk: Add support for PACKAGE_EXCLUDE
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
X-List-Received-Date: Wed, 14 Aug 2013 20:29:29 -0000
Content-Type: text/plain

This uses the new --add-exclude arguments in opkg-cl, to list the excluded
packages.

If an excluded package is needed for the install to resolve,
an error will be generated.  Recommended packages will not
generate an error.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_ipk.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 69a6d95..68ffc62 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -12,6 +12,7 @@ OPKGBUILDCMD ??= "opkg-build"
 
 OPKG_ARGS = "-f $INSTALL_CONF_IPK -o $INSTALL_ROOTFS_IPK --force_postinstall --prefer-arch-to-version"
 OPKG_ARGS += "${@['', '--no-install-recommends'][d.getVar("NO_RECOMMENDATIONS", True) == "1"]}"
+OPKG_ARGS += "${@['', '--add-exclude ' + ' --add-exclude '.join((d.getVar('PACKAGE_EXCLUDE', True) or "").split())][(d.getVar("PACKAGE_EXCLUDE", True) or "") != ""]}"
 
 OPKGLIBDIR = "${localstatedir}/lib"
 
-- 
1.8.1.2.545.g2f19ada


