Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0A10CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 13:33:16 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9477.1762349590811893283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 05:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lYFscAG/;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2951a817541so76869515ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762349590; x=1762954390; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vO/UE1MneIZMN6G5sl3r0EkH8YGhfn+MRGGwbXzMRxw=;
        b=lYFscAG/5AMJIFpfu1YJQoazFSni2+b1zXFsm24muaX/+TUQ71flQmtocP2BkTZ3Zr
         6+tz//42WgykFXDVr9wRNY02m6tj5ESwX1LOQxlZjOuu2QuoAWF6EW+raufDQk4QZfYk
         fNfYpF8Pp+4mgp/8bfBcwqUeH3YXlqt6bIls87ytuwpPF4z5x5sD+w49OJUieK8nhb+D
         AjBuH5mtceNbbdfq4u6S/9Wxk4+3MgDtEuGsn3PXqSoMbHu8qfefyvBFq4dtAkemTpSe
         O0zI13QLZ7u7XDI5+4RKaoR08glCCxqmHuR1JpNrtHALxEdAklM8WCUTQUAuSv4k18ek
         /PRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762349590; x=1762954390;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO/UE1MneIZMN6G5sl3r0EkH8YGhfn+MRGGwbXzMRxw=;
        b=m+bL8SV4KXPczdMb4etW+EFOJ6DGEdFbutUsjpo8K1L8jvI5lp5JyboRFB12qeugX7
         ekmJG7SAq2qGhv+fByD/gkb+evNb8M6oKC5vqvEvO5oq3EqGXJF+jw+dbiue2+eQ+8n+
         iZDqZq+q+HlKNTSCz1uVI0ERBHFpVyowUF0XgyQCnnb4WbUChp7BBYLGeLmXU/OAUgIv
         QQSbGua0zS1lJyT8EuvOCFxM334NbrBJh5RwEvE+1Dy0d0UlVboYFMC7JcXBEZdhGHGF
         EhhEy3TyqRY4qscM1vYNmRGYEqdoEVYMMXKh/5Q4nS9e7bi8DiBxqXnsqxfVMzgwE8oG
         QSOw==
X-Gm-Message-State: AOJu0Yw+t9BTag0upeeTjxMQbfMF8qPRwbHjk9ctT9fDexe4X9+9dITT
	kodFoukmCcMO9i+mS63AAkGQqNHL7ebyCGTa7dKUfvBoJVSJu7fFEnz6AB0PZQx727wqBbE1oSh
	DvkKCEqMEjVp/5x/UK/AXBW/OOvq5ml4=
X-Gm-Gg: ASbGnctjU5OB9vkhaizOtEeDB5Zp/nn2ADj/aG2nFWeu7eofv2xnVKVV7g0GewsXahe
	DWFPC3xhTLRM4t9OY9gnCLwj4NfzNH+mUixbmF9F3uFLCm+Yg3oHYcP26kZ1/HJDs1bxVppks/y
	cUIS9sDEShFnIcvXfdDcoDxp4V+MJ5F67hklpoQY7+/Texz6KyInzly7UUBiHdKIVeKKeKvJF3s
	gV3DCm45w+eYvOcM+1qcBeZskxid2Q/iRmRpDnKA0zly1UcNv4GFv4yBtA+ehBx9QUmJBqv
X-Google-Smtp-Source: AGHT+IFakxLVV4uGWjfmuAthMo1+iQpmVyYwQqRpVnnsKUtwt/cTHDkawDxf3Mxvkp/sM7WEot/6ZeMwM15W0CMeT44=
X-Received: by 2002:a17:903:2a8d:b0:295:6c9d:1905 with SMTP id
 d9443c01a7336-2962ad2002emr51138235ad.18.1762349590076; Wed, 05 Nov 2025
 05:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20251105130942.833204-1-Harish.Sadineni@windriver.com> <20251105130942.833204-5-Harish.Sadineni@windriver.com>
