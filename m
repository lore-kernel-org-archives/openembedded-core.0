Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 098E1C25B78
	for <webhook@archiver.kernel.org>; Thu, 16 May 2024 15:39:09 +0000 (UTC)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.17289.1715873947152083851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 May 2024 08:39:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1G3Sa5cs;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.173, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dee9943a293so4597029276.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1715873946; x=1716478746; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VwcNhWo1Q4SizEYiWi/mHgNA9I3zxyXsZki07a9O0QA=;
        b=1G3Sa5csic33bZpkk33S8EI5JXV1rSrxBRgNS47gpCXhZZ42GDi4MsDm+EPV6uWvmj
         oPX7+oXifmOCpD3jffJatTULcZQcG+0kOEgmMqeX+hHyfIOIQy5FPxHrIa3IeOIjxiAQ
         o17YbM1LeKOdo9Pq9Ns7VvuikDkFPz7QL0WhcHqzFwF1CIcQoDstyPg59gBDAjvlnOcD
         +/wRMz6xcHr4qsIcuZwtMzpYv9+Un9+nRjgcv71zXlmnuab6/rcPuVRj7FueZo9n6xQ+
         kJoVjKNPWM/SH4X/Jpz1E8IiHNh51BFTAI/5mlRhRxi07Mc7hw3HQ8oaIm99xTdo9X4c
         S0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715873946; x=1716478746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VwcNhWo1Q4SizEYiWi/mHgNA9I3zxyXsZki07a9O0QA=;
        b=Q5FV50x8nmtZvfOWybXuDmptUhU/BmoRRKuA5JlI7al1nYBS9QwUN6esSkqrP2rVVe
         yOMzUrIsbA7Jt3yd1JzeNm95gulIrMCRP8b/998TznZ1gi54o8dlOZOmsYKaQkB07wsu
         n2VeIbqt3zIo0GQiirq+cCwgUGY9mmQb3FfBvTtfTSuU5gRZkmenI6xyT8qeY8Bkinbh
         ++CdoeNlk4uDCn7QkwoxoBYo/V6XfomntnCzwt0EJHWTQxGFJjH6C3fTXq4b4XRziytZ
         1oeiCTHFlP3TGJ05YOisGz8jZ5yPneQdfz/7DTVtVCFbj4EpLbLmYUEx8sMayrcR3K8t
         uHUw==
X-Gm-Message-State: AOJu0YwM7DIIyfzDdt7eqdC8CQ5/SqAX9lE58zdutBZbIo+vAn7lomjb
	gb7Uq4XeF9KCUGgFq4+GTVGbNRKg0S5L5xKylufwzl4Qaynem+laN+02GHg5KPAs3pt7lhr7JID
	1ifTGZ2c8R2ZdAk2q+mHCQUl/m+Yhu8QADP323nPCtgDz/+4Ld7M=
X-Google-Smtp-Source: AGHT+IFy1HJHbx933OHFhIFQ0DDNyQd5NCr7pw3at/uXSahmI3c7omr1Af1aAfnUrtSmRhApB3lRVGfcQBMVrSWkZ1U=
X-Received: by 2002:a25:4e85:0:b0:de8:a770:4812 with SMTP id
 3f1490d57ef6-dee4f3149dfmr16279816276.40.1715873946019; Thu, 16 May 2024
 08:39:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240515055338.788503-1-soumya.sambu@windriver.com>
In-Reply-To: <20240515055338.788503-1-soumya.sambu@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 16 May 2024 08:38:54 -0700
Message-ID: <CAOSpxdYa6xJLiE+GPC55XrQA96NJRq+baSwe6UytH3x1vGm3gw@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH 1/1] bluez5: Fix CVE-2023-50230,
 CVE-2023-50229 and CVE-2023-27349
To: soumya.sambu@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 May 2024 15:39:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199491

This overlaps with the following commit in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D688f3725d2bc14=
f1343d2d3fb9b13c58c1140089

Please submit a V2 which omits the already fixed CVEs

Thanks!

Steve

