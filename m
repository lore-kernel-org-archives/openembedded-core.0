Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id A728E601E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 10:57:12 +0000 (UTC)
Received: by igbqq3 with SMTP id qq3so85433306igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jun 2015 03:57:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=27YcAeuMl8GT6vLzfyo63xSTHgf6iJe3CN2J0t22iJs=;
	b=ZhP80ibqQ5s7aHR9iXZp/tJG8Z5hc/gPVEaH19EkGy/DqEY364NctV7mW/RMrjZiMC
	eUC0PGoDJE+dN8ueURAfZ0V1Kcn822K2K0HSHwcYaeClwghRqXraVdafXrJcMkrHFxhY
	qXxwDE9boiLMPPxrvm9391VkjYkHkLyd23Mu1K7X5q2TBElN2c6M5vntU8k/ysNhvJcb
	4Iy9P8Ng4UYEWmeo6hAdOPZ0yw/7TvF/fPJaSJmcdPRzwO3V5nt1n4ippgQhp3VscjH+
	5njf2WlgKrai3LgUop3VBX/3qjZsvKzj4uA94Wus/Uj3O0DDC41XFzkWEbLWHyGFeSqs
	96xg==
X-Gm-Message-State: ALoCoQmXcXVa/VxSW2gCmyd35YlVE8bGkAnLDPQWHd/clWa50cgNF5FaDuFjhQz1mlM9GBEF0ijt
MIME-Version: 1.0
X-Received: by 10.50.178.133 with SMTP id cy5mr1330036igc.5.1435057033089;
	Tue, 23 Jun 2015 03:57:13 -0700 (PDT)
Received: by 10.79.67.133 with HTTP; Tue, 23 Jun 2015 03:57:13 -0700 (PDT)
In-Reply-To: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
References: <1434451710-2526-1-git-send-email-jkrishnanjanappa@mvista.com>
Date: Tue, 23 Jun 2015 16:27:13 +0530
Message-ID: <CAD3vsf51CUgAM3QKXu9JTUOgBX8=fm5U00k0bn=jcz932UC9CQ@mail.gmail.com>
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2][fido 1/4] runqemu: fix MACHINE being detected as qemuarm for qemuarm64 kernel image
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
X-List-Received-Date: Tue, 23 Jun 2015 10:57:13 -0000
Content-Type: multipart/alternative; boundary=089e01538cbeb0c9aa05192d40fe

--089e01538cbeb0c9aa05192d40fe
Content-Type: text/plain; charset=UTF-8

ping

Regards,
Jagadeesh

On Tue, Jun 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <
jkrishnanjanappa@mvista.com> wrote:

> Basically, runqemu script autodetects MACHINE type based on the
> kernel image name; if MACHINE name is not specified. Since 'qemuarm'
> string is common in both qemuarm amnd qemuarm64 kernel image names, the
> MACHINE type is considered as 'qemuarm' even when qemuarm64 kernel
> image name is given in command line.
>
> Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
> ---
>  scripts/runqemu | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/runqemu b/scripts/runqemu
> index 84ece4d..09c507d 100755
> --- a/scripts/runqemu
> +++ b/scripts/runqemu
> @@ -232,13 +232,13 @@ fi
>
>  if [ -z "$MACHINE" ]; then
>      if [ "x$FSTYPE" = "xvmdk" ]; then
> -        MACHINE=`basename $VM | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=`basename $VM | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from vmdk filename [$VM]"
>          fi
>          echo "Set MACHINE to [$MACHINE] based on vmdk [$VM]"
>      else
> -        MACHINE=`basename $KERNEL | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
> +        MACHINE=`basename $KERNEL | sed -n
> 's/.*\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p'`
>          if [ -z "$MACHINE" ]; then
>              error "Unable to set MACHINE from kernel filename [$KERNEL]"
>          fi
> --
> 1.9.1
>
>

--089e01538cbeb0c9aa05192d40fe
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">ping<div><br></div><div>Regards,</div><div>Jagadeesh</div>=
</div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun=
 16, 2015 at 4:18 PM, Jagadeesh Krishnanjanappa <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jkrishnanjanappa@mvista.com" target=3D"_blank">jkrishnanjanapp=
a@mvista.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Basica=
lly, runqemu script autodetects MACHINE type based on the<br>
kernel image name; if MACHINE name is not specified. Since &#39;qemuarm&#39=
;<br>
string is common in both qemuarm amnd qemuarm64 kernel image names, the<br>
MACHINE type is considered as &#39;qemuarm&#39; even when qemuarm64 kernel<=
br>
image name is given in command line.<br>
<br>
Signed-off-by: Jagadeesh Krishnanjanappa &lt;<a href=3D"mailto:jkrishnanjan=
appa@mvista.com">jkrishnanjanappa@mvista.com</a>&gt;<br>
---<br>
=C2=A0scripts/runqemu | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/scripts/runqemu b/scripts/runqemu<br>
index 84ece4d..09c507d 100755<br>
--- a/scripts/runqemu<br>
+++ b/scripts/runqemu<br>
@@ -232,13 +232,13 @@ fi<br>
<br>
=C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0if [ &quot;x$FSTYPE&quot; =3D &quot;xvmdk&quot; ]; then=
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/\1/p=
&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $VM | sed -n &#39;s/.*\(qe=
mux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemus=
h4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from vmdk filename [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Set MACHINE to [$MACHINE] base=
d on vmdk [$VM]&quot;<br>
=C2=A0 =C2=A0 =C2=A0else<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm\|qemumips64\|qemumips\|qemuppc\|qemush4\).*/=
\1/p&#39;`<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 MACHINE=3D`basename $KERNEL | sed -n &#39;s/.*=
\(qemux86-64\|qemux86\|qemuarm64\|qemuarm\|qemumips64\|qemumips\|qemuppc\|q=
emush4\).*/\1/p&#39;`<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ -z &quot;$MACHINE&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0error &quot;Unable to set M=
ACHINE from kernel filename [$KERNEL]&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
</font></span></blockquote></div><br></div>

--089e01538cbeb0c9aa05192d40fe--
