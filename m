Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7114DC04FFE
	for <webhook@archiver.kernel.org>; Mon, 20 May 2024 11:12:35 +0000 (UTC)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.58384.1716203547359434797
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 May 2024 04:12:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aTsU8ZUs;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-481398a7381so415972137.3
        for <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716203546; x=1716808346; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HKNH/7T6MwEc70dMgS6dybpmGhYWN4zljQjtjmL2LRE=;
        b=aTsU8ZUsZLiC+l2WxFbU0nVxmd3aQ1x34vUFOnWJBmr7Sr8tlf8c36+tDg8P0ydSUA
         HAEGmaEubZefJlvidFSeVWepb0HV4NfLqLrXlJ/woePEyni9usGr/n+cikKy+R4Qjt+c
         d+ZqEc2A8B78UwYmDR0I22fDFrN2HkviAwLp7MbIzlhK5kteoSTrpJnXFADFaoQ6Uu7N
         garsQN2K3ep3dX0zip/h2vtaaBBI67hkxdkTZkuYmRkwb4Y7LCFthgkNG82JidlTogyl
         8hP4Mn3YWsp7l0kLucWOiFVFA+P5LQpA5w/1CpgI94jGV5kqWTjDkEs7ej7SbaGiDWxh
         ZtnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716203546; x=1716808346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKNH/7T6MwEc70dMgS6dybpmGhYWN4zljQjtjmL2LRE=;
        b=BY8+y+R6PzBIaLh6YLnJZD7FtxVHDepg+PMY8HkY2Ah646lg3CTNaOpnHPgZFyET7Q
         GSl4x0kTRryvgSGr/xTqm6LzDewJmJJjVRYxSOeYGP9MN16OmPkBuRzoHkJ8VAeJeZBl
         sYEkbi0lAWygKUHhNQVipINtYjjxPfHeiIn22BqJ1nBuZ3LuIAOc0OGad7hVU6NtrqPO
         vJBaaNdyeRTz+q/BeLIklJ2dI19EaOP55yislU+UnJLyRnnHEj7WT2IGQG4uifD+kGJk
         2iz+6ukI+THUAaIJCnUp9vSObmWaQnvEDlBpJ3gLdQRfeeKweCppM+wa7Y/P3kLnBXsV
         usBQ==
X-Gm-Message-State: AOJu0YxMLulrXF5zIfYRhGRuZJVcuy/FjirXvMHbfV+ogUYNmO91nLme
	5IXvNfPMpyu/5JyIwfa2y1+qFA630urbCOELiaXP0NNYrmgQYFui60jyv2EdyxmXETh6DIFrJfK
	HO9dTj8NlbSh8gNYkjUBut/8PdZHoGI3641s=
X-Google-Smtp-Source: AGHT+IFWoL5+qqgSNkjz+atfGmPybDSQI4ft5R0JK4kcjvjcyARjnCbvwSjxHGNQ0o3hAm/9ovbqKAua8OZcQqZZ9rA=
X-Received: by 2002:a05:6102:3c9c:b0:47e:f728:b3a5 with SMTP id
 ada2fe7eead31-48077eb3ee7mr29748947137.34.1716203545354; Mon, 20 May 2024
 04:12:25 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj941KS_ULo9iwpyYCKmvpHRur-4djy0AD=bjUvjnwW1XA@mail.gmail.com>
 <17234.1716192619114804009@lists.openembedded.org>
In-Reply-To: <17234.1716192619114804009@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 20 May 2024 12:12:14 +0100
Message-ID: <CANPvuRkVg_AbJR3DjYj+bNQ1sCqK71W7H5Ww1tC3kftC7nG+4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] buildhistory: Fix do_package race issues
To: pmi183@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000aeef8d0618e0c6e7"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 May 2024 11:12:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199569

--000000000000aeef8d0618e0c6e7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Pedro,

This will add the sstate-cache as a dependency of the buildhistory
which can be correct if it is enabled or in use
but IMO the buildhistory should also work without it, when the sstate is
not in use.

Could you please test one build with: bitbake --no-setscene ... ?

Jose

pmi183 via lists.openembedded.org <pmi183=3Dgmail.com@lists.openembedded.or=
g>
escreveu (segunda, 20/05/2024 =C3=A0(s) 09:10):

> Hi Alex,
>
> I made some debug in the flow and i saw a timing issue and since there's
> no reason to generate files-in-package.txt before sstate-cache operations=
 i
