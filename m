Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5895C5B552
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 13:19:19 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.7558.1749129553354352227
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 06:19:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KlhwbeLS;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-311e2cc157bso803706a91.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 06:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749129553; x=1749734353; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0MiuuoZSrT0qijEwOGOHW/QqTp4POVbzQv9nL8qDdsE=;
        b=KlhwbeLSMqPNJ0ioR0Ov0IMDkqvrWW9JiEel23xqvbIDimUMvkwOA9SyaNrsi0TpcB
         ro23ol/rjet0msjH0MbPiPNoRWwGawNTZKucTwfsynGnUWBXBynGASRKaQ2/sW5cK5h5
         yWkK6Bs6h3fqnaUHqEl9La/SG4wg4RBkdLw3sJ8V3CLKMgomfXMm1TPtuP7WgZX0dCyJ
         /RZf9YlbSAOol4Z4+8BjSnkYGYEYXAha/E/ayzKWTLAOAZ960as8Yq4gU4ohtnWsF8Os
         8uATDqZb7MSrRqQM+7PUNM2mUSJrt0ghsS5WvsOEs/3lUu/MCa/tLmfzoQ14+eHOqVCE
         m+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749129553; x=1749734353;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MiuuoZSrT0qijEwOGOHW/QqTp4POVbzQv9nL8qDdsE=;
        b=VcnEOl7ejJW3Nob0r8ZkQxa/69gBXfZxa2kpdXGX1VAAtswIqdjRclUoND4EOWJ5HH
         Hp7jpRGzQiSI6yyYrWn+2Lato1NfLWtCZhO5wxhq++lz++YkDSfTz1M81PSCHRgEuuVP
         gHGFb26QoocVFQxGF1HsFMq4w7gfr/gV+XDoWIhBl26dYFr7X4Kox3g+4l9Glmt06aY7
         y1LsQ/XZR8E2FIeW6Ptgs7u6XLle4C3bFyPiM7zvpyqPscjMJoBBoYozCZqmx64CqwCQ
         Mdwxi5I662hfZocQWtY3CKVGFpPcfwaOMIMeSglDDjVpP9+Vm44Ac8u/c2I8Iso9AavX
         Hrcg==
X-Gm-Message-State: AOJu0Yxu/L2VgX3V5VPDKI+KvNTYNEmdQ18HmfusHT+FAIpKMnBRgUHn
	HN4eG/Fuiv2x8IXh+vJTTeKCsn7u5Cm5s9h1TfckhJdW0uHI82VxypRx85/9IHYqtWz6UANqWHQ
	8BML6tYqknvCo4/4zxZu5F2vC9+l4GGoN9P2V
X-Gm-Gg: ASbGncv+JooOZ0SVmaLaLaXyLUCsb3yO63c3azQwBGHm+5w2g+UKnNOxFheqFsdLnza
	jbN0pvw4c72OWDS15YC71Sh+7vE0HSsrxbys874lvzawUbYCU3U4rB0pyo4JDwYtSn4/wfQSQNV
	n+g/miyc/Sdqb2XFit5WoM/hHNrWgZ11PoIw==
X-Google-Smtp-Source: AGHT+IFZP7iHq+ncCmBfh9n7RTEluoyOSivAAMR90SXfH70V9CXqhuBCQrIkqDBVleuvfr7EOhyKxgS2qddO2qAZg3g=
X-Received: by 2002:a17:90b:38c1:b0:311:fde5:e225 with SMTP id
 98e67ed59e1d1-3130cd884abmr10511251a91.14.1749129552506; Thu, 05 Jun 2025
 06:19:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250605-perf-arm64-unistd-v2-1-c86ff172b167@phytec.de>
In-Reply-To: <20250605-perf-arm64-unistd-v2-1-c86ff172b167@phytec.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Jun 2025 09:19:01 -0400
X-Gm-Features: AX0GCFtv-nKl86bDGT_I2Rf7s73y1dPwfnBuYx7pha_yRvjT1IeluyrQswSnvO8
Message-ID: <CADkTA4NpDm4wuhNOy9OxMVFsc5m0Twb=F4KQ2j9nqfvK+-acxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] perf: add arm64 source files for unistd_64.h
To: y.moog@phytec.de
Cc: openembedded-core@lists.openembedded.org, upstream@lists.phytec.de
Content-Type: multipart/alternative; boundary="000000000000a4b3f00636d2f5a3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 13:19:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218018

--000000000000a4b3f00636d2f5a3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 5, 2025 at 3:24=E2=80=AFAM Yannic Moog via lists.openembedded.o=
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
> Changes in v2:
> - only include KBuild instead of whole directory
> - remove ARCH=3Darm64 condition for inclusion
> - Link to v1:
> https://patchwork.yoctoproject.org/project/oe-core/patch/20250604-perf-ar=
m64-unistd-v1-1-97d3bb08927f@phytec.de/


Thanks for v2!

This looks good to me.

Bruce



>
> ---
>  meta/recipes-kernel/perf/perf.bb | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/
> perf.bb
> index
> 0d19e1bdc222da26a5ad0a1d4964acca437a6692..6cc5499d8dd8b568a135ad767bd2dd5=
3fc4dce13
> 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -151,6 +151,7 @@ PERF_SRC ?=3D "Makefile \
>               arch/arm64/tools \
>               ${PERF_BPF_EVENT_SRC} \
>               arch/${ARCH}/Makefile \
> +             include/uapi/asm-generic/Kbuild \
>  "
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
> base-commit: ae97991a5c634d2ac0ea3bed29bb7aaa9d9b793f
> change-id: 20250603-perf-arm64-unistd-9344a6fc96a7
>
> Best regards,
> --
> Yannic Moog <y.moog@phytec.de>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217991):
> https://lists.openembedded.org/g/openembedded-core/message/217991
> Mute This Topic: https://lists.openembedded.org/mt/113481539/1050810
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

--000000000000a4b3f00636d2f5a3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Jun 5, 2025 at 3:24=
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
Changes in v2:<br>
- only include KBuild instead of whole directory<br>
- remove ARCH=3Darm64 condition for inclusion<br>
- Link to v1: <a href=3D"https://patchwork.yoctoproject.org/project/oe-core=
/patch/20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de/" rel=3D"nore=
ferrer" target=3D"_blank">https://patchwork.yoctoproject.org/project/oe-cor=
e/patch/20250604-perf-arm64-unistd-v1-1-97d3bb08927f@phytec.de/</a></blockq=
uote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Thanks for v2!</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">This =
looks good to me.</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</=
div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
---<br>
=C2=A0meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"noreferrer=
" target=3D"_blank">perf.bb</a> | 3 ++-<br>
=C2=A01 file changed, 2 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf.bb" rel=3D"nor=
eferrer" target=3D"_blank">perf.bb</a> b/meta/recipes-kernel/perf/<a href=
=3D"http://perf.bb" rel=3D"noreferrer" target=3D"_blank">perf.bb</a><br>
index 0d19e1bdc222da26a5ad0a1d4964acca437a6692..6cc5499d8dd8b568a135ad767bd=
2dd53fc4dce13 100644<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0include/uapi/asm-generic/K=
build \<br>
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
base-commit: ae97991a5c634d2ac0ea3bed29bb7aaa9d9b793f<br>
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
View/Reply Online (#217991): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/217991" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/217991</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113481539/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/113481539/1050810</a><br>
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

--000000000000a4b3f00636d2f5a3--

