Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 345B37701D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:11 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0Mh6lB-1ZGpjM3ndp-00MLGn; Thu, 17 Sep 2015 18:15:05
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 18:13:42 +0200
Message-Id: <1442506425-5096-2-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
References: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:WvmFyhHTRoRRs/oQ348gNp8VFDCdWR+ka40ToN8yODhTs7A3BZe
	/6BGvg4UtHTyOjdfhfu8w/HNpNaV/RDQqWDgmelteAGyYQKW9ujhgt2nTbq7TkdBGE2zqrF
	pBIZmZa0+ACe3T7GkDv6XuwA+Q0ZCvOb1Q7tFO5o/umXFloG5wfGWJUn1wJ7ZbUdDM53EgR
	ewh+8FdJTCIEFD53WBDqQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:hrKoc5ku4QU=:irmS144mRUU5UWCMa8kIpe
	Lg9DUTik+YWX+NmQRcvwS42gQkRNOcfdXjMvMjHb/NFoWPWFk7ZBx9ErxtGL3Pw7bpXamFLJa
	G9nYGD7m/+ie1NRaAffft1NbQQ+opgRJG2ojWtM1GPKgHk5DpxBBGoY0upntEQ286MF5fcwpY
	MUyYbx7ncLPLDSaPno/Vl8NQUcqzVHiF9r9l29Hdn1mcoFoOdeN8eaWNLOvozPdfRbOi9ILss
	oSXf2grvU5mmkgNEqa12PfdO1jmGBVo2cSN547uAHoYDcxOdtYcJAU8AsvbPTt0oJxxsCMPxf
	veS99goMW/YFBK1z9pmjeuSljDlFm4HAl4CD1//0jOK/A2VZOU0W1A451Qa8EuUtt3YhIehOo
	pOcf3WLtSCQNsOLH4+EUVdl1Ld/vUcNqn/hMMiwZh6cqortq1+sJ1xLfRXBoEAbjdNqoP9RMp
	P70NEPskjNF3y9oIG6dl7JpB5FeFDjgfDADbekt5q1WJLS+rQwWZ0kxqJeSV/iYgRkk4LV8l5
	s8W3nBqwGwdvQDARfxsLPKJgUsk6O/KAQGXga+r2p8VwyAJKNHurH1Qi8C6+zJyL25+cZCF2m
	W0QEE9KsNbw/M17V7sPAnMruxNHAIdriSwm1MQftDnV2qelRaQYnsUTfbnkuYHOrKyLX7a2sw
	cGj091SrBkT1d5+4yH+pESdR6ZTmCJ6YMuZvnLi+Ev+lyOkIiEoyjUB+C383zphWP7JM9SjTW
	LTLym8M9aOF/NEuxYIUGYcmAzgxD9aM08l57RQ==
Subject: [PATCH 1/4] tar: fix install if bindir == base_bindir
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
 meta/recipes-extended/tar/tar.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-extended/tar/tar.inc b/meta/recipes-extended/tar/tar.inc
index b339c43..93e4da1 100644
--- a/meta/recipes-extended/tar/tar.inc
+++ b/meta/recipes-extended/tar/tar.inc
@@ -22,10 +22,12 @@ do_install () {
 }
 
 do_install_append_class-target() {
-    install -d ${D}${base_bindir}
-    mv ${D}${bindir}/tar ${D}${base_bindir}/tar
-    mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
-    rmdir ${D}${bindir}/
+    if [ "${base_bindir}" != "${bindir}" ]; then
+        install -d ${D}${base_bindir}
+        mv ${D}${bindir}/tar ${D}${base_bindir}/tar
+        mv ${D}${bindir}/gtar ${D}${base_bindir}/gtar
+        rmdir ${D}${bindir}/
+    fi
 }
 
 PACKAGES =+ "${PN}-rmt"
-- 
2.5.2


