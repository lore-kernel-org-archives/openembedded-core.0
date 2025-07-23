Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B46AC83F17
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 12:45:06 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.13759.1753274704263991316
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 05:45:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Tx10/Zjq;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b31d578e774so672903a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 05:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753274704; x=1753879504; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=T4qylpA7hjP9pNYLYTumXWGYMrSOm7Z6aaY9vUl51Ro=;
        b=Tx10/Zjqb+OMyod1ukfsE2it1ru5kRrlZNR5n/2CJ+KYL1wYIDLbE5vZEqtL2cW3rE
         nDFkGWKWU0WLmoiVKYa52MGMLS3F9MHUtd9x7qQJWTiAdOB2+xUNXjrVDge4jieIQcjO
         Ke0CkJDm3mnA1MakNt2AWcRXsL9p6f2eaUutVTFoBlZ9wkFsh/NiBbHPU3scWjW3MybH
         Yy/YCWXHl8BLo0vfLr4HwIti4LMZyGuHM5qLtddRY4peE/tQsIhcjl4wnn+UBQKzj4Af
         vdInb2IeIiHSyGgIDcK+XUA6t3aG5Fw8g22gwb9qXyZp+dyCjQgXHEbeH+oN7Nngcll4
         hSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753274704; x=1753879504;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T4qylpA7hjP9pNYLYTumXWGYMrSOm7Z6aaY9vUl51Ro=;
        b=wCc9a877i2t2RYiv2cKQ8rD60XYUc1WGweZUnX7eFlvccWD+CgjiyMp3C7wM3+Tjbb
         5Vtl6mJFF/L6D+ipHOmmM8sXYeDizjp0x9GeLmsWtilyTaT7+m+jzyJcbkaWUygjEXQZ
         vEsOciNKfNEdHPzPLAqF+0BscC0fO5auJj8GYHyr2ltv4MBYG9mOQJ3+RVTTSltWPi7v
         cxhx0JhjUUKmoWMFsS1S4moJlBvk2QQrP1ppwMxEuX2Oq/17ZK6iyYS7LU2VOhvpgK7n
         +CbM3S34OHan386QA9xSnBf5wO72ZrWdfhhL8CiJqTDJrMdreUVznOrW6sxEk+27X4sd
         6Qgw==
X-Gm-Message-State: AOJu0Yz6vWd19I3ILDdsp6y6Du+6jjvbhXj8fM6w9VFuFKSLJJduPta2
	Z5DscKq6gVusAPM6LmOhXwbIEK1nsbFnYFay3jNVxjdz83vbDy59VMFh/SyjGiM460vmxSI2tV/
	CDOFhA1ykgyRpc664yNv/EDE7EytUzPg=
X-Gm-Gg: ASbGncvT7eTaUnWoNY9JC7pSnvhC4Oh+KdZ0cGRmf0pkJWzCZT5TLuyEeyupTzvUxxE
	m5jnZTZ5qr8xLLTxWDo87v0gCKrCx3hicUuD106xjk/iDZpDTybjkh9pfRT7ude6BX35hXEvg2n
	tD2DTOOU4S26MSs8BBb/d4/itIKNafxFy4jIcBEbA9//Bcip1o7mnZZW9E8NsR9y7QL+nH1TT8B
	hluK2qx
X-Google-Smtp-Source: AGHT+IEbnt+yBYS01XNSdLMU5VcHJBRxwi7JRF1ILVKnjM4TUz4MfCuqayEFSNKLo+VU/UWAXQ7plMGq5R0RABE22fQ=
X-Received: by 2002:a17:90b:3910:b0:311:83d3:fd9c with SMTP id
 98e67ed59e1d1-31e3dfcfbb0mr11271941a91.0.1753274703418; Wed, 23 Jul 2025
 05:45:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250723073804.3239691-1-Qi.Chen@windriver.com>
