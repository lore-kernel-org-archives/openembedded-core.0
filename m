Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2E96179B8D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:43:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9HGi0XO018752
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:44:00 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 09:43:59 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 12:43:25 -0400
Message-ID: <20181017164326.67111-4-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181017164326.67111-1-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/4] weston: Remove machine specific append
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
X-List-Received-Date: Wed, 17 Oct 2018 16:43:59 -0000
Content-Type: text/plain

If you try to build a system with multiple BSPs, one of which is qemux86
or qemux86-64, the overall system configuration will change and all of the
graphics packages will end up being rebuilt each time.

For a package based system, the PR values will also be incremented each
time.  The end result will be an ever growing set of PR values as well as
being unable to tell which configured version of the graphics components
are really being deployed.

The solution here was to always include the fbdev backend when an x86 BSP
is enabled.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-graphics/wayland/weston_5.0.0.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/wayland/weston_5.0.0.bb b/meta/recipes-graphics/wayland/weston_5.0.0.bb
index 299408b201..64256db198 100644
--- a/meta/recipes-graphics/wayland/weston_5.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_5.0.0.bb
@@ -29,10 +29,10 @@ WESTON_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:1])}"
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
                 "
-EXTRA_OECONF_append_qemux86 = "\
+EXTRA_OECONF_append_x86 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
-EXTRA_OECONF_append_qemux86-64 = "\
+EXTRA_OECONF_append_x86-64 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
 		"
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'kms fbdev wayland egl', '', d)} \
-- 
2.18.0


