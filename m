Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E30CCD4F54
	for <webhook@archiver.kernel.org>; Tue, 19 May 2026 07:01:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15935.1779174105397917954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 May 2026 00:01:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=ltP5BN35;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-488ab2db91aso32431475e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 00:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1779174104; x=1779778904; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nEiRYD43zWa1wCzbWNHzOrhR37RZR8PQ4/QXwbHRubw=;
        b=ltP5BN35fPhKenh4Ggw0BHytXx9hYwX1fZpTPgZNID0it7JuS2egOTJ9Nb61ipk+QB
         173D2LJ171NPOsFPATNZpAqomEROEaPao+LyoX5nqN8Aj1ipX9JJygk+U8QluehDinui
         aQcnpDbAMkr6WA0bOPfdW3D7AV9A4ZALIGYxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779174104; x=1779778904;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nEiRYD43zWa1wCzbWNHzOrhR37RZR8PQ4/QXwbHRubw=;
        b=mWbM7IZnr2ceCIVcagfd2qqr9Tl1AFsNv3mGR99/g0VIUG4tfrJrb651NF1wcGrzpo
         c941ZHqM+xId6unGGlHsAaK+9jB9b8Vd07qvjOfaNuzi1vXPfkKneFnmaXT2Ta7q6Lj6
         185QZkoyDWCVWWpIdzIUAHb7JMhfbZFzzQEmth8dLW6B+oqkMbCyVtlRCaZY9vUe2TJs
         DLlKqzWevPzUaY4Oqtk34uWOCKVCiPCbBxLu0XrNWJk2JgRkmmkwcRfvES7/s2feJLQa
         luavdKRk9/a4R0iM+yT7bGEqK/uqCZzbnIO1nS6PWs8Gt9jP3pvImjfHNAOz+2I7MceL
         6GAg==
X-Forwarded-Encrypted: i=1; AFNElJ9Ct5jdeUCFoSuq9AVb2BdcOEQoW6vhCcpV/XnwFnOFvhX94ZwEk789eojwtXnZraE+xF1q3NpZUep87c9DwpsDbg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyeEfY93pv1XdsrDpxDLEuHUCJQYZ+4Hm275iiQdmEc6OG/3wd9
	f+XF9DcWJQDqkr5zRcf1Ot4f3Cf5z+2HQSCMg7olfWhIBetbm82dFtvyW9KxPrHheOo=
X-Gm-Gg: Acq92OGkJylCZp5ifmBb74w5SFJQL5o4ZPzmQh5S8nTHcWIdB+vNskNoP22SpTkAZAu
	XWyQBrYPtq+2b3Vfu3N2rRClbjbg3rbqtpko72ESCfC/64LKH9TVqu92JunmeeRFpfeaFroKnUR
	lXleseIJO9Bmww8UXbVv2Kx4z3xQs7mIZqBOAu34F3a3z6PavbfPpWpEWbn39gWjag0d5E2kfZw
	LRDeUycL0u90MDAFmNE4xuFVy6zzMvMs6/JXFhokr7RNzU1bQDeE3ldXVhTw9VAM8iIX1nn5+6n
	YE6f9aSIrh+b/QyhgM7ZlxAl72wBrI/OM170ZL5ju80wjYiJ8wNnKcahek5vtbL35YRavCGlUjH
	gltbxkzbRBkZyLZ5nBzmkMQp5uY8uSYnUDUXaF5Dccj9qebOGDNt19Rhf6sC8ct0jNctAI/L/N7
	15KcsT5GH5mdVj0nubN9HW3yi2nFdF11Su0NihuHnzN4b5OkavlPcVbg6vG6ln9zawCOTDEPg0n
	7VjFd4n3GbDXdE=
X-Received: by 2002:a05:600c:4692:b0:48f:d5e8:758c with SMTP id 5b1f17b1804b1-48fe6325792mr288081135e9.16.1779174103478;
        Tue, 19 May 2026 00:01:43 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49017d7108fsm22188745e9.23.2026.05.19.00.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 00:01:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 19 May 2026 09:01:43 +0200
Message-Id: <DIMGKZGKFOAP.2INLU5ELU1YNK@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCHv2] qemu: fix for CVE-2025-11234
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Kai" <kai.kang@windriver.com>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260220051011.11250-1-hprajapati@mvista.com>
 <DGVZXBTVF9IV.1T2VD5JUSSC1F@smile.fr>
 <8b5048c5-f57f-45ca-801c-e31357578015@windriver.com>
In-Reply-To: <8b5048c5-f57f-45ca-801c-e31357578015@windriver.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 May 2026 07:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237272

