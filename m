Return-Path: <leobsd@gmail.com>
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by mail.openembedded.org (Postfix) with ESMTP id DD48F6BDDC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Feb 2019 08:18:29 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id e27so1881155lfj.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2019 00:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=x+EK1aWL718bRWviwIbmDdAum/3XjR6kaYaV33iUKLA=;
	b=Qfn6qeJ9UXr2XNiJ3QCBkg2WtKxExlTkwAVFPXZNPrnfGGlaT9P7flnLsRBkMdLMTO
	BOwWnqaecc0vBRBnaLKUdG0qv1kxs5v13LI8YU6jIAR/FWZ44n8sFiQNjMer7KfvrjIT
	6pDvXMctRfxcfSPLRo+GjZcsJ4oUhFzUAoJdYL5pl73naU73wG/7qmcdctcg/UvpB7iJ
	+Bx2kE/CIiDrLK3BlaR0LR18nqrmoeSoOr+7UdAEgbAw3DK3MQO4zOR0skYZOi7g8Q4N
	0ql+3xqkKBPzG6SCI8lrSupuLmGvrWTklXOqUFl06W32At0MDR8xFanfNQzzJYPXNVch
	f9cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=x+EK1aWL718bRWviwIbmDdAum/3XjR6kaYaV33iUKLA=;
	b=jYfhDLJNfKuKOwxQjKbhLsOBUbVipEmycT5+wmcQ37GNh0aQBbggYPedKhh5rha/eu
	yiaLeTCbfjygqewdJcVcVCs/R2WPjQw1a7UwX0YJcTuvEpD4G/K23JAc+YUCQt+Qziyt
	Tn/OISn10TZNVcgCbTSjYFZv5/RyShSQ7sZBGhQZWnyOiUX9CDfcTRtsHRG4OpG1m36i
	MyBwAvuA3FgVLlKGk0SWnkfZYOB4nliqGORwKqGqgSviUMMP8g/KqeddCXyqkHdeGvka
	NGoCatkjTKp05SqQokmquVNRxrb1foecLn+b3jfB9kbbk31A0OIrNeS5mDoIk6/M9xEg
	uLUA==
X-Gm-Message-State: AHQUAuYDUmcVoylxaPALiDFqJspDAslA0Jr6UwtCmcpJK+7BDXatQL/N
	d8aU/N7Gy9X1ofHXx1ZmE6YHiOC1YeSg34k0QU6xhAejtck=
X-Google-Smtp-Source: AHgI3IaS1H//GrMZR3PeSVe23YN33Yd2l8HjLgzMfW0E0+XDvctbss/QuDAg1/WeeywYiB3l6Mmxl/6hEqA/CNFEZR8=
X-Received: by 2002:a19:ee13:: with SMTP id g19mr2409831lfb.72.1549613909819; 
	Fri, 08 Feb 2019 00:18:29 -0800 (PST)
MIME-Version: 1.0
References: <20190208081415.23989-1-leobsd@gmail.com>
In-Reply-To: <20190208081415.23989-1-leobsd@gmail.com>
From: Leonardo Rangel <leobsd@gmail.com>
Date: Fri, 8 Feb 2019 00:17:53 -0800
Message-ID: <CAN7MDW_ntoz2TQWmpLgLfZayi=CFD8c_r2edVc6UUs1g_6z7ig@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fix cp's target path for ext* filesystems Python subprocess' shell=True defaults to /bin/sh[1][2], which often refers to a POSIX-compliant shell. As the -e flag is not defined in the POSIX standard[3], some shells may interpret "-e" as the first argument to the echo command, causing the rest of the command line to fail.
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
X-List-Received-Date: Fri, 08 Feb 2019 08:18:30 -0000
Content-Type: multipart/alternative; boundary="000000000000a24b0405815d9a45"

--000000000000a24b0405815d9a45
Content-Type: text/plain; charset="UTF-8"

