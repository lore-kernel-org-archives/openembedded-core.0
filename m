Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6587DC531E3
	for <webhook@archiver.kernel.org>; Thu, 19 Feb 2026 21:51:37 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25676.1771537890202496694
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Feb 2026 13:51:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=wpuhaMrr;
 spf=pass (domain: smile.fr, ip: 209.85.128.46, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-483703e4b08so11016325e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 13:51:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771537888; x=1772142688; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJlC4LunBSik7Ot/gFCurZzc1joyAZTaDXmKd81Ra4E=;
        b=wpuhaMrrF+P5JA0Ig/wQQxN8frERQv3RffbGUG0l5ow3PepNOGEsJaAM5qgXLU5MgU
         dVuyGuCzm7KMlGjHdHknMg92WG8nSCeb2tV4qXNbBbyDyTrJ9fHo8cejLd2E4QSBt1m4
         Stq1tfkQMDsfyweIiGq0enPTHLntDrsAwcKhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771537888; x=1772142688;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EJlC4LunBSik7Ot/gFCurZzc1joyAZTaDXmKd81Ra4E=;
        b=mVlu0F1Kq1nPNXbX1fB8VTsZfRjKpdaCWtfKauBTVBiklFV12kUxlb5oGrs+0U1x2B
         lmeir2P6mdlvrJDCbBFPjgN/O5LYDK3JzEkYgwJ39OMydBOyFIsOuXGBIIpklwITjBiA
         WJK68w2IJgNGN8idsC4xS1cce3lVhzar0XTY+s35lNis9qnpO90WxTmFG4Xm1nQ2F6rE
         LQVjCTv7r51EoqNGYBU+bF7Bzn3zrr2iYFYuC+VibqLevG3uMCXwcp+idi/BIsHoUq0e
         B1QoF1Jeg2JX1l6oNaJvLuw9f+gc/mmWFZ0FkVaLjaGifa8Nk4GEIO1D7KCKjCcqY0QL
         UNkA==
X-Forwarded-Encrypted: i=1; AJvYcCWwTo1N1Kjk4z9Q/uImfkxSdwXzjBx3ryKb/EXoLU8u5792kUUvO9xGmfLMH4aSLr/uyAhy2bqSmTzAxTkkMgcB/g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyO8/lPPjAyDPj0YeNqkpkqXiHHeFnIMtLqEj5Je9LK1O77cI2l
	W1nGqYll0ToOB8DKmAIhCjy3uU6+VnANL5rbYPedH5YYvLPnNJfjxhqgoam3kWkiHbk=
X-Gm-Gg: AZuq6aLuWIV/0e8q0+Uc2ftp/NigqPyS34Ib/3mJti7KRNRbwiWQQJMYthc2is0vLga
	IqELfsOFftc0nmpVKxt7+n2cXxCn9enephVkKN69VIbSKhmL8sV9zKMsIQWi1+ifPRc/p2W9LQV
	5jebT+SmGVqUEPndiSLzQ4gZS3yLcNNv1VPJdTdTPRCY5sXVOS7B0aUXSSU5oNYkazIdA04dnoS
	AnHKZ00YBegIvmbXuhVQ9wtTwFqAblHWhadSk7VVtuRUUBCKzfzLcf4Eu72zK2VkfEvpMDmIwIv
	6XbeiyFfHHMauYaYc1TOYy75LlP5GGGPE2EZF1nCpOlz5ndH4b6oNA7elIO2+FQ7Jjb7z+PfXVS
	0epw25hzdPV2KgGjZTppI3mHoM1eylVJN8CM0BlMgkWrUpwFBcoDJTtzoI00rOF7y4aYArgErxd
	7ioQRKZJJ3ZGnJO8akFlbmspIoHda6chKfvRH2hec+5JYQpBXxW3RinRQ6MsPyVRJAn36aCRrst
	EWJcfevvWBXhBE=
X-Received: by 2002:a05:600c:214b:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-4839fe90522mr45880315e9.3.1771537888378;
        Thu, 19 Feb 2026 13:51:28 -0800 (PST)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a5acaasm47061028f8f.6.2026.02.19.13.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:51:27 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Feb 2026 22:51:27 +0100
Message-Id: <DGJ9RQGSFJ6I.PFDF2775VGP1@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] qemu: fix for CVE-2025-11234
From: "Yoann Congal" <yoann.congal@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>, <hprajapati@mvista.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260123055353.139017-1-hprajapati@mvista.com>
 <DGJ9M70V9IT2.1OPDWSE0ZLB5F@smile.fr>
In-Reply-To: <DGJ9M70V9IT2.1OPDWSE0ZLB5F@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Feb 2026 21:51:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231444

