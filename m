Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0EDC4345F
	for <webhook@archiver.kernel.org>; Tue, 23 Apr 2024 12:51:12 +0000 (UTC)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
 by mx.groups.io with SMTP id smtpd.web10.17711.1713876667811510512
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Apr 2024 05:51:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=3aXhS1Z1;
 spf=softfail (domain: sakoman.com, ip: 209.85.128.175, mailfrom: steve@sakoman.com)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-61b601da8f1so23224917b3.3
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1713876667; x=1714481467; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qkPxQ7t7/KRypdmImpx01wKCFKiOAMEg7Tas6bfac7o=;
        b=3aXhS1Z1g9+qpVpLJ78H5O4yvkqZ9lcvTK/+NIl5knmzFfEYTMOBw7vW1yNxAIu8KV
         komITfHFGAgn1pE8ZvoKkvzK+A+dreNOPCpdq2+24dHGLCGZ6dIHnTb/hkex3E/sonDw
         55hf7Ahs8nR2d+78XcwkJ0OFy8r8TighQiR+oGD4wGetsE5CQn7rJTG4DlRZIczLHvYY
         brLHvjDj+lmhdyDa3j6R8kDRJQGb72lls2ofUsuU1EWzppCeHQp1WGDFgwnXxcuNCkX4
         O5x1ah5rExMIWJJCmBxoR8owAt0Ag71gHQ4iOh0NcOE91gb+wcA+4WvAx54Q+vvHPzfG
         tMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713876667; x=1714481467;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qkPxQ7t7/KRypdmImpx01wKCFKiOAMEg7Tas6bfac7o=;
        b=BL9Br+G0UE/o6giQ3ws4glRZkrai4e7kxyIG4Zq50EIPZ4j4mQRJ6cOsCS1PbbEMXV
         PJgKvbn5s9b5dXx1Hsj+UWxE1BSPjy0Vdo5GJ0Db63MD/Rc/S4N4ikGMpTDqCAgw6Rl0
         A/sRydrF5cuHYBQ0+cN9Q8r3oflqkLDzSNoXFZmjWyr+GHwbVw5/U6L4GVfKRs6Li2Ij
         rDhFXIRql02VM9yHGePwzY+V1M1MqQmHKFx/4MwKbSoA/llXMO6jmPCg3ohVZtGRE7jH
         MxTDon86J7VIi6m8O5/sJ+FqsFMesg7nawU+/oGUNiP/hERECMFstgWgsNt3X1miKWQb
         VLTw==
X-Gm-Message-State: AOJu0YzR3r95veL2bnQTdvCn44QFUvghwXNhCaAOEHE17M/zksjLyBZg
	E1S+dc/URvkqEVILJDwhxxxGmouB+CTE+Srt7eZD/+Nj1c+VOeqfwO2Vr8TqGhjy13Fyubhwn79
	mT5pWnuhzp/3oKRqpTnCxKzc9Z0EAAzf1fOVQlw==
X-Google-Smtp-Source: AGHT+IHqbBpL9X3rWFKXypfJwB3KRkjozudn0u+6Mo2ml4DetIFqY9N/v2viJf/5GU3BHJJnWKTxedWdofKcZ34zvQI=
X-Received: by 2002:a05:690c:ed2:b0:61a:e4ef:51d with SMTP id
 cs18-20020a05690c0ed200b0061ae4ef051dmr15778580ywb.9.1713876666572; Tue, 23
 Apr 2024 05:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240419081824.998654-1-padalkards17082001@gmail.com>
In-Reply-To: <20240419081824.998654-1-padalkards17082001@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 23 Apr 2024 05:50:55 -0700
Message-ID: <CAOSpxdZKu2k+Aro8G3qtijK-beMcNbc17z6q6Byq4cSSZoxEeg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] libssh2: backport fix for CVE-2023-48795
To: padalkards17082001@gmail.com
Cc: openembedded-core@lists.openembedded.org, bhabu.bindu@kpit.com, 
	Ross Burton <ross.burton@arm.com>, Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Apr 2024 12:51:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198623

