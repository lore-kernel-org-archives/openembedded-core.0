Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4916C71136
	for <webhook@archiver.kernel.org>; Mon, 16 Jun 2025 11:06:04 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.27766.1750071957843271318
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jun 2025 04:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=P6W6k6G2;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-73972a54919so3679695b3a.3
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 04:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750071957; x=1750676757; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E7ERiK0RvKQxbWVtwVg2cu2cHooYWoYeSj17Jf8M/Ec=;
        b=P6W6k6G21g5Ki9+wjt9tWaXzlzbjSXvNC+SndfHzJliKU3NBolzARaoNYT6HDt5g9Z
         +HZGkvvLM81rJ8ag7qT/JU/2JuobLZu68WpfI8X8TK4h8KWpkGBnSAItPzSBMPUP7FPA
         59Uk7QDAosAHa8Kwe++NSTUY/9g0vP0e0h26YL99lWz8TBQsEFbJwyy2KLIqYtBJjynE
         hifOBvCSAvr5XjTJQ9eVLjyAsSdmIwaTgOExCe0ixuwHCwjYj9Y4/WQM9faKcErcP0sr
         +82sBblOr9UknLRmsUOppv+QkoSueW8CwaA+AL1RNwvRnXSgdvkgPf2WP7zmY303JKSV
         af9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750071957; x=1750676757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E7ERiK0RvKQxbWVtwVg2cu2cHooYWoYeSj17Jf8M/Ec=;
        b=ZbxhrdYcMpmOx0BvfdGXZMjhObwPOpjB8pkI2u62bu9lj7cvo5TGzgyVNqJ4RE6Hvt
         623fHmiNlEnOXeRCyFVSyfI33/RzQwDAtY6FKqWiYrs8fO+wVOOrvz/H04oQB/ge74Cw
         x+uCo1F5SK2e2NVBtt5tLSKkiFBzUPI15TZDIeLZBEqMJ2kir+K/JCCbot5ireTA1gOw
         MSIlOEEtt7a7VWKA3gqKJOxrB2ww2HugtLgXU2SbrCOjKdmL1DjkTkbKQIlTVE6Wa2SH
         vEWWRHjFQ6/vLCQABEXXJg5/iUUFACHlFwm0LXJia8Cgj4YbVtU0GdXy0unCjUBNhUuD
         dPXA==
X-Gm-Message-State: AOJu0YxH+Oi5TTsjyqVVrmxmFjxxPTXN4MCXdz032/TOSkBRiObhYaRA
	crrGFY7SPfZlwiAyd5EjMcZly+SWAqFx4nL0NqMCFr4TVXGmbVC0WMnTFMSQiav0yfCwlzRUP2G
	YWScTE0R3jmJvJtyhHgEHXNaM8ryNT0o=
X-Gm-Gg: ASbGnctdLa2UMgQVxNW0eRYwFYz0CgA+NYRl/Gn6SGPcwsOo4rHsBEl6zmZ0vHKW2/q
	Xq2GWZoOuf29QJtfyeWz9jyCvJ3cAChLj3m4Bns6DLo0j63CSgaATuJQNrtjHPRf93IA0S1l+h1
	x9ZZwyVp+aCtq6WEfjqjsAAmAuloAuFilucj9r/bhuQ25i
X-Google-Smtp-Source: AGHT+IGyJWvUZ7JK1k2WHrWeQDAKHyPeFKKxATxIuHIqOYkjPRzyoeBMcDSYJTgWS+7EUq3sojU3RY1Sc0Iak7BWjoo=
X-Received: by 2002:a05:6a00:2d20:b0:742:a91d:b2f6 with SMTP id
 d2e1a72fcca58-7489d00b6b0mr11703132b3a.13.1750071956857; Mon, 16 Jun 2025
 04:05:56 -0700 (PDT)
MIME-Version: 1.0
References: <1750040965-15015-1-git-send-email-mark.hatle@kernel.crashing.org> <1750040965-15015-7-git-send-email-mark.hatle@kernel.crashing.org>
In-Reply-To: <1750040965-15015-7-git-send-email-mark.hatle@kernel.crashing.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Jun 2025 07:05:45 -0400
X-Gm-Features: AX0GCFvkd5y_38QTs6gvUiswkKdCwVvZG-DKQCd8mWgZyiLjnQ3Uqu8KoCK96W0
Message-ID: <CADkTA4PS5PwR6dL9GFQzMst-WdWSL+FAoWz4tBkuLGnqafxQFA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/6] linux-yocto.inc: State riscv required tune_features
To: mark.hatle@kernel.crashing.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000051e7330637ae612e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jun 2025 11:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218814