On Thu Feb 19, 2026 at 10:44 PM CET, Yoann Congal wrote:
> Hello,
>
> On Fri Jan 23, 2026 at 6:53 AM CET, Hitendra Prajapati via lists.openembe=
dded.org wrote:
>> Upstream-Status: Backport from https://gitlab.com/qemu-project/qemu/-/co=
mmit/911c814c8cc5f836286bd96694843036db83e99f && https://gitlab.com/qemu-pr=
oject/qemu/-/commit/cebdbd038e44af56e74272924dc2bf595a51fd8f
>
> (As the other CVE patches) please remove this Upstream-Status line from c=
ommit
> message, and add a justification for the patches.

And I forgot to add that this patch is needed on whinlatter (fix was
introduced on 10.0.7 and whinlatter is on 10.0.6), but not on master
(where the current 10.2.0 does contain it).

Can you send the fixed version to whinlatter as well?

Thanks!

>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu.inc           |   2 +
>>  .../qemu/qemu/CVE-2025-11234-01.patch         |  72 ++++++++
>>  .../qemu/qemu/CVE-2025-11234-02.patch         | 174 ++++++++++++++++++
>>  3 files changed, 248 insertions(+)
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.pa=
tch
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.pa=
tch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools=
/qemu/qemu.inc
>> index 748a32215e..ba21d57010 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -43,6 +43,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.ta=
r.xz \
>>             file://qemu-guest-agent.udev \
>>             file://CVE-2024-8354.patch \
>>             file://CVE-2025-12464.patch \
>> +           file://CVE-2025-11234-01.patch \
>> +           file://CVE-2025-11234-02.patch \
>>             "
>>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>> =20
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>> new file mode 100644
>> index 0000000000..c3797bc66f
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-01.patch
>> @@ -0,0 +1,72 @@
>> +From 911c814c8cc5f836286bd96694843036db83e99f Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange=
@redhat.com>
>> +Date: Tue, 30 Sep 2025 11:58:35 +0100
>> +Subject: [PATCH] io: move websock resource release to close method
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +The QIOChannelWebsock object releases all its resources in the
>> +finalize callback. This is later than desired, as callers expect
>> +to be able to call qio_channel_close() to fully close a channel
>> +and release resources related to I/O.
>> +
>> +The logic in the finalize method is at most a failsafe to handle
>> +cases where a consumer forgets to call qio_channel_close.
>> +
>> +This adds equivalent logic to the close method to release the
>> +resources, using g_clear_handle_id/g_clear_pointer to be robust
>> +against repeated invocations. The finalize method is tweaked
>> +so that the GSource is removed before releasing the underlying
>> +channel.
>> +
>> +Reviewed-by: Eric Blake <eblake@redhat.com>
>> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> +(cherry picked from commit 322c3c4f3abee616a18b3bfe563ec29dd67eae63)
>> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> +
>> +CVE: CVE-2025-11234
>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commi=
t/911c814c8cc5f836286bd96694843036db83e99f]
>
> This backport is weird to decypher, this commit is in the 7.2 branch
> (while scarthgap has 8.2). The more easy to understand is
> 322c3c4f3abee616a18b3bfe563ec29dd67eae63 (on master and in the 10.2.0
> release)
>
>> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> +---
>> + io/channel-websock.c | 11 ++++++++++-
>> + 1 file changed, 10 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>> +index de39f0d18..1aac3c88a 100644
>> +--- a/io/channel-websock.c
>> ++++ b/io/channel-websock.c
>> +@@ -922,13 +922,13 @@ static void qio_channel_websock_finalize(Object *=
obj)
>> +     buffer_free(&ioc->encinput);
>> +     buffer_free(&ioc->encoutput);
>> +     buffer_free(&ioc->rawinput);
>> +-    object_unref(OBJECT(ioc->master));
>> +     if (ioc->io_tag) {
>> +         g_source_remove(ioc->io_tag);
>> +     }
>> +     if (ioc->io_err) {
>> +         error_free(ioc->io_err);
>> +     }
>> ++    object_unref(OBJECT(ioc->master));
>> + }
>> +=20
>> +=20
>> +@@ -1219,6 +1219,15 @@ static int qio_channel_websock_close(QIOChannel =
*ioc,
>> +     QIOChannelWebsock *wioc =3D QIO_CHANNEL_WEBSOCK(ioc);
>> +=20
>> +     trace_qio_channel_websock_close(ioc);
>> ++    buffer_free(&wioc->encinput);
>> ++    buffer_free(&wioc->encoutput);
>> ++    buffer_free(&wioc->rawinput);
>> ++    if (wioc->io_tag) {
>> ++        g_clear_handle_id(&wioc->io_tag, g_source_remove);
>> ++    }
>> ++    if (wioc->io_err) {
>> ++        g_clear_pointer(&wioc->io_err, error_free);
>> ++    }
>> +     return qio_channel_close(wioc->master, errp);
>> + }
>> +=20
>> +--=20
>> +2.50.1
>> +
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch b/m=
eta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>> new file mode 100644
>> index 0000000000..364d19457d
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2025-11234-02.patch
>> @@ -0,0 +1,174 @@
>> +From cebdbd038e44af56e74272924dc2bf595a51fd8f Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange=
@redhat.com>
>> +Date: Tue, 30 Sep 2025 12:03:15 +0100
>> +Subject: [PATCH] io: fix use after free in websocket handshake code
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +If the QIOChannelWebsock object is freed while it is waiting to
>> +complete a handshake, a GSource is leaked. This can lead to the
>> +callback firing later on and triggering a use-after-free in the
>> +use of the channel. This was observed in the VNC server with the
>> +following trace from valgrind:
>> +
>> +=3D=3D2523108=3D=3D Invalid read of size 4
>> +=3D=3D2523108=3D=3D    at 0x4054A24: vnc_disconnect_start (vnc.c:1296)
>> +=3D=3D2523108=3D=3D    by 0x4054A24: vnc_client_error (vnc.c:1392)
>> +=3D=3D2523108=3D=3D    by 0x4068A09: vncws_handshake_done (vnc-ws.c:105=
)
>> +=3D=3D2523108=3D=3D    by 0x44863B4: qio_task_complete (task.c:197)
>> +=3D=3D2523108=3D=3D    by 0x448343D: qio_channel_websock_handshake_io (=
channel-websock.c:588)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.l=
to_priv.0 (gmain.c:4249)
>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:4=
237)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287=
)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop.=
c:310)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main=
.h:58)
>> +=3D=3D2523108=3D=3D  Address 0x57a6e0dc is 28 bytes inside a block of s=
ize 103,608 free'd
>> +=3D=3D2523108=3D=3D    at 0x5F2FE43: free (vg_replace_malloc.c:989)
>> +=3D=3D2523108=3D=3D    by 0x6EDC444: g_free (gmem.c:208)
>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_update_client (vnc.c:1153)
>> +=3D=3D2523108=3D=3D    by 0x4053F23: vnc_refresh (vnc.c:3225)
>> +=3D=3D2523108=3D=3D    by 0x4042881: dpy_refresh (console.c:880)
>> +=3D=3D2523108=3D=3D    by 0x4042881: gui_update (console.c:90)
>> +=3D=3D2523108=3D=3D    by 0x45EFA1B: timerlist_run_timers.part.0 (qemu-=
timer.c:562)
>> +=3D2523108=3D=3D    by 0x45EC765: main_loop_wait (main-loop.c:600)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main=
.h:58)
>> +=3D=3D2523108=3D=3D  Block was alloc'd at
>> +=3D=3D2523108=3D=3D    at 0x5F343F3: calloc (vg_replace_malloc.c:1675)
>> +=3D=3D2523108=3D=3D    by 0x6EE2F81: g_malloc0 (gmem.c:133)
>> +=3D=3D2523108=3D=3D    by 0x4057DA3: vnc_connect (vnc.c:3245)
>> +=3D=3D2523108=3D=3D    by 0x448591B: qio_net_listener_channel_func (net=
-listener.c:54)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: UnknownInlinedFun (gmain.c:3398)
>> +=3D=3D2523108=3D=3D    by 0x6EDB862: g_main_context_dispatch_unlocked.l=
to_priv.0 (gmain.c:4249)
>> +=3D=3D2523108=3D=3D    by 0x6EDBAE4: g_main_context_dispatch (gmain.c:4=
237)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: glib_pollfds_poll (main-loop.c:287=
)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: os_host_main_loop_wait (main-loop.=
c:310)
>> +=3D=3D2523108=3D=3D    by 0x45EC79F: main_loop_wait (main-loop.c:589)
>> +=3D=3D2523108=3D=3D    by 0x423A56D: qemu_main_loop (runstate.c:835)
>> +=3D=3D2523108=3D=3D    by 0x454F300: qemu_default_main (main.c:37)
>> +=3D=3D2523108=3D=3D    by 0x73D6574: (below main) (libc_start_call_main=
.h:58)
>> +=3D=3D2523108=3D=3D
>> +
>> +The above can be reproduced by launching QEMU with
>> +
>> +  $ qemu-system-x86_64 -vnc localhost:0,websocket=3D5700
>> +
>> +and then repeatedly running:
>> +
>> +  for i in {1..100}; do
>> +     (echo -n "GET / HTTP/1.1" && sleep 0.05) | nc -w 1 localhost 5700 =
&
>> +  done
>> +
>> +CVE-2025-11234
>> +Reported-by: Grant Millar | Cylo <rid@cylo.io>
>> +Reviewed-by: Eric Blake <eblake@redhat.com>
>> +Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
>> +(cherry picked from commit b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9)
>> +Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> +
>> +CVE: CVE-2025-11234
>> +Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commi=
t/cebdbd038e44af56e74272924dc2bf595a51fd8f]
>
> Same idea: b7a1f2ca45c7865b9e98e02ae605a65fc9458ae9 is easier to
> understand.
>> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> +---
>> + include/io/channel-websock.h |  3 ++-
>> + io/channel-websock.c         | 22 ++++++++++++++++------
>> + 2 files changed, 18 insertions(+), 7 deletions(-)
>> +
>> +diff --git a/include/io/channel-websock.h b/include/io/channel-websock.=
h
>> +index e180827c5..6700cf894 100644
>> +--- a/include/io/channel-websock.h
>> ++++ b/include/io/channel-websock.h
>> +@@ -61,7 +61,8 @@ struct QIOChannelWebsock {
>> +     size_t payload_remain;
>> +     size_t pong_remain;
>> +     QIOChannelWebsockMask mask;
>> +-    guint io_tag;
>> ++    guint hs_io_tag; /* tracking handshake task */
>> ++    guint io_tag; /* tracking watch task */
>> +     Error *io_err;
>> +     gboolean io_eof;
>> +     uint8_t opcode;
>> +diff --git a/io/channel-websock.c b/io/channel-websock.c
>> +index 1aac3c88a..583ea8618 100644
>> +--- a/io/channel-websock.c
>> ++++ b/io/channel-websock.c
>> +@@ -545,6 +545,7 @@ static gboolean qio_channel_websock_handshake_send(=
QIOChannel *ioc,
>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty=
(err));
>> +         qio_task_set_error(task, err);
>> +         qio_task_complete(task);
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +=20
>> +@@ -560,6 +561,7 @@ static gboolean qio_channel_websock_handshake_send(=
QIOChannel *ioc,
>> +             trace_qio_channel_websock_handshake_complete(ioc);
>> +             qio_task_complete(task);
>> +         }
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_OUT);
>> +@@ -586,6 +588,7 @@ static gboolean qio_channel_websock_handshake_io(QI=
OChannel *ioc,
>> +         trace_qio_channel_websock_handshake_fail(ioc, error_get_pretty=
(err));
>> +         qio_task_set_error(task, err);
>> +         qio_task_complete(task);
>> ++        wioc->hs_io_tag =3D 0;
>> +         return FALSE;
>> +     }
>> +     if (ret =3D=3D 0) {
>> +@@ -597,7 +600,7 @@ static gboolean qio_channel_websock_handshake_io(QI=
OChannel *ioc,
>> +     error_propagate(&wioc->io_err, err);
>> +=20
>> +     trace_qio_channel_websock_handshake_reply(ioc);
>> +-    qio_channel_add_watch(
>> ++    wioc->hs_io_tag =3D qio_channel_add_watch(
>> +         wioc->master,
>> +         G_IO_OUT,
>> +         qio_channel_websock_handshake_send,
>> +@@ -907,11 +910,12 @@ void qio_channel_websock_handshake(QIOChannelWebs=
ock *ioc,
>> +=20
>> +     trace_qio_channel_websock_handshake_start(ioc);
>> +     trace_qio_channel_websock_handshake_pending(ioc, G_IO_IN);
>> +-    qio_channel_add_watch(ioc->master,
>> +-                          G_IO_IN,
>> +-                          qio_channel_websock_handshake_io,
>> +-                          task,
>> +-                          NULL);
>> ++    ioc->hs_io_tag =3D qio_channel_add_watch(
>> ++        ioc->master,
>> ++        G_IO_IN,
>> ++        qio_channel_websock_handshake_io,
>> ++        task,
>> ++        NULL);
>> + }
>> +=20
>> +=20
>> +@@ -922,6 +926,9 @@ static void qio_channel_websock_finalize(Object *ob=
j)
>> +     buffer_free(&ioc->encinput);
>> +     buffer_free(&ioc->encoutput);
>> +     buffer_free(&ioc->rawinput);
>> ++    if (ioc->hs_io_tag) {
>> ++        g_source_remove(ioc->hs_io_tag);
>> ++    }
>> +     if (ioc->io_tag) {
>> +         g_source_remove(ioc->io_tag);
>> +     }
>> +@@ -1222,6 +1229,9 @@ static int qio_channel_websock_close(QIOChannel *=
ioc,
>> +     buffer_free(&wioc->encinput);
>> +     buffer_free(&wioc->encoutput);
>> +     buffer_free(&wioc->rawinput);
>> ++    if (wioc->hs_io_tag) {
>> ++        g_clear_handle_id(&wioc->hs_io_tag, g_source_remove);
>> ++    }
>> +     if (wioc->io_tag) {
>> +         g_clear_handle_id(&wioc->io_tag, g_source_remove);
>> +     }
>> +--=20
>> +2.50.1
>> +


--=20
Yoann Congal
Smile ECS


