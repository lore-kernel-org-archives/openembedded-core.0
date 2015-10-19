Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 81A24770DF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 08:17:39 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 541FAA00458
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 10:17:53 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101910173678-42258 ;
	Mon, 19 Oct 2015 10:17:36 +0200 
From: Stefan Christ <s.christ@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Oct 2015 10:15:36 +0200
Message-Id: <1445242541-41638-3-git-send-email-s.christ@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 10:17:36,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 10:17:36,
	Serialize complete at 19.10.2015 10:17:36
Subject: [PATCH 2/7] linux-dtb.inc: fix file ending detection
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
X-List-Received-Date: Mon, 19 Oct 2015 08:17:42 -0000

Only search for 'dts' at the end of the filename. Don't trigger the
warning when the device tree name only contains 'dts'. The sed command
already replaces the string 'dts' only at the end.

Signed-off-by: Stefan Christ <s.christ@phytec.de>
---
 meta/recipes-kernel/linux/linux-dtb.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
index db2afb8..d73792a 100644
--- a/meta/recipes-kernel/linux/linux-dtb.inc
+++ b/meta/recipes-kernel/linux/linux-dtb.inc
@@ -8,7 +8,7 @@ python __anonymous () {
 do_compile_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q 'dts'; then
+			if echo ${DTB} | grep -q '\.dts$'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
@@ -20,7 +20,7 @@ do_compile_append() {
 do_install_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q 'dts'; then
+			if echo ${DTB} | grep -q '\.dts$'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
@@ -38,7 +38,7 @@ do_install_append() {
 do_deploy_append() {
 	if test -n "${KERNEL_DEVICETREE}"; then
 		for DTB in ${KERNEL_DEVICETREE}; do
-			if echo ${DTB} | grep -q 'dts'; then
+			if echo ${DTB} | grep -q '\.dts$'; then
 				bbwarn "${DTB} contains the full path to the the dts file, but only the dtb name should be used."
 				DTB=`basename ${DTB} | sed 's,\.dts$,.dtb,g'`
 			fi
-- 
1.9.1


