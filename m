Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A462C369D5
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 14:25:10 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.49698.1745850299740898361
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 07:24:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bdGqU49d;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3081f72c271so4549670a91.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 07:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745850299; x=1746455099; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QqMcd+2FmHPPxRwx2zt/nTw8izGuy+bAOvJpB4FRWv0=;
        b=bdGqU49dslXjUD234gLjxlSNppT2U9+RDXZc2EpVPY73qq3L4kFFqrW02J3moHBWTL
         CoJLZJC5YWx7rswf5qQpriytQ1oiAXiZs+P1x3l0habVYrO3Fxi+M1rNnfZIH6WA+uRd
         tOfCKgLaG5ljCp2CUYn55nB7AWPIeHAq6RVX6Nm0BXp7l1VfIdHQxBRG5YuFCd834ikU
         K7TzjX/bS5Q6BUgOWOfIvVAeN0oz8JZ4HquaEZ+73CDFZ3Lduo44LF/+eIrIbY8MkOva
         eKWoZfJCtzfcgyN4FR1ADlUgUIkbtEKXb8M00dWGAQsNDWLUyRoumGBeBhvgdWg9btMg
         64ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745850299; x=1746455099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QqMcd+2FmHPPxRwx2zt/nTw8izGuy+bAOvJpB4FRWv0=;
        b=rhHu9t5AOzf5nU1d1JvlW2C4ZFVv/ygREX+7LEiN5EqzvAIoLGGNpojGMg9NvLuXaJ
         XmGevv72Mq4HWxpwBoSkvWU7/V0zf7TM9E41mQyQpHozVguPLDm2xVwiio303x9QwXwd
         xjKol9VZx8hl8Bx7aM2xdI+SnNSsvYV4Ggheh08zvVuL3IJBnxMOsu2hC2wedXutEvUn
         A4TB0R86ZTQ7+KUYkylP65rrIXK3JC1VR0dYGkS0yOCWHLfAPfnllQswqSvMq9xjJjuq
         7S+qKrAEE2/hihSe9H97FXxOoTdxBFIBxKAI6U74t2NkftsMUfvB/XM9r77JljBMwTBH
         Cdpw==
X-Gm-Message-State: AOJu0YyRrB6K1aOuFSh6QxWiMKvLYtHOtwaFXv8V1B0pTWEdq4AmvJ0J
	d3EYNSAg/PGBwdi4Q/DCQAckiZEc64zhvldTaKJSVlNvBLI+H3NIUdeL1FYVZ2VLPfguFSA2Poo
	RnP3oYERwvzdfIYP01qKOjlhFEA4=
X-Gm-Gg: ASbGncsl+ui9XQ4yBLaWmqPPZV8DgZiCEHxBvo6CAXBsAtEi2pZCE/wB/oUjEK02YXB
	Ul2khQdFGsd7q9OYnhxUDvIyuqJ+bKvQh9AyAE+N9EWkPbL6PDGQhBBvL+1sGUiVCfUN2wM/Gua
	Z/buaFyWvhQPra2XWsNRzXGhQ=
X-Google-Smtp-Source: AGHT+IGV+UYjIB2s/DGEqdWZweX7P9cfYWtjJ5iG4LrgeHZd/WvIT482OFwkvKKPbMWgt967+TlIRobQ5Ouj2zJBAZ4=
X-Received: by 2002:a17:90b:2f0f:b0:2eb:140d:f6df with SMTP id
 98e67ed59e1d1-30a012ed038mr13697826a91.1.1745850298960; Mon, 28 Apr 2025
 07:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250428134205.900354-1-daniel.turull@ericsson.com> <20250428134205.900354-4-daniel.turull@ericsson.com>
In-Reply-To: <20250428134205.900354-4-daniel.turull@ericsson.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Apr 2025 10:24:47 -0400
X-Gm-Features: ATxdqUFVtFN7KTtb82xfjGpTfam-NJh0SXyhL5BwYPrHq_gM00KXennxoAkXu6U
Message-ID: <CADkTA4PW77MzS_+trJGgPCTSW=dPsnKP16tE+Wk8Lu47bK5mSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 3/6] kernel: add support to extract compiled files
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, rybczynska@gmail.com, 
	steve@sakoman.com, Peter.Marko@siemens.com, ross.burton@arm.com, 
	skandigraun@gmail.com
Content-Type: multipart/alternative; boundary="000000000000e68d1e0633d772f4"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 14:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215610

