Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523FCCEFCFB
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 19:23:02 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.98324.1767727375809349507
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 11:22:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAr7o0EW;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-34c565c3673so15725a91.0
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 11:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767727375; x=1768332175; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G+SAdQIuPqU4OCodsXjE1ZbBsG5sNi5k7Lhjgsn4lNQ=;
        b=QAr7o0EWEVyss8ixWWdqo72c/xG0N63e4w4vO3Yql19ciIV0B4a2hhKSyuzjUHdjHt
         MVegognBA7KRUrFEgO467NKvRldO8uUZ/i9IqXxbOGcfTpsCfUJonWwZ/a6Y/LbJRNR2
         iSDOeySysi/7Ul3rO1ohcPGDLdEhMsUupsj6jllkf72RkR8cic5PWU3Ug+B1ibbfVlVJ
         5/Y6yG6JCHnFr5Nogfz0rtb1P5MFATNkMK0Uw0OA9b5K+pCdhoU1K4UKlc3vYfQzR5Eh
         MHU0rfHlgAKWNYZwiJ+1CWraCZ9KAYUIvdbIIk9VJEDvCIO2kbLQiyYu+JtKF3JGx/C0
         jzWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767727375; x=1768332175;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G+SAdQIuPqU4OCodsXjE1ZbBsG5sNi5k7Lhjgsn4lNQ=;
        b=I5szWlJCTPHYTsZT/Aw1olpzfAhh/1Rqk7l/lyVS/PJd38/kTu+EpJ6LGbeifaMoX5
         qy2sPzUXoXoCAG6Ch6Phy1F/ndjClWhPdu0WO0RBZJkwEqrLBH6CLRAgOXQbt8hecAea
         ZAmWs4BMaKHXX02T2/JumORN9G5ThzZ8I8S52fqmX5MPEwCuT7msCvvI188yl6O96hbC
         1ozi68DIC2qxm6b1boNsht+UTyA7qQ71kRPfSvAoCsB5femV4Efu4oUG3u+b0rTWSVrd
         wQxxllCrAA1cNGj1t1Q7Nc6/9kUfbM8nVuAsKwFJPVuPmLUbi1EzKgKd2NTSItNEeZQt
         AsNw==
X-Gm-Message-State: AOJu0YxrJY2FBIgVrhfgdotXl+eH+Go6PtZGAfPwm/g6OizHwXTRXRJE
	YMIzUyFfgXigS5GLet9ut71E3XdHH5qVy/91Fan2oCKsvKMTiHcV6N0Zm8AR8Qsc493Vu6ABPBC
	GHqRIfXwQ4qL+zrwLXDfxAEsmh05zY8A=
X-Gm-Gg: AY/fxX4vKLW2o56Zszdd0rh+L9xuXx17WwKYVXKSUpxXmOLbU+tlpcJ3jKPq8hpNxbf
	ZhzSouQ42RZC9Lk6Mus9DuwADUqnCs+vPUUUF8qarCkKp6Uaf69X0fIjMGRkYwum9EN0HOemD2Q
	DNLiwR3UXGUV7RfDAodJbJI75vwDgUoeBPCKp2RDDaoAqE3bmEtq7snvupHtuBn2PQC1AEbQs5f
	xMdsSprjWMYXM7W7KmUMJZqWXz7Ly0CfioCncdG3zw127q2H2oTTaysVbUCstQQrvSFFLAx
X-Google-Smtp-Source: AGHT+IGdbPDQ2jB7g11flXa0/5ZUQJJXHK877cRuQ1h0d2qV99hQECTr+TkaNrO4vtb2PiRjGrQp0UAvKXP+1lxqwNk=
X-Received: by 2002:a17:90b:2710:b0:32e:4716:d551 with SMTP id
 98e67ed59e1d1-34f68b64cc4mr158686a91.6.1767727375000; Tue, 06 Jan 2026
 11:22:55 -0800 (PST)
MIME-Version: 1.0
References: <20260106191001.3385117-1-valentin.boudevin@gmail.com> <20260106191001.3385117-4-valentin.boudevin@gmail.com>
In-Reply-To: <20260106191001.3385117-4-valentin.boudevin@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jan 2026 14:22:42 -0500
X-Gm-Features: AQt7F2pfdO1vTj6ABjVLLMxhlMTOh0SkSWIGb0a5hZFHkRzsG-BxvrEiK4WJsI4
Message-ID: <CADkTA4NwX2Dg10pitppoN1rBT27nvu1DfcTEH2Be6eZj00MtMQ@mail.gmail.com>
Subject: Re: [OE-core] [[PATCH v2] 4/4] linux: Add inherit on generate-cve-exclusions
To: valentin.boudevin@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003f291e0647bd1ab5"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 19:23:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228921