In-Reply-To: <20250723073804.3239691-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 23 Jul 2025 08:44:45 -0400
X-Gm-Features: Ac12FXxMHs6izrAIfq2BFUeeAxm0gzw2egelBvsgBflecVZm16tgvHR09ARW3Dk
Message-ID: <CADkTA4P30hz0VWDD7U3vrkPe+j=HTXUG28Z149MOo4uB8_oUrQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V3] kernel-devsrc: copy arch/powerpc/tools contents
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e41bf6063a9813be"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 12:45:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220805

--000000000000e41bf6063a9813be
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 23, 2025 at 3:38=E2=80=AFAM Chen Qi via lists.openembedded.org =
<Qi.Chen=3D
windriver.com@lists.openembedded.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> For now, using qemuppc64 as MACHINE and building things inside SDK,
> we'll get the following error:
>
>   ERROR: modpost: "_mcount" undefined
>
> This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/
> contents to do the check. This in turn affects HAVE_OBJTOOL.
> """
> arch/powerpc/Kconfig:   select HAVE_OBJTOOL                     if
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32
> """
>
> The current MPROFILE_KERNEL for powerpc:
> """
> config MPROFILE_KERNEL
>             depends on PPC64_ELF_ABI_V2 && FUNCTION_TRACER
>             def_bool
> $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC=
)
> -mlittle-endian) if CPU_LITTLE_ENDIAN
>             def_bool
> $(success,$(srctree)/arch/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC=
)
> -mbig-endian) if CPU_BIG_ENDIAN
> """
>
> If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then
> FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.
>
> The scripts are listed and copied one by one. Their names and the reasons
> why
> they are copied are as below:
>   gcc-check-mprofile-kernel.sh: needed by MPROFILE_KERNEL
>   gcc-check-fpatchable-function-entry.sh: needed by
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY
>   head_check.sh/relocs_check.sh/unrel_branch_check.sh: needed by
> Makefile.postlink
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 3d2eb3929e..f8563291d5 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -208,6 +208,13 @@ do_install() {
>          fi
>
>          if [ "${ARCH}" =3D "powerpc" ]; then
> +            # Copy scripts that are needed by powperpc build, but don't
> error if they aren't present in the source.
> +            # 4.18+ needs gcc-check-mprofile-kernel.sh for
> MPROFILE_KERNEL, for example.
> +            # See
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
> +            for script in gcc-check-mprofile-kernel.sh
> gcc-check-fpatchable-function-entry.sh head_check.sh relocs_check.sh
> unrel_branch_check.sh; do
> +                cp -a --parents arch/powerpc/tools/$script
> $kerneldir/build/ 2>/dev/null || :
> +            done
> +
>

v3 looks good to me.

Bruce

             # 5.0 needs these files, but don't error if they aren't
> present in the source
>              cp -a --parents arch/${ARCH}/kernel/syscalls/syscall.tbl
> $kerneldir/build/ 2>/dev/null || :
>              cp -a --parents arch/${ARCH}/kernel/syscalls/syscalltbl.sh
> $kerneldir/build/ 2>/dev/null || :
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220795):
> https://lists.openembedded.org/g/openembedded-core/message/220795
> Mute This Topic: https://lists.openembedded.org/mt/114300365/1050810
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