There is already a fix for this CVE in kirkstone:

https://git.yoctoproject.org/poky/commit/?h=3Dkirkstone&id=3D888ea24812c219=
10e74c864313be56f02fad6c2e

Steve

On Fri, Apr 19, 2024 at 1:19=E2=80=AFAM dnyandev via lists.openembedded.org
<padalkards17082001=3Dgmail.com@lists.openembedded.org> wrote:
>
> Backport the upstream fix for CVE-2023-48795.
>
> (From OE-Core rev: 314fa19c5e07fa632ff0434a6adbb97de1319a02)
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 3adac25f899054b7d1d8c14458a1a4cd310abbd7)
> Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
> ---
>  .../libssh2/libssh2/CVE-2023-48795.patch      | 469 ++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.10.0.bb |   1 +
>  2 files changed, 470 insertions(+)
>  create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2023-48795.p=
atch
>
> diff --git a/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch b/=
meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
> new file mode 100644
> index 0000000000..9aaa92bb1c
> --- /dev/null
> +++ b/meta/recipes-support/libssh2/libssh2/CVE-2023-48795.patch
> @@ -0,0 +1,469 @@
> +From d4634630432594b139b3af6b9f254b890c0f275d Mon Sep 17 00:00:00 2001
> +From: Michael Buckley <michael@buckleyisms.com>
> +Date: Thu, 30 Nov 2023 15:08:02 -0800
> +Subject: [PATCH] src: add 'strict KEX' to fix CVE-2023-48795 "Terrapin A=
ttack"
> +
> +Refs:
> +https://terrapin-attack.com/
> +https://seclists.org/oss-sec/2023/q4/292
> +https://osv.dev/list?ecosystem=3D&q=3DCVE-2023-48795
> +https://github.com/advisories/GHSA-45x7-px36-x8w8
> +https://cve.mitre.org/cgi-bin/cvename.cgi?name=3DCVE-2023-48795
> +
> +Fixes #1290
> +Closes #1291
> +
> +CVE: CVE-2023-48795
> +Upstream-Status: Backport
> +Comments: Refreshed Hunks
> +
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + src/kex.c          | 63 +++++++++++++++++++++++------------
> + src/libssh2_priv.h | 18 +++++++---
> + src/packet.c       | 83 +++++++++++++++++++++++++++++++++++++++++++---
> + src/packet.h       |  2 +-
> + src/session.c      |  3 ++
> + src/transport.c    | 12 ++++++-
> + 6 files changed, 149 insertions(+), 32 deletions(-)
> +
> +diff --git a/src/kex.c b/src/kex.c
> +index d4034a0a..b4b748ca 100644
> +--- a/src/kex.c
> ++++ b/src/kex.c
> +@@ -3026,6 +3026,13 @@ kex_method_ssh_curve25519_sha256 =3D {
> + };
> + #endif
> +
> ++static const LIBSSH2_KEX_METHOD
> ++kex_method_strict_client_extension =3D {
> ++    "kex-strict-c-v00@openssh.com",
> ++    NULL,
> ++    0,
> ++};
> ++
> + static const LIBSSH2_KEX_METHOD *libssh2_kex_methods[] =3D {
> + #if LIBSSH2_ED25519
> +     &kex_method_ssh_curve25519_sha256,
> +@@ -3043,6 +3050,7 @@ static const LIBSSH2_KEX_METHOD *libssh2
> +     &kex_method_diffie_helman_group14_sha1,
> +     &kex_method_diffie_helman_group1_sha1,
> +     &kex_method_diffie_helman_group_exchange_sha1,
> ++    &kex_method_strict_client_extension,
> +   NULL
> + };
> +
> +@@ -3281,13 +3289,13 @@ static int kexinit(LIBSSH2_SESSION * ses
> +     return 0;
> + }
> +
> +-/* kex_agree_instr
> ++/* _libssh2_kex_agree_instr
> +  * Kex specific variant of strstr()
> +  * Needle must be precede by BOL or ',', and followed by ',' or EOL
> +  */
> +-static unsigned char *
> +-kex_agree_instr(unsigned char *haystack, unsigned long haystack_len,
> +-                const unsigned char *needle, unsigned long needle_len)
> ++unsigned char *
> ++_libssh2_kex_agree_instr(unsigned char *haystack, size_t haystack_len,
> ++                         const unsigned char *needle, size_t needle_len=
)
> + {
> +     unsigned char *s;
> +     unsigned char *end_haystack;
> +@@ -3398,7 +3406,7 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * ses=
sion,
> +         while(s && *s) {
> +             unsigned char *p =3D (unsigned char *) strchr((char *) s, '=
,');
> +             size_t method_len =3D (p ? (size_t)(p - s) : strlen((char *=
) s));
> +-            if(kex_agree_instr(hostkey, hostkey_len, s, method_len)) {
> ++            if(_libssh2_kex_agree_instr(hostkey, hostkey_len, s, method=
_len)) {
> +                 const LIBSSH2_HOSTKEY_METHOD *method =3D
> +                     (const LIBSSH2_HOSTKEY_METHOD *)
> +                     kex_get_method_by_name((char *) s, method_len,
> +@@ -3432,9 +3440,9 @@ static int kex_agree_hostkey(LIBSSH2_SESSION * ses=
sion,
> +     }
> +
> +     while(hostkeyp && (*hostkeyp) && (*hostkeyp)->name) {
> +-        s =3D kex_agree_instr(hostkey, hostkey_len,
> +-                            (unsigned char *) (*hostkeyp)->name,
> +-                            strlen((*hostkeyp)->name));
> ++        s =3D _libssh2_kex_agree_instr(hostkey, hostkey_len,
> ++                                     (unsigned char *) (*hostkeyp)->nam=
e,
> ++                                     strlen((*hostkeyp)->name));
> +         if(s) {
> +             /* So far so good, but does it suit our purposes? (Encrypti=
ng vs
> +                Signing) */
> +@@ -3468,6 +3476,12 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION =
* session, unsigned char *kex,
> + {
> +     const LIBSSH2_KEX_METHOD **kexp =3D libssh2_kex_methods;
> +     unsigned char *s;
> ++    const unsigned char *strict =3D
> ++        (unsigned char *)"kex-strict-s-v00@openssh.com";
> ++
> ++    if(_libssh2_kex_agree_instr(kex, kex_len, strict, 28)) {
> ++        session->kex_strict =3D 1;
> ++    }
> +
> +     if(session->kex_prefs) {
> +         s =3D (unsigned char *) session->kex_prefs;
> +@@ -3475,7 +3489,7 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION *=
 session, unsigned char *kex,
> +         while(s && *s) {
> +             unsigned char *q, *p =3D (unsigned char *) strchr((char *) =
s, ',');
> +             size_t method_len =3D (p ? (size_t)(p - s) : strlen((char *=
) s));
> +-            q =3D kex_agree_instr(kex, kex_len, s, method_len);
> ++            q =3D _libssh2_kex_agree_instr(kex, kex_len, s, method_len)=
;
> +             if(q) {
> +                 const LIBSSH2_KEX_METHOD *method =3D (const LIBSSH2_KEX=
_METHOD *)
> +                     kex_get_method_by_name((char *) s, method_len,
> +@@ -3509,9 +3523,9 @@ static int kex_agree_kex_hostkey(LIBSSH2_SESSION *=
 session, unsigned char *kex,
> +     }
> +
> +     while(*kexp && (*kexp)->name) {
> +-        s =3D kex_agree_instr(kex, kex_len,
> +-                            (unsigned char *) (*kexp)->name,
> +-                            strlen((*kexp)->name));
> ++        s =3D _libssh2_kex_agree_instr(kex, kex_len,
> ++                                     (unsigned char *) (*kexp)->name,
> ++                                     strlen((*kexp)->name));
> +         if(s) {
> +             /* We've agreed on a key exchange method,
> +              * Can we agree on a hostkey that works with this kex?
> +@@ -3555,7 +3569,7 @@ static int kex_agree_crypt(LIBSSH2_SESSION * sessi=
on,
> +             unsigned char *p =3D (unsigned char *) strchr((char *) s, '=
,');
> +             size_t method_len =3D (p ? (size_t)(p - s) : strlen((char *=
) s));
> +
> +-            if(kex_agree_instr(crypt, crypt_len, s, method_len)) {
> ++            if(_libssh2_kex_agree_instr(crypt, crypt_len, s, method_len=
)) {
> +                 const LIBSSH2_CRYPT_METHOD *method =3D
> +                     (const LIBSSH2_CRYPT_METHOD *)
> +                     kex_get_method_by_name((char *) s, method_len,
> +@@ -3577,9 +3591,9 @@ static int kex_agree_crypt(LIBSSH2_SESSION * sessi=
on,
> +     }
> +
> +     while(*cryptp && (*cryptp)->name) {
> +-        s =3D kex_agree_instr(crypt, crypt_len,
> +-                            (unsigned char *) (*cryptp)->name,
> +-                            strlen((*cryptp)->name));
> ++        s =3D _libssh2_kex_agree_instr(crypt, crypt_len,
> ++                                     (unsigned char *) (*cryptp)->name,
> ++                                     strlen((*cryptp)->name));
> +         if(s) {
> +             endpoint->crypt =3D *cryptp;
> +             return 0;
> +@@ -3619,7 +3633,7 @@ static int kex_agree_mac(LIBSSH2_SESSION * session=
,
> +             unsigned char *p =3D (unsigned char *) strchr((char *) s, '=
,');
> +             size_t method_len =3D (p ? (size_t)(p - s) : strlen((char *=
) s));
> +
> +-            if(kex_agree_instr(mac, mac_len, s, method_len)) {
> ++            if(_libssh2_kex_agree_instr(mac, mac_len, s, method_len)) {
> +                 const LIBSSH2_MAC_METHOD *method =3D (const LIBSSH2_MAC=
_METHOD *)
> +                     kex_get_method_by_name((char *) s, method_len,
> +                                            (const LIBSSH2_COMMON_METHOD=
 **)
> +@@ -3640,8 +3654,9 @@ static int kex_agree_mac(LIBSSH2_SESSION * session=
,
> +     }
> +
> +     while(*macp && (*macp)->name) {
> +-        s =3D kex_agree_instr(mac, mac_len, (unsigned char *) (*macp)->=
name,
> +-                            strlen((*macp)->name));
> ++        s =3D _libssh2_kex_agree_instr(mac, mac_len,
> ++                                     (unsigned char *) (*macp)->name,
> ++                                     strlen((*macp)->name));
> +         if(s) {
> +             endpoint->mac =3D *macp;
> +             return 0;
> +@@ -3672,7 +3687,7 @@ static int kex_agree_comp(LIBSSH2_SESSION *session=
,
> +             unsigned char *p =3D (unsigned char *) strchr((char *) s, '=
,');
> +             size_t method_len =3D (p ? (size_t)(p - s) : strlen((char *=
) s));
> +
> +-            if(kex_agree_instr(comp, comp_len, s, method_len)) {
> ++            if(_libssh2_kex_agree_instr(comp, comp_len, s, method_len))=
 {
> +                 const LIBSSH2_COMP_METHOD *method =3D
> +                     (const LIBSSH2_COMP_METHOD *)
> +                     kex_get_method_by_name((char *) s, method_len,
> +@@ -3694,8 +3709,9 @@ static int kex_agree_comp(LIBSSH2_SESSION *session=
,
> +     }
> +
> +     while(*compp && (*compp)->name) {
> +-        s =3D kex_agree_instr(comp, comp_len, (unsigned char *) (*compp=
)->name,
> +-                            strlen((*compp)->name));
> ++        s =3D _libssh2_kex_agree_instr(comp, comp_len,
> ++                                     (unsigned char *) (*compp)->name,
> ++                                     strlen((*compp)->name));
> +         if(s) {
> +             endpoint->comp =3D *compp;
> +             return 0;
> +@@ -3876,6 +3892,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, i=
nt reexchange,
> +                 session->local.kexinit =3D key_state->oldlocal;
> +                 session->local.kexinit_len =3D key_state->oldlocal_len;
> +                 key_state->state =3D libssh2_NB_state_idle;
> ++                session->state &=3D ~LIBSSH2_STATE_INITIAL_KEX;
> +                 session->state &=3D ~LIBSSH2_STATE_KEX_ACTIVE;
> +                 session->state &=3D ~LIBSSH2_STATE_EXCHANGING_KEYS;
> +                 return -1;
> +@@ -3901,6 +3918,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, i=
nt reexchange,
> +                 session->local.kexinit =3D key_state->oldlocal;
> +                 session->local.kexinit_len =3D key_state->oldlocal_len;
> +                 key_state->state =3D libssh2_NB_state_idle;
> ++                session->state &=3D ~LIBSSH2_STATE_INITIAL_KEX;
> +                 session->state &=3D ~LIBSSH2_STATE_KEX_ACTIVE;
> +                 session->state &=3D ~LIBSSH2_STATE_EXCHANGING_KEYS;
> +                 return -1;
> +@@ -3949,6 +3967,7 @@ _libssh2_kex_exchange(LIBSSH2_SESSION * session, i=
nt reexchange,
> +         session->remote.kexinit =3D NULL;
> +     }
> +
> ++    session->state &=3D ~LIBSSH2_STATE_INITIAL_KEX;
> +     session->state &=3D ~LIBSSH2_STATE_KEX_ACTIVE;
> +     session->state &=3D ~LIBSSH2_STATE_EXCHANGING_KEYS;
> +
> +diff --git a/src/libssh2_priv.h b/src/libssh2_priv.h
> +index 82c3afe2..ee1d8b5c 100644
> +--- a/src/libssh2_priv.h
> ++++ b/src/libssh2_priv.h
> +@@ -640,6 +640,9 @@ struct _LIBSSH2_SESSION
> +     unsigned char server_hostkey_sha256[SHA256_DIGEST_LENGTH];
> +     int server_hostkey_sha256_valid;
> +
> ++    /* Whether to use the OpenSSH Strict KEX extension */
> ++    int kex_strict;
> ++
> +     /* (remote as source of data -- packet_read ) */
> +     libssh2_endpoint_data remote;
> +
> +@@ -870,6 +873,7 @@ struct _LIBSSH2_SESSION
> +     int fullpacket_macstate;
> +     size_t fullpacket_payload_len;
> +     int fullpacket_packet_type;
> ++    uint32_t fullpacket_required_type;
> +
> +     /* State variables used in libssh2_sftp_init() */
> +     libssh2_nonblocking_states sftpInit_state;
> +@@ -910,10 +914,11 @@ struct _LIBSSH2_SESSION
> + };
> +
> + /* session.state bits */
> +-#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000001
> +-#define LIBSSH2_STATE_NEWKEYS           0x00000002
> +-#define LIBSSH2_STATE_AUTHENTICATED     0x00000004
> +-#define LIBSSH2_STATE_KEX_ACTIVE        0x00000008
> ++#define LIBSSH2_STATE_INITIAL_KEX       0x00000001
> ++#define LIBSSH2_STATE_EXCHANGING_KEYS   0x00000002
> ++#define LIBSSH2_STATE_NEWKEYS           0x00000004
> ++#define LIBSSH2_STATE_AUTHENTICATED     0x00000008
> ++#define LIBSSH2_STATE_KEX_ACTIVE        0x00000010
> +
> + /* session.flag helpers */
> + #ifdef MSG_NOSIGNAL
> +@@ -1144,6 +1149,11 @@ ssize_t _libssh2_send(libssh2_socket_t socket, co=
nst void *buffer,
> + int _libssh2_kex_exchange(LIBSSH2_SESSION * session, int reexchange,
> +                           key_exchange_state_t * state);
> +
> ++unsigned char *_libssh2_kex_agree_instr(unsigned char *haystack,
> ++                                        size_t haystack_len,
> ++                                        const unsigned char *needle,
> ++                                        size_t needle_len);
> ++
> + /* Let crypt.c/hostkey.c expose their method structs */
> + const LIBSSH2_CRYPT_METHOD **libssh2_crypt_methods(void);
> + const LIBSSH2_HOSTKEY_METHOD **libssh2_hostkey_methods(void);
> +diff --git a/src/packet.c b/src/packet.c
> +index b5b41981..35d4d39e 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -605,14 +605,13 @@ authagent_exit:
> +  * layer when it has received a packet.
> +  *
> +  * The input pointer 'data' is pointing to allocated data that this fun=
ction
> +- * is asked to deal with so on failure OR success, it must be freed fin=
e.
> +- * The only exception is when the return code is LIBSSH2_ERROR_EAGAIN.
> ++ * will be freed unless return the code is LIBSSH2_ERROR_EAGAIN.
> +  *
> +  * This function will always be called with 'datalen' greater than zero=
.
> +  */
> + int
> + _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +-                    size_t datalen, int macstate)
> ++                    size_t datalen, int macstate, uint32_t seq)
> + {
> +     int rc =3D 0;
> +     unsigned char *message =3D NULL;
> +@@ -657,6 +656,70 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsi=
gned char *data,
> +         break;
> +     }
> +
> ++    if(session->state & LIBSSH2_STATE_INITIAL_KEX) {
> ++        if(msg =3D=3D SSH_MSG_KEXINIT) {
> ++            if(!session->kex_strict) {
> ++                if(datalen < 17) {
> ++                    LIBSSH2_FREE(session, data);
> ++                    session->packAdd_state =3D libssh2_NB_state_idle;
> ++                    return _libssh2_error(session,
> ++                                          LIBSSH2_ERROR_BUFFER_TOO_SMAL=
L,
> ++                                          "Data too short extracting ke=
x");
> ++                }
> ++                else {
> ++                    const unsigned char *strict =3D
> ++                    (unsigned char *)"kex-strict-s-v00@openssh.com";
> ++                    struct string_buf buf;
> ++                    unsigned char *algs =3D NULL;
> ++                    size_t algs_len =3D 0;
> ++
> ++                    buf.data =3D (unsigned char *)data;
> ++                    buf.dataptr =3D buf.data;
> ++                    buf.len =3D datalen;
> ++                    buf.dataptr +=3D 17; /* advance past type and cooki=
e */
> ++
> ++                    if(_libssh2_get_string(&buf, &algs, &algs_len)) {
> ++                        LIBSSH2_FREE(session, data);
> ++                        session->packAdd_state =3D libssh2_NB_state_idl=
e;
> ++                        return _libssh2_error(session,
> ++                                              LIBSSH2_ERROR_BUFFER_TOO_=
SMALL,
> ++                                              "Algs too short");
> ++                    }
> ++
> ++                    if(algs_len =3D=3D 0 ||
> ++                       _libssh2_kex_agree_instr(algs, algs_len, strict,=
 28)) {
> ++                        session->kex_strict =3D 1;
> ++                    }
> ++                }
> ++            }
> ++
> ++            if(session->kex_strict && seq) {
> ++                LIBSSH2_FREE(session, data);
> ++                session->socket_state =3D LIBSSH2_SOCKET_DISCONNECTED;
> ++                session->packAdd_state =3D libssh2_NB_state_idle;
> ++                libssh2_session_disconnect(session, "strict KEX violati=
on: "
> ++                                           "KEXINIT was not the first p=
acket");
> ++
> ++                return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DIS=
CONNECT,
> ++                                      "strict KEX violation: "
> ++                                      "KEXINIT was not the first packet=
");
> ++            }
> ++        }
> ++
> ++        if(session->kex_strict && session->fullpacket_required_type &&
> ++            session->fullpacket_required_type !=3D msg) {
> ++            LIBSSH2_FREE(session, data);
> ++            session->socket_state =3D LIBSSH2_SOCKET_DISCONNECTED;
> ++            session->packAdd_state =3D libssh2_NB_state_idle;
> ++            libssh2_session_disconnect(session, "strict KEX violation: =
"
> ++                                       "unexpected packet type");
> ++
> ++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONN=
ECT,
> ++                                  "strict KEX violation: "
> ++                                  "unexpected packet type");
> ++        }
> ++    }
> ++
> +     if(session->packAdd_state =3D=3D libssh2_NB_state_allocated) {
> +         /* A couple exceptions to the packet adding rule: */
> +         switch(msg) {
> +@@ -1341,6 +1404,15 @@ _libssh2_packet_ask(LIBSSH2_SESSION * session, un=
signed char packet_type,
> +
> +             return 0;
> +         }
> ++        else if(session->kex_strict &&
> ++                (session->state & LIBSSH2_STATE_INITIAL_KEX)) {
> ++            libssh2_session_disconnect(session, "strict KEX violation: =
"
> ++                                       "unexpected packet type");
> ++
> ++            return _libssh2_error(session, LIBSSH2_ERROR_SOCKET_DISCONN=
ECT,
> ++                                  "strict KEX violation: "
> ++                                  "unexpected packet type");
> ++        }
> +         packet =3D _libssh2_list_next(&packet->node);
> +     }
> +     return -1;
> +@@ -1402,7 +1474,10 @@ _libssh2_packet_require(LIBSSH2_SESSION * session=
, unsigned char packet_type,
> +     }
> +
> +     while(session->socket_state =3D=3D LIBSSH2_SOCKET_CONNECTED) {
> +-        int ret =3D _libssh2_transport_read(session);
> ++        int ret;
> ++        session->fullpacket_required_type =3D packet_type;
> ++        ret =3D _libssh2_transport_read(session);
> ++        session->fullpacket_required_type =3D 0;
> +         if(ret =3D=3D LIBSSH2_ERROR_EAGAIN)
> +             return ret;
> +         else if(ret < 0) {
> +diff --git a/src/packet.h b/src/packet.h
> +index 79018bcf..6ea100a5 100644
> +--- a/src/packet.h
> ++++ b/src/packet.h
> +@@ -71,6 +71,6 @@ int _libssh2_packet_burn(LIBSSH2_SESSION * session,
> + int _libssh2_packet_write(LIBSSH2_SESSION * session, unsigned char *dat=
a,
> +                           unsigned long data_len);
> + int _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +-                        size_t datalen, int macstate);
> ++                        size_t datalen, int macstate, uint32_t seq);
> +
> + #endif /* __LIBSSH2_PACKET_H */
> +diff --git a/src/session.c b/src/session.c
> +index a4d602ba..f4bafb57 100644
> +--- a/src/session.c
> ++++ b/src/session.c
> +@@ -500,6 +500,8 @@ libssh2_session_init_ex(LIBSSH2_ALLOC_FU
> +         session->abstract =3D abstract;
> +         session->api_timeout =3D 0; /* timeout-free API by default */
> +         session->api_block_mode =3D 1; /* blocking API by default */
> ++        session->state =3D LIBSSH2_STATE_INITIAL_KEX;
> ++        session->fullpacket_required_type =3D 0;
> +         _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
> +                        "New session resource allocated");
> +         _libssh2_init_if_needed();
> +@@ -1186,6 +1188,7 @@ libssh2_session_disconnect_ex(LIBSSH2_SESSION *ses=
sion, int reason,
> +                               const char *desc, const char *lang)
> + {
> +     int rc;
> ++    session->state &=3D ~LIBSSH2_STATE_INITIAL_KEX;
> +     session->state &=3D ~LIBSSH2_STATE_EXCHANGING_KEYS;
> +     BLOCK_ADJUST(rc, session,
> +                  session_disconnect(session, reason, desc, lang));
> +diff --git a/src/transport.c b/src/transport.c
> +index 6d902d33..3b30ff84 100644
> +--- a/src/transport.c
> ++++ b/src/transport.c
> +@@ -187,6 +187,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted =
/* 1 or 0 */ )
> +     struct transportpacket *p =3D &session->packet;
> +     int rc;
> +     int compressed;
> ++    uint32_t seq =3D session->remote.seqno;
> +
> +     if(session->fullpacket_state =3D=3D libssh2_NB_state_idle) {
> +         session->fullpacket_macstate =3D LIBSSH2_MAC_CONFIRMED;
> +@@ -318,7 +319,7 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted =
/* 1 or 0 */ )
> +     if(session->fullpacket_state =3D=3D libssh2_NB_state_created) {
> +         rc =3D _libssh2_packet_add(session, p->payload,
> +                                  session->fullpacket_payload_len,
> +-                                 session->fullpacket_macstate);
> ++                                 session->fullpacket_macstate, seq);
> +         if(rc =3D=3D LIBSSH2_ERROR_EAGAIN)
> +             return rc;
> +         if(rc) {
> +@@ -329,6 +330,11 @@ fullpacket(LIBSSH2_SESSION * session, int encrypted=
 /* 1 or 0 */ )
> +
> +     session->fullpacket_state =3D libssh2_NB_state_idle;
> +
> ++    if(session->kex_strict &&
> ++        session->fullpacket_packet_type =3D=3D SSH_MSG_NEWKEYS) {
> ++        session->remote.seqno =3D 0;
> ++    }
> ++
> +     return session->fullpacket_packet_type;
> + }
> +
> +@@ -892,6 +892,10 @@ int _libssh2_transport_send(LIBSSH2_SESS
> +
> +     session->local.seqno++;
> +
> ++    if(session->kex_strict && data[0] =3D=3D SSH_MSG_NEWKEYS) {
> ++        session->local.seqno =3D 0;
> ++    }
> ++
> +     ret =3D LIBSSH2_SEND(session, p->outbuf, total_length,
> +                         LIBSSH2_SOCKET_SEND_FLAGS(session));
> +     if(ret < 0)
> +--
> +2.34.1
> +
> diff --git a/meta/recipes-support/libssh2/libssh2_1.10.0.bb b/meta/recipe=
s-support/libssh2/libssh2_1.10.0.bb
> index 8483a292c2..9ade9f335c 100644
> --- a/meta/recipes-support/libssh2/libssh2_1.10.0.bb
> +++ b/meta/recipes-support/libssh2/libssh2_1.10.0.bb
> @@ -11,6 +11,7 @@ SRC_URI =3D "http://www.libssh2.org/download/${BP}.tar.=
gz \
>             file://fix-ssh2-test.patch \
>             file://run-ptest \
>             file://CVE-2020-22218.patch \
> +           file://CVE-2023-48795.patch \
>             "
>
>  SRC_URI[sha256sum] =3D "2d64e90f3ded394b91d3a2e774ca203a4179f69aebee0300=
3e5a6fa621e41d51"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198528): https://lists.openembedded.org/g/openembedde=
d-core/message/198528
> Mute This Topic: https://lists.openembedded.org/mt/105614205/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [st=
eve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

