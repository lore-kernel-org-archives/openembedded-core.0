Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2949C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 03:46:31 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.web11.41069.1752723986855360087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Jul 2025 20:46:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CWj3UAQ1;
 spf=pass (domain: gmail.com, ip: 209.85.215.175, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b2c4e46a89fso348644a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Jul 2025 20:46:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752723986; x=1753328786; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NHvv2YZ1UY7xxN2waY4/fO6b6ME0aDD6euWC8+T3NKU=;
        b=CWj3UAQ1NwrKUPj9BMZyjlzJv9h2R8boKrN1r2naVEGd4Y1gNl2wzj7FMuY3KV0xOs
         7uVrLTiuJxd7YkSFfjJlAeLiK5UcN3lknwYyxMkiWq1Vr0ytelWYh1uh6oBs3YzkY0GJ
         L9pCQZj29/8eHlJ9aJkk2WBINJs0pnPIdcHwkRielajP3BJhdqDr6Ea5Rcdm6kFZHqaf
         tFk8gepWBfJgrg7gHTi58Q+abp8+GFINMvz9RgQh5YY4aZ0ljLCQyYc6a4Oq1m0VebSI
         fRTLaml9hvRRoOCLtWBZKXRort6yksCrKFf3YoyGmJM/ru64+ZpBXhvaOBOwpnGyQeJx
         VyQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752723986; x=1753328786;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NHvv2YZ1UY7xxN2waY4/fO6b6ME0aDD6euWC8+T3NKU=;
        b=XTvqogEieCASjtMjs8B9YHuBS2vFGvabr0f9iCsyR/o9yeDmb5GphN+CPqm9NnM6D1
         GL5wjkUYC1MFUCl5oSIiJXcbAzXhJsorv196okvRqnIfzksogLQTMZPXsHJ4K5BSiwEf
         Fu8ys8H3+msX/PnONJO6Z0SLRV6xyLRFjQ6sUaJsel5uH3KC5iGTlyEu+a18NPZJ+Io7
         ZrepOKtZLzkU6KeE+DQ6KVoVT4tueC0hUcp80E920xYpv78rUZx6TwRJdQ4nxQi7acwt
         u28MD3S6x+gcGsFf2+k8dirwBh4bqXOSk8v4XLKCyC1tcc/1TNij11Fok6sTTh9YfRK2
         oKqQ==
X-Gm-Message-State: AOJu0YwwXqg5GiFaTMa9q36LczMH+1WypLFrMMGp4gmBptqGRYNUnrgr
	pBIV0kH0X0UZjsx7+P9cgC4xfpTsYnsWgq7VwKeDiR9I9rC+HY721pcr6RzpjeLZQySykl4RVnA
	emfWNiPy2lXC7cPHqna/N1PJaFN/lwJk=
X-Gm-Gg: ASbGncvi3Y3fnrZQ/1ZNrXP37HGMvetEC5fcuteEtyEVNaz1azc0gl6r+XGPgVz0oDw
	BW/GpGckLrYjW+HZUu9E3hRkvcbLEcN4JWHzK0phNQ51s5Cq3FTBkmSXwNGXDWgEjpQTfG8PMHh
	v0i2uZMSu/FXR5i6ZeCXeqsrHqysU1M2R2RrCtiYmPWkV264GZ8IDmJExE9mIp+qp9fnehNX21z
	/sNOcQMgAEPziF25g==
X-Google-Smtp-Source: AGHT+IEPKAPxPtV46FprPrjmZm1JySst5EAnNa0ahuGq1h8UhYWfWa/APQR5n6ARPqseMA4/y/mWolCPidQo5I5N76U=
X-Received: by 2002:a17:90b:1e07:b0:311:9c9a:58d7 with SMTP id
 98e67ed59e1d1-31c9f42e8a1mr7029211a91.19.1752723985839; Wed, 16 Jul 2025
 20:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20250717025948.1442716-1-Qi.Chen@windriver.com>
In-Reply-To: <20250717025948.1442716-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jul 2025 23:46:14 -0400
X-Gm-Features: Ac12FXzQyjURtP1rtFJBXyxeSJiacth-W1JyMPxuXJIr47478YnXm_b4xF6ePlw
Message-ID: <CADkTA4NAPTg9FHa627Xj+_fqreOWbB8wCWa6R3NodjCPLQrFyQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH V2] kernel-devsrc: copy arch/powerpc/tools contents
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000090bbc5063a17dac8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 03:46:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220514

