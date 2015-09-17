Return-Path: <dominic.sacre@gmx.de>
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	by mail.openembedded.org (Postfix) with ESMTP id 337FD77011
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 16:20:11 +0000 (UTC)
Received: from dastp.lan ([37.24.103.185]) by mail.gmx.com (mrgmx102) with
	ESMTPSA (Nemesis) id 0MZOan-1ZK7Vv1SG5-00LGw5; Thu, 17 Sep 2015 18:15:06
	+0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Sep 2015 18:13:45 +0200
Message-Id: <1442506425-5096-5-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.5.2
In-Reply-To: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
References: <1442506425-5096-1-git-send-email-dominic.sacre@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K0:zAyIIK3sKxCPmz27/WXxKAogBnyUERCCA6iGSYhiT3oe90svjvm
	58LnyQDyO0rrrez3Oc5M/maZHwQeAhkEaQMegUQlJvLbM6000zO65mXdVhwGSV3jobRuCtg
	/gTI/CigdBiWY5A7f9VLC+pM1V1UlKeb/Kaej7AVLk99CQPpj1E1ShbuajgnoTjH5RvP5ge
	D4XMFLZeOzTFVOA2ugkSQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:sqQwgP8Qr4c=:Y0tRXBNS/YU1b3Y1RQPF/p
	R7LyEPVMabq9ufuetu7s8Omoluqz96QHQl/Xllqvpy5X+MKdKSr35I2eB+0XlN+ZnVwhqOucl
	4zEdtXVuPQ4WaAB6NGKEU6A+3ViHJ3Pv0U8disJR+WJMX3/cqn2uxNsFuwxp1bpjPVZHkc+cb
	6cK4q0bXh/hkfUzQk1pDfgBemi1zIJDZ5mmg4Ig21C6W8HyyX2tu4xeCd2VmgoKnvkkeskMCh
	SZ+udxUnv8rUk2wiF7Gzp//+FkMoDEafRlR9JM+XUQ2oRB3KJrxlH1TXxls8ChlpdgKiuUa4T
	Or8j1QGTTvAogGwZ99G0zir08Ie6VWdcqo0bMH20/XGyFUP5VoHOs7lVVih1bWPBB2T60omlX
	U4huNFZXLq1WX57CUjDzBnKf2Hff1VvMGMK3DOFtiHxf0rlRRiCk12H6rJumO8MDgTMPVEfaW
	EZUoaXrUPJMF+Wz8pNj1FmSHX0ZH6mVu1riymqodsAIBBmb/KDHasJzHX4tt6NW4kQOisOwGJ
	pynv9G4MGlf8DUK0WmG5j7nScw/Wwp+99hR8+P231fw405b4PQinI368K1w4sjMv+zCmoDsNm
	y+F9s/eQFnsHL5vwsD+WNw0xly9HSpWZyo6yMF0RWULC902Rn4HAB1GXBXFkoptiREAqMsL6u
	JnKDXnm0a9bNbjVHexiK+wYqxR5iYpXRuZNQ1qWp226cESBuhc/H/v8kH/YvErqdoH8K0rFvl
	DmU1OBQxC+XU24aTRH/Jy10913nFUZKOxVC2Og==
Subject: [PATCH 4/4] grep: fix install if bindir == base_bindir
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
 meta/recipes-extended/grep/grep_2.21.bb | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/grep/grep_2.21.bb b/meta/recipes-extended/grep/grep_2.21.bb
index 3661098..c51147b 100644
--- a/meta/recipes-extended/grep/grep_2.21.bb
+++ b/meta/recipes-extended/grep/grep_2.21.bb
@@ -23,11 +23,13 @@ do_configure_prepend () {
 
 do_install () {
 	autotools_do_install
-	install -d ${D}${base_bindir}
-	mv ${D}${bindir}/grep ${D}${base_bindir}/grep
-	mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
-	mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
-	rmdir ${D}${bindir}/
+	if [ "${base_bindir}" != "${bindir}" ]; then
+		install -d ${D}${base_bindir}
+		mv ${D}${bindir}/grep ${D}${base_bindir}/grep
+		mv ${D}${bindir}/egrep ${D}${base_bindir}/egrep
+		mv ${D}${bindir}/fgrep ${D}${base_bindir}/fgrep
+		rmdir ${D}${bindir}/
+	fi
 }
 
 inherit update-alternatives
-- 
2.5.2


