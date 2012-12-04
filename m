Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TftQK-0000py-Iy
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 15:24:37 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so2410702pad.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 06:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=oszSl1ORHrRaaCNmg0/Cujvy3oghBAPSdC7/mCh3ILU=;
	b=XXMUhLHLKxT/MhM0MgKEpinptMiUba/uy3kYaHM81y3rEORFXSJayGTyH95B2IaFtp
	q84Hm9f3MAHegcfnLAURWSkj+ZdwUD5kjRx2pPiSXTLk8mkLsmVhP52YCZtM13fWG3/H
	XNbn96QMqsJ9zmvpAkNcMAKeRNqWF0J798tz8jhShW5hVpf/5AtQPj11CAr8IDyY8fEH
	zOa0YwKGiPQCCwrSb7SoGlNS5dKHgdhgdlS4n1Q5UQmmFyxaa8wjBEQHfQdBd7ZcpiWS
	0zNgfeJ0ZiuUTV8NqQ0J96FbuBBrzlxS2lEG6I12Yezg+nCiuaFD30b+u0JV+0pAly8c
	srYA==
MIME-Version: 1.0
Received: by 10.68.224.165 with SMTP id rd5mr39695681pbc.49.1354630212769;
	Tue, 04 Dec 2012 06:10:12 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 4 Dec 2012 06:10:12 -0800 (PST)
In-Reply-To: <1636e75017b72bc97347f4cca038a8bc1efdb4ff.1354626535.git.laurentiu.palcu@intel.com>
References: <cover.1354626535.git.laurentiu.palcu@intel.com>
	<1636e75017b72bc97347f4cca038a8bc1efdb4ff.1354626535.git.laurentiu.palcu@intel.com>
Date: Tue, 4 Dec 2012 12:10:12 -0200
X-Google-Sender-Auth: v1TJEjo4dGdfni432aJnan_kDqo
Message-ID: <CAP9ODKoKot-eijHMBOSyBGHaELZxW6wEETKcV=FBAPehqbVncg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] image.bbclass: run postinst scripts once, at rootfs time
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
X-List-Received-Date: Tue, 04 Dec 2012 14:24:37 -0000
Content-Type: multipart/alternative; boundary=e89a8ff253c4a2596504d0076c53

--e89a8ff253c4a2596504d0076c53
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 4, 2012 at 11:59 AM, Laurentiu Palcu
<laurentiu.palcu@intel.com>wrote:

