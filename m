Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60195C47073
	for <webhook@archiver.kernel.org>; Thu,  4 Jan 2024 18:00:50 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web11.595.1704391240356388238
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jan 2024 10:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=BYkuB08h;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.47, mailfrom: steve@sakoman.com)
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-50eaabc36bcso904162e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 10:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1704391238; x=1704996038; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4IEsm9HN4ABizrZUbWxBUCfXAG8m9nUXIsr6vSaqadw=;
        b=BYkuB08hx3JvYOYjv8cfRMn7bfdQSfa7oeF2eQ88BTlJP0Cw7EBFG0chJA7Quioqkd
         cr++IC5wepTMjeKKYL8FFp7D90IU5Tr2NKocLWY7xOh/O5m7LbNkArZDLRkIPb42d7jp
         URyqSKNaALb+h78SDbAJimKEGlxZvZSkjXYKG/u3a+saSxPr+/eunH6CYf9lVKPll9md
         h2qOLeKyem9qgBefEFP3nmq3rZynQzswAlWcH/ipG+TD+cOCOG2Md28HCsqo3LH/6K2/
         trLY1tFuMCaGW3oBcXZJ0Gio8bfrf+SAvoa7oNjuNSp2dBnZdL93scvxIexM3sUPvKRJ
         Rukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704391238; x=1704996038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IEsm9HN4ABizrZUbWxBUCfXAG8m9nUXIsr6vSaqadw=;
        b=TuKRvHEnpUzq04nSlnyhpTdQG3o7+0x2olEqBPMKsn9GPqO9OuKdpxJBu3PrRClLEl
         qv8NVtQTh3Ztn265/CAdttH/DWGYPH0ec2ECSQ4iSJbd85WfdCgw2Yu6aiSb7ddjrgSS
         /5l6BcDWbh8Ndmx1JNljt7WNNMZFk1NpmOUJkvq5Mtg5X6BkAeWralVYfMjIsBpP1XsE
         YTr+yT8EzPZgMAQiW7aVKyxKXtk9bjSZmIAQ/PlE/dIpExC4RXMll142vjtgTpVTKywr
         C246DqxfN5FFSODce/Zr7UD5BFB3xCDHBFUepbiBT6dUGRt2Br/bdEdLzKG5WAdgHSfV
         WSWQ==
X-Gm-Message-State: AOJu0Yzudg2+8Uch0RWGMQhPGcMKALQXGH8jMGAs7KW8IlezHJf5qBXw
	apva0qEKxeK+4EWN94D8Q/RrLiEz3ztzxJ/fEywjP+WnZdqdKQ==
X-Google-Smtp-Source: AGHT+IE8vd94kCSGMgEvkG8MGgIyXVeKGhijF1yHWSp6suGtqYQxSCLt5JMllPrsxeTo5seWFgoHT1pUye5w2nEwl5o=
X-Received: by 2002:a19:f01a:0:b0:50e:9f5f:a78e with SMTP id
 p26-20020a19f01a000000b0050e9f5fa78emr504299lfc.5.1704391237865; Thu, 04 Jan
 2024 10:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20240103090049.2048094-1-meenali.gupta@windriver.com>
In-Reply-To: <20240103090049.2048094-1-meenali.gupta@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 4 Jan 2024 08:00:26 -1000
Message-ID: <CAOSpxdYAcn5ZXCJVq8x3koW53+3kyMVmZbS=kRay_t-f0-tbjg@mail.gmail.com>
Subject: Re: [oe-core][kirkstone][PATCH 1/1] dropbear: fix CVE-2023-48795
To: meenali.gupta@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jan 2024 18:00:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193331

This patch fails at build time:

