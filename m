Return-Path: <kai.kang@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947DDEB64DC
	for <webhook@archiver.kernel.org>; Fri, 14 Jul 2023 15:06:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1159.1689347157644235753
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Jul 2023 08:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=ZeYHCBkE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6559fb2604=kai.kang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36E99u6Z031413
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 08:05:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=PmY16
	LqGrkghr7L5fm6p0Cb/EUwZcp705fFRu/fpeRY=; b=ZeYHCBkEjNdqPUa0LG/CJ
	q8VP9lCISD7Ulb+9yZaHnGib55ar582+e+9JuA0oxdqH6n0BfZtHsEM7LuwQSqLt
	PXmPBNUBLAhDi5IoXT3I5MV4yczXSxZzv41DhwQb6VshuK8bd8CIOGTX3s9Ad38K
	JUP1ln/g5KaY2Hg6d20NTX018qCxdubgLYjupI5LGvfM3JDq48M+seA5J5Wk9aLA
	ugKV3dLrg281ww185V4hPOVPUrvpY/5quumMNUDKoYDdvinNbERTKqcsb0XuH4ul
	DONEYWx/X2bvAOgLxXawKqrEMp5nFwc5gRb2+1mi+4SVjZPcJo0IemS39c8/A2db
	A==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3rtpud0w56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 08:05:57 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 14 Jul 2023 08:05:56 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.27 via Frontend Transport; Fri, 14 Jul 2023 08:05:55 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [mickledore][PATCH] libx11: fix CVE-2023-3138
Date: Fri, 14 Jul 2023 23:05:51 +0800
Message-ID: <20230714150551.3431226-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: XQakNLnPPXgGId9hZUSi30QIyOBvezvV
X-Proofpoint-ORIG-GUID: XQakNLnPPXgGId9hZUSi30QIyOBvezvV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 phishscore=0 mlxlogscore=892 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307140137
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jul 2023 15:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184270

From: Kai Kang <kai.kang@windriver.com>

CVE: CVE-2023-3138

Backport patch to fix CVE-2023-3138 for libx11.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../xorg-lib/libx11/CVE-2023-3138.patch       | 113 ++++++++++++++++++
 .../recipes-graphics/xorg-lib/libx11_1.8.5.bb |   4 +-
 2 files changed, 116 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
new file mode 100644
index 0000000000..0d9397dd95
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/CVE-2023-3138.patch
@@ -0,0 +1,113 @@
+From 304a654a0d57bf0f00d8998185f0360332cfa36c Mon Sep 17 00:00:00 2001
+From: Alan Coopersmith <alan.coopersmith@oracle.com>
+Date: Sat, 10 Jun 2023 16:30:07 -0700
+Subject: [PATCH] InitExt.c: Add bounds checks for extension request, event, &
+ error codes
+
+Fixes CVE-2023-3138: X servers could return values from XQueryExtension
+that would cause Xlib to write entries out-of-bounds of the arrays to
+store them, though this would only overwrite other parts of the Display
+struct, not outside the bounds allocated for that structure.
+
+Reported-by: Gregory James DUCK <gjduck@gmail.com>
+Signed-off-by: Alan Coopersmith <alan.coopersmith@oracle.com>
+
+CVE: CVE-2023-3138
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/lib/libx11/-/commit/304a654]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ src/InitExt.c | 42 ++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 42 insertions(+)
+
+diff --git a/src/InitExt.c b/src/InitExt.c
+index 4de46f15..afc00a6b 100644
+--- a/src/InitExt.c
++++ b/src/InitExt.c
+@@ -33,6 +33,18 @@ from The Open Group.
+ #include <X11/Xos.h>
+ #include <stdio.h>
+ 
++/* The X11 protocol spec reserves events 64 through 127 for extensions */
++#ifndef LastExtensionEvent
++#define LastExtensionEvent 127
++#endif
++
++/* The X11 protocol spec reserves requests 128 through 255 for extensions */
++#ifndef LastExtensionRequest
++#define FirstExtensionRequest 128
++#define LastExtensionRequest 255
++#endif
++
++
+ /*
+  * This routine is used to link a extension in so it will be called
+  * at appropriate times.
+@@ -242,6 +254,12 @@ WireToEventType XESetWireToEvent(
+ 	WireToEventType proc)	/* routine to call when converting event */
+ {
+ 	register WireToEventType oldproc;
++	if (event_number < 0 ||
++	    event_number > LastExtensionEvent) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension event %d\n",
++		    event_number);
++	    return (WireToEventType)_XUnknownWireEvent;
++	}
+ 	if (proc == NULL) proc = (WireToEventType)_XUnknownWireEvent;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->event_vec[event_number];
+@@ -263,6 +281,12 @@ WireToEventCookieType XESetWireToEventCookie(
+     )
+ {
+ 	WireToEventCookieType oldproc;
++	if (extension < FirstExtensionRequest ||
++	    extension > LastExtensionRequest) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n",
++		    extension);
++	    return (WireToEventCookieType)_XUnknownWireEventCookie;
++	}
+ 	if (proc == NULL) proc = (WireToEventCookieType)_XUnknownWireEventCookie;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->generic_event_vec[extension & 0x7F];
+@@ -284,6 +308,12 @@ CopyEventCookieType XESetCopyEventCookie(
+     )
+ {
+ 	CopyEventCookieType oldproc;
++	if (extension < FirstExtensionRequest ||
++	    extension > LastExtensionRequest) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension opcode %d\n",
++		    extension);
++	    return (CopyEventCookieType)_XUnknownCopyEventCookie;
++	}
+ 	if (proc == NULL) proc = (CopyEventCookieType)_XUnknownCopyEventCookie;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->generic_event_copy_vec[extension & 0x7F];
+@@ -305,6 +335,12 @@ EventToWireType XESetEventToWire(
+ 	EventToWireType proc)	/* routine to call when converting event */
+ {
+ 	register EventToWireType oldproc;
++	if (event_number < 0 ||
++	    event_number > LastExtensionEvent) {
++	    fprintf(stderr, "Xlib: ignoring invalid extension event %d\n",
++		    event_number);
++	    return (EventToWireType)_XUnknownNativeEvent;
++	}
+ 	if (proc == NULL) proc = (EventToWireType) _XUnknownNativeEvent;
+ 	LockDisplay (dpy);
+ 	oldproc = dpy->wire_vec[event_number];
+@@ -325,6 +361,12 @@ WireToErrorType XESetWireToError(
+ 	WireToErrorType proc)	/* routine to call when converting error */
+ {
+ 	register WireToErrorType oldproc = NULL;
++	if (error_number < 0 ||
++	    error_number > LastExtensionError) {
++	   fprintf(stderr, "Xlib: ignoring invalid extension error %d\n",
++		    error_number);
++	   return (WireToErrorType)_XDefaultWireError;
++	}
+ 	if (proc == NULL) proc = (WireToErrorType)_XDefaultWireError;
+ 	LockDisplay (dpy);
+ 	if (!dpy->error_vec) {
+-- 
+GitLab
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
index cf2e29471a..028a757d39 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.8.5.bb
@@ -22,7 +22,9 @@ PE = "1"
 
 XORG_PN = "libX11"
 
-SRC_URI += "file://disable_tests.patch"
+SRC_URI += "file://disable_tests.patch \
+            file://CVE-2023-3138.patch \
+            "
 
 SRC_URI[sha256sum] = "e362c6f03c793171becd1ce2078c64789504c7d7ff48ee40a76ff76b59f6b561"
 
-- 
2.34.1


