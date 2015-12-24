Return-Path: <joshuagloe@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id E57CE70030
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 10:02:23 +0000 (UTC)
Received: by mail-ig0-f180.google.com with SMTP id to4so96602061igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=axVjUb/iitKyJOhjKu+pjobNa0ke9bHELQg1rP6+fEg=;
	b=1CTq9XimG4DZ/Q4gh4DUb7UyugQRZN3WcssWVjhuiNLvQ1TJuo2dZ9pJbMwfxHVuYu
	mzdRuqnmxlE3qw/+Ql26vIJH1lS/JvXZ0vLPi3MEISVbFky8DQDd/VLznLeDKZ2eSfWo
	Oo5yLPFJRy6HSW6+A/RznOBVWlCO6lxyIMtCE4C2j9RSwIhkNEwBan74C8Lq4qqeHT3b
	BYg+kUj08+dOA2+4Uar4RcuZxpreCZOnOrSK+aSPjJEu90yeGXdKeT+ZT51EEwHguGqy
	W/wbihhlVCxrYDlvMBI8Z5DI1WwwehTScKM8brCjyvh0qVsju3k2RSVYftZBDJvrWOJ+
	E1bQ==
MIME-Version: 1.0
X-Received: by 10.50.109.201 with SMTP id hu9mr36770654igb.5.1450951344128;
	Thu, 24 Dec 2015 02:02:24 -0800 (PST)
Received: by 10.64.114.164 with HTTP; Thu, 24 Dec 2015 02:02:24 -0800 (PST)
In-Reply-To: <1450878635-25307-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1450878635-25307-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Thu, 24 Dec 2015 10:02:24 +0000
Message-ID: <CAK-Jx1OZSp5u9OAcX-e0CHM67d1he7yNTWTd=hmfNv4tNenHgQ@mail.gmail.com>
From: Joshua Lock <joshuagloe@gmail.com>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
Cc: Joshua Lock <joshua.lock@collabora.co.uk>,
	openembedded-core@lists.openembedded.org
Subject: Re: [wic][PATCH] wic: rawcopy: Copy source file to build folder
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
X-List-Received-Date: Thu, 24 Dec 2015 10:02:24 -0000
Content-Type: multipart/alternative; boundary=089e0112c7d67408130527a1ef43

--089e0112c7d67408130527a1ef43
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 23, 2015 at 1:50 PM, Ed Bartosh <ed.bartosh@linux.intel.com>
wrote:

> From: Noor Ahsan <noor_ahsan@mentor.com>
>
> When a file is given using --sourceparams then wic directly use that file
> instead of copying them to build folder. At time of assembling it os.rename
> is called which renames all the files to name. In that process the original
> file is renamed. When image recipe is rebuilt then wic complains about
> missing file which was renamed in previous build.
>
> [YOCTO #8854]
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
>


Thanks Ed,

I've verified this patch resolves the issue.

Acked-by:  Joshua Lock <joshuagloe@gmail.com>



> ---
>  scripts/lib/wic/plugins/source/rawcopy.py | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/scripts/lib/wic/plugins/source/rawcopy.py
> b/scripts/lib/wic/plugins/source/rawcopy.py
> index f0691ba..0472f53 100644
> --- a/scripts/lib/wic/plugins/source/rawcopy.py
> +++ b/scripts/lib/wic/plugins/source/rawcopy.py
> @@ -67,13 +67,14 @@ class RawCopyPlugin(SourcePlugin):
>              return
>
>          src = os.path.join(bootimg_dir, source_params['file'])
> -        dst = src
> +        dst = os.path.join(cr_workdir, source_params['file'])
>
>          if 'skip' in source_params:
> -            dst = os.path.join(cr_workdir, source_params['file'])
>              dd_cmd = "dd if=%s of=%s ibs=%s skip=1 conv=notrunc" % \
>                      (src, dst, source_params['skip'])
> -            exec_cmd(dd_cmd)
> +        else:
> +            dd_cmd = "cp %s %s" % (src, dst)
> +        exec_cmd(dd_cmd)
>
>          # get the size in the right units for kickstart (kB)
>          du_cmd = "du -Lbks %s" % dst
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e0112c7d67408130527a1ef43
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On W=
ed, Dec 23, 2015 at 1:50 PM, Ed Bartosh <span dir=3D"ltr">&lt;<a href=3D"ma=
ilto:ed.bartosh@linux.intel.com" target=3D"_blank">ed.bartosh@linux.intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">From: Noor Ahsan &lt;<a href=3D"mailto:noor_ahsan@mentor.com">noor_ahsan=
@mentor.com</a>&gt;<br>
<br>
When a file is given using --sourceparams then wic directly use that file<b=
r>
instead of copying them to build folder. At time of assembling it os.rename=
<br>
is called which renames all the files to name. In that process the original=
<br>
file is renamed. When image recipe is rebuilt then wic complains about<br>
missing file which was renamed in previous build.<br>
<br>
[YOCTO #8854]<br>
<br>
Signed-off-by: Ed Bartosh &lt;<a href=3D"mailto:ed.bartosh@linux.intel.com"=
>ed.bartosh@linux.intel.com</a>&gt;<br></blockquote><div><br><span class=3D=
"im"><div><br></div></span><div>Thanks Ed,<br><br></div><div>I&#39;ve verif=
ied this patch resolves the issue.<br></div><div><br>Acked-by:=C2=A0 Joshua=
 Lock &lt;<a href=3D"mailto:joshuagloe@gmail.com" target=3D"_blank">joshuag=
loe@gmail.com</a>&gt;</div><br>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0scripts/lib/wic/plugins/source/rawcopy.py | 7 ++++---<br>
=C2=A01 file changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/scripts/lib/wic/plugins/source/rawcopy.py b/scripts/lib/wic/pl=
ugins/source/rawcopy.py<br>
index f0691ba..0472f53 100644<br>
--- a/scripts/lib/wic/plugins/source/rawcopy.py<br>
+++ b/scripts/lib/wic/plugins/source/rawcopy.py<br>
@@ -67,13 +67,14 @@ class RawCopyPlugin(SourcePlugin):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0src =3D os.path.join(bootimg_dir, source_=
params[&#39;file&#39;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D src<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(cr_workdir, source_params=
[&#39;file&#39;])<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if &#39;skip&#39; in source_params:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dst =3D os.path.join(cr_workdir,=
 source_params[&#39;file&#39;])<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0dd_cmd =3D &quot;dd if=3D%s=
 of=3D%s ibs=3D%s skip=3D1 conv=3Dnotrunc&quot; % \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0(src, dst, source_params[&#39;skip&#39;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(dd_cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dd_cmd =3D &quot;cp %s %s&quot; =
% (src, dst)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 exec_cmd(dd_cmd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# get the size in the right units for kic=
kstart (kB)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0du_cmd =3D &quot;du -Lbks %s&quot; % dst<=
br>
<span class=3D""><font color=3D"#888888">--<br>
2.1.4<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br></div></div>

--089e0112c7d67408130527a1ef43--