On Tue, May 14, 2024 at 10:54=E2=80=AFPM Soumya via lists.openembedded.org
<soumya.sambu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Soumya Sambu <soumya.sambu@windriver.com>
>
> CVE-2023-50230:
> BlueZ Phone Book Access Profile Heap-based Buffer Overflow Remote Code
> Execution Vulnerability. This vulnerability allows network-adjacent
> attackers to execute arbitrary code on affected installations of BlueZ.
> User interaction is required to exploit this vulnerability in that the
> target must connect to a malicious Bluetooth device. The specific flaw
> exists within the handling of the Phone Book Access profile. The issue
> results from the lack of proper validation of the length of user-supplied
> data prior to copying it to a fixed-length heap-based buffer. An attacker
> can leverage this vulnerability to execute code in the context of root.
> Was ZDI-CAN-20938.
>
> CVE-2023-50229:
> BlueZ Phone Book Access Profile Heap-based Buffer Overflow Remote Code
> Execution Vulnerability. This vulnerability allows network-adjacent
> attackers to execute arbitrary code on affected installations of BlueZ.
> User interaction is required to exploit this vulnerability in that the
> target must connect to a malicious Bluetooth device. The specific flaw
> exists within the handling of the Phone Book Access profile. The issue
> results from the lack of proper validation of the length of user-supplied
> data prior to copying it to a fixed-length heap-based buffer. An attacker
> can leverage this vulnerability to execute code in the context of root.
> Was ZDI-CAN-20936.
>
> CVE-2023-27349:
> BlueZ Audio Profile AVRCP Improper Validation of Array Index Remote Code
> Execution Vulnerability. This vulnerability allows network-adjacent
> attackers to execute arbitrary code via Bluetooth on affected installatio=
ns
> of BlueZ. User interaction is required to exploit this vulnerability in
> that the target must connect to a malicious device. The specific flaw
> exists within the handling of the AVRCP protocol. The issue results from
> the lack of proper validation of user-supplied data, which can result in =
a
> write past the end of an allocated buffer. An attacker can leverage this
> vulnerability to execute code in the context of root. Was ZDI-CAN-19908.
>
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-50230
> https://nvd.nist.gov/vuln/detail/CVE-2023-50229
> https://nvd.nist.gov/vuln/detail/CVE-2023-27349
>
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  meta/recipes-connectivity/bluez5/bluez5.inc   |  4 +-
>  .../bluez5/bluez5/CVE-2023-27349.patch        | 52 ++++++++++++++
>  .../CVE-2023-50230-CVE-2023-50229.patch       | 71 +++++++++++++++++++
>  3 files changed, 126 insertions(+), 1 deletion(-)
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-2734=
9.patch
>  create mode 100644 meta/recipes-connectivity/bluez5/bluez5/CVE-2023-5023=
0-CVE-2023-50229.patch
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-c=
onnectivity/bluez5/bluez5.inc
> index 7786b65670..a752975b3a 100644
> --- a/meta/recipes-connectivity/bluez5/bluez5.inc
> +++ b/meta/recipes-connectivity/bluez5/bluez5.inc
> @@ -54,7 +54,9 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/bluetooth/bluez-=
${PV}.tar.xz \
>             ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'file:=
//0001-Allow-using-obexd-without-systemd-in-the-user-sessio.patch', d)} \
>             file://0001-tests-add-a-target-for-building-tests-without-run=
nin.patch \
>             file://0001-test-gatt-Fix-hung-issue.patch \
> -          file://CVE-2023-45866.patch \
> +           file://CVE-2023-45866.patch \
> +           file://CVE-2023-50230-CVE-2023-50229.patch \
> +           file://CVE-2023-27349.patch \
>             "
>  S =3D "${WORKDIR}/bluez-${PV}"
>
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch=
 b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