On Mon May 18, 2026 at 10:17 AM CEST, Kai wrote:
> On 3/7/26 04:53, Yoann Congal via lists.openembedded.org wrote:
>> On Fri Feb 20, 2026 at 6:10 AM CET, Hitendra Prajapati via lists.openemb=
edded.org wrote:
>>> This patch fix use after free in websocket handshake code.
>>>
>>> Backport patch from debian refer :
>>> https://security-tracker.debian.org/tracker/CVE-2025-11234
>>>
>>> Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> ---
>>>   meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>>   .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
>>>   .../qemu/qemu/CVE-2025-11234-02.patch         | 174 +++++++++++++++++=
+
>>>   3 files changed, 248 insertions(+)
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.=
patch
>>>   create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.=
patch
>> Hello,
> Hi Yoann,
>> Thanks for the v2, it looks better. But it still needs a fix for
>> whinlatter (the fix is in 10.0.7, whinlatter in 10.0.6, so maybe an
>> upgrade?)
>
> May I ask why it didn't be merged to scarthgap, please?

I simply lost track of it. I've added this one to my scarthgap review
branch. I plan to review the patches in "Awaiting Upstream" state on
patchwork (like this one) for the next cycle.

Thanks!

> Regards,
> Kai
>
>>
>> Regards,
>>
>>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtool=
s/qemu/qemu.inc
>>> index 748a32215e..ba21d57010 100644
>>> --- a/meta/recipes-devtools/qemu/qemu.inc
>>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>>> @@ -43,6 +43,8 @@ SRC_URI =3D"https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \=20
>>> file://qemu-guest-agent.udev \ file://CVE-2024-8354.patch \=20
>>> file://CVE-2025-12464.patch \ + file://CVE-2025-11234-01.patch \ +=20
>>> file://CVE-2025-11234-02.patch \ "
>>>   UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>>  =20
>>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/=
meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>>> new file mode 100644
>>> index 0000000000..c3797bc66f
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>>> @@ -0,0 +1,72 @@
>>> +From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 2001
>>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berrange=
@redhat.com>
>>> +Date: Tue, 30 Sep 2025 11:58:35 +0100
>>> +Subject: [PATCH] io: move websock resource release to close method
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +The QIOChannelWebsock object releases all its resources in the
>>> +finalize callback. This is later than desired, as callers expect
>>> +to be able to call qio_channel_close() to fully close a channel
>>> +and release resources related to I/O.
>>> +
>>> +The logic in the finalize method is at most a failsafe to handle
>>> +cases where a consumer forgets to call qio_channel_close.
>>> +
>>> +This adds equivalent logic to the close method to release the
>>> +resources, using g_clear_handle_id/g_clear_pointer to be robust
>>> +against repeated invocations. The finalize method is tweaked
>>> +so that the GSource is removed before releasing the underlying
>>> +channel.
>>> +
>>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>>> +(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63)
>>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>>> +
>>> +CVE: CVE-2025-11234
>>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/comm=
it/911c814c8cc5f836286bd96694843036db83e99f]
>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> +---
>>> + io/channel-websock.c | 11 ++++++++++-
>>> + 1 file changed, 10 insertions(+), 1 deletion(-)
>>> +
>>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>>> +index de39f0d18..1aac3c88a 100644
>>> +--- a/io/channel-websock.c
>>> ++++ b/io/channel-websock.c
>>> +@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Object =
*obj)
>>> +     buffer_free(&ioc->encinput);
>>> +     buffer_free(&ioc->encoutput);
>>> +     buffer_free(&ioc->rawinput);
>>> +-    object_unref(OBJECT(ioc->master));
>>> +     if (ioc->io_tag) {
>>> +         g_source_remove(ioc->io_tag);
>>> +     }
>>> +     if (ioc->io_err) {
>>> +         error_free(ioc->io_err);
>>> +     }
>>> ++    object_unref(OBJECT(ioc->master));
>>> + }
>>> +
>>> +
>>> +@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChannel=
 *ioc,
