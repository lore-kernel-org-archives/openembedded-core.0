Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 716B77190C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Oct 2014 06:36:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9H6aATJ029435
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Oct 2014 23:36:11 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 16 Oct 2014 23:36:10 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<Qi.Chen@windriver.com>
Date: Fri, 17 Oct 2014 14:35:57 +0800
Message-ID: <202c8dafdad7479bc30c44a3d1d7e51650870026.1413527658.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1413527658.git.hongxu.jia@windriver.com>
References: <cover.1413527658.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] systemd: move libgudev back to $rootlibdir
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
X-List-Received-Date: Fri, 17 Oct 2014 06:36:16 -0000
Content-Type: text/plain

While upgrading systemd to 216, we manually moved libgudev to
${rootlibdir} in do_install task to keep backward compatibility.

But libdir in libgudev-1.0.la is still ${libdir}, that caused
libgudev could not be found by libtool.

Add the missing revision to libgudev-1.0.la

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-core/systemd/systemd_216.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_216.bb b/meta/recipes-core/systemd/systemd_216.bb
index ebf9395..053825d 100644
--- a/meta/recipes-core/systemd/systemd_216.bb
+++ b/meta/recipes-core/systemd/systemd_216.bb
@@ -130,7 +130,8 @@ do_install() {
 	fi
 
 	# Move libgudev back to ${rootlibdir} to keep backward compatibility
-	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev*
+	[ ${rootlibdir} != ${libdir} ] && mv -t ${D}${rootlibdir} ${D}${libdir}/libgudev* && \
+        sed -i "s#^libdir=.*#libdir='${rootlibdir}'#" ${D}${rootlibdir}/libgudev-1.0.la
 
         # Delete journal README, as log can be symlinked inside volatile.
         rm -f ${D}/${localstatedir}/log/README
-- 
1.9.1


