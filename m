Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id A18396A5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 11:19:47 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t59so4625729wes.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 04:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=kGJmVpWRNCtpwEM0wOaYnsWLyg1VQ1r0JcF1lWskGvc=;
	b=0WyvRwoqi8+R9f1vaDpitUj2G3w9xhrzXxPVloPLcVSUSptyEgLrW/zPeSBt7sfoqZ
	n/wlMymVbjj+/ef3DLRQMpWS6l5ejIXXV3qNVyY91HgmaQT6ebFs8/2jJwHfHEo4nxaZ
	e+b3nwWGikK9dwmybTAP4adegRnBlV0hhatxww0szcieGYJAmpt33qyTJELx2bumppbF
	soa8CjDATib5S4vFSGY48V0Cyktwc16C8bxDWvqAoTk7kLA/2LMhlAwQEW8YUJVVj59J
	XsQouawVBWT6u5F7ZpMd4oS7Fekc+oEOY/gvLIzESeHFp9o6ZfF7FxyfEcc4/kNlHkez
	DaVg==
MIME-Version: 1.0
X-Received: by 10.194.80.39 with SMTP id o7mr5138081wjx.94.1370863188054; Mon,
	10 Jun 2013 04:19:48 -0700 (PDT)
Received: by 10.194.121.229 with HTTP; Mon, 10 Jun 2013 04:19:48 -0700 (PDT)
In-Reply-To: <2326207.iuBVrRrsbt@helios>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<2326207.iuBVrRrsbt@helios>
Date: Mon, 10 Jun 2013 12:19:48 +0100
Message-ID: <CABuzA3N_Bk0_AnC3sF4TDqk08F2h2LHcv3ChkWJi4iX=dCKT_g@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 11:19:48 -0000
Content-Type: multipart/alternative; boundary=047d7bb045c45c1a7304decaf5ba

--047d7bb045c45c1a7304decaf5ba
Content-Type: text/plain; charset=ISO-8859-1

Hi Paul,

Thanks for the reply.

The Qt application (qtui) is compiled and has some C++, some QML and needs
to use dbus. I am kicking it off via './qtui -qws'.

So basically if I had this -

IMAGE_INSTALL += " \
qt4-embedded \
qtui \
"

You suggest just cutting it down to

IMAGE_INSTALL += " \
qtui \
"
and it should work itself out ?

qtui.bb is -
I am not entirely sure on the 'inherit qt4e' line. If there are any glaring
errors here let me know. I'll kick off a build in the meantime.

SRC_URI = "git://${SOURCE_REPO}/git/${PN}.git;protocol=ssh;tag=${PV}"
LICENSE="CLOSED"
PROVIDES = "${PN}_${PV}"
DEPENDS = "qt4-embedded"
S = "${WORKDIR}/git"
RPROVIDES = "qtui_${PV}"
PACKAGES="${PN}"
FILES_${PN} += "/root/qtui /usr/share/reciva/qml/qtui
${sysconfdir}/dbus-1/system.d/"

inherit qt4e

do_compile() {
  cd ${S}
  ./rebuild
}

