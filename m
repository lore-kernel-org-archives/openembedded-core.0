Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 43B657146D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 10:29:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8EATDgH004979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 03:29:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 14 Sep 2014 03:29:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 14 Sep 2014 18:29:40 +0800
Message-ID: <4ec99785157dbb7716f3452cc17f5dbf4891ec2e.1410690532.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1410690532.git.Qi.Chen@windriver.com>
References: <cover.1410690532.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] systemd: fix to use ${libdir}
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
X-List-Received-Date: Sun, 14 Sep 2014 10:29:14 -0000
Content-Type: text/plain

We need to user ${libdir} instead of ${exec_prefix}/lib.
Otherwise, we would meet do_install errors if multilib is enabled.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index bd52891..331da99 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -129,7 +129,7 @@ do_install() {
 	fi
 
 	# Move libgudev back to ${rootlibdir} to keep backward compatibility
-	[ ${rootlibdir} != ${exec_prefix}/lib ] && mv -t ${D}${rootlibdir} ${D}${exec_prefix}/lib/libgudev*
+	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
 
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
@@ -241,7 +241,7 @@ FILES_${PN} = " ${base_bindir}/* \
                 ${rootlibexecdir}/systemd/* \
                 ${systemd_unitdir}/* \
                 ${base_libdir}/security/*.so \
-                ${exec_prefix}/lib/libnss_* \
+                ${libdir}/libnss_* \
                 /cgroup \
                 ${bindir}/systemd* \
                 ${bindir}/busctl \
-- 
1.9.1