--000000000000e68d1e0633d772f4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 9:42=E2=80=AFAM Daniel Turull via lists.openembedde=
d.org
<daniel.turull=3Dericsson.com@lists.openembedded.org> wrote:

> From: Daniel Turull <daniel.turull@ericsson.com>
>
> Use gen_compile_commands.py to extract files used during compilation
> for the used kernel configuration.
>
> CC: Peter Marko <peter.marko@siemens.com>
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/classes-recipe/kernel.bbclass | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel.bbclass
> b/meta/classes-recipe/kernel.bbclass
> index 36ce659762..56060f2c91 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -867,3 +867,14 @@ EXPORT_FUNCTIONS do_deploy
>
>  # Add using Device Tree support
>  inherit kernel-devicetree
> +
> +KERNEL_FILES_DIR ?=3D "${LOG_DIR}/cve/kernel_files"
> +KERNEL_SRC_FILES ?=3D "${KERNEL_FILES_DIR}/compile_commands.json"
> +
> +do_save_compiled_files() {
> +    bbdebug 1 "Saving compiled files in ${KERNEL_SRC_FILES}"
> +    mkdir -p ${KERNEL_FILES_DIR}
> +    ${S}/scripts/clang-tools/gen_compile_commands.py -o
> ${KERNEL_SRC_FILES} -d ${B}
> +}
> +
> +addtask do_save_compiled_files after do_compile do_compile_kernelmodules
>

This is something that I wouldn't want running in my development
environment.

I can't tell fully. Is this opt in ? Is there a way to opt-out ?

Bruce



>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215604):
> https://lists.openembedded.org/g/openembedded-core/message/215604
> Mute This Topic: https://lists.openembedded.org/mt/112499916/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000e68d1e0633d772f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 28, 2025 at 9:42=
=E2=80=AFAM Daniel Turull via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;daniel.turull=3D<a href=3D"mailto:ericsson.com@=
lists.openembedded.org">ericsson.com@lists.openembedded.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Daniel Tur=
ull &lt;<a href=3D"mailto:daniel.turull@ericsson.com" target=3D"_blank">dan=
iel.turull@ericsson.com</a>&gt;<br>
<br>
Use gen_compile_commands.py to extract files used during compilation<br>
for the used kernel configuration.<br>
<br>
CC: Peter Marko &lt;<a href=3D"mailto:peter.marko@siemens.com" target=3D"_b=
lank">peter.marko@siemens.com</a>&gt;<br>
Signed-off-by: Daniel Turull &lt;<a href=3D"mailto:daniel.turull@ericsson.c=
om" target=3D"_blank">daniel.turull@ericsson.com</a>&gt;<br>
---<br>
=C2=A0meta/classes-recipe/kernel.bbclass | 11 +++++++++++<br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kerne=
l.bbclass<br>
index 36ce659762..56060f2c91 100644<br>
--- a/meta/classes-recipe/kernel.bbclass<br>
+++ b/meta/classes-recipe/kernel.bbclass<br>
@@ -867,3 +867,14 @@ EXPORT_FUNCTIONS do_deploy<br>
<br>
=C2=A0# Add using Device Tree support<br>
=C2=A0inherit kernel-devicetree<br>
+<br>
+KERNEL_FILES_DIR ?=3D &quot;${LOG_DIR}/cve/kernel_files&quot;<br>
+KERNEL_SRC_FILES ?=3D &quot;${KERNEL_FILES_DIR}/compile_commands.json&quot=
;<br>
+<br>
+do_save_compiled_files() {<br>
+=C2=A0 =C2=A0 bbdebug 1 &quot;Saving compiled files in ${KERNEL_SRC_FILES}=
&quot;<br>
+=C2=A0 =C2=A0 mkdir -p ${KERNEL_FILES_DIR}<br>
+=C2=A0 =C2=A0 ${S}/scripts/clang-tools/gen_compile_commands.py -o ${KERNEL=
_SRC_FILES} -d ${B}<br>
+}<br>
+<br>
+addtask do_save_compiled_files after do_compile do_compile_kernelmodules<b=
r></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">This is something that I wouldn&#39;t want running in my dev=
elopment environment.</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I c=
an&#39;t tell fully. Is this opt in ? Is there a way to opt-out ?</div><div=
 class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"=
gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#215604): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/215604" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/215604</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112499916/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/112499916/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000e68d1e0633d772f4--