> new file mode 100644
> index 0000000000..26edb3a5cb
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-27349.patch
> @@ -0,0 +1,52 @@
> +From f54299a850676d92c3dafd83e9174fcfe420ccc9 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Wed, 22 Mar 2023 11:34:24 -0700
> +Subject: [PATCH] avrcp: Fix crash while handling unsupported events
> +
> +The following crash can be observed if the remote peer send and
> +unsupported event:
> +
> +ERROR: AddressSanitizer: heap-use-after-free on address 0x60b000148f11
> + at pc 0x559644552088 bp 0x7ffe28b3c7b0 sp 0x7ffe28b3c7a0
> + WRITE of size 1 at 0x60b000148f11 thread T0
> +     #0 0x559644552087 in avrcp_handle_event profiles/audio/avrcp.c:3907
> +     #1 0x559644536c22 in control_response profiles/audio/avctp.c:939
> +     #2 0x5596445379ab in session_cb profiles/audio/avctp.c:1108
> +     #3 0x7fbcb3e51c43 in g_main_context_dispatch (/lib/x86_64-linux-gnu=
/libglib-2.0.so.0+0x55c43)
> +     #4 0x7fbcb3ea66c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7)
> +     #5 0x7fbcb3e512b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libglib=
-2.0.so.0+0x552b2)
> +     #6 0x559644754ab6 in mainloop_run src/shared/mainloop-glib.c:66
> +     #7 0x559644755606 in mainloop_run_with_signal src/shared/mainloop-n=
otify.c:188
> +     #8 0x5596445bb963 in main src/main.c:1289
> +     #9 0x7fbcb3bafd8f in __libc_start_call_main ../sysdeps/nptl/libc_st=
art_call_main.h:58
> +     #10 0x7fbcb3bafe3f in __libc_start_main_impl ../csu/libc-start.c:39=
2
> +     #11 0x5596444e8224 in _start (/usr/local/libexec/bluetooth/bluetoot=
hd+0xf0224)
> +
> +CVE: CVE-2023-27349
> +
> +Upstream-Status: Backport [https://git.kernel.org/pub/scm/bluetooth/blue=
z.git/commit/?id=3Df54299a850676d92c3dafd83e9174fcfe420ccc9]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + profiles/audio/avrcp.c | 6 ++++++
> + 1 file changed, 6 insertions(+)
> +
> +diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
> +index 80f34c7..dda9a30 100644
> +--- a/profiles/audio/avrcp.c
> ++++ b/profiles/audio/avrcp.c
> +@@ -3901,6 +3901,12 @@ static gboolean avrcp_handle_event(struct avctp *=
conn, uint8_t code,
> +       case AVRCP_EVENT_UIDS_CHANGED:
> +               avrcp_uids_changed(session, pdu);
> +               break;
> ++      default:
> ++              if (event > AVRCP_EVENT_LAST) {
> ++                      warn("Unsupported event: %u", event);
> ++                      return FALSE;
> ++              }
> ++              break;
> +       }
> +
> +       session->registered_events |=3D (1 << event);
> +--
> +2.40.0
> diff --git a/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2=
023-50229.patch b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CV=
E-2023-50229.patch
> new file mode 100644
> index 0000000000..5d44d78469
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez5/bluez5/CVE-2023-50230-CVE-2023-502=
29.patch
> @@ -0,0 +1,71 @@
> +From 5ab5352531a9cc7058cce569607f3a6831464443 Mon Sep 17 00:00:00 2001
> +From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> +Date: Tue, 19 Sep 2023 12:14:01 -0700
> +Subject: [PATCH] pbap: Fix not checking Primary/Secundary Counter length
> +
> +Primary/Secundary Counters are supposed to be 16 bytes values, if the
> +server has implemented them incorrectly it may lead to the following
> +crash:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=3D=3D31860=3D=3DERROR: AddressSanitizer: heap-buffer-overflow on addres=
s
> +0x607000001878 at pc 0x7f95a1575638 bp 0x7fff58c6bb80 sp 0x7fff58c6b328
> +
> + READ of size 48 at 0x607000001878 thread T0
> +     #0 0x7f95a1575637 in MemcmpInterceptorCommon(void*, int (*)(void co=
nst*, void const*, unsigned long), void const*, void const*, unsigned long)=
 ../../../../src/libsanitizer/sanitizer_common/sanitizer_common_interceptor=
