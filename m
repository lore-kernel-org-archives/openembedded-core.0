Return-Path: <jatedev@gmail.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 00BFA65CC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:39:01 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id m20so1045775qcx.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ff2CAdg1TNTONoVdY2QZgALs6Gi0IWkMHXuASNZm4TY=;
	b=farW+hOYmuGw9gpRFnRL24P6Hq1DEBezY846W673J4cc6kpb7bHQB3mM6ksax8IW4c
	SzelUFt5bHq4mfQAbd5Z57a84ApW6muLtFk42O0+giXKopickjL9n7p0uhf6ME6Kowba
	zfOb0wXj/JqRBwx3nP24ek7M/2u+MVZ1zYkP7Axcs6OvEyxkD3Xy/jGzxhmaT+qoWe+m
	OdqoF4gq70NesEVVVR7uBFgauP54YAHtU9MqeXPrU/hfhfX8QIB550vxj8RvH0W5uzFw
	IOP94U5tAFwf2NoB6F2xhe/MQGmUCucR0VBKTJ+ZjZIw6MFl6Eu1rHEAICohH6nCCuoa
	D3zQ==
MIME-Version: 1.0
X-Received: by 10.229.211.132 with SMTP id go4mr58296546qcb.0.1407717542439;
	Sun, 10 Aug 2014 17:39:02 -0700 (PDT)
Received: by 10.140.34.76 with HTTP; Sun, 10 Aug 2014 17:39:02 -0700 (PDT)
In-Reply-To: <CAPphmgbm851LepCazfd6mjYQZdOgAgqo=6jCxt5xP1-2Vrz-Ag@mail.gmail.com>
References: <1403533002-1118-1-git-send-email-jatedev@gmail.com>
	<CAPphmgbm851LepCazfd6mjYQZdOgAgqo=6jCxt5xP1-2Vrz-Ag@mail.gmail.com>
Date: Sun, 10 Aug 2014 20:39:02 -0400
Message-ID: <CAPphmgZxCxNfysb8R7xS4OXu4DLWQXyrVQ1GdcKXPPXPt24iVQ@mail.gmail.com>
From: Jate S <jatedev@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Install list-records with resolvconf package
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
X-List-Received-Date: Mon, 11 Aug 2014 00:39:02 -0000
Content-Type: multipart/alternative; boundary=001a113439960fb1bd05004fc8e6

--001a113439960fb1bd05004fc8e6
Content-Type: text/plain; charset=UTF-8

I am following up on this patch.

