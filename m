Return-Path: <ole2mail@mail.com>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 19 Jan 2018 11:11:53 UTC
Received: from mout.gmx.com (mout.gmx.com [74.208.4.201])
	by mail.openembedded.org (Postfix) with ESMTP id 2740A78776
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jan 2018 11:11:53 +0000 (UTC)
Received: from localhost.localdomain ([109.0.249.169]) by mail.gmx.com
	(mrgmxus002 [74.208.5.15]) with ESMTPSA (Nemesis) id
	0M7HJw-1ezvIi3ZtG-00x5O7; Fri, 19 Jan 2018 12:06:27 +0100
From: Oleg Kokorin <ole2mail@mail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jan 2018 12:06:16 +0100
Message-Id: <1516359976-26345-1-git-send-email-ole2mail@mail.com>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K0:n9duvZBGBfqrntnvAxuX6z+3J4ajRWXzJBE7bjLVVLS5g12RtcK
	Zrxa/N0iIPJitiKssH/VLoxVL5g4EY1uEVcSPlxBdCtarJPiAegkfQ+sEML6ctkJjYYxtEq
	fYz/sWY66Q2s+bbJWdkoA7Na6fi3aNf1vwTiUYAx/+5hnlTqiPmQNcr7nDQumdAJCS+PuOs
	2dglb/c+srMI16vEzuRTg==
X-UI-Out-Filterresults: notjunk:1;V01:K0:8U1Hga+qdng=:B459wGtgg2A83qou2Wavoj
	RomcnO7I2WQ9RJmlzwdz7kCH/yyDhfEfrfaF933w1F4lE3BmiMPU6yjly9KJLrZ/5jviW3WF8
	IlEW7vek7/6uLqw//Zgf2fetPD7epS5vUgaqgVwArLz+2OgVCALI3MV1ojqjYAmK3kG2X2+3/
	JRC3H2ezx1RzI28oY2XCItx9nKnOJYB6iWxiTgUgvWBh/7RERADg1U8aeuI1XJgT8QbKossal
	baVUjj6k2XAL+EGjQxoFUXxlZvWDlvIyVU42tQDW8I+MMq2v/j/w5NgxnOUSpxWtnVidA17aY
	uXK2geUadIel2ch3Kv6TSIK3y1bRSqDvRGyPfPSrSvZhx8RtJx66VOAa97LKqvuvH1Xb0Gv8o
	KTDnsplBTfCUM9ooMhmu9+6/boyhAlxrcDQVAruObgOlNJ2yG/RNMIHElo+xq2d+ZFYkkLifg
	WYxYceMXq3rwGSJHVDE/PJ6r8Xrj9yOePjU+7OniMT0d4beAJUmajix8Y5fFYN/CvFvwAufpT
	Eb/egMDv8/3mjhDAajC88apPoYw6OjDB4zMhQPAmoQ+J4zVfaOAfArAqWS45RvBb/d/+n88QA
	WTamQhfXoAKHTq1XjGsVwJoJ+djPVja9vAwDt9sOCoqMgknSWJF037hJzfPRG1FEsQ+SxEHb6
	GRp0UYHM15oMGGg4niTdI6QF2jFpAt8iVLm6wn2O9F04DNsnovXxv5PMOKxHOfYVadT3c6CqA
	0V22KOfXgZ7WhIMGFDT6iKU6iAI8w5UKU3hJveOIW0J2WWfsnHOnE4N85stk5Si2x0vfMZI1l
	n4ii80DPd1ydAp3NTVG8nhv9rsqAY4csId32ns/Pn09bpvI0QQ=
Subject: [PATCH] mtd-utils: remove double hashtable iterator definition
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
X-List-Received-Date: Fri, 19 Jan 2018 11:11:53 -0000

hashtable_iterator_key and hashtable_iterator_value redefinition inside
mkfs.ubifs/hashtable/hashtable_itr.h cause linker redefinition error

Signed-off-by: Oleg Kokorin <ole2mail@mail.com>
---
 .../mtd-utils-fix-hashtable_iterator.patch         | 31 ++++++++++++++++++++++
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |  1 +
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch

diff --git a/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
new file mode 100644
index 0000000..082f3b1
--- /dev/null
+++ b/meta/recipes-devtools/mtd/mtd-utils/mtd-utils-fix-hashtable_iterator.patch
@@ -0,0 +1,31 @@
+Index: setup-scripts/build/tmp-angstrom_v2014_12-glibc/work/x86_64-linux/mtd-utils-native/1.5.1+gitAUTOINC+9f107132a6-r0/git/mkfs.ubifs/hashtable/hashtable_itr.h
+===================================================================
+--- a/mkfs.ubifs/hashtable/hashtable_itr.h
++++ b/mkfs.ubifs/hashtable/hashtable_itr.h
+@@ -27,22 +27,22 @@ hashtable_iterator(struct hashtable *h);
+ /*****************************************************************************/
+ /* hashtable_iterator_key
+  * - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_key(struct hashtable_itr *i)
+ {
+     return i->e->k;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* value - return the value of the (key,value) pair at the current position */
+-
++/*
+ extern inline void *
+ hashtable_iterator_value(struct hashtable_itr *i)
+ {
+     return i->e->v;
+ }
+-
++*/
+ /*****************************************************************************/
+ /* advance - advance the iterator to the next element
+  *           returns zero if advanced to end of table */
diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_git.bb
index 52297c6..f903a65 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_git.bb
@@ -11,6 +11,7 @@ SRCREV = "9f107132a6a073cce37434ca9cda6917dd8d866b"
 SRC_URI = "git://git.infradead.org/mtd-utils.git \
 		file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 		file://fix-armv7-neon-alignment.patch \
+		file://mtd-utils-fix-hashtable_iterator.patch \
 "
 
 PV = "1.5.1+git${SRCPV}"
-- 
2.7.4


