Return-Path: <awais.belal@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 7D7D772381
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Dec 2014 11:40:50 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so553578pdi.17
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Dec 2014 03:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=c6kjcj08oECG9U5W/HbU8f6aDC9COgzkwH7hw4+oRVc=;
	b=VnRJyb0MEAhkm2SrBmiVKMov6u3itfIGJFN7hNSmLvn0ZjeyrsmQKaShGIFxNfLLDz
	O/bFhNLgeW0+n/nfUm/WImZqIlSVnCxxxrDIX5zPRFTHe2sM1kSyNB9SqmbzIL18v6dl
	nks+tteqKeOQ6xpRfjZO7/GTbyWoxNqGZ5xP5FAuQ8k08ROgqk3Fo5A+o0LaB8p3YXGW
	kq2cHpEZLJLgCKjpIJCjyWx6Kdtc/9WYRkLf9uNpnb7gXY7d8/PZxPXFXGZRASiDW7Dg
	HFhZxBDiSlQB8mhnTFDCqF1v+m1RoiueLq2/fTSH6o5zUhqhnEnmzt67IJ4C0SCBbrow
	4yzw==
X-Received: by 10.70.37.4 with SMTP id u4mr14256516pdj.3.1417779651173;
	Fri, 05 Dec 2014 03:40:51 -0800 (PST)
Received: from awais-Precision-M4700.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPSA id
	hk9sm18677081pdb.47.2014.12.05.03.40.49 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 05 Dec 2014 03:40:50 -0800 (PST)
From: Awais Belal <awais.belal@gmail.com>
X-Google-Original-From: Awais Belal <awais_belal@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Dec 2014 16:40:43 +0500
Message-Id: <1417779643-18350-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] libxcb: fix socket writes
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
X-List-Received-Date: Fri, 05 Dec 2014 11:40:52 -0000

The patch has been picked up from libxcb git and is only
applicable to v1.10 while it gets fixed in mainstream v1.11.
http://cgit.freedesktop.org/xcb/libxcb/commit/?id=be0fe56c3bcad5124dcc6c47a2fad01acd16f71a

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 ...owns-socket-and-no-other-threads-are-writ.patch |  121 ++++++++++++++++++++
 meta/recipes-graphics/xorg-lib/libxcb_1.10.bb      |    3 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-lib/libxcb/ensure-xcb-owns-socket-and-no-other-threads-are-writ.patch