--00000000000090bbc5063a17dac8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 16, 2025 at 11:00=E2=80=AFPM Chen Qi via lists.openembedded.org
<Qi.Chen=3Dwindriver.com@lists.openembedded.org> wrote:

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
> Note that there are 6 scripts under arch/powerpc/tools directory and we
> need to copy them all. They are needed in the same way as MPROFILE_KERNEL
> needing gcc-check-mprofile-kernel.sh.
>

Then list them all.

No other architecture does a complete copy of tools/ and copying entire
directories
has been avoided unless absolutely necessary.

If there are future items added there that we don't need, we don't want
them copied.
If there are new items added in the future that we do need, we WANT the
failure to
notify us to inspect and add them into the list.

Bruce



>
> For example, gcc-check-fpatchable-function-entry.sh is needed by
> ARCH_USING_PATCHABLE_FUNCTION_ENTRY.
>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index 3d2eb3929e..c4b5d0e5a6 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -208,6 +208,10 @@ do_install() {
>          fi
>
>          if [ "${ARCH}" =3D "powerpc" ]; then
> +            # 4.18+ needs these files for MPROFILE_KERNEL, but don't
> error if they aren't present in the source
> +            # See
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?=
id=3Dabba759796f9b73eb24df9b734dd063839fc62e0
> +            cp -a --parents arch/powerpc/tools $kerneldir/build/
> 2>/dev/null || :
> +
>              # 5.0 needs these files, but don't error if they aren't
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
> View/Reply Online (#220513):
> https://lists.openembedded.org/g/openembedded-core/message/220513
> Mute This Topic: https://lists.openembedded.org/mt/114197717/1050810
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

--00000000000090bbc5063a17dac8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 16, 2025 at 11:00=
=E2=80=AFPM Chen Qi via <a href=3D"http://lists.openembedded.org">lists.ope=
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
Note that there are 6 scripts under arch/powerpc/tools directory and we<br>
need to copy them all. They are needed in the same way as MPROFILE_KERNEL<b=
r>
needing gcc-check-mprofile-kernel.sh.<br></blockquote><div><br></div><div><=
div class=3D"gmail_default" style=3D"font-size:small">Then list them all.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br>No other arc=
hitecture does a complete copy of tools/ and copying entire directories</di=
v><div class=3D"gmail_default" style=3D"font-size:small">has been avoided u=
nless absolutely necessary.</div><div class=3D"gmail_default" style=3D"font=
-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:smal=
l">If there are future items added there that we don&#39;t need, we don&#39=
;t want them copied.</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">If there are new items added in the future that we do need, we WANT t=
he failure to</div><div class=3D"gmail_default" style=3D"font-size:small">n=
otify us to inspect and add them into the list.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
<br>
For example, gcc-check-fpatchable-function-entry.sh is needed by<br>
ARCH_USING_PATCHABLE_FUNCTION_ENTRY.<br>
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
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 3d2eb3929e..c4b5d0e5a6 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -208,6 +208,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;${ARCH}&quot; =3D &quot;powerp=
c&quot; ]; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # 4.18+ needs these files for MP=
ROFILE_KERNEL, but don&#39;t error if they aren&#39;t present in the source=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # See <a href=3D"https://git.ker=
nel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba759796f9=
b73eb24df9b734dd063839fc62e0" rel=3D"noreferrer" target=3D"_blank">https://=
git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=3Dabba7=
59796f9b73eb24df9b734dd063839fc62e0</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents arch/powerpc/too=
ls $kerneldir/build/ 2&gt;/dev/null || :<br>
+<br>
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
View/Reply Online (#220513): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/220513" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/220513</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/114197717/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/114197717/1050810</a><br>
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

--00000000000090bbc5063a17dac8--

