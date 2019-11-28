Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
	[209.85.208.66])
	by mail.openembedded.org (Postfix) with ESMTP id D4E2D7F77A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 14:09:05 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id s10so22857216edi.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Nov 2019 06:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pg4VLZC4NC1IU5xFpKxOl33237M2+nXjsqkFCRFArr4=;
	b=uN19FtSudbDhLST78WiiKgv1M4ka6VlekrrcxB7EMQp5Y9Xjj6znVTlPltg7yhOc1D
	ZnYekEvVDoKFvj8aDflE/uO2Ura46NQXeCBm2CgAWTUzm02TYaWy4EkZVFsRuZHCvvyE
	Vzh9BvjInO1lqz5aRWz7Pawfg+sew89tYrzGdLvFCNjL8ip6hI09jYkV0ukFgFZKkg28
	ASo/hpiKcZ1mf2f3qqXzGBwMGxGyWOJUf8+oWPb1TbeuJFe7ej3nW7L6h9ZwEx0PdU6V
	M6NfATQSBjiUjf/FWUVX3OwACyOmsff68Jl74aEhi3LnEd+/nu5CB7Els6Sy3WTAByyA
	ArjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pg4VLZC4NC1IU5xFpKxOl33237M2+nXjsqkFCRFArr4=;
	b=m0VlrL8ArYpYUVeiEcScxRPg2oYYB/y2um5VD/OIWX8m/1Z1GlqojeizGf5stEQxYD
	i+vVswZASlWqMLqHOY4kKpH9GKpbLYL5ARskGtJeZ01uiF1lJW4CspaoVJJUxPpozwYU
	2NYdpaoAkWLaif3xPaOUTRD57usifNnal1s1SeCyxmqA8IQzqPrb1MzMOTRLwn5QxBph
	KnmAljy8+V+/n+oLm3Gxg2YPHrQeFPfN1tE0ioFcqFY09uyt0+oSqChCsRdUMi2xBdRg
	eRsNhR7vT6GQ2YSy3gYEdNAkcqoi9hQyH4hAMaQ+eJKRH6s4Iq9uKdHWKuWiIB4OSWUt
	PZdg==
X-Gm-Message-State: APjAAAXgVm54rmiOurJqKRZLPQMwUm+PtP2IuhFhG4rniIMlyTsDSCDe
	kBWrcj6a3hcNp/w5SqqxIPv77jyua0L90gFXITNv3BvJ
X-Google-Smtp-Source: APXvYqyPQeBc0lRyuxkp1tn/mbvVlK2zkPskGYP/gUL/vQhgnMoUq1bbF8WZvaVVhTRXSOuBrpd0lg1pSCHAZy4/5rc=
X-Received: by 2002:a05:6402:2d0:: with SMTP id
	b16mr2675359edx.227.1574950146339; 
	Thu, 28 Nov 2019 06:09:06 -0800 (PST)
MIME-Version: 1.0
References: <1574921664-22600-1-git-send-email-peter@berginkonsult.se>
In-Reply-To: <1574921664-22600-1-git-send-email-peter@berginkonsult.se>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Nov 2019 09:08:55 -0500
Message-ID: <CADkTA4NJAbLORAJXBgFtRt_NKjoipB0FusM7UKs=FNyKP=rFZQ@mail.gmail.com>
To: Peter Bergin <peter@berginkonsult.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: fix error with old (<4.2) x86 kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Nov 2019 14:09:06 -0000
Content-Type: multipart/alternative; boundary="00000000000002f7ae059868a85f"

--00000000000002f7ae059868a85f
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 28, 2019 at 1:14 AM Peter Bergin <peter@berginkonsult.se> wrote:

