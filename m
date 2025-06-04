Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9418C5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 11:55:02 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.web10.14677.1749038099663127527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 04:54:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z05U+W67;
 spf=pass (domain: gmail.com, ip: 209.85.215.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-afc857702d1so5200274a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 04:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749038099; x=1749642899; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jtj1bLbaIDinwaILuRJeEmS7Lpmc9Q2vYmMdl4oBqc0=;
        b=Z05U+W67LJNWxyidxjDEwqftxoHyoQkbyFVCVt0I50Cv6Fpmllcl3UCAwAgdF9/tI3
         8VxWijAAzhzmKwigXOOXKnSDeG3/V355E710Mh0zHqExhJe7kNPE6MDhfYCJbuCUkGEP
         J/APXQ0X8rgCZ7telbFqpY8GTw+zmOlfIhr/afdMrA0FoSvk9TCxJYAD6M+Rk7/aTRUT
         ounmBSk4Htb+g+kcxgU3PvQ5KzurW2LYLxR0GcxZfzEqfYy69Zq3SS7MvPhlWPdFTcAa
         mCgWytPhKYxQJ+nnRVATcMFxEwF/hYpkTRrSEpsqjIyTFsa83E4FiqbuwZsRvTJe2+o6
         PQPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749038099; x=1749642899;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jtj1bLbaIDinwaILuRJeEmS7Lpmc9Q2vYmMdl4oBqc0=;
        b=G2kczlyh1wiRArXzs5BBJq1oyI/+UeI7tKM3O3q1bO3P5lkk1Qon0ZT8yJ8JkswiW3
         RsJcB6f+cYpaVzEYUrmrYQsMp+xQQecxNEjJKIIashaBkr0MsUiVXoA23jUZXT9spFHP
         +PjcGo7SobPeTcYy731Dr0Zxp+PGfTCy0f6VmHHHGBbRpMhtCJBrxUWS9iWODdjXkpsl
         ZKkkqNMt5/BJP/YQ95uIfE/DZk6rfe98MV7Xdu2drKO8CndZc8ecVpvajl0WPkSc0KNb
         dXr4D2mRDkm3jCRqPW0AXtVyVhujyQTQt2pSW8wcNcYySKd7YAcNq8JlmYyccla3sQKu
         ITHA==
X-Gm-Message-State: AOJu0YztE8ADwmIrQGuekAShil8UGbki5X8v/J7DJEtzCnVF6P/wsIys
	jq+mN+LzIY3XtUXYjjZXujOBCvaowzP/PCvmIRy9LHu54cu7IvFThcR3b1nDsl+NhE/84DPkg9G
	TtDFgnd+IPRpVoxZSpV06wKNFU8Y6glVhMDFl
X-Gm-Gg: ASbGncvFpqJbw2QlsjACwSvjhurFgnR/JfxmSsHJi84aoUcXHfMZaJR4GESkMQfF9rG
	fKVoErHCCOw47zD4jck+7Qzu6gU3ga8CYpSDT6cg9qVmmwQEvZvmCvayeoV0r5nBnOCe6WHYUEc
	mq3yXovy+XikQmipZb7PvOn/Am1P/pDhp1a6gUgJaQgG9g
X-Google-Smtp-Source: AGHT+IHrgSZum1OxeLjBI2MGO/1uVdyA9xnzUW6pJj0EnqK3a0ygY/JGNI2Nskx6LyKZfs3nvRsCS4HE566VX0SP5Qg=
X-Received: by 2002:a17:90b:5290:b0:312:1c83:58ec with SMTP id
 98e67ed59e1d1-3130cd14d19mr5244988a91.12.1749038098627; Wed, 04 Jun 2025
 04:54:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de>
In-Reply-To: <20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 Jun 2025 07:54:47 -0400
X-Gm-Features: AX0GCFstIJ-IItHU_NPTmC648XqK90kfbywD5IAwFlZ5DGxzHaQ4jaNdH7YXTeo
Message-ID: <CADkTA4PKf=M6MYeuRatixn7XbeHB4WyE763S_g+dSCj20KGWEw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: add arm64 source files for unistd_64.h
To: y.moog@phytec.de
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: multipart/alternative; boundary="0000000000009141c10636bdaabc"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:55:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217941

--0000000000009141c10636bdaabc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 2:52=E2=80=AFAM Yannic Moog via lists.openembedded.o=
rg
<y.moog=3Dphytec.de@lists.openembedded.org> wrote:

> kernel commit bfb713ea53c7 ("perf tools: Fix arm64 build by generating
> unistd_64.h")
> introduces a new dependency on source files for arm64, specifically
> include/uapi/asm-generic.
>
> Build fails with:
> [..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33:
> [...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild: No such file or
> directory
> make[4]: *** No rule to make target
> '[...]/perf/1.0/perf-1.0/include/uapi/asm-generic/Kbuild'.  Stop.
>
> Add the directory to PERF_SRC.
> Fix whitespace error while at it.
>
> Signed-off-by: Yannic Moog <y.moog@phytec.de>
> ---
>  meta/recipes-kernel/perf/perf.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index
> 0d19e1bdc222da26a5ad0a1d4964acca437a6692..d7a81b5802dc655917c2adf04472b8e=
680380ec8
> 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -151,6 +151,7 @@ PERF_SRC ?=3D "Makefile \
>               arch/arm64/tools \
>               ${PERF_BPF_EVENT_SRC} \
>               arch/${ARCH}/Makefile \
> +             ${@bb.utils.contains('ARCH', 'arm64',
> 'include/uapi/asm-generic', '', d)} \
>

Can we be more precise on just getting what we need to generate unistd_64 ?

We've always tried to copy just as much as required to get things building.
I've been
able to get away with being specific in kernel-devsrc in the past.

Barring that, I wouldn't make this architecture specific, just copy it all
for all architectures.

Bruce

 "
>
>  PERF_EXTRA_LDFLAGS =3D ""
> @@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {
>  do_configure:prepend () {
>      # If building a multlib based perf, the incorrect library path will =
be
>      # detected by perf, since it triggers via: ifeq ($(ARCH),x86_64). In
> a 32 bit
> -    # build, with a 64 bit multilib, the arch won't match and the
> detection of a
> +    # build, with a 64 bit multilib, the arch won't match and the
> detection of a
>      # 64 bit build (and library) are not exected. To ensure that
> libraries are
>      # installed to the correct location, we can use the weak assignment
> in the
>      # config/Makefile.
>
> ---
> base-commit: 343dd7ae4a177111e75f51f6d1ee1ce254f99e9d
> change-id: 20250603-perf-arm64-unistd-9344a6fc96a7
>
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217839):
> https://lists.openembedded.org/g/openembedded-core/message/217839
> Mute This Topic: https://lists.openembedded.org/mt/113462181/1050810
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

--0000000000009141c10636bdaabc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 4, 2025 at 2:52=
=E2=80=AFAM Yannic Moog via <a href=3D"http://lists.openembedded.org">lists=
.openembedded.org</a> &lt;y.moog=3D<a href=3D"mailto:phytec.de@lists.openem=
bedded.org">phytec.de@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">kernel commit bfb713ea53c7 (&qu=
ot;perf tools: Fix arm64 build by generating unistd_64.h&quot;)<br>
introduces a new dependency on source files for arm64, specifically<br>
include/uapi/asm-generic.<br>
<br>
Build fails with:<br>
[..]/perf/1.0/perf-1.0/scripts/Makefile.asm-headers:33: [...]/perf/1.0/perf=
-1.0/include/uapi/asm-generic/Kbuild: No such file or directory<br>
make[4]: *** No rule to make target &#39;[...]/perf/1.0/perf-1.0/include/ua=
pi/asm-generic/Kbuild&#39;.=C2=A0 Stop.<br>
<br>
Add the directory to PERF_SRC.<br>
Fix whitespace error while at it.<br>
<br>
Signed-off-by: Yannic Moog &lt;<a href=3D"mailto:y.moog@phytec.de" target=
=3D"_blank">y.moog@phytec.de</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 0d19e1bdc222da26a5ad0a1d4964acca437a6692..d7a81b5802dc655917c2adf0447=
2b8e680380ec8 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a><br>
@@ -151,6 +151,7 @@ PERF_SRC ?=3D &quot;Makefile \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/arm64/tools \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${PERF_BPF_EVENT_SRC} \<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 arch/${ARCH}/Makefile \<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;=
ARCH&#39;, &#39;arm64&#39;, &#39;include/uapi/asm-generic&#39;, &#39;&#39;,=
 d)} \<br></blockquote><div><br></div><div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Can we be more precise on just getting what we need =
to generate unistd_64 ?</div><div class=3D"gmail_default" style=3D"font-siz=
e:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">W=
e&#39;ve always tried to copy just as much as required to get things buildi=
ng. I&#39;ve been</div><div class=3D"gmail_default" style=3D"font-size:smal=
l">able to get away with being specific in kernel-devsrc in the past.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Barring that, I wouldn&#39;t m=
ake this architecture specific, just copy it all for all architectures.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0&quot;<br>
<br>
=C2=A0PERF_EXTRA_LDFLAGS =3D &quot;&quot;<br>
@@ -208,7 +209,7 @@ python copy_perf_source_from_kernel() {<br>
=C2=A0do_configure:prepend () {<br>
=C2=A0 =C2=A0 =C2=A0# If building a multlib based perf, the incorrect libra=
ry path will be<br>
=C2=A0 =C2=A0 =C2=A0# detected by perf, since it triggers via: ifeq ($(ARCH=
),x86_64). In a 32 bit<br>
-=C2=A0 =C2=A0 # build, with a 64 bit multilib, the arch won&#39;t match an=
d the detection of a <br>
+=C2=A0 =C2=A0 # build, with a 64 bit multilib, the arch won&#39;t match an=
d the detection of a<br>
=C2=A0 =C2=A0 =C2=A0# 64 bit build (and library) are not exected. To ensure=
 that libraries are<br>
=C2=A0 =C2=A0 =C2=A0# installed to the correct location, we can use the wea=
k assignment in the<br>
=C2=A0 =C2=A0 =C2=A0# config/Makefile.<br>
<br>
---<br>
base-commit: 343dd7ae4a177111e75f51f6d1ee1ce254f99e9d<br>
change-id: 20250603-perf-arm64-unistd-9344a6fc96a7<br>
<br>
Best regards,<br>
-- <br>
Yannic Moog &lt;<a href=3D"mailto:y.moog@phytec.de" target=3D"_blank">y.moo=
g@phytec.de</a>&gt;<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#217839): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217839" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/217839</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113462181/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113462181/1050810</a><br>
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

--0000000000009141c10636bdaabc--