--000000000000e41bf6063a9813be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 23, 2025 at 3:38=
=E2=80=AFAM Chen Qi via <a href=3D"http://lists.openembedded.org">lists.ope=
nembedded.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.opene=
mbedded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a href=
=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.com</=
a>&gt;<br>
<br>
For now, using qemuppc64 as MACHINE and building things inside SDK,<br>
we&#39;ll get the following error:<br>
<br>
=C2=A0 ERROR: modpost: &quot;_mcount&quot; undefined<br>
<br>
This is because after [1], MPROFILE_KERNEL is using arch/powerpc/tools/<br>
contents to do the check. This in turn affects HAVE_OBJTOOL.<br>
&quot;&quot;&quot;<br>
arch/powerpc/Kconfig:=C2=A0 =C2=A0select HAVE_OBJTOOL=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ARCH_USING_PATCHA=
BLE_FUNCTION_ENTRY || MPROFILE_KERNEL || PPC32<br>
&quot;&quot;&quot;<br>
<br>
The current MPROFILE_KERNEL for powerpc:<br>
&quot;&quot;&quot;<br>
config MPROFILE_KERNEL<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on PPC64_ELF_ABI_V2 &amp;=
&amp; FUNCTION_TRACER<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def_bool $(success,$(srctree)/arc=
h/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mlittle-endian) if CPU_=
LITTLE_ENDIAN<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 def_bool $(success,$(srctree)/arc=
h/powerpc/tools/gcc-check-mprofile-kernel.sh $(CC) -mbig-endian) if CPU_BIG=
_ENDIAN<br>
&quot;&quot;&quot;<br>
<br>
If MPROFILE_KERNEL is disabled, thus HAVE_OBJTOOL being disabled, then<br>
FTRACE_MCOUNT_USE_RECORDMCOUNT will be enabled, causing this error.<br>
<br>
The scripts are listed and copied one by one. Their names and the reasons w=
hy<br>
they are copied are as below:<br>
=C2=A0 gcc-check-mprofile-kernel.sh: needed by MPROFILE_KERNEL<br>
=C2=A0 gcc-check-fpatchable-function-entry.sh: needed by ARCH_USING_PATCHAB=
LE_FUNCTION_ENTRY<br>
=C2=A0 <a href=3D"http://head_check.sh/relocs_check.sh/unrel_branch_check.s=
h" rel=3D"noreferrer" target=3D"_blank">head_check.sh/relocs_check.sh/unrel=
_branch_check.sh</a>: needed by Makefile.postlink<br>
<br>
[1] <a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux=
.git/commit/?id=3Dabba759796f9b73eb24df9b734dd063839fc62e0" rel=3D"noreferr=
er" target=3D"_blank">https://git.kernel.org/pub/scm/linux/kernel/git/stabl=
e/linux.git/commit/?id=3Dabba759796f9b73eb24df9b734dd063839fc62e0</a><br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 7 +++++++<br>
=C2=A01 file changed, 7 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 3d2eb3929e..f8563291d5 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -208,6 +208,13 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;powerp=
c&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # Copy scripts that are needed b=
y powperpc build, but don&#39;t error if they aren&#39;t present in the sou=
rce.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 4.18+ needs gcc-check-mprofile=
-kernel.sh for MPROFILE_KERNEL, for example.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a href=3D"https://git.ker=
nel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba759796f9=
b73eb24df9b734dd063839fc62e0" rel=3D"noreferrer" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba7=
59796f9b73eb24df9b734dd063839fc62e0</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for script in gcc-check-mprofile=
-kernel.sh gcc-check-fpatchable-function-entry.sh head_check.sh relocs_chec=
k.sh unrel_branch_check.sh; do<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents ar=
ch/powerpc/tools/$script $kerneldir/build/ 2&gt;/dev/null || :<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 done<br>
+<br></blockquote><div><br></div><div class=3D"gmail_default" style=3D"font=
-size:small">v3 looks good to me.</div><div class=3D"gmail_default" style=
=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-s=
ize:small">Bruce</div><div class=3D"gmail_default" style=3D"font-size:small=
"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# 5.0 needs these files, bu=
t don&#39;t error if they aren&#39;t present in the source<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH=
}/kernel/syscalls/syscall.tbl $kerneldir/build/ 2&gt;/dev/null || :<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/${ARCH=
}/kernel/syscalls/syscalltbl.sh $kerneldir/build/ 2&gt;/dev/null || :<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#220795): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220795" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220795</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114300365/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114300365/1050810</a><br>
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

--000000000000e41bf6063a9813be--