>>> +     QIOChannelWebsock *wioc =3D QIO_CHANNEL_WEBSOCK(ioc);
>>> +
>>> +     trace_qio_channel_websock_close(ioc);
>>> ++    buffer_free(&wioc->encinput);
>>> ++    buffer_free(&wioc->encoutput);
>>> ++    buffer_free(&wioc->rawinput);
>>> ++    if (wioc->io_tag) {
>>> ++        g_clear_handle_id(&wioc->io_tag, g_source_remove);
>>> ++    }
>>> ++    if (wioc->io_err) {
>>> ++        g_clear_pointer(&wioc->io_err, error_free);
>>> ++    }
>>> +     return qio_channel_close(wioc->master, errp);
>>> + }
>>> +
>>> +--
>>> +2.50.1
>>> +
>>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch b/=
meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>>> new file mode 100644
>>> index 0000000000..364d19457d
>>> --- /dev/null
>>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>>> @@ -0,0 +1,174 @@
>>> +From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 2001
>>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D<berrange=
@redhat.com>
>>> +Date: Tue, 30 Sep 2025 12:03:15 +0100
>>> +Subject: [PATCH] io: fix use after free in websocket handshake code
>>> +MIME-Version: 1.0
>>> +Content-Type: text/plain; charset=3DUTF-8
>>> +Content-Transfer-Encoding: 8bit
>>> +
>>> +If the QIOChannelWebsock object is freed while it is waiting to
>>> +complete a handshake, a GSource is leaked. This can lead to the
>>> +callback firing later on and triggering a use-after-free in the
>>> +use of the channel. This was observed in the VNC server with the
>>> +following trace from valgrind:
>>> +
>>> +=3D=3D2523108=3D=3D Invalid read of size 4
>>> +=3D=3D2523108=3D=3D    at 0x4054A24: vnc_disconnect_start (vnc.c:1296)
>>> +=3D=3D2523108=3D=3D    by 0x4054A24: vnc_client_error (vnc.c:1392)
>>> +=3D=3D2523108=3D=3D    by 0x4068A09: vncws_handshake_done (vnc-ws.c:10=
5)
>>> +=3D=3D2523108=3D=3D    by 0x44863B4: qio_task_complete (task.c:197)
>>> +=3D=3D2523108=3D=3D    by 0x448343D: qio_channel_websock_handshake_io =
(channel-websock.c:588)
>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.=
lto_priv.0 (gmain.c:4249)
>>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:=
4237)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:28=
7)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop=
.c:310)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_mai=
n.h:58)
>>> +=3D=3D2523108=3D=3D  Address 0x57a6e0dc is 28 bytes inside a block of =
size 103,608 free'd
>>> +=3D=3D2523108=3D=3D    at 0x5F2FE43: free (vg_replace_malloc.c:989)
>>> +=3D=3D2523108=3D=3D    by 0x6EDC444: g_free (gmem.c:208)
>>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_update_client (vnc.c:1153)
>>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_refresh (vnc.c:3225)
>>> +=3D=3D2523108=3D=3D    by 0x4042881: dpy_refresh (console.c:880)
>>> +=3D=3D2523108=3D=3D    by 0x4042881: gui_update (console.c:90)
>>> +=3D=3D2523108=3D=3D    by 0x45EFA1B: timerlist_run_timers.part.0 (qemu=
-timer.c:562)
>>> +=3D2523108=3D=3D    by 0x45EC765: main_loop_wait (main-loop.c:600)
>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_mai=
n.h:58)
>>> +=3D=3D2523108=3D=3D  Block was alloc'd at
>>> +=3D=3D2523108=3D=3D    at 0x5F343F3: calloc (vg_replace_malloc.c:1675)
>>> +=3D=3D2523108=3D=3D    by 0x6EE2F81: g_malloc0 (gmem.c:133)
>>> +=3D=3D2523108=3D=3D    by 0x4057DA3: vnc_connect (vnc.c:3245)
>>> +=3D=3D2523108=3D=3D    by 0x448591B: qio_net_listener_channel_func (ne=
t-listener.c:54)
>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.=
lto_priv.0 (gmain.c:4249)
>>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:=
4237)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:28=
7)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop=
.c:310)
>>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_mai=
n.h:58)
>>> +=3D=3D2523108=3D=3D
>>> +
>>> +The above can be reproduced by launching QEMU with
>>> +
>>> +  $ qemu-system-x86_64 -vnc localhost:0,websocket=3D5700
>>> +
>>> +and then repeatedly running:
>>> +
>>> +  for i in {1..100}; do
>>> +     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 localhost 5700=
 &