--0000000000003f291e0647bd1ab5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Apologies for not commenting on this in v1, I was
focused on the overhead of the task.

Rather than updating all the .bb files, why not just
have this in the linux-yocto.inc ? Otherwise, I'll surely
forget it at some point :)

Now that the task is optional, there's no risk of it
in the .inc, since other .inc users won't get overhead
that they don't expect.

Bruce

On Tue, Jan 6, 2026 at 2:10=E2=80=AFPM vboudevin via lists.openembedded.org
<valentin.boudevin=3Dgmail.com@lists.openembedded.org> wrote:

> All kernel recipes can use generate-cve-exclusions class to perform CVE
> exclusions.
> ---
>  meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   | 3 +++
>  meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 3 +++
>  meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb   | 3 +++
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb | 3 +++
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 3 +++
>  meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb | 3 +++
>  meta/recipes-kernel/linux/linux-yocto_6.12.bb      | 3 +++
>  meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 3 +++
>  meta/recipes-kernel/linux/linux-yocto_6.18.bb      | 3 +++
>  9 files changed, 27 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> index 9ac8507f9f..5cc735ae93 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb
> @@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.12.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # Skip processing of this recipe if it is not explicitly specified as th=
e
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>  # to build multiple virtual/kernel providers, e.g. as dependency of
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> index 1230e4e805..53532b4e7e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
> @@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.16.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # Skip processing of this recipe if it is not explicitly specified as th=
e
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>  # to build multiple virtual/kernel providers, e.g. as dependency of
> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> index 32ed29f25e..e95264d99d 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.18.bb
> @@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.18.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # Skip processing of this recipe if it is not explicitly specified as th=
e
>  # PREFERRED_PROVIDER for virtual/kernel. This avoids errors when trying
>  # to build multiple virtual/kernel providers, e.g. as dependency of
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> index 940561352c..6b17c2ff7f 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb
> @@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.12.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  LINUX_VERSION ?=3D "6.12.62"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> index ffa15b0c1b..02e502faed 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
> @@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.16.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  LINUX_VERSION ?=3D "6.16.11"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> index 2afdc02467..e36a7fb028 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.18.bb
> @@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  # CVE exclusions
>  include recipes-kernel/linux/cve-exclusion_6.18.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  LINUX_VERSION ?=3D "6.18.1"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6bc538ed5bd9a7fc9398086aedcd7=
e46"
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> index 84419f8c78..b6ac5f9b90 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.12.bb
> @@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  include recipes-kernel/linux/cve-exclusion.inc
>  include recipes-kernel/linux/cve-exclusion_6.12.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # board specific branches
>  KBRANCH:qemuarm  ?=3D "v6.12/standard/arm-versatile-926ejs"
>  KBRANCH:qemuarm64 ?=3D "v6.12/standard/base"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> index 408f14b451..947de4186e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
> @@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  include recipes-kernel/linux/cve-exclusion.inc
>  include recipes-kernel/linux/cve-exclusion_6.16.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # board specific branches
>  KBRANCH:qemuarm  ?=3D "v6.16/standard/arm-versatile-926ejs"
>  KBRANCH:qemuarm64 ?=3D "v6.16/standard/base"
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> index 562a997020..66320f7123 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
> @@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc
>  include recipes-kernel/linux/cve-exclusion.inc
>  include recipes-kernel/linux/cve-exclusion_6.18.inc
>
> +# Generate Dynamic CVE Exclusions
> +inherit generate-cve-exclusions
> +
>  # board specific branches
>  KBRANCH:qemuarm  ?=3D "v6.18/standard/arm-versatile-926ejs"
>  KBRANCH:qemuarm64 ?=3D "v6.18/standard/base"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228920):
> https://lists.openembedded.org/g/openembedded-core/message/228920
> Mute This Topic: https://lists.openembedded.org/mt/117111078/1050810
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

--0000000000003f291e0647bd1ab5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Apologies for not commenting on this in v1, I was</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">focused on the overhead of=
 the task.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Rather than up=
dating all the .bb files, why not just</div><div class=3D"gmail_default" st=
yle=3D"font-size:small">have this in the linux-yocto.inc ? Otherwise, I&#39=
;ll surely</div><div class=3D"gmail_default" style=3D"font-size:small">forg=
et it at some point :)</div><div class=3D"gmail_default" style=3D"font-size=
:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">No=
w that the task is optional, there&#39;s no risk of it</div><div class=3D"g=
mail_default" style=3D"font-size:small">in the .inc, since other .inc users=
 won&#39;t get overhead</div><div class=3D"gmail_default" style=3D"font-siz=
