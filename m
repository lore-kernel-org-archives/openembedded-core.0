Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SohcR-0001y8-9F
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 23:05:15 +0200
Received: by yhjj56 with SMTP id j56so479480yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 13:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=vRtwwaltCghEG2sp75fDCdy9DPVOoA3+pLiiusUkqWk=;
	b=NOzyO2taXTbTSxiiBVPacwmdYHchIuE/kt86Do0lJaUkdsQ8Zs4R69/GmgpX4c65nk
	s2AR2gykhbpn4Ld/fruEnkjilkAEHncJCDw1cy4kYQb6od5M2FIzgeZJqy19pB+CfoMo
	aXKGQUEF6vv2tw5PGbsVDlzsWzkqcowDgVLa52f44en4S+DRHpP3KGZkuk0TSiJDN+He
	R7fiH8xnQsLgsDgSyeyenWVctYwqV6OzQpSrl1SM4xwSMe2abyi8wdvsnY8D0kamL6Zk
	t74G7D8iXoLmyMakh+uGnY0Ac5Ou8eR8mUfW8X9huWZ3wBq13Kw9t5tNZMPwC+x596cU
	AlSA==
Received: by 10.50.159.196 with SMTP id xe4mr12555271igb.43.1341953643337;
	Tue, 10 Jul 2012 13:54:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.98.162 with HTTP; Tue, 10 Jul 2012 13:53:43 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <1341936154.1294.3.camel@ted>
References: <9403579097d0430a5ce2cd3bb23925fe25917a0b.1341932186.git.andrei@gherzan.ro>
	<d7e0c2813e4002b9dfd8e2d681b93da9ddc5870f.1341932186.git.andrei@gherzan.ro>
	<1341936154.1294.3.camel@ted>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 10 Jul 2012 23:53:43 +0300
Message-ID: <CAK18fxFDoHEpzDnVwJLdPHKL48Qo7ZuwnJsQDE78U6fbcULjKw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmzOn9UvznpSbyFa6GGtASYCZ6Rpka/LXKJdHKL2wHPa8sAttutLwNYGRxNvcqUc5gUe8b7
Subject: Re: [PATCH 5/5] busybox.inc: Install hwclock init script only if rtc is present in MACHINE_FEATURES
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Jul 2012 21:05:15 -0000
Content-Type: multipart/alternative; boundary=14dae934059b37595d04c47fee6c

--14dae934059b37595d04c47fee6c
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 10, 2012 at 7:02 PM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Tue, 2012-07-10 at 17:59 +0300, Andrei Gherzan wrote:
> > Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
> > ---
> >  meta/recipes-core/busybox/busybox.inc |   10 +++++++---
> >  1 file changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-core/busybox/busybox.inc
> b/meta/recipes-core/busybox/busybox.inc
> > index 82137a3..17ff442 100644
> > --- a/meta/recipes-core/busybox/busybox.inc
> > +++ b/meta/recipes-core/busybox/busybox.inc
> > @@ -180,9 +180,13 @@ do_install () {
> >       if grep "CONFIG_UDHCPD=y" ${WORKDIR}/defconfig; then
> >               install -m 0755 ${WORKDIR}/busybox-udhcpd
> ${D}${sysconfdir}/init.d/
> >       fi
> > -     if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> > -             install -m 0755 ${WORKDIR}/hwclock.sh
> ${D}${sysconfdir}/init.d/
> > -     fi
> > +     case "${MACHINE_FEATURES}" in
> > +     *rtc*)
> > +             if grep "CONFIG_HWCLOCK=y" ${WORKDIR}/defconfig; then
> > +                     install -m 0755 ${WORKDIR}/hwclock.sh
> ${D}${sysconfdir}/init.d/
> > +             fi
> > +             ;;
> > +     esac
> >       if grep "CONFIG_UDHCPC=y" ${WORKDIR}/defconfig; then
> >               install -d ${D}${sysconfdir}/udhcpc.d
> >               install -d ${D}${datadir}/udhcpc
>
> This makes busybox machine specific? Is that really what you want to do?
>
> I want to have hwclock init script only on machines with RTC.

@g

--14dae934059b37595d04c47fee6c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Tue, Jul 10, 2012 at 7:02 PM, Richard Purdie =
<span dir=3D"ltr">&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org"=
 target=3D"_blank">richard.purdie@linuxfoundation.org</a>&gt;</span> wrote:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">

<div class=3D"HOEnZb"><div class=3D"h5">On Tue, 2012-07-10 at 17:59 +0300, =
Andrei Gherzan wrote:<br>
&gt; Signed-off-by: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.ro"=
>andrei@gherzan.ro</a>&gt;<br>
&gt; ---<br>
&gt; =A0meta/recipes-core/busybox/busybox.inc | =A0 10 +++++++---<br>
&gt; =A01 file changed, 7 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core=
/busybox/busybox.inc<br>
&gt; index 82137a3..17ff442 100644<br>
&gt; --- a/meta/recipes-core/busybox/busybox.inc<br>
&gt; +++ b/meta/recipes-core/busybox/busybox.inc<br>
&gt; @@ -180,9 +180,13 @@ do_install () {<br>
&gt; =A0 =A0 =A0 if grep &quot;CONFIG_UDHCPD=3Dy&quot; ${WORKDIR}/defconfig=
; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/busybox-udhcpd =
${D}${sysconfdir}/init.d/<br>
&gt; =A0 =A0 =A0 fi<br>
&gt; - =A0 =A0 if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${WORKDIR}/defconfig;=
 then<br>
&gt; - =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/hwclock.sh ${D}${=
sysconfdir}/init.d/<br>
&gt; - =A0 =A0 fi<br>
&gt; + =A0 =A0 case &quot;${MACHINE_FEATURES}&quot; in<br>
&gt; + =A0 =A0 *rtc*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 if grep &quot;CONFIG_HWCLOCK=3Dy&quot; ${WOR=
KDIR}/defconfig; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0755 ${WORKDIR}/h=
wclock.sh ${D}${sysconfdir}/init.d/<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; + =A0 =A0 esac<br>
&gt; =A0 =A0 =A0 if grep &quot;CONFIG_UDHCPC=3Dy&quot; ${WORKDIR}/defconfig=
; then<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${sysconfdir}/udhcpc.d<br>
&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -d ${D}${datadir}/udhcpc<br>
<br>
</div></div>This makes busybox machine specific? Is that really what you wa=
nt to do?<br><br></blockquote><div>I want to have hwclock init script only =
on machines with RTC.</div><div><br></div><div>@g=A0</div></div>

--14dae934059b37595d04c47fee6c--