In-Reply-To: <20251105130942.833204-5-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Nov 2025 08:32:57 -0500
X-Gm-Features: AWmQ_bli8sRKEJVlc6lfpcHEg5qQU5nHROO4-oajZ-KWlSlIEaNYjgySdvIeRU0
Message-ID: <CADkTA4MRn4u_mFsmwJt1K8MiBECcgers6rkKGTTWQK-KBGnCpg@mail.gmail.com>
Subject: Re: [PATCH RFC v2 4/8] rust: stage rustlib sources for linux-yocto
 make rustavailable support
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	sundeep.kokkonda@windriver.com, elmehdi.younes@smile.fr
Content-Type: multipart/alternative; boundary="000000000000495fcf0642d8fd8e"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 13:33:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225770

--000000000000495fcf0642d8fd8e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 5, 2025 at 8:10=E2=80=AFAM <Harish.Sadineni@windriver.com> wrot=
e:

> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> When building the Linux kernel with Rust support enabled (e.g., via `make
> rustavailable`),
>  the build system expects the Rust standard library sources to be
> available under:
>
>
If that call is happening at configure time (in configme), then it would
better to have
this preparation step in the same location versus separate before do_patch.

Bruce



>  ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
> b/meta/recipes-kernel/linux/linux-yocto.inc
> index e2ffd96b59..05219d166e 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -71,6 +71,14 @@ do_install:append(){
>                 rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
>         fi
>  }
> +do_patch:append(){
> +       if
> ${@bb.utils.contains('DISTRO_FEATURES','rust-kernel','true','false',d)};
> then
> +               if [ ! -d ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust
> ]; then
> +                       mkdir -p
> ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/
> +                       cp -r ${TMPDIR}/work-shared/rust
> ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/.
> +               fi
> +        fi
> +}
>
>  # enable kernel-sample for oeqa/runtime/cases's ksample.py test
>  KERNEL_FEATURES:append:qemuall =3D "
> features/kernel-sample/kernel-sample.scc"
> --
> 2.49.0
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000495fcf0642d8fd8e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 5, 2025 at 8:10=
=E2=80=AFAM &lt;<a href=3D"mailto:Harish.Sadineni@windriver.com">Harish.Sad=
ineni@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadin=
eni@windriver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<=
br>
<br>
When building the Linux kernel with Rust support enabled (e.g., via `make r=
ustavailable`),<br>
=C2=A0the build system expects the Rust standard library sources to be avai=
lable under:<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">If that call is happening at configure time (in configme),=
 then it would better to have</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">this preparation step in the same location versus separate b=
efore do_patch.</div><div class=3D"gmail_default" style=3D"font-size:small"=
><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</di=
v><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
=C2=A0${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust<br>
<br>
Signed-off-by: Harish Sadineni &lt;<a href=3D"mailto:Harish.Sadineni@windri=
ver.com" target=3D"_blank">Harish.Sadineni@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/linux-yocto.inc | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kerne=
l/linux/linux-yocto.inc<br>
index e2ffd96b59..05219d166e 100644<br>
--- a/meta/recipes-kernel/linux/linux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/linux-yocto.inc<br>
@@ -71,6 +71,14 @@ do_install:append(){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGING_KE=
RNEL_DIR}/${KMETA}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+do_patch:append(){<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;rust-kernel&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ ! -d ${STAGING=
_DIR_NATIVE}/usr/lib/rustlib/src/rust ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0mkdir -p ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0cp -r ${TMPDIR}/work-shared/rust ${STAGING_DIR_NATIVE}/usr/lib/ru=
stlib/src/.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
+}<br>
<br>
=C2=A0# enable kernel-sample for oeqa/runtime/cases&#39;s ksample.py test<b=
r>
=C2=A0KERNEL_FEATURES:append:qemuall =3D &quot; features/kernel-sample/kern=
el-sample.scc&quot;<br>
-- <br>
2.49.0<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000495fcf0642d8fd8e--