--00000000000051e7330637ae612e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 10:29=E2=80=AFPM Mark Hatle via lists.openembedded.=
org
<mark.hatle=3Dkernel.crashing.org@lists.openembedded.org> wrote:

> From: Mark Hatle <mark.hatle@amd.com>
>
> Required:
>    rv32ima_zicsr_zifencei
>    rv64ima_zicsr_zifencei
>
> See the arch/riscv/Makefile:
>
> riscv-march-$(CONFIG_ARCH_RV32I)        :=3D rv32ima
> riscv-march-$(CONFIG_ARCH_RV64I)        :=3D rv64ima
> riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D
> $(riscv-march-y)_zicsr_zifencei
>
> Signed-off-by: Mark Hatle <mark.hatle@amd.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index cdf2583698..80db85fe89 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -51,6 +51,11 @@ SRC_URI_RISCV =3D "\
>  SRC_URI:append:riscv32 =3D "${SRC_URI_RISCV}"
>  SRC_URI:append:riscv64 =3D "${SRC_URI_RISCV}"
>
> +inherit features_check
> +
> +REQUIRED_TUNE_FEATURES:riscv32 =3D "rv 32 i m a zicsr zifencei"
> +REQUIRED_TUNE_FEATURES:riscv64 =3D "rv 64 i m a zicsr zifencei"
> +
>

I don't think we should be enforcing this at this level. The kernel has
always been
responsible for setting the compiler options that it requires.  And we
don't check or
otherwise manipulate that from the build system.

What exactly are you trying to enforce / check here ?

Bruce


>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
>  # by the kernel. This is typically the branch that should be built,
>  # and it can be specific to the machine or shared
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#218760):
> https://lists.openembedded.org/g/openembedded-core/message/218760
> Mute This Topic: https://lists.openembedded.org/mt/113664657/1050810
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

--00000000000051e7330637ae612e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 15, 2025 at 10:29=
=E2=80=AFPM Mark Hatle via <a href=3D"http://lists.openembedded.org">lists.=
openembedded.org</a> &lt;mark.hatle=3D<a href=3D"mailto:kernel.crashing.org=
@lists.openembedded.org">kernel.crashing.org@lists.openembedded.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ma=
rk Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=3D"_blank">mark.h=
atle@amd.com</a>&gt;<br>
<br>
Required:<br>
=C2=A0 =C2=A0rv32ima_zicsr_zifencei<br>
=C2=A0 =C2=A0rv64ima_zicsr_zifencei<br>
<br>
See the arch/riscv/Makefile:<br>
<br>
riscv-march-$(CONFIG_ARCH_RV32I)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D rv32ima<br=
>
riscv-march-$(CONFIG_ARCH_RV64I)=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D rv64ima<br=
>
riscv-march-$(CONFIG_TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI) :=3D $(riscv-=
march-y)_zicsr_zifencei<br>
<br>
Signed-off-by: Mark Hatle &lt;<a href=3D"mailto:mark.hatle@amd.com" target=
=3D"_blank">mark.hatle@amd.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++<br>
=C2=A01 file changed, 5 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index cdf2583698..80db85fe89 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -51,6 +51,11 @@ SRC_URI_RISCV =3D &quot;\<br>
=C2=A0SRC_URI:append:riscv32 =3D &quot;${SRC_URI_RISCV}&quot;<br>
=C2=A0SRC_URI:append:riscv64 =3D &quot;${SRC_URI_RISCV}&quot;<br>
<br>
+inherit features_check<br>
+<br>
+REQUIRED_TUNE_FEATURES:riscv32 =3D &quot;rv 32 i m a zicsr zifencei&quot;<=
br>
+REQUIRED_TUNE_FEATURES:riscv64 =3D &quot;rv 64 i m a zicsr zifencei&quot;<=
br>
+<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D=
"font-size:small">I don&#39;t think we should be enforcing this at this lev=
el. The kernel has always been</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">responsible for setting the compiler options that it requir=
es.=C2=A0 And we don&#39;t check or</div></div><div class=3D"gmail_default"=
 style=3D"font-size:small">otherwise manipulate that from the build system.=
</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div=
 class=3D"gmail_default" style=3D"font-size:small">What exactly are you try=
ing to enforce / check here ?</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
=C2=A0# A KMACHINE is the mapping of a yocto $MACHINE to what is built<br>
=C2=A0# by the kernel. This is typically the branch that should be built,<b=
r>
=C2=A0# and it can be specific to the machine or shared<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#218760): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/218760" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/218760</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113664657/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113664657/1050810</a><br>
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

--00000000000051e7330637ae612e--

