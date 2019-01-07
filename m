Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BDDE86BB5B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 08:06:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x0786YaB022260
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 Jan 2019 00:06:34 -0800 (PST)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 7 Jan 2019 00:06:33 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 7 Jan 2019 16:06:32 +0800
Message-ID: <1546848392-296663-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libsndfile1: Security fix CVE-2017-17456/17457 CVE-2018-19661/19662
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
X-List-Received-Date: Mon, 07 Jan 2019 08:06:33 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

fix 4 CVEs, which is backport from
https://github.com/erikd/libsndfile/commit/585cc28a93be27d6938f276af0011401b9f7c0ca

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-a-ulaw-fix-multiple-buffer-overflows-432.patch | 101 +++++++++++++++++++++
 .../libsndfile/libsndfile1_1.0.28.bb               |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch

diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
new file mode 100644
index 0000000..c3f44ca
--- /dev/null
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1/0001-a-ulaw-fix-multiple-buffer-overflows-432.patch
@@ -0,0 +1,101 @@
+From 39453899fe1bb39b2e041fdf51a85aecd177e9c7 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Mon, 7 Jan 2019 15:55:03 +0800
+Subject: [PATCH] a/ulaw: fix multiple buffer overflows (#432)
+
+i2ulaw_array() and i2alaw_array() fail to handle ptr [count] = INT_MIN
+properly, leading to buffer underflow. INT_MIN is a special value
+since - INT_MIN cannot be represented as int.
+
+In this case round - INT_MIN to INT_MAX and proceed as usual.
+
+f2ulaw_array() and f2alaw_array() fail to handle ptr [count] = NaN
+properly, leading to null pointer dereference.
+
+In this case, arbitrarily set the buffer value to 0.
+
+This commit fixes #429 (CVE-2018-19661 and CVE-2018-19662) and
+fixes #344 (CVE-2017-17456 and CVE-2017-17457).
+
+Upstream-Status: Backport[https://github.com/erikd/libsndfile/
+commit/585cc28a93be27d6938f276af0011401b9f7c0ca]
+
+CVE: CVE-2017-17456 CVE-2017-17457 CVE-2018-19661 CVE-2018-19662
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/alaw.c | 9 +++++++--
+ src/ulaw.c | 9 +++++++--
+ 2 files changed, 14 insertions(+), 4 deletions(-)
+
+diff --git a/src/alaw.c b/src/alaw.c
+index 063fd1a..4220224 100644
+--- a/src/alaw.c
++++ b/src/alaw.c
+@@ -19,6 +19,7 @@
+ #include	"sfconfig.h"
+ 
+ #include	<math.h>
++#include	<limits.h>
+ 
+ #include	"sndfile.h"
+ #include	"common.h"
+@@ -326,7 +327,9 @@ s2alaw_array (const short *ptr, int count, unsigned char *buffer)
+ static inline void
+ i2alaw_array (const int *ptr, int count, unsigned char *buffer)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (ptr [count] == INT_MIN)
++			buffer [count] = alaw_encode [INT_MAX >> (16 + 4)] ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = alaw_encode [ptr [count] >> (16 + 4)] ;
+ 		else
+ 			buffer [count] = 0x7F & alaw_encode [- ptr [count] >> (16 + 4)] ;
+@@ -346,7 +349,9 @@ f2alaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
+ static inline void
+ d2alaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (!isfinite (ptr [count]))
++			buffer [count] = 0 ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = alaw_encode [lrint (normfact * ptr [count])] ;
+ 		else
+ 			buffer [count] = 0x7F & alaw_encode [- lrint (normfact * ptr [count])] ;
+diff --git a/src/ulaw.c b/src/ulaw.c
+index e50b4cb..b6070ad 100644
+--- a/src/ulaw.c
++++ b/src/ulaw.c
+@@ -19,6 +19,7 @@
+ #include	"sfconfig.h"
+ 
+ #include	<math.h>
++#include	<limits.h>
+ 
+ #include	"sndfile.h"
+ #include	"common.h"
+@@ -827,7 +828,9 @@ s2ulaw_array (const short *ptr, int count, unsigned char *buffer)
+ static inline void
+ i2ulaw_array (const int *ptr, int count, unsigned char *buffer)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (ptr [count] == INT_MIN)
++			buffer [count] = ulaw_encode [INT_MAX >> (16 + 2)] ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = ulaw_encode [ptr [count] >> (16 + 2)] ;
+ 		else
+ 			buffer [count] = 0x7F & ulaw_encode [-ptr [count] >> (16 + 2)] ;
+@@ -847,7 +850,9 @@ f2ulaw_array (const float *ptr, int count, unsigned char *buffer, float normfact
+ static inline void
+ d2ulaw_array (const double *ptr, int count, unsigned char *buffer, double normfact)
+ {	while (--count >= 0)
+-	{	if (ptr [count] >= 0)
++	{	if (!isfinite (ptr [count]))
++			buffer [count] = 0 ;
++		else if (ptr [count] >= 0)
+ 			buffer [count] = ulaw_encode [lrint (normfact * ptr [count])] ;
+ 		else
+ 			buffer [count] = 0x7F & ulaw_encode [- lrint (normfact * ptr [count])] ;
+-- 
+2.7.4
+
diff --git a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
index b28f675..13248f5 100644
--- a/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
+++ b/meta/recipes-multimedia/libsndfile/libsndfile1_1.0.28.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://www.mega-nerd.com/libsndfile/files/libsndfile-${PV}.tar.gz \
            file://CVE-2017-14245-14246.patch \
            file://CVE-2017-14634.patch \
            file://CVE-2018-13139.patch \
+           file://0001-a-ulaw-fix-multiple-buffer-overflows-432.patch \
           "
 
 SRC_URI[md5sum] = "646b5f98ce89ac60cdb060fcd398247c"
-- 
2.7.4


