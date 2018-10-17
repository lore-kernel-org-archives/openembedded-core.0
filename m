Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB9879B8E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 16:44:30 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9HGiBNh005179
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Oct 2018 09:44:21 -0700
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 17 Oct 2018 09:44:00 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Oct 2018 12:43:26 -0400
Message-ID: <20181017164326.67111-5-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20181017164326.67111-1-mark.hatle@windriver.com>
References: <20181017164326.67111-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] gstreamer: Remove machine specific append
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
X-List-Received-Date: Wed, 17 Oct 2018 16:44:30 -0000
Content-Type: text/plain

If you try to build a system with multiple BSPs, one of which is qemux86
or qemux86-64, the gstreamer package will change.  This will trigger
anything using gstream to also be rebuilt.

For a package based system, the PR values will also be incremented each
time.  The end result will be an ever growing set of PR values as well as
being unable to tell which configured version of the multimedia components
are really being deployed.

The solution here was to remove the rrecommend for consistency.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
index 7f291f6630..3a6e53de04 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.14.2.bb
@@ -55,8 +55,6 @@ FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la ${libdir}/gstreamer-1.0/*.a ${libdir}/gstreamer-1.0/include"
 FILES_${PN}-bash-completion += "${datadir}/bash-completion/completions/ ${datadir}/bash-completion/helpers/gst*"
 
-RRECOMMENDS_${PN}_qemux86 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-RRECOMMENDS_${PN}_qemux86-64 += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
 RDEPENDS_${PN}-ptest += "make"
 
 delete_pkg_m4_file() {
-- 
2.18.0


