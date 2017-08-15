Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5A08178170
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 05:29:28 +0000 (UTC)
Received: from pps.filterd (m0048204.ppops.net [127.0.0.1])
	by m0048204.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v7F5TSlc047444 for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 01:29:30 -0400
From: Jose Alarcon <jose.alarcon@ge.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Aug 2017 08:29:13 +0300
Message-Id: <20170815052913.140594-1-jose.alarcon@ge.com>
X-Mailer: git-send-email 2.10.1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-08-15_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=1 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1706020000
	definitions=main-1708150094
Subject: [PATCH v3] libx11: Add patch to fix hanging issue in _XReply
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
X-List-Received-Date: Tue, 15 Aug 2017 05:29:29 -0000

Assume event queue is empty if another thread is blocking waiting for event.

If one thread was blocking waiting for an event and another thread sent a
reply to the X server, both threads got blocked until an event was
received.

Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
---
 .../libx11/Fix-hanging-issue-in-_XReply.patch      | 60 ++++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch

diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
new file mode 100644
index 0000000..897882b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
@@ -0,0 +1,60 @@
+From 5235a7f3692a4c3c90dd4ac1be3c670388904bbe Mon Sep 17 00:00:00 2001
+From: Tatu Frisk <tatu.frisk@ge.com>
+Date: Tue, 14 Mar 2017 14:41:27 +0200
+Subject: [PATCH] Fix hanging issue in _XReply
+
+Assume event queue is empty if another thread is blocking waiting for event.
+
+If one thread was blocking waiting for an event and another thread sent a
+reply to the X server, both threads got blocked until an event was
+received.
+
+Upstream-Status: Submitted [https://patchwork.freedesktop.org/patch/171458/]
+
+This patch needs to be removed once the corresponding patch has been merged upstream.
+
+https://patchwork.freedesktop.org/patch/171458/
+
+Signed-off-by: Tatu Frisk <tatu.frisk@ge.com>
+Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
+---
+ src/xcb_io.c | 19 +++++++------------
+ 1 file changed, 7 insertions(+), 12 deletions(-)
+
+diff --git a/src/xcb_io.c b/src/xcb_io.c
+index 5987329..c64eb04 100644
+--- a/src/xcb_io.c
++++ b/src/xcb_io.c
+@@ -609,22 +609,17 @@ Status _XReply(Display *dpy, xReply *rep, int extra, Bool discard)
+ 		 * letting anyone else process this sequence number, we
+ 		 * need to process any events that should have come
+ 		 * earlier. */
+-
+ 		if(dpy->xcb->event_owner == XlibOwnsEventQueue)
+ 		{
+ 			xcb_generic_reply_t *event;
+-			/* If some thread is already waiting for events,
+-			 * it will get the first one. That thread must
+-			 * process that event before we can continue. */
+-			/* FIXME: That event might be after this reply,
+-			 * and might never even come--or there might be
+-			 * multiple threads trying to get events. */
+-			while(dpy->xcb->event_waiter)
+-			{ /* need braces around ConditionWait */
+-				ConditionWait(dpy, dpy->xcb->event_notify);
++
++			/* Assume event queue is empty if another thread is blocking
++			 * waiting for event. */
++			if(!dpy->xcb->event_waiter)
++			{
++				while((event = poll_for_response(dpy)))
++					handle_response(dpy, event, True);
+ 			}
+-			while((event = poll_for_event(dpy)))
+-				handle_response(dpy, event, True);
+ 		}
+ 
+ 		req->reply_waiter = 0;
+-- 
+2.10.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
index 50e8837..427bf28 100644
--- a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
@@ -4,6 +4,7 @@ inherit gettext
 BBCLASSEXTEND = "native nativesdk"
 
 SRC_URI += "file://disable_tests.patch \
+            file://Fix-hanging-issue-in-_XReply.patch \
            "
 do_configure_append () {
     sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
-- 
2.10.1