On Mon, Jun 23, 2014 at 11:07 AM, Jate S <jatedev@gmail.com> wrote:
> From: Jate Sujjavanich <jatedev@gmail.com>
> Date: Mon, Jun 23, 2014 at 10:16 AM
> Subject: [PATCH] Install list-records with resolvconf package
> To: openembedded-devel@lists.openembedded.org, sgw@linux.intel.com
> Cc: Jate Sujjavanich <jatedev@gmail.com>
>
>
> The resolvconf script uses /lib/resolvconf/list-records, but the recipe
> does not install it. This causes an error when /etc/resolvconf/update.d
> runs.
>
> Signed-off-by: Jate Sujjavanich <jatedev@gmail.com>
> ---
>  .../resolvconf/resolvconf_1.75.bb                  |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> index 7310c83..77eac7a 100644
> --- a/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> +++ b/meta/recipes-connectivity/resolvconf/resolvconf_1.75.bb
> @@ -40,8 +40,14 @@ do_install () {
>         install -m 0755 bin/resolvconf ${D}${base_sbindir}/
>         install -m 0644 README ${D}${docdir}/${P}/
>         install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/
> +
> +       # resolvconf requires /lib/resolvconf/list-records
> +       install -d ${D}${base_libdir}/${BPN}
> +       install -m 0755 ${S}/bin/list-records ${D}${base_libdir}/${BPN}
>  }
>
> +FILES_${PN} += "/lib/resolvconf/"
> +
>  pkg_postinst_${PN} () {
>         if [ -z "$D" ]; then
>                 if command -v systemd-tmpfiles >/dev/null; then
> --
> 1.7.9.5

--001a113439960fb1bd05004fc8e6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I am following up on this patch.<br></div><div><br>On=
 Mon, Jun 23, 2014 at 11:07 AM, Jate S &lt;<a href=3D"mailto:jatedev@gmail.=
com">jatedev@gmail.com</a>&gt; wrote:<br></div>&gt; From: Jate Sujjavanich =
&lt;<a href=3D"mailto:jatedev@gmail.com">jatedev@gmail.com</a>&gt;<br>
&gt; Date: Mon, Jun 23, 2014 at 10:16 AM<br>&gt; Subject: [PATCH] Install l=
ist-records with resolvconf package<br>&gt; To: <a href=3D"mailto:openembed=
ded-devel@lists.openembedded.org">openembedded-devel@lists.openembedded.org=
</a>, <a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</a><br>
&gt; Cc: Jate Sujjavanich &lt;<a href=3D"mailto:jatedev@gmail.com">jatedev@=
gmail.com</a>&gt;<br>&gt;<br>&gt;<br>&gt; The resolvconf script uses /lib/r=
esolvconf/list-records, but the recipe<br>&gt; does not install it. This ca=
uses an error when /etc/resolvconf/update.d<br>
&gt; runs.<br>&gt;<br>&gt; Signed-off-by: Jate Sujjavanich &lt;<a href=3D"m=
ailto:jatedev@gmail.com">jatedev@gmail.com</a>&gt;<br>&gt; ---<br>&gt; =C2=
=A0.../resolvconf/<a href=3D"http://resolvconf_1.75.bb">resolvconf_1.75.bb<=
/a> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =
=C2=A06 ++++++<br>
&gt; =C2=A01 file changed, 6 insertions(+)<br>&gt;<br>&gt; diff --git a/met=
a/recipes-connectivity/resolvconf/<a href=3D"http://resolvconf_1.75.bb">res=
olvconf_1.75.bb</a><br>&gt; b/meta/recipes-connectivity/resolvconf/<a href=
=3D"http://resolvconf_1.75.bb">resolvconf_1.75.bb</a><br>
&gt; index 7310c83..77eac7a 100644<br>&gt; --- a/meta/recipes-connectivity/=
resolvconf/<a href=3D"http://resolvconf_1.75.bb">resolvconf_1.75.bb</a><br>=
&gt; +++ b/meta/recipes-connectivity/resolvconf/<a href=3D"http://resolvcon=
f_1.75.bb">resolvconf_1.75.bb</a><br>
&gt; @@ -40,8 +40,14 @@ do_install () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 install -m 0755 bin/resolvconf ${D}${base_sbindir}/<br>&gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 install -m 0644 README ${D}${docdir}/${P}/<br>&gt; =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 install -m 0644 man/resolvconf.8 ${D}${mandir}/man8/<br>
&gt; +<br>&gt; + =C2=A0 =C2=A0 =C2=A0 # resolvconf requires /lib/resolvconf=
/list-records<br>&gt; + =C2=A0 =C2=A0 =C2=A0 install -d ${D}${base_libdir}/=
${BPN}<br>&gt; + =C2=A0 =C2=A0 =C2=A0 install -m 0755 ${S}/bin/list-records=
 ${D}${base_libdir}/${BPN}<br>&gt; =C2=A0}<br>
&gt;<br>&gt; +FILES_${PN} +=3D &quot;/lib/resolvconf/&quot;<br>&gt; +<br>&g=
t; =C2=A0pkg_postinst_${PN} () {<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -=
z &quot;$D&quot; ]; then<br>&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if command -v systemd-tmpfiles &gt;/dev/null; then<br>
&gt; --<br>&gt; 1.7.9.5<br><br></div>

--001a113439960fb1bd05004fc8e6--