> This patch will allow the repeating postinst scriptlets to be run
> only once, on host, at do_rootfs time. This will lower the time for
> rootfs generation and, also, instead of running some time consuming
> scriptlets at target's first boot, we will do on the host.
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/image.bbclass |   20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 7b24e4e..719d871 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -156,7 +156,7 @@ inherit ${IMAGE_CLASSES}
>
>  IMAGE_POSTPROCESS_COMMAND ?= ""
>  MACHINE_POSTPROCESS_COMMAND ?= ""
> -ROOTFS_POSTPROCESS_COMMAND ?= ""
> +ROOTFS_POSTPROCESS_COMMAND_prepend = "run_intercept_scriptlets; "
>
>  # some default locales
>  IMAGE_LINGUAS ?= "de-de fr-fr en-gb"
> @@ -166,15 +166,29 @@ LINGUAS_INSTALL ?= "${@" ".join(map(lambda s:
> "locale-base-%s" % s, d.getVar('IM
>  PSEUDO_PASSWD = "${IMAGE_ROOTFS}"
>
>  do_rootfs[nostamp] = "1"
> -do_rootfs[dirs] = "${TOPDIR}"
> +do_rootfs[dirs] = "${TOPDIR} ${WORKDIR}/intercept_scripts"
>  do_rootfs[lockfiles] += "${IMAGE_ROOTFS}.lock"
> -do_rootfs[cleandirs] += "${S}"
> +do_rootfs[cleandirs] += "${S} ${WORKDIR}/intercept_scripts"
>  do_build[nostamp] = "1"
>
>  # Must call real_do_rootfs() from inside here, rather than as a separate
>  # task, so that we have a single fakeroot context for the whole process.
>  do_rootfs[umask] = "022"
>
> +
> +run_intercept_scriptlets () {
> +       if [ -d ${WORKDIR}/intercept_scripts ]; then
> +               cd ${WORKDIR}/intercept_scripts
> +               echo "Running intercept scripts:"
> +               for script in *; do
> +                       if [ "$script" = "*" ]; then break; fi
>

This is personal choice but I'd use:

if [ ... ]; then
    break
fi

or

[ ... ] && break

The if in a single line seems confusing to read for me.


> +                       echo "> Executing $script"
> +                       chmod +x $script
> +                       ./$script
> +               done
> +       fi
> +}
> +
>  fakeroot do_rootfs () {
>         #set -x
>         # When use the rpm incremental image generation, don't remove the
> rootfs
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

--e89a8ff253c4a2596504d0076c53
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 4, 2012 at 11:59 AM, Laurentiu Palcu <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@=
intel.com</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote">
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">This patch will allow the repeating postinst=
 scriptlets to be run<br>
only once, on host, at do_rootfs time. This will lower the time for<br>
rootfs generation and, also, instead of running some time consuming<br>
scriptlets at target&#39;s first boot, we will do on the host.<br>
<br>
Signed-off-by: Laurentiu Palcu &lt;<a href=3D"mailto:laurentiu.palcu@intel.=
com">laurentiu.palcu@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/image.bbclass | =A0 20 +++++++++++++++++---<br>
=A01 file changed, 17 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass<br>
index 7b24e4e..719d871 100644<br>
--- a/meta/classes/image.bbclass<br>
+++ b/meta/classes/image.bbclass<br>
@@ -156,7 +156,7 @@ inherit ${IMAGE_CLASSES}<br>
<br>
=A0IMAGE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
=A0MACHINE_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
-ROOTFS_POSTPROCESS_COMMAND ?=3D &quot;&quot;<br>
+ROOTFS_POSTPROCESS_COMMAND_prepend =3D &quot;run_intercept_scriptlets; &qu=
ot;<br>
<br>
=A0# some default locales<br>
=A0IMAGE_LINGUAS ?=3D &quot;de-de fr-fr en-gb&quot;<br>
@@ -166,15 +166,29 @@ LINGUAS_INSTALL ?=3D &quot;${@&quot; &quot;.join(map(=
lambda s: &quot;locale-base-%s&quot; % s, d.getVar(&#39;IM<br>
=A0PSEUDO_PASSWD =3D &quot;${IMAGE_ROOTFS}&quot;<br>
<br>
=A0do_rootfs[nostamp] =3D &quot;1&quot;<br>
-do_rootfs[dirs] =3D &quot;${TOPDIR}&quot;<br>
+do_rootfs[dirs] =3D &quot;${TOPDIR} ${WORKDIR}/intercept_scripts&quot;<br>
=A0do_rootfs[lockfiles] +=3D &quot;${IMAGE_ROOTFS}.lock&quot;<br>
-do_rootfs[cleandirs] +=3D &quot;${S}&quot;<br>
+do_rootfs[cleandirs] +=3D &quot;${S} ${WORKDIR}/intercept_scripts&quot;<br=
>
=A0do_build[nostamp] =3D &quot;1&quot;<br>
<br>
=A0# Must call real_do_rootfs() from inside here, rather than as a separate=
<br>
=A0# task, so that we have a single fakeroot context for the whole process.=
<br>
=A0do_rootfs[umask] =3D &quot;022&quot;<br>
<br>
+<br>
+run_intercept_scriptlets () {<br>
+ =A0 =A0 =A0 if [ -d ${WORKDIR}/intercept_scripts ]; then<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 cd ${WORKDIR}/intercept_scripts<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;Running intercept scripts:&quot;<b=
r>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 for script in *; do<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ &quot;$script&quot; =3D =
&quot;*&quot; ]; then break; fi<br></blockquote><div><br></div><div>This is=
 personal choice but I&#39;d use:</div><div><br></div><div>if [ ... ]; then=
</div><div>=A0 =A0 break</div>
<div>fi</div><div><br></div><div>or=A0</div><div><br></div><div>[ ... ] &am=
p;&amp; break</div><div><br></div><div>The if in a single line seems confus=
ing to read for me.</div><div>=A0<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo &quot;&gt; Executing $sc=
ript&quot;<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chmod +x $script<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ./$script<br>
+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 done<br>
+ =A0 =A0 =A0 fi<br>
+}<br>
+<br>
=A0fakeroot do_rootfs () {<br>
=A0 =A0 =A0 =A0 #set -x<br>
=A0 =A0 =A0 =A0 # When use the rpm incremental image generation, don&#39;t =
remove the rootfs<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.7.9.5<br>
<br>
<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r>Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0O.S. Systems<br>E-mail: <a href=3D"mailto:otavio@ossystems.com.br" targe=
t=3D"_blank">otavio@ossystems.com.br</a>=A0 <a href=3D"http://www.ossystems=
.com.br" target=3D"_blank">http://www.ossystems.com.br</a><br>
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0<a href=3D"http://pro=
jetos.ossystems.com.br" target=3D"_blank">http://projetos.ossystems.com.br<=
/a><br><br>
</div>

--e89a8ff253c4a2596504d0076c53--
