Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TZ1XW-0003W2-07
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 16:39:38 +0100
Received: by mail-lb0-f175.google.com with SMTP id j7so1299486lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2012 07:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=mzWqH5qd6DvzshlGQL6CxVRaTdhQvCpy85UOG19TMOg=;
	b=VejgopnYN7tfd3X29GHd1yVRANT6dYPnmsgGdP5LALRHEiUX4sdmImUVtL/EWogR3X
	StZC9jz+jHVLNCFNEPB9YMwf4011FVwC8Wqg6yIYhbTz6F4sBwVyWPSCN4v1UXpcid3h
	Qclsw5mxtw40x1UFprUwGZ3nhU5K+A00o/1TwNaJLn0deJEAHjew8fLkHajGeUB43bfH
	+Kbb9kgYQ6MaeGNF+8t//p5ERvIfhOwUuzkL19+QkS4Uf3Hg4HniExEmHYJgZqtaF+OD
	CScOqJN+d4fENvfgiCry7mcT5tRtH017pjhCsT6PdW9eb7hrkdMrEkYeblsETj3IyEcV
	Tf7g==
Received: by 10.112.24.6 with SMTP id q6mr767263lbf.24.1352993140849; Thu, 15
	Nov 2012 07:25:40 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.18.239 with HTTP; Thu, 15 Nov 2012 07:25:20 -0800 (PST)
In-Reply-To: <1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
References: <1351077301-7744-1-git-send-email-Martin.Jansa@gmail.com>
	<1352964649-31187-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 15 Nov 2012 08:25:20 -0700
X-Google-Sender-Auth: YCksXz0gQSJV8ZdEFdLYoS70G84
Message-ID: <CABcZAN=W_E+Qtox5XF7nBcMY9tN4vCCA51vcy=Hx1GDVGMwVbQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv4] scripts/sstate-sysroot-cruft.sh: add simple script to find files in sysroots not tracked by sstate
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Nov 2012 15:39:38 -0000
Content-Type: multipart/alternative; boundary=e0cb4efe2a0a8b3d3304ce8a43ca

--e0cb4efe2a0a8b3d3304ce8a43ca
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 15, 2012 at 12:30 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> * it's not very universal, but works with default oe-core setup and
>   shows basic HOW-TO. It can be improved later.
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  V2: added .pyo to WHITELIST
>      shorter filenames
>      TMPDIR
>      added duplicates but not shown
>
>  V3: use also populate-sysroot.MACHINE, manifest name for populate-sysroot
>      was changed in febeaf3d1b8917b660c7279b008d8b03337568e9
>
>  V4: dropped eglibc-initial work around, it was fixed in oe-core
>
>  scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>  create mode 100755 scripts/sstate-sysroot-cruft.sh
>
> diff --git a/scripts/sstate-sysroot-cruft.sh
> b/scripts/sstate-sysroot-cruft.sh
> new file mode 100755
> index 0000000..ca23dcf
> --- /dev/null
> +++ b/scripts/sstate-sysroot-cruft.sh
> @@ -0,0 +1,34 @@
> +#!/bin/sh
> +
> +# Used to find files installed in sysroot which are not tracked by sstate
> manifest
> +# Update BASE
> +
> +BASE="/OE/oe-core"
>

This seems interesting, but I have a few comments/concerns.

1) don't hardcode BASE, figure out the path relative to the script's
location, e.g. BASE="$(cd $(dirname $(dirname $0)) && pwd)"
2) output files shouldn't go into oe-core directly, as oe-core isn't
guaranteed to be writable, and it's more common to expect output from a
script like this to go relative to the current directory, or a temp
directory
3) extract TMPDIR from bitbake -e, rather than hardcoding that, as that
breaks for any distros or users which separate their tmpdirs by distro, or
set TCLIBCAPPEND = ""
-- 
Christopher Larson

--e0cb4efe2a0a8b3d3304ce8a43ca
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Nov 15, 2=
012 at 12:30 AM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:marti=
n.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> =
wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div class=3D"im">* it&#39;s not very universal, but works=
 with default oe-core setup and<br>


=C2=A0 shows basic HOW-TO. It can be improved later.<br>
<br>
</div><div class=3D"im">Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:M=
artin.Jansa@gmail.com">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0V2: added .pyo to WHITELIST<br>
=C2=A0 =C2=A0 =C2=A0shorter filenames<br>
=C2=A0 =C2=A0 =C2=A0TMPDIR<br>
=C2=A0 =C2=A0 =C2=A0added duplicates but not shown<br>
<br>
=C2=A0V3: use also populate-sysroot.MACHINE, manifest name for populate-sys=
root<br>
=C2=A0 =C2=A0 =C2=A0was changed in febeaf3d1b8917b660c7279b008d8b03337568e9=
<br>
<br>
</div>=C2=A0V4: dropped eglibc-initial work around, it was fixed in oe-core=
<br>
<div class=3D"im"><br>
=C2=A0scripts/sstate-sysroot-cruft.sh | 34 ++++++++++++++++++++++++++++++++=
++<br>
=C2=A01 file changed, 34 insertions(+)<br>
=C2=A0create mode 100755 scripts/sstate-sysroot-cruft.sh<br>
<br>
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft=
.sh<br>
new file mode 100755<br>
</div>index 0000000..ca23dcf<br>
<div class=3D"im">--- /dev/null<br>
+++ b/scripts/sstate-sysroot-cruft.sh<br>
@@ -0,0 +1,34 @@<br>
+#!/bin/sh<br>
+<br>
+# Used to find files installed in sysroot which are not tracked by sstate =
manifest<br>
+# Update BASE<br>
+<br>
+BASE=3D&quot;/OE/oe-core&quot;<br></div></blockquote><div><br></div>This s=
eems interesting, but I have a few comments/concerns.</div><div class=3D"gm=
ail_quote"><br></div><div class=3D"gmail_quote">1) don&#39;t hardcode BASE,=
 figure out the path relative to the script&#39;s location, e.g. BASE=3D&qu=
ot;$(cd $(dirname $(dirname $0)) &amp;&amp; pwd)&quot;</div>

<div class=3D"gmail_quote">2) output files shouldn&#39;t go into oe-core di=
rectly, as oe-core isn&#39;t guaranteed to be writable, and it&#39;s more c=
ommon to expect output from a script like this to go relative to the curren=
t directory, or a temp directory</div>

<div class=3D"gmail_quote">3) extract TMPDIR from bitbake -e, rather than h=
ardcoding that, as that breaks for any distros or users which separate thei=
r tmpdirs by distro, or set TCLIBCAPPEND =3D &quot;&quot;</div>-- <br>Chris=
topher Larson<br>


</div>

--e0cb4efe2a0a8b3d3304ce8a43ca--