> When using kernel-devsrc for older kernels do_install fails with:
>
> | cp: failed to get attributes of 'arch/x86/entry': No such file or
> directory
>
> In the Linux kernel commit 1f57d5d85
> "x86/asm/entry: Move the arch/x86/syscalls/ definitions to
> arch/x86/entry/syscalls/"
> moved some files copied in the kernel-devsrc recipe. Commit 1f57d5d85 was
> added in
> v4.2.
>
> To be able to use kernel-devsrc for kernels older than v4.2 this commit
> make use of find
> for the files that shall be copied.
>
> Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
> b/meta/recipes-kernel/linux/kernel-devsrc.bb
> index b68d945..b6f2dbc 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -185,14 +185,14 @@ do_install() {
>         cp -a --parents tools/include/tools/be_byteshift.h
> $kerneldir/build/
>
>         # required for generate missing syscalls prepare phase
> -       cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl
> $kerneldir/build
> +       cp -a --parents $(find arch/x86 -type f -name "syscall_32.tbl")
> $kerneldir/build
>

Potentially stupid question (since obviously you've tested this on versions
less than v4.2) ..

Doesn't that find command return nothing in kernels < 4.1 and hence is a cp
-a --parents <nothing> $kerneldir/build ?

I haven't tested it myself (yet), so I thought I'd ask.

Thanks for fixing up the older kernel support!

Bruce



>
>         if [ "${ARCH}" = "x86" ]; then
>             # files for 'make prepare' to succeed with kernel-devel
> -           cp -a --parents arch/x86/entry/syscalls/syscall_32.tbl
> $kerneldir/build/
> -           cp -a --parents arch/x86/entry/syscalls/syscalltbl.sh
> $kerneldir/build/
> -           cp -a --parents arch/x86/entry/syscalls/syscallhdr.sh
> $kerneldir/build/
> -           cp -a --parents arch/x86/entry/syscalls/syscall_64.tbl
> $kerneldir/build/
> +           cp -a --parents $(find arch/x86 -type f -name
> "syscall_32.tbl") $kerneldir/build/
> +           cp -a --parents $(find arch/x86 -type f -name "syscalltbl.sh")
> $kerneldir/build/
> +           cp -a --parents $(find arch/x86 -type f -name "syscallhdr.sh")
> $kerneldir/build/
> +           cp -a --parents $(find arch/x86 -type f -name
> "syscall_64.tbl") $kerneldir/build/
>             cp -a --parents arch/x86/tools/relocs_32.c $kerneldir/build/
>             cp -a --parents arch/x86/tools/relocs_64.c $kerneldir/build/
>             cp -a --parents arch/x86/tools/relocs.c $kerneldir/build/
> --
> 2.7.4
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000002f7ae059868a85f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Nov 28, 2019 at 1:14 AM Peter Bergin &lt;<a=
 href=3D"mailto:peter@berginkonsult.se">peter@berginkonsult.se</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When using ke=
rnel-devsrc for older kernels do_install fails with:<br>
<br>
| cp: failed to get attributes of &#39;arch/x86/entry&#39;: No such file or=
 directory<br>
<br>
In the Linux kernel commit 1f57d5d85<br>
&quot;x86/asm/entry: Move the arch/x86/syscalls/ definitions to arch/x86/en=
try/syscalls/&quot;<br>
moved some files copied in the kernel-devsrc recipe. Commit 1f57d5d85 was a=
dded in<br>
v4.2.<br>
<br>
To be able to use kernel-devsrc for kernels older than v4.2 this commit mak=
e use of find<br>
for the files that shall be copied.<br>
<br>
Signed-off-by: Peter Bergin &lt;<a href=3D"mailto:peter@berginkonsult.se" t=
arget=3D"_blank">peter@berginkonsult.se</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 10 +++++-----<br>
=C2=A01 file changed, 5 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index b68d945..b6f2dbc 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -185,14 +185,14 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents tools/include/tools/be_byteshif=
t.h $kerneldir/build/<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # required for generate missing syscalls prepar=
e phase<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/syscalls/syscall=
_32.tbl $kerneldir/build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents $(find arch/x86 -type f -name &=
quot;syscall_32.tbl&quot;) $kerneldir/build<br></blockquote><div><br></div>=
<div><div class=3D"gmail_default" style=3D"font-size:small">Potentially stu=
pid question (since obviously you&#39;ve tested this on versions less than =
v4.2) ..=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:small">=
<br></div><div class=3D"gmail_default" style=3D"font-size:small">Doesn&#39;=
t that find command return nothing in kernels &lt; 4.1 and hence is a cp -a=
 --parents &lt;nothing&gt; $kerneldir/build ?<br></div><br></div><div><div =
class=3D"gmail_default" style=3D"font-size:small">I haven&#39;t tested it m=
yself (yet), so I thought I&#39;d ask.</div><div class=3D"gmail_default" st=
yle=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"fon=
t-size:small">Thanks for fixing up the older kernel support!</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ &quot;${ARCH}&quot; =3D &quot;x86&quot; ];=
 then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # files for &#39;make prepare&#39=
; to succeed with kernel-devel<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/syscall_32.tbl $kerneldir/build/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/syscalltbl.sh $kerneldir/build/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/syscallhdr.sh $kerneldir/build/<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents arch/x86/entry/sy=
scalls/syscall_64.tbl $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents $(find arch/x86 -=
type f -name &quot;syscall_32.tbl&quot;) $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents $(find arch/x86 -=
type f -name &quot;syscalltbl.sh&quot;) $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents $(find arch/x86 -=
type f -name &quot;syscallhdr.sh&quot;) $kerneldir/build/<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cp -a --parents $(find arch/x86 -=
type f -name &quot;syscall_64.tbl&quot;) $kerneldir/build/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents arch/x86/tools/re=
locs_32.c $kerneldir/build/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents arch/x86/tools/re=
locs_64.c $kerneldir/build/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cp -a --parents arch/x86/tools/re=
locs.c $kerneldir/build/<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--00000000000002f7ae059868a85f--