e:small">that they don&#39;t expect.</div><div class=3D"gmail_default" styl=
e=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-=
size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quote_cont=
ainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jan 6, 2026 at 2:10=E2=
=80=AFPM vboudevin via <a href=3D"http://lists.openembedded.org">lists.open=
embedded.org</a> &lt;valentin.boudevin=3D<a href=3D"mailto:gmail.com@lists.=
openembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">All kernel recipes can us=
e generate-cve-exclusions class to perform CVE<br>
exclusions.<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a>=C2=A0 =C2=A0=
| 3 +++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a>=C2=A0 =C2=A0=
| 3 +++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a>=C2=A0 =C2=A0=
| 3 +++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a> | 3 +++<=
br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a> | 3 +++<=
br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a> | 3 +++<=
br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 3 +++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 3 +++<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a>=C2=A0 =C2=A0 =C2=
=A0 | 3 +++<br>
=C2=A09 files changed, 27 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
2.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
index 9ac8507f9f..5cc735ae93 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.12.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.12.bb</a><br>
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.12.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# Skip processing of this recipe if it is not explicitly specified as=
 the<br>
=C2=A0# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tryi=
ng<br>
=C2=A0# to build multiple virtual/kernel providers, e.g. as dependency of<b=
r>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
6.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
index 1230e4e805..53532b4e7e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.16.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.16.bb</a><br>
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.16.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# Skip processing of this recipe if it is not explicitly specified as=
 the<br>
=C2=A0# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tryi=
ng<br>
=C2=A0# to build multiple virtual/kernel providers, e.g. as dependency of<b=
r>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.1=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a> b/met=
a/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" rel=3D"nor=
eferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
index 32ed29f25e..e95264d99d 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_6.18.bb" r=
el=3D"noreferrer" target=3D"_blank">linux-yocto-rt_6.18.bb</a><br>
@@ -5,6 +5,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.18.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# Skip processing of this recipe if it is not explicitly specified as=
 the<br>
=C2=A0# PREFERRED_PROVIDER for virtual/kernel. This avoids errors when tryi=
ng<br>
=C2=A0# to build multiple virtual/kernel providers, e.g. as dependency of<b=
r>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.12.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
index 940561352c..6b17c2ff7f 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.12.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.12.bb</a><br>
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.12.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.12.62&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.16.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
index ffa15b0c1b..02e502faed 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.16.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.16.bb</a><br>
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.16.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.16.11&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6=
.18.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a> b=
/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
index 2afdc02467..e36a7fb028 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-tiny_6.18.bb"=
 rel=3D"noreferrer" target=3D"_blank">linux-yocto-tiny_6.18.bb</a><br>
@@ -8,6 +8,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0# CVE exclusions<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.18.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0LINUX_VERSION ?=3D &quot;6.18.1&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D6bc538ed5bd9a7fc93980=
86aedcd7e46&quot;<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.12.bb</a><br>
index 84419f8c78..b6ac5f9b90 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.12.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.12.bb</a><br>
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.12.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# board specific branches<br>
=C2=A0KBRANCH:qemuarm=C2=A0 ?=3D &quot;v6.12/standard/arm-versatile-926ejs&=
quot;<br>
=C2=A0KBRANCH:qemuarm64 ?=3D &quot;v6.12/standard/base&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.16.bb</a><br>
index 408f14b451..947de4186e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.16.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.16.bb</a><br>
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.16.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# board specific branches<br>
=C2=A0KBRANCH:qemuarm=C2=A0 ?=3D &quot;v6.16/standard/arm-versatile-926ejs&=
quot;<br>
=C2=A0KBRANCH:qemuarm64 ?=3D &quot;v6.16/standard/base&quot;<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.b=
b" rel=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a> b/meta/reci=
pes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=3D"noreferrer" =
target=3D"_blank">linux-yocto_6.18.bb</a><br>
index 562a997020..66320f7123 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_6.18.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_6.18.bb</a><br>
@@ -6,6 +6,9 @@ require recipes-kernel/linux/linux-yocto.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion.inc<br>
=C2=A0include recipes-kernel/linux/cve-exclusion_6.18.inc<br>
<br>
+# Generate Dynamic CVE Exclusions<br>
+inherit generate-cve-exclusions<br>
+<br>
=C2=A0# board specific branches<br>
=C2=A0KBRANCH:qemuarm=C2=A0 ?=3D &quot;v6.18/standard/arm-versatile-926ejs&=
quot;<br>
=C2=A0KBRANCH:qemuarm64 ?=3D &quot;v6.18/standard/base&quot;<br>
-- <br>
2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#228920): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/228920" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/228920</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117111078/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/117111078/1050810</a><br>
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

--0000000000003f291e0647bd1ab5--

