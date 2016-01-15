Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 52EF573172
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jan 2016 02:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0F2TDcr009075
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jan 2016 18:29:13 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 14 Jan 2016 18:29:13 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jan 2016 18:29:05 -0800
Message-ID: <06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1452824908.git.liezhi.yang@windriver.com>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Fri, 15 Jan 2016 02:29:14 -0000
Content-Type: text/plain

There are a lot of binary packages have files in /etc/, but only a few
of them have set CONFFILES, more than 180 packages are not set in a
world build.  So treat all the files in /etc/ as CONFFILES as Debian
does:
- All the files in /etc/ are CONFFILES
- Move the file out of /etc/ if it is not a conffile
- If /etc/foo can't be moved out, and is changed during
  runtime, then create a symlink /etc/foo -> /var/foo

[YOCTO #8436]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/conf/bitbake.conf |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 2fe6b24..f0e4b3a 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -271,6 +271,7 @@ PACKAGE_BEFORE_PN ?= ""
 PACKAGES = "${PN}-dbg ${PN}-staticdev ${PN}-dev ${PN}-doc ${PN}-locale ${PACKAGE_BEFORE_PN} ${PN}"
 PACKAGES_DYNAMIC = "^${PN}-locale-.*"
 FILES = ""
+CONFFILES = "${sysconfdir}/*"
 
 FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
             ${sysconfdir} ${sharedstatedir} ${localstatedir} \
-- 
1.7.9.5


