Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f46.google.com (mail-qg0-f46.google.com
	[209.85.192.46])
	by mail.openembedded.org (Postfix) with ESMTP id 4EE5473710
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 22:22:31 +0000 (UTC)
Received: by qget71 with SMTP id t71so135676076qge.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Jul 2015 15:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R5UXHTmJ1MyLCeNdnG6RA2gymCG00uUrbrznQZMsJfQ=;
	b=BoiVDZMcWYeOkt7kPuimLOG5WVU5lPMk8vAWI7tSHoxfyTEu4YTPsjUuAdAgQ4/rKP
	pJBKkgRjGJQpi0bgtQTBGayu+5/dFojwSlK6mGtpDZD8zgmDpAhaArfLLyaz92mjumgc
	Q585rT6US6orWk7UGVyDoH5Vlu9OdbEKZEQQDObIy7hZ7kiVaSXe5OdrCTvlwcu2LJ+a
	dgABO78+bC8C0TXh3RWmxaFCbz1nkly6whCVxtoXKqoVMHzjmMGaPqhOq2z9tzmV6Cno
	V3EW1ixYC+5o+A3pqyHRmvnr9IUeJ5gdOCKyIGQ87aW/PfExeJN8MsDkuiPSclS30o9G
	1fYw==
X-Gm-Message-State: ALoCoQm1XX4wEGUSknZVC6Eb0n9NiZRPY5lGP9G/0nRJUDIylot9jb5jmoRu6v0shxVS2V6U++KB
X-Received: by 10.140.231.19 with SMTP id b19mr36933179qhc.22.1436566951781;
	Fri, 10 Jul 2015 15:22:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Fri, 10 Jul 2015 15:22:11 -0700 (PDT)
In-Reply-To: <1436158731-2341-1-git-send-email-rongqing.li@windriver.com>
References: <1436158731-2341-1-git-send-email-rongqing.li@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 Jul 2015 23:22:11 +0100
Message-ID: <CAJTo0LZMMOpGKrt41M=XxOyKbEidML_dNPGZaDWMuPtMzO-U9Q@mail.gmail.com>
To: "rongqing.li@windriver.com" <rongqing.li@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] elfutils: fix stack usage warning
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
X-List-Received-Date: Fri, 10 Jul 2015 22:22:32 -0000
Content-Type: multipart/alternative; boundary=001a11c12f00db874b051a8cce8b

--001a11c12f00db874b051a8cce8b
Content-Type: text/plain; charset=UTF-8

Can you rebase this for the current master please, which has 0.163.

Ross

On 6 July 2015 at 05:58, <rongqing.li@windriver.com> wrote:

