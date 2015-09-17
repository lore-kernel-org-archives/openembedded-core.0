Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by mail.openembedded.org (Postfix) with ESMTP id 3073676E04
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:11 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0MSY2q-1ZDChi0FLI-00RciO; Thu, 17 Sep 2015 18:15:06
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 18:13:43 +0200
Message-Id: <1442506425-5096-3-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
References: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:hwl/0sf6JD8T2ykPWPUd4or56pmnGrTeY2t9HBmPgFWLrvKE2EH
	8/lT9R52ZUF+dVMfs30IhCGd6iig6JhrtGKhQjOsGF20x+lzICseXgDb5QyCJ+tfPIpRtQP
	HFA0YPhY5D7t2j2mKpUSvjugcjjuUCpj1Bbg6ZqmRRh4JpCGdRWttqbXm4gE1lqZcWpiVUu
	8RkQ3fKHAnS+SR8zR8Fig==
X-UI-Out-Filterresults: notjunk:1;V01:K0:T+8Frcgk5gc=:pY4moATk/EpnZljKxuk3Fw
	nBlVRNEAPXooO/MEZgZkQxflmjVq2zAFgZUtz6zjgSJ3MXS4EhlT/eEmUZLd7HbIkjv7DoYr+
	W4XFWmUP8IcrYdTllsFaP+1xVjscvVTaM1IUF5REXj0RJH+gZpCOcVyRu6iQlJ6c1uJ9DuQ1h
	bEejl5qIWiwln5XgKXWMRAV9uIoRK7ozeGFpMuYlxy4kugwpsEWi5tNcAtt+uf/XgnXhobuOV
	L7UuDscAgeqiZVlCPigCUBnNhe1JM0/n52nwUPhIKaI2OfVawoy9YGhuJmQC3/D8+zxrsJofA
	PCR5gic2G1/PcSCVIAtD2jNotG+nPF9olTg/dwDDsHVo1uboNjDQ+TMbFy+4AN0DsUXAAFfFL
	4WDdpUsy2+RJ70JFaG4x2ceTjv9dkoBqGOa/GBBYvL2V4CqHG2rH/JB2siNyTXTI22NL5cMj1
	hbCKFNQPTKMFIm4cUMRChqRAm0sfj+XRPA7wvQhMKFLiXnSz3u6VUimRcCFBe+vekT2U0sBWK
	isOdRMSscJIdI9y7xOb1ychItq4XwrNVrzV1SRmFjscrK6eS53AXrAd2CFdH6wFGHNbHt+ULU
	PJVyZ4IlsCDtw3y0IHoJz3HsjubDJCDHdWsQC5Fi92JTBFRaouvW3dYNtNi4uYkWbHl1t9pIT
	Bpt86CvElZ3uQEiIXlLUQ0KZ9DwXQewzcCqQ+/jfQSN0Wl3xVqCEmpp4MHdIAp8Das1zJQxvt
	3OD3f6rzUFHDCXbL7BB6lw2TEzrE5RKjSTzaCg==
Subject: [PATCH 2/4] cpio: fix install if bindir == base_bindir
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
X-List-Received-Date: Thu, 17 Sep 2015 16:20:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Don't try to move binaries onto themselves if ${bindir} and
${base_bindir} are the same, as is the case on systems with a
merged /usr directory.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/recipes-extended/cpio/cpio_v2.inc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cpio/cpio_v2.inc b/meta/recipes-extended/cpio/cpio_v2.inc
index 93de4bb..8520ff2 100644
--- a/meta/recipes-extended/cpio/cpio_v2.inc
+++ b/meta/recipes-extended/cpio/cpio_v2.inc
@@ -18,9 +18,11 @@ EXTRA_OECONF += "DEFAULT_RMT_DIR=${base_sbindir}"
 
 do_install () {
     autotools_do_install
-    install -d ${D}${base_bindir}/
-    mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
-    rmdir ${D}${bindir}/
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        install -d ${D}${base_bindir}/
+        mv "${D}${bindir}/cpio" "${D}${base_bindir}/cpio"
+        rmdir ${D}${bindir}/
+    fi
 }
 
 PACKAGES =+ "${PN}-rmt"
-- 
2.5.2