ERROR: dropbear-2020.81-r0 do_patch: Applying patch
'CVE-2023-48795.patch' on target directory
'/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-lin=
ux/dropbear/2020.81-r0/dropbear-2020.81'
CmdError('quilt --quiltrc
/home/steve/builds/poky-contrib-kirkstone/build/tmp/work/core2-64-poky-linu=
x/dropbear/2020.81-r0/recipe-sysroot-native/etc/quiltrc
push', 0, 'stdout: Applying patch CVE-2023-48795.patch
patching file cli-session.c
Hunk #2 succeeded at 115 (offset -3 lines).
Hunk #3 succeeded at 475 (offset -14 lines).
patching file common-algo.c
Hunk #1 succeeded at 332 (offset 25 lines).
patching file common-kex.c
Hunk #2 FAILED at 198.
Hunk #3 succeeded at 555 (offset 1 line).
Hunk #4 succeeded at 869 (offset 2 lines).
1 out of 4 hunks FAILED -- rejects in file common-kex.c
patching file kex.h
patching file process-packet.c
Hunk #2 FAILED at 55.
1 out of 3 hunks FAILED -- rejects in file process-packet.c
patching file ssh.h
patching file svr-session.c
Hunk #1 succeeded at 342 (offset -28 lines).
Patch CVE-2023-48795.patch does not apply (enforce with -f)

Please submit a V2 with these issues fixed.

Thanks!

Steve

On Tue, Jan 2, 2024 at 11:02=E2=80=AFPM Meenali Gupta via
lists.openembedded.org
<meenali.gupta=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Meenali Gupta <meenali.gupta@windriver.com>
>
> A flaw was found in the SSH channel integrity.
> By manipulating sequence numbers during the handshake,
> an attacker can remove the initial messages on the secure
> channel without causing a MAC failure. For example, an attacker
> could disable the ping extension and thus disable the new
> countermeasure in OpenSSH 9.5 against keystroke timing attacks.
>
> Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> ---
>  meta/recipes-core/dropbear/dropbear.inc       |   1 +
>  .../dropbear/dropbear/CVE-2023-48795.patch    | 235 ++++++++++++++++++
>  2 files changed, 236 insertions(+)
>  create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2023-48795.pa=
tch
>
> diff --git a/meta/recipes-core/dropbear/dropbear.inc b/meta/recipes-core/=
dropbear/dropbear.inc
> index e61930f7db..a32242949b 100644
> --- a/meta/recipes-core/dropbear/dropbear.inc
> +++ b/meta/recipes-core/dropbear/dropbear.inc
> @@ -30,6 +30,7 @@ SRC_URI =3D "http://matt.ucc.asn.au/dropbear/releases/d=
ropbear-${PV}.tar.bz2 \
>             ${@bb.utils.contains('PACKAGECONFIG', 'disable-weak-ciphers',=
 'file://dropbear-disable-weak-ciphers.patch', '', d)} \
>            file://CVE-2021-36369.patch \
>            file://CVE-2023-36328.patch \
> +          file://CVE-2023-48795.patch \
>            "
>
>  PAM_SRC_URI =3D "file://0005-dropbear-enable-pam.patch \
> diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch b/m=
eta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
> new file mode 100644
> index 0000000000..d3f7c014ef
> --- /dev/null
> +++ b/meta/recipes-core/dropbear/dropbear/CVE-2023-48795.patch
> @@ -0,0 +1,235 @@
> +From 768546edcf45794538f81c096f5544a5d35e336f Mon Sep 17 00:00:00 2001
> +From: Matt Johnston <matt@ucc.asn.au>
> +Date: Mon, 20 Nov 2023 14:02:47 +0800
> +Subject: [PATCH] Implement Strict KEX mode
> +
> +As specified by OpenSSH with kex-strict-c-v00@openssh.com and
> +kex-strict-s-v00@openssh.com.
> +
> +CVE: CVE-2023-48795
> +
> +Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/6e43be=
5c7b99dbee49dc72b6f989f29fdd7e9356]
> +
> +Signed-off-by: Meenali Gupta <meenali.gupta@windriver.com>
> +---
> + cli-session.c    | 11 +++++++++++
> + common-algo.c    |  6 ++++++
> + common-kex.c     | 24 ++++++++++++++++++++++++
> + kex.h            |  3 +++
> + process-packet.c | 35 +++++++++++++++++++----------------
> + ssh.h            |  4 ++++
> + svr-session.c    |  3 +++
> + 7 files changed, 70 insertions(+), 16 deletions(-)
> +
> +diff --git a/cli-session.c b/cli-session.c
> +index 5981b24..d261c8f 100644
> +--- a/cli-session.c
> ++++ b/cli-session.c
> +@@ -46,6 +46,7 @@ static void cli_finished(void) ATTRIB_NORETURN;
> + static void recv_msg_service_accept(void);
> + static void cli_session_cleanup(void);
> + static void recv_msg_global_request_cli(void);
> ++static void cli_algos_initialise(void);
> +
> + struct clientsession cli_ses; /* GLOBAL */
> +
> +@@ -117,6 +118,7 @@ void cli_session(int sock_in, int sock_out, struct d=
ropbear_progress_connection
> +       }
> +
> +       chaninitialise(cli_chantypes);
> ++      cli_algos_initialise();
> +
> +       /* Set up cli_ses vars */
> +       cli_session_init(proxy_cmd_pid);
> +@@ -487,3 +489,12 @@ void cli_dropbear_log(int priority, const char* for=
mat, va_list param) {
> +       fflush(stderr);
> + }
> +
> ++static void cli_algos_initialise(void) {
> ++      algo_type *algo;
> ++      for (algo =3D sshkex; algo->name; algo++) {
> ++              if (strcmp(algo->name, SSH_STRICT_KEX_S) =3D=3D 0) {
> ++                      algo->usable =3D 0;
> ++              }
> ++      }
> ++}
> ++
> +diff --git a/common-algo.c b/common-algo.c
> +index 378f0ca..f9d46eb 100644
> +--- a/common-algo.c
> ++++ b/common-algo.c
> +@@ -307,6 +307,12 @@ algo_type sshkex[] =3D {
> +       /* Set unusable by svr_algos_initialise() */
> +       {SSH_EXT_INFO_C, 0, NULL, 1, NULL},
> + #endif
> ++#endif
> ++#if DROPBEAR_CLIENT
> ++      {SSH_STRICT_KEX_C, 0, NULL, 1, NULL},
> ++#endif
> ++#if DROPBEAR_SERVER
> ++      {SSH_STRICT_KEX_S, 0, NULL, 1, NULL},
> + #endif
> +       {NULL, 0, NULL, 0, NULL}
> + };
> +diff --git a/common-kex.c b/common-kex.c
> +index ac88442..e6825e1 100644
> +--- a/common-kex.c
> ++++ b/common-kex.c
> +@@ -183,6 +183,10 @@ void send_msg_newkeys() {
> +       gen_new_keys();
> +       switch_keys();
> +
> ++      if (ses.kexstate.strict_kex) {
> ++              ses.transseq =3D 0;
> ++      }
> ++
> +       TRACE(("leave send_msg_newkeys"))
> + }
> +
> +@@ -194,6 +198,10 @@ void recv_msg_newkeys() {
> +       ses.kexstate.recvnewkeys =3D 1;
> +       switch_keys();
> +
> ++      if (ses.kexstate.strict_kex) {
> ++              ses.recvseq =3D 0;
> ++      }
> ++
> +       TRACE(("leave recv_msg_newkeys"))
> + }
> +
> +@@ -550,6 +558,10 @@ void recv_msg_kexinit() {
> +
> +       ses.kexstate.recvkexinit =3D 1;
> +
> ++        if (ses.kexstate.strict_kex && !ses.kexstate.donefirstkex && se=
s.recvseq !=3D 1) {
> ++              dropbear_exit("First packet wasn't kexinit");
> ++      }
> ++
> +       TRACE(("leave recv_msg_kexinit"))
> + }
> +
> +@@ -859,6 +871,18 @@ static void read_kex_algos() {
> +       }
> + #endif
> +
> ++      if (!ses.kexstate.donefirstkex) {
> ++              const char* strict_name;
> ++              if (IS_DROPBEAR_CLIENT) {
> ++                      strict_name =3D SSH_STRICT_KEX_S;
> ++              } else {
> ++                      strict_name =3D SSH_STRICT_KEX_C;
> ++              }
> ++              if (buf_has_algo(ses.payload, strict_name) =3D=3D DROPBEA=
R_SUCCESS) {
> ++                      ses.kexstate.strict_kex =3D 1;
> ++              }
> ++      }
> ++
> +       algo =3D buf_match_algo(ses.payload, sshkex, kexguess2, &goodgues=
s);
> +       allgood &=3D goodguess;
> +       if (algo =3D=3D NULL || algo->data =3D=3D NULL) {
> +diff --git a/kex.h b/kex.h
> +index 77cf21a..7fcc3c2 100644
> +--- a/kex.h
> ++++ b/kex.h
> +@@ -83,6 +83,9 @@ struct KEXState {
> +
> +       unsigned our_first_follows_matches : 1;
> +
> ++      /* Boolean indicating that strict kex mode is in use */
> ++      unsigned int strict_kex;
> ++
> +       time_t lastkextime; /* time of the last kex */
> +       unsigned int datatrans; /* data transmitted since last kex */
> +       unsigned int datarecv; /* data received since last kex */
> +diff --git a/process-packet.c b/process-packet.c
> +index 9454160..0270f71 100644
> +--- a/process-packet.c
> ++++ b/process-packet.c
> +@@ -44,6 +44,7 @@ void process_packet() {
> +
> +       unsigned char type;
> +       unsigned int i;
> ++      unsigned int first_strict_kex =3D ses.kexstate.strict_kex && !ses=
.kexstate.donefirstkex;
> +       time_t now;
> +
> +       TRACE2(("enter process_packet"))
> +@@ -54,22 +55,23 @@ void process_packet() {
> +       now =3D monotonic_now();
> +       ses.last_packet_time_keepalive_recv =3D now;
> +
> +-      /* These packets we can receive at any time */
> +-      switch(type) {
> +-
> +-              case SSH_MSG_IGNORE:
> +-                      goto out;
> +-              case SSH_MSG_DEBUG:
> +-                      goto out;
> ++      if (type =3D=3D SSH_MSG_DISCONNECT) {
> ++              /* Allowed at any time */
> ++              dropbear_close("Disconnect received");
> ++      }
> +
> +-              case SSH_MSG_UNIMPLEMENTED:
> +-                      /* debugging XXX */
> +-                      TRACE(("SSH_MSG_UNIMPLEMENTED"))
> +-                      goto out;
> +-
> +-              case SSH_MSG_DISCONNECT:
> +-                      /* TODO cleanup? */
> +-                      dropbear_close("Disconnect received");
> ++      /* These packets may be received at any time,
> ++         except during first kex with strict kex */
> ++      if (!first_strict_kex) {
> ++              switch(type) {
> ++                      case SSH_MSG_IGNORE:
> ++                              goto out;
> ++                      case SSH_MSG_DEBUG:
> ++                              goto out;
> ++                      case SSH_MSG_UNIMPLEMENTED:
> ++                              TRACE(("SSH_MSG_UNIMPLEMENTED"))
> ++                              goto out;
> ++              }
> +       }
> +
> +       /* Ignore these packet types so that keepalives don't interfere w=
ith
> +@@ -98,7 +100,8 @@ void process_packet() {
> +                       if (type >=3D 1 && type <=3D 49
> +                               && type !=3D SSH_MSG_SERVICE_REQUEST
> +                               && type !=3D SSH_MSG_SERVICE_ACCEPT
> +-                              && type !=3D SSH_MSG_KEXINIT)
> ++                              && type !=3D SSH_MSG_KEXINIT
> ++                              && !first_strict_kex)
> +                       {
> +                               TRACE(("unknown allowed packet during kex=
init"))
> +                               recv_unimplemented();
> +diff --git a/ssh.h b/ssh.h
> +index 1b4fec6..ef3efdc 100644
> +--- a/ssh.h
> ++++ b/ssh.h
> +@@ -100,6 +100,10 @@
> + #define SSH_EXT_INFO_C "ext-info-c"
> + #define SSH_SERVER_SIG_ALGS "server-sig-algs"
> +
> ++/* OpenSSH strict KEX feature */
> ++#define SSH_STRICT_KEX_S "kex-strict-s-v00@openssh.com"
> ++#define SSH_STRICT_KEX_C "kex-strict-c-v00@openssh.com"
> ++
> + /* service types */
> + #define SSH_SERVICE_USERAUTH "ssh-userauth"
> + #define SSH_SERVICE_USERAUTH_LEN 12
> +diff --git a/svr-session.c b/svr-session.c
> +index 769f073..a538e2c 100644
> +--- a/svr-session.c
> ++++ b/svr-session.c
> +@@ -370,6 +370,9 @@ static void svr_algos_initialise(void) {
> +                       algo->usable =3D 0;
> +               }
> + #endif
> ++              if (strcmp(algo->name, SSH_STRICT_KEX_C) =3D=3D 0) {
> ++                      algo->usable =3D 0;
> ++              }
> +       }
> + }
> +
> +--
> +2.40.0
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193277): https://lists.openembedded.org/g/openembedde=
d-core/message/193277
> Mute This Topic: https://lists.openembedded.org/mt/103498799/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