> From: Roy Li <rongqing.li@windriver.com>
>
> Signed-off-by: Roy Li <rongqing.li@windriver.com>
> ---
>  .../0001-fix-a-stack-usage-warning.patch           | 28
> ++++++++++++++++++++++
>  meta/recipes-devtools/elfutils/elfutils_0.162.bb   |  1 +
>  2 files changed, 29 insertions(+)
>  create mode 100644
> meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack-usage-warning.patch
>
> diff --git
> a/meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack-usage-warning.patch
> b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack-usage-warning.patch
> new file mode 100644
> index 0000000..6923bf7
> --- /dev/null
> +++
> b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack-usage-warning.patch
> @@ -0,0 +1,28 @@
> +[PATCH] fix a stack-usage warning
> +
> +Upstream-Status: Pending
> +
> +not use a variable to as a array size, otherwise the warning to error that
> +stack usage might be unbounded [-Werror=stack-usage=] will happen
> +
> +Signed-off-by: Roy Li <rongqing.li@windriver.com>
> +---
> + backends/ppc_initreg.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c
> +index 64f5379..52dde3e 100644
> +--- a/backends/ppc_initreg.c
> ++++ b/backends/ppc_initreg.c
> +@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__
> ((unused)),
> +       return false;
> +     }
> +   const size_t gprs = sizeof (user_regs.r.gpr) / sizeof
> (*user_regs.r.gpr);
> +-  Dwarf_Word dwarf_regs[gprs];
> ++  Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof
> (*user_regs.r.gpr)];
> +   for (unsigned gpr = 0; gpr < gprs; gpr++)
> +     dwarf_regs[gpr] = user_regs.r.gpr[gpr];
> +   if (! setfunc (0, gprs, dwarf_regs, arg))
> +--
> +1.9.1
> +
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.162.bb
> b/meta/recipes-devtools/elfutils/elfutils_0.162.bb
> index f6ace7e..7ebfc4f 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.162.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.162.bb
> @@ -17,6 +17,7 @@ SRC_URI += "\
>          file://fixheadercheck.patch \
>
>  file://0001-elf_getarsym-Silence-Werror-maybe-uninitialized-fals.patch \
>          file://0001-remove-the-unneed-checking.patch \
> +        file://0001-fix-a-stack-usage-warning.patch \
>  "
>
>  # pick the patch from debian
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--001a11c12f00db874b051a8cce8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you rebase this for the current master please, which h=
as 0.163.<div><br></div><div>Ross</div></div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On 6 July 2015 at 05:58,  <span dir=3D"ltr">&lt=
;<a href=3D"mailto:rongqing.li@windriver.com" target=3D"_blank">rongqing.li=
@windriver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From=
: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rongqing.li@windr=
iver.com</a>&gt;<br>
<br>
Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">rong=
qing.li@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../0001-fix-a-stack-usage-warning.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 28 ++++++++++++++++++++++<br>
=C2=A0meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.162.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.162.bb</a>=C2=A0 =C2=A0|=C2=
=A0 1 +<br>
=C2=A02 files changed, 29 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.162/0001=
-fix-a-stack-usage-warning.patch<br>
<br>
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack=
-usage-warning.patch b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-f=
ix-a-stack-usage-warning.patch<br>
new file mode 100644<br>
index 0000000..6923bf7<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/elfutils/elfutils-0.162/0001-fix-a-stack-usage-=
warning.patch<br>
@@ -0,0 +1,28 @@<br>
+[PATCH] fix a stack-usage warning<br>
+<br>
+Upstream-Status: Pending<br>
+<br>
+not use a variable to as a array size, otherwise the warning to error that=
<br>
+stack usage might be unbounded [-Werror=3Dstack-usage=3D] will happen<br>
+<br>
+Signed-off-by: Roy Li &lt;<a href=3D"mailto:rongqing.li@windriver.com">ron=
gqing.li@windriver.com</a>&gt;<br>
+---<br>
+ backends/ppc_initreg.c | 2 +-<br>
+ 1 file changed, 1 insertion(+), 1 deletion(-)<br>
+<br>
+diff --git a/backends/ppc_initreg.c b/backends/ppc_initreg.c<br>
+index 64f5379..52dde3e 100644<br>
+--- a/backends/ppc_initreg.c<br>
++++ b/backends/ppc_initreg.c<br>
+@@ -93,7 +93,7 @@ ppc_set_initial_registers_tid (pid_t tid __attribute__ (=
(unused)),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0const size_t gprs =3D sizeof (user_regs.r.gpr) / sizeof (*use=
r_regs.r.gpr);<br>
+-=C2=A0 Dwarf_Word dwarf_regs[gprs];<br>
++=C2=A0 Dwarf_Word dwarf_regs[sizeof (user_regs.r.gpr) / sizeof (*user_reg=
s.r.gpr)];<br>
+=C2=A0 =C2=A0for (unsigned gpr =3D 0; gpr &lt; gprs; gpr++)<br>
+=C2=A0 =C2=A0 =C2=A0dwarf_regs[gpr] =3D user_regs.r.gpr[gpr];<br>
+=C2=A0 =C2=A0if (! setfunc (0, gprs, dwarf_regs, arg))<br>
+--<br>
+1.9.1<br>
+<br>
diff --git a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.16=
2.bb" rel=3D"noreferrer" target=3D"_blank">elfutils_0.162.bb</a> b/meta/rec=
ipes-devtools/elfutils/<a href=3D"http://elfutils_0.162.bb" rel=3D"noreferr=
er" target=3D"_blank">elfutils_0.162.bb</a><br>
index f6ace7e..7ebfc4f 100644<br>
--- a/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.162.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.162.bb</a><br>
+++ b/meta/recipes-devtools/elfutils/<a href=3D"http://elfutils_0.162.bb" r=
el=3D"noreferrer" target=3D"_blank">elfutils_0.162.bb</a><br>
@@ -17,6 +17,7 @@ SRC_URI +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://fixheadercheck.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-elf_getarsym-Silence-Werror-m=
aybe-uninitialized-fals.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-remove-the-unneed-checking.pa=
tch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-fix-a-stack-usage-warning.patch \<=
br>
=C2=A0&quot;<br>
<br>
=C2=A0# pick the patch from debian<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div>

--001a11c12f00db874b051a8cce8b--
