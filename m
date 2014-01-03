Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B1D6A6B5B0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jan 2014 09:43:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s039hLXv027683
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jan 2014 01:43:21 -0800 (PST)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 3 Jan 2014 01:43:21 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 4 Jan 2014 01:45:49 +0800
Message-ID: <e00b0c55fcd5d2be705b0fad8086663e13edb74d.1388771106.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1388771106.git.liezhi.yang@windriver.com>
References: <cover.1388771106.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] logrotate: two minor fixes
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
X-List-Received-Date: Fri, 03 Jan 2014 09:43:21 -0000
Content-Type: text/plain

* Change EXTRA_OEMAKE = "CC='${CC}'" to "", the root cause is the "-e"
  from EXTRA_OEMAKE makes the CFLAGS from the env overrides the one
  defined in logrotate/Makefile which causes build failures, so we need to
  set EXTRA_OEMAKE to "", set it to CC='${CC}' would confuse the user
  since CC='${CC}' has been defined in the env.

* Merge do_install() and do_install_append()

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-extended/logrotate/logrotate_3.8.7.bb | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
index 055bfd56..b386b85 100644
--- a/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
+++ b/meta/recipes-extended/logrotate/logrotate_3.8.7.bb
@@ -16,13 +16,10 @@ SRC_URI = "https://fedorahosted.org/releases/l/o/logrotate/logrotate-${PV}.tar.g
 SRC_URI[md5sum] = "99e08503ef24c3e2e3ff74cc5f3be213"
 SRC_URI[sha256sum] = "f6ba691f40e30e640efa2752c1f9499a3f9738257660994de70a45fe00d12b64"
 
-EXTRA_OEMAKE = "CC='${CC}'"
+EXTRA_OEMAKE = ""
 
 do_install(){
     oe_runmake install DESTDIR=${D} PREFIX=${D} MANDIR=${mandir}
-}
-
-do_install_append(){
     mkdir -p ${D}${sysconfdir}/logrotate.d
     mkdir -p ${D}${sysconfdir}/cron.daily
     mkdir -p ${D}${localstatedir}/lib
-- 
1.8.3.1