do_install() {
  install -d ${D}/usr/share/reciva/
  install -d ${D}/usr/share/reciva/qml/
  install -d ${D}/usr/share/reciva/qml/qtui/
  install -d ${D}/root/
  install -d ${D}/${sysconfdir}/
  install -d ${D}/${sysconfdir}/dbus-1/
  install -d ${D}/${sysconfdir}/dbus-1/system.d/

  install -m 0755 ${S}/qtui ${D}/root/
  install -m 0755 ${S}/qml/qtui/* ${D}/usr/share/reciva/qml/qtui/

  # So that qtui can use dbus system bus
  install -m 0644 ${S}/dbus_config/qtui.conf
${D}/${sysconfdir}/dbus-1/system.d/
}




On 10 June 2013 11:55, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> Hi John,
>
> On Monday 10 June 2013 11:31:26 John Stirling wrote:
> > I've successfully built qt4-embedded (oe-core, denzil, beaglebone) and
> have
> > got a Qt/QML application running (on a beaglebone)
> >
> > The image size is quite big however and I notice there a load of
> > examples/demos etc that I don't need on the filesystem.
> >
> > I presume I am probably just building the wrong thing ? Can someone
> advise
> > the recommended way to get Qt built without all the demos etc  ?
> >
> > This is what I added to our image -
> >
> > IMAGE_INSTALL += " \
> >   qt4-embedded \
> >   "
>
> It's not what you're building that's the problem, but the package you're
> selecting to go into the image. The "qt4-embedded" package will pull in
> all of
> the Qt/Embedded packages, which probably isn't what you want. Assuming
> your Qt
> application is compiled rather than pure QML, most of the time you can get
> away with only installing your Qt application - the Qt libraries that it
> uses
> will be installed automatically as dependencies. Then the only thing you
> will
> need to install as far as Qt is concerned are any plugins (database, image,
> etc.). You may also want qt4-embedded-qml-plugins and
> qt4-embedded-qmlviewer
> depending on how you start your application.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--047d7bb045c45c1a7304decaf5ba
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div>Hi Paul,</div><div><br></div><div>Thanks for the reply.</div><div><br>=
</div><div>The Qt application (qtui) is compiled and has some C++, some QML=
 and needs to use dbus. I am kicking it off via &#39;./qtui -qws&#39;.=A0</=
div>
<div><br></div><div>So basically if I had this -</div><div><br></div><div>I=
MAGE_INSTALL +=3D &quot; \<br>qt4-embedded \<br>qtui \<br>&quot;<br></div><=
div><br></div><div>You suggest just cutting it down to=A0</div><div><br></d=
iv>
<div><div>IMAGE_INSTALL +=3D &quot; \<br>qtui \<br>&quot;<br></div></div><d=
iv>and it should work itself out ?</div><div><br></div><div><a href=3D"http=
://qtui.bb">qtui.bb</a> is -</div><div>I am not entirely sure on the &#39;i=
nherit qt4e&#39; line. If there are any glaring errors here let me know. I&=
#39;ll kick off a build in the meantime.</div>
<div><br></div><div><div>SRC_URI =3D &quot;git://${SOURCE_REPO}/git/${PN}.g=
it;protocol=3Dssh;tag=3D${PV}&quot;</div><div>LICENSE=3D&quot;CLOSED&quot;<=
/div><div>PROVIDES =3D &quot;${PN}_${PV}&quot;</div><div>DEPENDS =3D &quot;=
qt4-embedded&quot;</div>
<div>S =3D &quot;${WORKDIR}/git&quot;</div><div>RPROVIDES =3D &quot;qtui_${=
PV}&quot;</div><div>PACKAGES=3D&quot;${PN}&quot;</div><div>FILES_${PN} +=3D=
 &quot;/root/qtui /usr/share/reciva/qml/qtui ${sysconfdir}/dbus-1/system.d/=
&quot;</div>
<div><br></div><div>inherit qt4e</div><div><br></div><div>do_compile() {</d=
iv><div>=A0 cd ${S}</div><div>=A0 ./rebuild</div><div>}</div><div><br></div=
><div>do_install() {</div><div>=A0 install -d ${D}/usr/share/reciva/</div><=
div>
=A0 install -d ${D}/usr/share/reciva/qml/</div><div>=A0 install -d ${D}/usr=
/share/reciva/qml/qtui/</div><div>=A0 install -d ${D}/root/</div><div>=A0 i=
nstall -d ${D}/${sysconfdir}/</div><div>=A0 install -d ${D}/${sysconfdir}/d=
bus-1/</div>
<div>=A0 install -d ${D}/${sysconfdir}/dbus-1/system.d/</div><div><br></div=
><div>=A0 install -m 0755 ${S}/qtui ${D}/root/</div><div>=A0 install -m 075=
5 ${S}/qml/qtui/* ${D}/usr/share/reciva/qml/qtui/</div><div><br></div><div>=
=A0 # So that qtui can use dbus system bus</div>
<div>=A0 install -m 0644 ${S}/dbus_config/qtui.conf ${D}/${sysconfdir}/dbus=
-1/system.d/</div><div>}</div></div><div><br></div><div><br></div><div><br>=
<br><div class=3D"gmail_quote">On 10 June 2013 11:55, Paul Eggleton <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_=
blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">Hi John,<br>
<div><div class=3D"h5"><br>
On Monday 10 June 2013 11:31:26 John Stirling wrote:<br>
&gt; I&#39;ve successfully built qt4-embedded (oe-core, denzil, beaglebone)=
 and have<br>
&gt; got a Qt/QML application running (on a beaglebone)<br>
&gt;<br>
&gt; The image size is quite big however and I notice there a load of<br>
&gt; examples/demos etc that I don&#39;t need on the filesystem.<br>
&gt;<br>
&gt; I presume I am probably just building the wrong thing ? Can someone ad=
vise<br>
&gt; the recommended way to get Qt built without all the demos etc =A0?<br>
&gt;<br>
&gt; This is what I added to our image -<br>
&gt;<br>
&gt; IMAGE_INSTALL +=3D &quot; \<br>
&gt; =A0 qt4-embedded \<br>
&gt; =A0 &quot;<br>
<br>
</div></div>It&#39;s not what you&#39;re building that&#39;s the problem, b=
ut the package you&#39;re<br>
selecting to go into the image. The &quot;qt4-embedded&quot; package will p=
ull in all of<br>
the Qt/Embedded packages, which probably isn&#39;t what you want. Assuming =
your Qt<br>
application is compiled rather than pure QML, most of the time you can get<=
br>
away with only installing your Qt application - the Qt libraries that it us=
es<br>
will be installed automatically as dependencies. Then the only thing you wi=
ll<br>
need to install as far as Qt is concerned are any plugins (database, image,=
<br>
etc.). You may also want qt4-embedded-qml-plugins and qt4-embedded-qmlviewe=
r<br>
depending on how you start your application.<br>
<br>
Cheers,<br>
Paul<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</font></span></blockquote></div><br></div>

--047d7bb045c45c1a7304decaf5ba--
