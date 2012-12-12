Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1Tilry-0001aD-7U
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 13:57:02 +0100
Received: by mail-la0-f47.google.com with SMTP id u2so525449lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 04:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nsKuwgqmbu76WJAbhGgEQ871w7KJmQB5eccmQcT7R7o=;
	b=W/SIYMtuiwUuI+TRQ4Ei+CRN/QKVXJTNn4AFRJJWRNoAcWyg3UbHNoNj03GZZ2MoEp
	erkgG78gkSZhSOHNrDypFEdCjXGPxpuvLJXnXDkZWfxk6Bw+rh6hIxeYzQ5vzF7gO19B
	Vf48op4SkmhOB+ComM5JObAm3iHgiLJoep3j3P3wvtIhJB6d/0Qv2WHYAiP7uvwmaDP2
	FN0Mb7bZ/sxrbm8ENtBA6qXORwkALkTJUI51J1I+00Lm1S03W/8yckwwytfikDCE7rrG
	p9pNo1tyR+0TYFDc8WG1rEiihzwqN0SoaR5ozG1juT/R8RYjtjjlybpj2090wi/kNE9k
	nhBw==
MIME-Version: 1.0
Received: by 10.112.46.199 with SMTP id x7mr390119lbm.109.1355316148748; Wed,
	12 Dec 2012 04:42:28 -0800 (PST)
Received: by 10.114.77.164 with HTTP; Wed, 12 Dec 2012 04:42:28 -0800 (PST)
In-Reply-To: <1355296117-6980-1-git-send-email-fahad_usman@mentor.com>
References: <1355296117-6980-1-git-send-email-fahad_usman@mentor.com>
Date: Wed, 12 Dec 2012 07:42:28 -0500
Message-ID: <CADkTA4OO6yh4rqRESBwFK1DLa_bRCw8=p8LicS2XQOG-0MRGVw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Fahad Usman <fahad_usman@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perf: kill -Werror
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
X-List-Received-Date: Wed, 12 Dec 2012 12:57:02 -0000
Content-Type: multipart/alternative; boundary=bcaec55405689ac13d04d0a7219c

--bcaec55405689ac13d04d0a7219c
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 12, 2012 at 2:08 AM, Fahad Usman <fahad_usman@mentor.com> wrote:

> this fails to build using a recent sourcery toolchain due to
> unused-but-set-variable
>
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>
> the patch was imported from meta-mentor layer on yoctoproject git server
> http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor as of commit ids
> 82e96b3baa1c64d03412871fce56d496a338f167 and
> ae325d011bd50501fe677c8b37295ae83030c526
>
> Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
> ---
>  meta/recipes-kernel/perf/perf_3.4.bb |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf_3.4.bbb/meta/recipes-kernel/perf/
> perf_3.4.bb
> index b094362..4e6d03d 100644
> --- a/meta/recipes-kernel/perf/perf_3.4.bb
> +++ b/meta/recipes-kernel/perf/perf_3.4.bb
> @@ -9,7 +9,7 @@ as well."
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"
>
> -PR = "r5"
> +PR = "r6"
>
>  require perf.inc
>
> @@ -79,6 +79,10 @@ do_install() {
>         fi
>  }
>
> +do_configure_prepend () {
> +    sed -i 's,-Werror ,,' ${S}/tools/perf/Makefile
> +}
>

Is this still an outstanding issue in the latest kernel with perf ?
I don't mean the removal of the -Werror, but the unused variable ?
I'm just trying to make sure that a patch is going upstream to the source,
so
we can eventually drop something like this from the perf build.

Cheers,

Bruce


> +
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>
>  FILES_${PN} += "${libexecdir}/perf-core"
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
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--bcaec55405689ac13d04d0a7219c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On Wed, D=
ec 12, 2012 at 2:08 AM, Fahad Usman <span dir=3D"ltr">&lt;<a href=3D"mailto=
:fahad_usman@mentor.com" target=3D"_blank">fahad_usman@mentor.com</a>&gt;</=
span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">this fails to build using a recent sourcery =
toolchain due to<br>
unused-but-set-variable<br>
<br>
Signed-off-by: Christopher Larson &lt;<a href=3D"mailto:chris_larson@mentor=
.com">chris_larson@mentor.com</a>&gt;<br>
<br>
the patch was imported from meta-mentor layer on yoctoproject git server<br=
>
<a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor" target=3D=
"_blank">http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor</a> as of co=
mmit ids<br>
82e96b3baa1c64d03412871fce56d496a338f167 and<br>
ae325d011bd50501fe677c8b37295ae83030c526<br>
<br>
Signed-off-by: Fahad Usman &lt;<a href=3D"mailto:fahad_usman@mentor.com">fa=
had_usman@mentor.com</a>&gt;<br>
---<br>
=A0meta/recipes-kernel/perf/<a href=3D"http://perf_3.4.bb" target=3D"_blank=
">perf_3.4.bb</a> | =A0 =A06 +++++-<br>
=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/perf/<a href=3D"http://perf_3.4.bb" target=
=3D"_blank">perf_3.4.bb</a> b/meta/recipes-kernel/perf/<a href=3D"http://pe=
rf_3.4.bb" target=3D"_blank">perf_3.4.bb</a><br>
index b094362..4e6d03d 100644<br>
--- a/meta/recipes-kernel/perf/<a href=3D"http://perf_3.4.bb" target=3D"_bl=
ank">perf_3.4.bb</a><br>
+++ b/meta/recipes-kernel/perf/<a href=3D"http://perf_3.4.bb" target=3D"_bl=
ank">perf_3.4.bb</a><br>
@@ -9,7 +9,7 @@ as well.&quot;<br>
=A0LICENSE =3D &quot;GPLv2&quot;<br>
=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dd7810fab7487fb0aad327b76=
f1be7cd7&quot;<br>
<br>
-PR =3D &quot;r5&quot;<br>
+PR =3D &quot;r6&quot;<br>
<br>
=A0require perf.inc<br>
<br>
@@ -79,6 +79,10 @@ do_install() {<br>
=A0 =A0 =A0 =A0 fi<br>
=A0}<br>
<br>
+do_configure_prepend () {<br>
+ =A0 =A0sed -i &#39;s,-Werror ,,&#39; ${S}/tools/perf/Makefile<br>
+}<br></blockquote><div><br></div><div>Is this still an outstanding issue i=
n the latest kernel with perf ?</div><div>I don&#39;t mean the removal of t=
he -Werror, but the unused variable ?</div><div>I&#39;m just trying to make=
 sure that a patch is going upstream to the source, so</div>
<div>we can eventually drop something like this from the perf build.</div><=
div><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div>=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">

+<br>
=A0PACKAGE_ARCH =3D &quot;${MACHINE_ARCH}&quot;<br>
<br>
=A0FILES_${PN} +=3D &quot;${libexecdir}/perf-core&quot;<br>
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
r>&quot;Thou shalt not follow the NULL pointer, for chaos and madness await=
 thee at its end&quot;<br>
</div>

--bcaec55405689ac13d04d0a7219c--