diff --git a/meta/recipes-graphics/xorg-lib/libxcb/ensure-xcb-owns-socket-and-no-other-threads-are-writ.patch b/meta/recipes-graphics/xorg-lib/libxcb/ensure-xcb-owns-socket-and-no-other-threads-are-writ.patch
new file mode 100644
index 0000000..14cefa3
--- /dev/null
+++ b/meta/recipes-graphics/xorg-lib/libxcb/ensure-xcb-owns-socket-and-no-other-threads-are-writ.patch
@@ -0,0 +1,121 @@
+From be0fe56c3bcad5124dcc6c47a2fad01acd16f71a Mon Sep 17 00:00:00 2001
+From: Keith Packard <keithp@keithp.com>
+Date: Mon, 23 Dec 2013 21:15:20 -0800
+Subject: [PATCH] Ensure xcb owns socket and no other threads are writing
+ before send_request
+
+send_request may only write to out.queue if no other thread is busy
+writing to the network (as that thread may be writing from out.queue).
+
+send_request may only allocate request sequence numbers if XCB owns
+the socket.
+
+Therefore, send_request must make sure that both conditions are true
+when it holds iolock, which can only be done by looping until both
+conditions are true without having dropped the lock waiting for the
+second condition.
+
+We choose to get the socket back from Xlib first as get_socket_back
+has a complicated test and checking for other threads writing is a
+simple in-lined check.
+
+This also changes the sequence number checks (64k requests with no
+reply, 4M request wrapping) to ensure that both conditions are true
+before queueing the request.
+
+Signed-off-by: Keith Packard <keithp@keithp.com>
+Reviewed-by: Uli Schlachter <psychon@znc.in>
+---
+ src/xcb_out.c | 57 ++++++++++++++++++++++++++++++++++++++++-----------------
+ 1 file changed, 40 insertions(+), 17 deletions(-)
+
+diff --git a/src/xcb_out.c b/src/xcb_out.c
+index 18bb5f9..dc42954 100644
+--- a/src/xcb_out.c
++++ b/src/xcb_out.c
+@@ -103,6 +103,33 @@ static void get_socket_back(xcb_connection_t *c)
+     _xcb_in_replies_done(c);
+ }
+ 
++static void prepare_socket_request(xcb_connection_t *c)
++{
++    /* We're about to append data to out.queue, so we need to
++     * atomically test for an external socket owner *and* some other
++     * thread currently writing.
++     *
++     * If we have an external socket owner, we have to get the socket back
++     * before we can use it again.
++     *
++     * If some other thread is writing to the socket, we assume it's
++     * writing from out.queue, and so we can't stick data there.
++     *
++     * We satisfy this condition by first calling get_socket_back
++     * (which may drop the lock, but will return when XCB owns the
++     * socket again) and then checking for another writing thread and
++     * escaping the loop if we're ready to go.
++     */
++    for (;;) {
++        if(c->has_error)
++            return;
++        get_socket_back(c);
++        if (!c->out.writing)
++            break;
++        pthread_cond_wait(&c->out.cond, &c->iolock);
++    }
++}
++
+ /* Public interface */
+ 
+ void xcb_prefetch_maximum_request_length(xcb_connection_t *c)
+@@ -236,24 +263,23 @@ unsigned int xcb_send_request(xcb_connection_t *c, int flags, struct iovec *vect
+ 
+     /* get a sequence number and arrange for delivery. */
+     pthread_mutex_lock(&c->iolock);
+-    /* wait for other writing threads to get out of my way. */
+-    while(c->out.writing)
+-        pthread_cond_wait(&c->out.cond, &c->iolock);
+-    get_socket_back(c);
++
++    prepare_socket_request(c);
+ 
+     /* send GetInputFocus (sync_req) when 64k-2 requests have been sent without
+-     * a reply. */
+-    if(req->isvoid && c->out.request == c->in.request_expected + (1 << 16) - 2)
+-        send_sync(c);
+-    /* Also send sync_req (could use NoOp) at 32-bit wrap to avoid having
++     * a reply.
++     * Also send sync_req (could use NoOp) at 32-bit wrap to avoid having
+      * applications see sequence 0 as that is used to indicate
+-     * an error in sending the request */
+-    if((unsigned int) (c->out.request + 1) == 0)
++     * an error in sending the request
++     */
++     
++    while ((req->isvoid && c->out.request == c->in.request_expected + (1 << 16) - 2) ||
++           (unsigned int) (c->out.request + 1) == 0)
++    {
+         send_sync(c);
++        prepare_socket_request(c);
++    }
+ 
+-    /* The above send_sync calls could drop the I/O lock, but this
+-     * thread will still exclude any other thread that tries to write,
+-     * so the sequence number postconditions still hold. */
+     send_request(c, req->isvoid, workaround, flags, vector, veclen);
+     request = c->has_error ? 0 : c->out.request;
+     pthread_mutex_unlock(&c->iolock);
+@@ -373,10 +399,7 @@ int _xcb_out_send(xcb_connection_t *c, struct iovec *vector, int count)
+ 
+ void _xcb_out_send_sync(xcb_connection_t *c)
+ {
+-    /* wait for other writing threads to get out of my way. */
+-    while(c->out.writing)
+-        pthread_cond_wait(&c->out.cond, &c->iolock);
+-    get_socket_back(c);
++    prepare_socket_request(c);
+     send_sync(c);
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb b/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
index d88b025..5bb5f0b 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
+++ b/meta/recipes-graphics/xorg-lib/libxcb_1.10.bb
@@ -6,5 +6,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
 DEPENDS += "libxdmcp"
 
+SRC_URI += "file://ensure-xcb-owns-socket-and-no-other-threads-are-writ.patch \
+"
+
 SRC_URI[md5sum] = "074c335cc4453467eeb234e3dadda700"
 SRC_URI[sha256sum] = "98d9ab05b636dd088603b64229dd1ab2d2cc02ab807892e107d674f9c3f2d5b5"
-- 
1.7.9.5


