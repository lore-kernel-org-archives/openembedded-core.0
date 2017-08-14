Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id ED68F78281
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 15:42:30 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Aug 2017 08:42:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,373,1498546800"; d="scan'208";a="1003458720"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga003.jf.intel.com with ESMTP; 14 Aug 2017 08:42:30 -0700
Message-ID: <1502725875.28941.15.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Jose Alarcon <jose.alarcon@ge.com>
Date: Mon, 14 Aug 2017 10:51:15 -0500
In-Reply-To: <20170814080058.129615-1-jose.alarcon@ge.com>
References: <20170814080058.129615-1-jose.alarcon@ge.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2] libx11: Add patch to fix hanging issue in _XReply
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
X-List-Received-Date: Mon, 14 Aug 2017 15:42:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-14 at 11:00 +0300, Jose Alarcon wrote:
> Assume event queue is empty if another thread is blocking waiting for event.
> 
> If one thread was blocking waiting for an event and another thread sent a
> reply to the X server, both threads got blocked until an event was
> received.
> 
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> ---
>  .../libx11/Fix-hanging-issue-in-_XReply.patch      | 60 ++++++++++++++++++++++
>  meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb     |  1 +
>  2 files changed, 61 insertions(+)
>  create mode 100644 meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
> 
> diff --git a/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
> new file mode 100644
> index 0000000..e04acef
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-lib/libx11/Fix-hanging-issue-in-_XReply.patch
> @@ -0,0 +1,60 @@
> +From 5235a7f3692a4c3c90dd4ac1be3c670388904bbe Mon Sep 17 00:00:00 2001
> +From: Tatu Frisk <tatu.frisk@ge.com>
> +Date: Tue, 14 Mar 2017 14:41:27 +0200
> +Subject: [PATCH] Fix hanging issue in _XReply
> +
> +Assume event queue is empty if another thread is blocking waiting for event.
> +
> +If one thread was blocking waiting for an event and another thread sent a
> +reply to the X server, both threads got blocked until an event was
> +received.
> +
> +Upstream-Status: Submitted.

Jose, can you please included where it was submitted:

Upstream-Status: Submitted [where]

More info @
http://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines


> +
> +This patch needs to be removed once the corresponding patch has been merged upstream.
> +
> +https://patchwork.freedesktop.org/patch/171458/
> +
> +Signed-off-by: Tatu Frisk <tatu.frisk@ge.com>
> +Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>
> +---
> + src/xcb_io.c | 19 +++++++------------
> + 1 file changed, 7 insertions(+), 12 deletions(-)
> +
> +diff --git a/src/xcb_io.c b/src/xcb_io.c
> +index 5987329..c64eb04 100644
> +--- a/src/xcb_io.c
> ++++ b/src/xcb_io.c
> +@@ -609,22 +609,17 @@ Status _XReply(Display *dpy, xReply *rep, int extra, Bool discard)
> + 		 * letting anyone else process this sequence number, we
> + 		 * need to process any events that should have come
> + 		 * earlier. */
> +-
> + 		if(dpy->xcb->event_owner == XlibOwnsEventQueue)
> + 		{
> + 			xcb_generic_reply_t *event;
> +-			/* If some thread is already waiting for events,
> +-			 * it will get the first one. That thread must
> +-			 * process that event before we can continue. */
> +-			/* FIXME: That event might be after this reply,
> +-			 * and might never even come--or there might be
> +-			 * multiple threads trying to get events. */
> +-			while(dpy->xcb->event_waiter)
> +-			{ /* need braces around ConditionWait */
> +-				ConditionWait(dpy, dpy->xcb->event_notify);
> ++
> ++			/* Assume event queue is empty if another thread is blocking
> ++			 * waiting for event. */
> ++			if(!dpy->xcb->event_waiter)
> ++			{
> ++				while((event = poll_for_response(dpy)))
> ++					handle_response(dpy, event, True);
> + 			}
> +-			while((event = poll_for_event(dpy)))
> +-				handle_response(dpy, event, True);
> + 		}
> + 
> + 		req->reply_waiter = 0;
> +-- 
> +2.10.1
> +
> diff --git a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> index 50e8837..427bf28 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> +++ b/meta/recipes-graphics/xorg-lib/libx11_1.6.5.bb
> @@ -4,6 +4,7 @@ inherit gettext
>  BBCLASSEXTEND = "native nativesdk"
>  
>  SRC_URI += "file://disable_tests.patch \
> +            file://Fix-hanging-issue-in-_XReply.patch \
>             "
>  do_configure_append () {
>      sed -i -e "/X11_CFLAGS/d" ${B}/src/util/Makefile
> -- 
> 2.10.1
> 