>>> +  done
>>> +
>>> +CVE-2025-11234
>>> +Reported-by: Grant Millar | Cylo<rid@cylo.io>
>>> +Reviewed-by: Eric Blake<eblake@redhat.com>
>>> +Signed-off-by: Daniel P. Berrang=C3=A9<berrange@redhat.com>
>>> +(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9)
>>> +Signed-off-by: Michael Tokarev<mjt@tls.msk.ru>
>>> +
>>> +CVE: CVE-2025-11234
>>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/comm=
it/cebdbd038e44af56e74272924dc2bf595a51fd8f]
>>> +Signed-off-by: Hitendra Prajapati<hprajapati@mvista.com>
>>> +---
>>> + include/io/channel-websock.h |  3 ++-
>>> + io/channel-websock.c         | 22 ++++++++++++++++------
>>> + 2 files changed, 18 insertions(+), 7 deletions(-)
>>> +
>>> +diff --git a/include/io/channel-websock.h b/include/io/channel-websock=
.h
>>> +index e180827c5..6700cf894 100644
>>> +--- a/include/io/channel-websock.h
>>> ++++ b/include/io/channel-websock.h
>>> +@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
>>> +     size_t payload_remain;
>>> +     size_t pong_remain;
>>> +     QIOChannelWebsockMask mask;
>>> +-    guint io_tag;
>>> ++    guint hs_io_tag; /* tracking handshake task */
>>> ++    guint io_tag; /* tracking watch task */
>>> +     Error *io_err;
>>> +     gboolean io_eof;
>>> +     uint8_t opcode;
>>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>>> +index 1aac3c88a..583ea8618 100644
>>> +--- a/io/channel-websock.c
>>> ++++ b/io/channel-websock.c
>>> +@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_send=
(QIOChannel *ioc,
>>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_prett=
y(err));
>>> +         qio_task_set_error(task, err);
>>> +         qio_task_complete(task);
>>> ++        wioc->hs_io_tag =3D 0;
>>> +         return FALSE;
>>> +     }
>>> +
>>> +@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_send=
(QIOChannel *ioc,
>>> +             trace_qio_channel_websock_handshake_complete(ioc);
>>> +             qio_task_complete(task);
>>> +         }
>>> ++        wioc->hs_io_tag =3D 0;
>>> +         return FALSE;
>>> +     }
>>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
>>> +@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_io(Q=
IOChannel *ioc,
>>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_prett=
y(err));
>>> +         qio_task_set_error(task, err);
>>> +         qio_task_complete(task);
>>> ++        wioc->hs_io_tag =3D 0;
>>> +         return FALSE;
>>> +     }
>>> +     if (ret =3D=3D 0) {
>>> +@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_io(Q=
IOChannel *ioc,
>>> +     error_propagate(&wioc->io_err, err);
>>> +
>>> +     trace_qio_channel_websock_handshake_reply(ioc);
>>> +-    qio_channel_add_watch(
>>> ++    wioc->hs_io_tag =3D qio_channel_add_watch(
>>> +         wioc->master,
>>> +         G_IO_OUT,
>>> +         qio_channel_websock_handshake_send,
>>> +@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannelWeb=
sock *ioc,
>>> +
>>> +     trace_qio_channel_websock_handshake_start(ioc);
>>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
>>> +-    qio_channel_add_watch(ioc->master,
>>> +-                          G_IO_IN,
>>> +-                          qio_channel_websock_handshake_io,
>>> +-                          task,
>>> +-                          NULL);
>>> ++    ioc->hs_io_tag =3D qio_channel_add_watch(
>>> ++        ioc->master,
>>> ++        G_IO_IN,
>>> ++        qio_channel_websock_handshake_io,
>>> ++        task,
>>> ++        NULL);
>>> + }
>>> +
>>> +
>>> +@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object *o=
bj)
>>> +     buffer_free(&ioc->encinput);
>>> +     buffer_free(&ioc->encoutput);
>>> +     buffer_free(&ioc->rawinput);
>>> ++    if (ioc->hs_io_tag) {
>>> ++        g_source_remove(ioc->hs_io_tag);
>>> ++    }
>>> +     if (ioc->io_tag) {
>>> +         g_source_remove(ioc->io_tag);
>>> +     }
>>> +@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChannel =
*ioc,
>>> +     buffer_free(&wioc->encinput);
>>> +     buffer_free(&wioc->encoutput);
>>> +     buffer_free(&wioc->rawinput);
>>> ++    if (wioc->hs_io_tag) {
>>> ++        g_clear_handle_id(&wioc->hs_io_tag, g_source_remove);
>>> ++    }
>>> +     if (wioc->io_tag) {
>>> +         g_clear_handle_id(&wioc->io_tag, g_source_remove);
>>> +     }
>>> +--
>>> +2.50.1
>>> +
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#232598):https://lists.openembedded.org/g/openembedde=
d-core/message/232598
>> Mute This Topic:https://lists.openembedded.org/mt/117905702/3616933
>> Group Owner:openembedded-core+owner@lists.openembedded.org
>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [ka=
i.kang@windriver.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


--=20
Yoann Congal
Smile ECS