> moved the call to the postfunc of sstate:
>
> ---
>  meta/classes-global/sstate.bbclass |  5 +++++
>  meta/classes/buildhistory.bbclass  | 18 +++++++++++++++---
>  meta/lib/oe/packagedata.py         |  2 +-
>  3 files changed, 21 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes-global/sstate.bbclass
> b/meta/classes-global/sstate.bbclass
> index 76a7b59636..7e3c3e3c4f 100644
> --- a/meta/classes-global/sstate.bbclass
> +++ b/meta/classes-global/sstate.bbclass
> @@ -104,6 +104,7 @@ SSTATEPOSTCREATEFUNCS =3D ""
>  SSTATEPREINSTFUNCS =3D ""
>  SSTATEPOSTUNPACKFUNCS =3D "sstate_hardcode_path_unpack"
>  SSTATEPOSTINSTFUNCS =3D ""
> +SSTATEPOSTFUNCS =3D ""
>  EXTRA_STAGING_FIXMES ?=3D "HOSTTOOLS_DIR"
>
>  # Check whether sstate exists for tasks that support sstate and are in t=
he
> @@ -805,6 +806,10 @@ python sstate_task_postfunc () {
>      sstate_installpkgdir(shared_state, d)
>
>      bb.utils.remove(d.getVar("SSTATE_BUILDDIR"), recurse=3DTrue)
> +
> +    for postfunc in (d.getVar('SSTATEPOSTFUNCS') or '').split():
> +        # All hooks should run in the SSTATE_INSTDIR
> +        bb.build.exec_func(postfunc, d, (sstateinst,))
>  }
>  sstate_task_postfunc[dirs] =3D "${WORKDIR}"
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index fd53e92402..054c213bf5 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -58,6 +58,9 @@ SSTATEPOSTUNPACKFUNCS:append =3D "
> buildhistory_emit_outputsigs"
>  sstate_installpkgdir[vardepsexclude] +=3D "buildhistory_emit_outputsigs"
>  SSTATEPOSTUNPACKFUNCS[vardepvalueexclude] .=3D "|
> buildhistory_emit_outputsigs"
>
> +SSTATEPOSTFUNCS:append =3D " buildhistory_emit_filesinpackage"
> +SSTATEPOSTFUNCS[vardepvalueexclude] .=3D "|
> buildhistory_emit_filesinpackage"
> +
>  # All items excepts those listed here will be removed from a recipe's
>  # build history directory by buildhistory_emit_pkghistory(). This is
>  # necessary because some of these items (package directories, files that
> @@ -87,6 +90,16 @@ buildhistory_emit_sysroot() {
>         buildhistory_list_files_no_owners $BASE
> ${BUILDHISTORY_DIR_PACKAGE}/sysroot
>  }
>
> +#
> +# Write out files-in-package for this package
> +#
> +python buildhistory_emit_filesinpackage() {
> +    if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> +        # Create files-in-<package-name>.txt files containing a list of
> files of each recipe's package
> +        bb.build.exec_func("buildhistory_list_pkg_files", d)
> +        return 0
> +}
> +
>  #
>  # Write out metadata about this package for comparison when writing
> future packages
>  #
> @@ -99,8 +112,6 @@ python buildhistory_emit_pkghistory() {
>          return 0
>
>      if d.getVar('BB_CURRENTTASK') in ['package', 'package_setscene']:
> -        # Create files-in-<package-name>.txt files containing a list of
> files of each recipe's package
> -        bb.build.exec_func("buildhistory_list_pkg_files", d)
>          return 0
>
>      if not d.getVar('BB_CURRENTTASK') in ['packagedata',
> 'packagedata_setscene']:
> @@ -599,7 +610,8 @@ buildhistory_list_files_no_owners() {
>
>  buildhistory_list_pkg_files() {
>         # Create individual files-in-package for each recipe's package
> -       for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
> +    pkgdirlist=3D$(find ${PKGDEST}/* -maxdepth 0 -type d)
> +       for pkgdir in ${pkgdirlist}; do
>                 pkgname=3D$(basename $pkgdir)
>                 outfolder=3D"${BUILDHISTORY_DIR_PACKAGE}/$pkgname"
>                 outfile=3D"$outfolder/files-in-package.txt"
> diff --git a/meta/lib/oe/packagedata.py b/meta/lib/oe/packagedata.py
> index 2d1d6ddeb7..e8c503b43b 100644
> --- a/meta/lib/oe/packagedata.py
> +++ b/meta/lib/oe/packagedata.py
> @@ -309,7 +309,7 @@ fi
>          subdata_file =3D pkgdatadir + "/runtime/%s" % pkg
>          with open(subdata_file, 'w') as sf:
>              for var in (d.getVar('PKGDATA_VARS') or "").split():
> -                val =3D write_if_exists(sf, pkg, var)
> +                write_if_exists(sf, pkg, var)
>
>              write_if_exists(sf, pkg, 'FILERPROVIDESFLIST')
>              for dfile in sorted((d.getVar('FILERPROVIDESFLIST:' + pkg) o=
r
> "").split()):
> --
> 2.34.1
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199555):
> https://lists.openembedded.org/g/openembedded-core/message/199555
> Mute This Topic: https://lists.openembedded.org/mt/87258776/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000aeef8d0618e0c6e7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(0,0,0)">Hi Pedro,<br></span><br>T=
his will add the sstate-cache as a dependency=C2=A0of the buildhistory whic=
h=C2=A0can be correct if it is enabled or in use<div>but IMO the buildhisto=
ry should also work without it, when the sstate is not in use.<br><br>Could=
 you please test one build with: bitbake --no-setscene ... ?<br><br>Jose</d=
iv></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">pmi183 via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a> &lt;pmi183=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; escreveu (segunda, 20/05/2024 =C3=A0=
(s) 09:10):<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi A=
lex,<br><br>I made some debug in the flow and i saw a timing issue and sinc=
e there&#39;s no reason to generate files-in-package.txt before sstate-cach=
e operations i moved the call to the postfunc of sstate:<br><br>---<br>=C2=
=A0meta/classes-global/sstate.bbclass | =C2=A05 +++++<br>=C2=A0meta/classes=
/buildhistory.bbclass =C2=A0| 18 +++++++++++++++---<br>=C2=A0meta/lib/oe/pa=
ckagedata.py =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A02 +-<br>=C2=A03 files chan=
ged, 21 insertions(+), 4 deletions(-)<br><br>diff --git a/meta/classes-glob=
al/sstate.bbclass b/meta/classes-global/sstate.bbclass<br>index 76a7b59636.=
.7e3c3e3c4f 100644<br>--- a/meta/classes-global/sstate.bbclass<br>+++ b/met=
a/classes-global/sstate.bbclass<br>@@ -104,6 +104,7 @@ SSTATEPOSTCREATEFUNC=
S =3D &quot;&quot;<br>=C2=A0SSTATEPREINSTFUNCS =3D &quot;&quot;<br>=C2=A0SS=
TATEPOSTUNPACKFUNCS =3D &quot;sstate_hardcode_path_unpack&quot;<br>=C2=A0SS=
TATEPOSTINSTFUNCS =3D &quot;&quot;<br>+SSTATEPOSTFUNCS =3D &quot;&quot;<br>=
=C2=A0EXTRA_STAGING_FIXMES ?=3D &quot;HOSTTOOLS_DIR&quot;<br><br>=C2=A0# Ch=
eck whether sstate exists for tasks that support sstate and are in the<br>@=
@ -805,6 +806,10 @@ python sstate_task_postfunc () {<br>=C2=A0 =C2=A0 =C2=
=A0sstate_installpkgdir(shared_state, d)<br><br>=C2=A0 =C2=A0 =C2=A0bb.util=
s.remove(d.getVar(&quot;SSTATE_BUILDDIR&quot;), recurse=3DTrue)<br>+<br>+ =
=C2=A0 =C2=A0for postfunc in (d.getVar(&#39;SSTATEPOSTFUNCS&#39;) or &#39;&=
#39;).split():<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0# All hooks should run in th=
e SSTATE_INSTDIR<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(postfun=
c, d, (sstateinst,))<br>=C2=A0}<br>=C2=A0sstate_task_postfunc[dirs] =3D &qu=
ot;${WORKDIR}&quot;<br><br>diff --git a/meta/classes/buildhistory.bbclass b=
/meta/classes/buildhistory.bbclass<br>index fd53e92402..054c213bf5 100644<b=
r>--- a/meta/classes/buildhistory.bbclass<br>+++ b/meta/classes/buildhistor=
y.bbclass<br>@@ -58,6 +58,9 @@ SSTATEPOSTUNPACKFUNCS:append =3D &quot; buil=
dhistory_emit_outputsigs&quot;<br>=C2=A0sstate_installpkgdir[vardepsexclude=
] +=3D &quot;buildhistory_emit_outputsigs&quot;<br>=C2=A0SSTATEPOSTUNPACKFU=
NCS[vardepvalueexclude] .=3D &quot;| buildhistory_emit_outputsigs&quot;<br>=
<br>+SSTATEPOSTFUNCS:append =3D &quot; buildhistory_emit_filesinpackage&quo=
t;<br>+SSTATEPOSTFUNCS[vardepvalueexclude] .=3D &quot;| buildhistory_emit_f=
ilesinpackage&quot;<br>+<br>=C2=A0# All items excepts those listed here wil=
l be removed from a recipe&#39;s<br>=C2=A0# build history directory by buil=
dhistory_emit_pkghistory(). This is<br>=C2=A0# necessary because some of th=
ese items (package directories, files that<br>@@ -87,6 +90,16 @@ buildhisto=
ry_emit_sysroot() {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 buildhistory_list_files_=
no_owners $BASE ${BUILDHISTORY_DIR_PACKAGE}/sysroot<br>=C2=A0}<br><br>+#<br=
>+# Write out files-in-package for this package<br>+#<br>+python buildhisto=
ry_emit_filesinpackage() {<br>+ =C2=A0 =C2=A0if d.getVar(&#39;BB_CURRENTTAS=
K&#39;) in [&#39;package&#39;, &#39;package_setscene&#39;]:<br>+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0# Create files-in-&lt;package-name&gt;.txt files containin=
g a list of files of each recipe&#39;s package<br>+ =C2=A0 =C2=A0 =C2=A0 =
=C2=A0bb.build.exec_func(&quot;buildhistory_list_pkg_files&quot;, d)<br>+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br>+}<br>+<br>=C2=A0#<br>=C2=A0# Write =
out metadata about this package for comparison when writing future packages=
<br>=C2=A0#<br>@@ -99,8 +112,6 @@ python buildhistory_emit_pkghistory() {<b=
r>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br><br>=C2=A0 =C2=A0 =C2=A0if =
d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;package&#39;, &#39;package_sets=
cene&#39;]:<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0# Create files-in-&lt;package-n=
ame&gt;.txt files containing a list of files of each recipe&#39;s package<b=
r>- =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.build.exec_func(&quot;buildhistory_list_p=
kg_files&quot;, d)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0<br><br>=C2=
=A0 =C2=A0 =C2=A0if not d.getVar(&#39;BB_CURRENTTASK&#39;) in [&#39;package=
data&#39;, &#39;packagedata_setscene&#39;]:<br>@@ -599,7 +610,8 @@ buildhis=
tory_list_files_no_owners() {<br><br>=C2=A0buildhistory_list_pkg_files() {<=
br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Create individual files-in-package for eac=
h recipe&#39;s package<br>- =C2=A0 =C2=A0 =C2=A0 for pkgdir in $(find ${PKG=
DEST}/* -maxdepth 0 -type d); do<br>+ =C2=A0 =C2=A0pkgdirlist=3D$(find ${PK=
GDEST}/* -maxdepth 0 -type d)<br>+ =C2=A0 =C2=A0 =C2=A0 for pkgdir in ${pkg=
dirlist}; do<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pkg=
name=3D$(basename $pkgdir)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 outfolder=3D&quot;${BUILDHISTORY_DIR_PACKAGE}/$pkgname&quot;<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 outfile=3D&quot;$ou=
tfolder/files-in-package.txt&quot;<br>diff --git a/meta/lib/oe/packagedata.=
py b/meta/lib/oe/packagedata.py<br>index 2d1d6ddeb7..e8c503b43b 100644<br>-=
-- a/meta/lib/oe/packagedata.py<br>+++ b/meta/lib/oe/packagedata.py<br>@@ -=
309,7 +309,7 @@ fi<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0subdata_file =3D pk=
gdatadir + &quot;/runtime/%s&quot; % pkg<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0with open(subdata_file, &#39;w&#39;) as sf:<br>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0for var in (d.getVar(&#39;PKGDATA_VARS&#39;) or &qu=
ot;&quot;).split():<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0val =3D write_if_exists(sf, pkg, var)<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_if_exists(sf, pkg, var)<br><br>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0write_if_exists(sf, pkg, &#39;FILE=
RPROVIDESFLIST&#39;)<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for=
 dfile in sorted((d.getVar(&#39;FILERPROVIDESFLIST:&#39; + pkg) or &quot;&q=
uot;).split()):<br>--<br>2.34.1
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#199555): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/199555" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/199555</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87258776/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87258776/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--000000000000aeef8d0618e0c6e7--