s.inc:860
> +     #1 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsaniti=
zer/sanitizer_common/sanitizer_common_interceptors.inc:892
> +     #2 0x7f95a1575ba6 in __interceptor_memcmp ../../../../src/libsaniti=
zer/sanitizer_common/sanitizer_common_interceptors.inc:887
> +     #3 0x564df69c77a0 in read_version obexd/client/pbap.c:288
> +     #4 0x564df69c77a0 in read_return_apparam obexd/client/pbap.c:352
> +     #5 0x564df69c77a0 in phonebook_size_callback obexd/client/pbap.c:37=
4
> +     #6 0x564df69bea3c in session_terminate_transfer obexd/client/sessio=
n.c:921
> +     #7 0x564df69d56b0 in get_xfer_progress_first obexd/client/transfer.=
c:729
> +     #8 0x564df698b9ee in handle_response gobex/gobex.c:1140
> +     #9 0x564df698cdea in incoming_data gobex/gobex.c:1385
> +     #10 0x7f95a12fdc43 in g_main_context_dispatch (/lib/x86_64-linux-gn=
u/libglib-2.0.so.0+0x55c43)
> +     #11 0x7f95a13526c7  (/lib/x86_64-linux-gnu/libglib-2.0.so.0+0xaa6c7=
)
> +     #12 0x7f95a12fd2b2 in g_main_loop_run (/lib/x86_64-linux-gnu/libgli=
b-2.0.so.0+0x552b2)
> +     #13 0x564df6977d41 in main obexd/src/main.c:307
> +     #14 0x7f95a10a7d8f in __libc_start_call_main ../sysdeps/nptl/libc_s=
tart_call_main.h:58
> +     #15 0x7f95a10a7e3f in __libc_start_main_impl ../csu/libc-start.c:39=
2
> +     #16 0x564df6978704 in _start (/usr/local/libexec/bluetooth/obexd+0x=
8b704)
> + 0x607000001878 is located 0 bytes to the right of 72-byte region [0x607=
000001830,0x607000001878)
> +
> + allocated by thread T0 here:
> +     #0 0x7f95a1595a37 in __interceptor_calloc ../../../../src/libsaniti=
zer/asan/asan_malloc_linux.cpp:154
> +     #1 0x564df69c8b6a in pbap_probe obexd/client/pbap.c:1259
> +
> +CVE: CVE-2023-50230, CVE-2023-50229
> +
> +Upstream-Status: Backport [https://github.com/bluez/bluez/commit/5ab5352=
531a9cc7058cce569607f3a6831464443]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + obexd/client/pbap.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/obexd/client/pbap.c b/obexd/client/pbap.c
> +index 1ed8c68..2d2aa95 100644
> +--- a/obexd/client/pbap.c
> ++++ b/obexd/client/pbap.c
> +@@ -285,7 +285,7 @@ static void read_version(struct pbap_data *pbap, GOb=
exApparam *apparam)
> +               data =3D value;
> +       }
> +
> +-      if (memcmp(pbap->primary, data, len)) {
> ++      if (len =3D=3D sizeof(pbap->primary) && memcmp(pbap->primary, dat=
a, len)) {
> +               memcpy(pbap->primary, data, len);
> +               g_dbus_emit_property_changed(conn,
> +                                       obc_session_get_path(pbap->sessio=
n),
> +@@ -299,7 +299,8 @@ static void read_version(struct pbap_data *pbap, GOb=
exApparam *apparam)
> +               data =3D value;
> +       }
> +
> +-      if (memcmp(pbap->secondary, data, len)) {
> ++      if (len =3D=3D sizeof(pbap->secondary) &&
> ++                      memcmp(pbap->secondary, data, len)) {
> +               memcpy(pbap->secondary, data, len);
> +               g_dbus_emit_property_changed(conn,
> +                                       obc_session_get_path(pbap->sessio=
n),
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199270): https://lists.openembedded.org/g/openembedde=
d-core/message/199270
> Mute This Topic: https://lists.openembedded.org/mt/106109462/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