Please disregard. V2 with (hopefully) fixed title is on the way.

On Fri, Feb 8, 2019 at 12:14 AM Leonardo Augusto <leobsd@gmail.com> wrote:

> In this particular case, "echo -e 'cd {}'" is interpreted
> as "-e cd {}", which causes the first line of the command
> to fail, and causing cp to always place the source file
> in the filesystem's root.
>
> This issue only affects "wic cp" for ext* filesystems.
>
> [1] https://docs.python.org/2/library/subprocess.html
> [2] https://docs.python.org/3/library/subprocess.html
> [3] http://pubs.opengroup.org/onlinepubs/9699919799
>
> Signed-off-by: Leonardo Augusto <leobsd@gmail.com>
> ---
>  scripts/lib/wic/engine.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
> index 4662c665c0..b4be796752 100644
> --- a/scripts/lib/wic/engine.py
> +++ b/scripts/lib/wic/engine.py
> @@ -331,7 +331,7 @@ class Disk:
>      def copy(self, src, pnum, path):
>          """Copy partition image into wic image."""
>          if self.partitions[pnum].fstype.startswith('ext'):
> -            cmd = "echo -e 'cd {}\nwrite {} {}' | {} -w {}".\
> +            cmd = "echo 'cd {}\nwrite {} {}' | {} -w {}".\
>                        format(path, src, os.path.basename(src),
>                               self.debugfs, self._get_part_image(pnum))
>          else: # fat
> --
> 2.17.1
>
>

--000000000000a24b0405815d9a45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br clear=3D"all"></div><div>Please disre=
gard. V2 with (hopefully) fixed title is on the way.<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 8, 2019=
 at 12:14 AM Leonardo Augusto &lt;<a href=3D"mailto:leobsd@gmail.com">leobs=
d@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">In this particular case, &quot;echo -e &#39;cd {}&#39;&quot; is =
interpreted<br>
as &quot;-e cd {}&quot;, which causes the first line of the command<br>
to fail, and causing cp to always place the source file<br>
in the filesystem&#39;s root.<br>
<br>
This issue only affects &quot;wic cp&quot; for ext* filesystems.<br>
<br>
[1] <a href=3D"https://docs.python.org/2/library/subprocess.html" rel=3D"no=
referrer" target=3D"_blank">https://docs.python.org/2/library/subprocess.ht=
ml</a><br>
[2] <a href=3D"https://docs.python.org/3/library/subprocess.html" rel=3D"no=
referrer" target=3D"_blank">https://docs.python.org/3/library/subprocess.ht=
ml</a><br>
[3] <a href=3D"http://pubs.opengroup.org/onlinepubs/9699919799" rel=3D"nore=
ferrer" target=3D"_blank">http://pubs.opengroup.org/onlinepubs/9699919799</=
a><br>
<br>
Signed-off-by: Leonardo Augusto &lt;<a href=3D"mailto:leobsd@gmail.com" tar=
get=3D"_blank">leobsd@gmail.com</a>&gt;<br>
---<br>
=C2=A0scripts/lib/wic/engine.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py<br>
index 4662c665c0..b4be796752 100644<br>
--- a/scripts/lib/wic/engine.py<br>
+++ b/scripts/lib/wic/engine.py<br>
@@ -331,7 +331,7 @@ class Disk:<br>
=C2=A0 =C2=A0 =C2=A0def copy(self, src, pnum, path):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;Copy partition image in=
to wic image.&quot;&quot;&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.partitions[pnum].fstype.startswit=
h(&#39;ext&#39;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;echo -e &#39;cd {}=
\nwrite {} {}&#39; | {} -w {}&quot;.\<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cmd =3D &quot;echo &#39;cd {}\nw=
rite {} {}&#39; | {} -w {}&quot;.\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0format(path, src, os.path.basename(src),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.debugfs, self._get_part_image(pnum))<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else: # fat<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div></div>

--000000000000a24b0405815d9a45--
