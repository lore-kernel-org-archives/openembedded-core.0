Return-Path: <mgloff@emacinc.com>
Received: from mail-ig0-f173.google.com (mail-ig0-f173.google.com
	[209.85.213.173])
	by mail.openembedded.org (Postfix) with ESMTP id 108FE722AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 19:34:01 +0000 (UTC)
Received: by mail-ig0-f173.google.com with SMTP id r2so3150222igi.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 11:34:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=7+dsj1ClprjK0EU1RD1hNDJYWcY+TuUpi88rpeFM5Ek=;
	b=W/Qj2lSeA171F/4OX1LDkoMBNz106ADpTUHgKqRI4ZSYeCPogpYxqIVKorcMlTsoc2
	lOOt+rGf4LwaiAYnIk7J9cK0YDK2utM4jiAYNAzBh0UPyiCTVWuJ/Qpt04LkFAy4OILY
	yCeJOHbiKt5pHumTXJvgMu88llwdyDXi0X4UflYiqdkUirmaSEbQbIvEcaQI+En4sKOH
	/Dp+CtTtB+6qDGropmXZivc/4kBE8r+EgmurGZLOLMkwnXn6TuVezZFprmmgS+11nAR+
	SqvgzS+uO1/zoArIfbp6dFQ1gLwkSym9M0tmB5osiXUgx0VUR519PYDKHPxx5JY+ni9e
	Md5Q==
X-Gm-Message-State: ALoCoQntZRFOkI70bE7fuQHdZAds0wnyMA0Onlj4HD28VY0pKi8gS97sCpySxUqv3b7IXWSVaIru
MIME-Version: 1.0
X-Received: by 10.42.151.67 with SMTP id d3mr4282135icw.56.1418499241208; Sat,
	13 Dec 2014 11:34:01 -0800 (PST)
Received: by 10.107.47.41 with HTTP; Sat, 13 Dec 2014 11:34:01 -0800 (PST)
In-Reply-To: <20141213125415.GB4969@crash.betafive.co.uk>
References: <CANyK_8eZHwtww6AL7L5f34R5Nc7mhSQALaez1NCnHvmUpHWcXw@mail.gmail.com>
	<1417004047.12520.10.camel@linuxfoundation.org>
	<CANyK_8dxvZU8wnqFQGWL=DgFxOdgdq-yaaOkOJrR60w7_M6pfg@mail.gmail.com>
	<20141126151708.GA2460@jama>
	<20141213125415.GB4969@crash.betafive.co.uk>
Date: Sat, 13 Dec 2014 13:34:01 -0600
Message-ID: <CALXw4G6rgsO-qNyhqUtP45BY50C=rJxgLuQUn+UyDnHSHxm-1g@mail.gmail.com>
From: Michael Gloff <mgloff@emacinc.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: opkg, opkg-config-base and opkg-collateral
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
X-List-Received-Date: Sat, 13 Dec 2014 19:34:13 -0000
Content-Type: multipart/alternative; boundary=90e6ba6135706304fe050a1e1739

--90e6ba6135706304fe050a1e1739
Content-Type: text/plain; charset=UTF-8

Paul,
Thanks for looking into this further. I agree that poky-feed-config-opkg
does not work for anything other than a reference. I've resorted to
creating my own, but should be maybe even a part of the opkg recipe so as
not to disturb rpm/deb. Below is what I am using. arch.conf and
base-feeds.conf only really need all, architecture and machine.
FEEDURIPREFIX ?= "ftp://MYMACHINE"

do_compile() {
        mkdir -p ${S}/${sysconfdir}/opkg/

        ipkgarchs="all ${MACHINE_ARCH} ${PACKAGE_ARCH}"

        basefeedconf=${S}/${sysconfdir}/opkg/base-feeds.conf

        rm -f $basefeedconf
        touch $basefeedconf

        for arch in $ipkgarchs; do
                echo "src/gz $arch ${FEEDURIPREFIX}/$arch" >> $basefeedconf
        done
}


do_install () {
        install -d ${D}${sysconfdir}/opkg
        install -m 0644  ${S}/${sysconfdir}/opkg/* ${D}${sysconfdir}/opkg/
}

FILES_${PN} = "${sysconfdir}/opkg/ "

CONFFILES_${PN} += "${sysconfdir}/opkg/base-feeds.conf"

Michael Gloff

On Sat, Dec 13, 2014 at 6:54 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
>
> On Wed, Nov 26, 2014 at 04:17:08PM +0100, Martin Jansa wrote:
> > On Wed, Nov 26, 2014 at 01:50:38PM +0000, Paul Barker wrote:
> > >
> > > I'd keep three, but refactor them as I've described above:
> > > - opkg: Includes '/etc/opkg/opkg.conf'
> > > - opkg-arch-config: Includes '/etc/opkg/arch.conf', machine specific
> > > - opkg-feed-config: Includes '/etc/opkg/feeds.conf', distro and
> > > possibly machine specific
> >
> > Please also check
> >
> http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-core/meta/distro-feed-configs.bb
> >
> > + filtering the architectures
> >
> >
> https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-distro/recipes-core/meta/distro-feed-configs.bbappend
> >
> > + stricter filter for individual MACHINEs based on selected DEFAULTTUNE
> >
> >
> https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-distro/conf/distro/include/defaulttunes.inc
> >
>
> Thanks for the pointer Martin, I forgot to check outside oe-core. Also,
> sorry
> for the late reply, been rather busy recently!
>
> I suggest we drop poky-feed-config-opkg from oe-core as it isn't really
> usable
> as-is and the Yocto Project manual recommends using distro-feed-config
> anyway
> (
> http://www.yoctoproject.org/docs/1.7/mega-manual/mega-manual.html#runtime-package-management-build
> ).
>
> I still think the opkg and opkg-collateral recipes should be refactored as
> I
> proposed in my previous email. I'll try to throw together some RFC patches
> this
> week.
>
> We could also consider moving distro-feed-config to oe-core if it is the
> recommended way to setup opkg feeds. I do think that a unified way of
> configuring ipk/deb/rpm feeds would be good to have in the long term, but
> we can
> at least tidy up the opkg configuration for now.
>
> Thanks,
>
> --
> Paul Barker
>
> Email: paul@paulbarker.me.uk
> http://www.paulbarker.me.uk
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--90e6ba6135706304fe050a1e1739
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Paul,<br></div>Thanks for looking into this furt=
her. I agree that poky-feed-config-opkg does not work for anything other th=
an a reference. I&#39;ve resorted to creating my own, but should be maybe e=
ven a part of the opkg recipe so as not to disturb rpm/deb. Below is what I=
 am using. arch.conf and base-feeds.conf only really need all, architecture=
 and machine. <br>FEEDURIPREFIX ?=3D &quot;<a href=3D"ftp://MYMACHINE">ftp:=
//MYMACHINE</a>&quot;<br><br>do_compile() {<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 mkdir -p ${S}/${sysconfdir}/opkg/<br><br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 ipkgarchs=3D&quot;all ${MACHINE_ARCH} ${PACKAGE_AR=
CH}&quot;<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 basefeedconf=3D=
${S}/${sysconfdir}/opkg/base-feeds.conf<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 rm -f $basefeedconf<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 touch $basefeedconf<br><br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 for arch in $ipkgarchs; do<br>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo &quot;src/gz $arch=
 ${FEEDURIPREFIX}/$arch&quot; &gt;&gt; $basefeedconf<br>=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 done<br>}<br><br><br>do_install () {<br>=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -d ${D}${sysconfdir}/opkg<br>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 install -m 0644=C2=A0 ${S}/${syscon=
fdir}/opkg/* ${D}${sysconfdir}/opkg/<br>}<br><br>FILES_${PN} =3D &quot;${sy=
sconfdir}/opkg/ &quot;<br><br>CONFFILES_${PN} +=3D &quot;${sysconfdir}/opkg=
/base-feeds.conf&quot;<br><br></div>Michael Gloff<br></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Sat, Dec 13, 2014 at 6:54 AM, =
Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mailto:paul@paulbarker.me.uk" =
target=3D"_blank">paul@paulbarker.me.uk</a>&gt;</span> wrote:<blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex">On Wed, Nov 26, 2014 at 04:17:08PM +0100, Martin Jansa wro=
te:<br>
&gt; On Wed, Nov 26, 2014 at 01:50:38PM +0000, Paul Barker wrote:<br>
&gt; &gt;<br>
&gt; &gt; I&#39;d keep three, but refactor them as I&#39;ve described above=
:<br>
&gt; &gt; - opkg: Includes &#39;/etc/opkg/opkg.conf&#39;<br>
&gt; &gt; - opkg-arch-config: Includes &#39;/etc/opkg/arch.conf&#39;, machi=
ne specific<br>
&gt; &gt; - opkg-feed-config: Includes &#39;/etc/opkg/feeds.conf&#39;, dist=
ro and<br>
&gt; &gt; possibly machine specific<br>
&gt;<br>
&gt; Please also check<br>
&gt; <a href=3D"http://git.openembedded.org/meta-openembedded/tree/meta-oe/=
recipes-core/meta/distro-feed-configs.bb" target=3D"_blank">http://git.open=
embedded.org/meta-openembedded/tree/meta-oe/recipes-core/meta/distro-feed-c=
onfigs.bb</a><br>
&gt;<br>
&gt; + filtering the architectures<br>
&gt;<br>
&gt; <a href=3D"https://github.com/shr-distribution/meta-smartphone/blob/ma=
ster/meta-shr-distro/recipes-core/meta/distro-feed-configs.bbappend" target=
=3D"_blank">https://github.com/shr-distribution/meta-smartphone/blob/master=
/meta-shr-distro/recipes-core/meta/distro-feed-configs.bbappend</a><br>
&gt;<br>
&gt; + stricter filter for individual MACHINEs based on selected DEFAULTTUN=
E<br>
&gt;<br>
&gt; <a href=3D"https://github.com/shr-distribution/meta-smartphone/blob/ma=
ster/meta-shr-distro/conf/distro/include/defaulttunes.inc" target=3D"_blank=
">https://github.com/shr-distribution/meta-smartphone/blob/master/meta-shr-=
distro/conf/distro/include/defaulttunes.inc</a><br>
&gt;<br>
<br>
Thanks for the pointer Martin, I forgot to check outside oe-core. Also, sor=
ry<br>
for the late reply, been rather busy recently!<br>
<br>
I suggest we drop poky-feed-config-opkg from oe-core as it isn&#39;t really=
 usable<br>
as-is and the Yocto Project manual recommends using distro-feed-config anyw=
ay<br>
(<a href=3D"http://www.yoctoproject.org/docs/1.7/mega-manual/mega-manual.ht=
ml#runtime-package-management-build" target=3D"_blank">http://www.yoctoproj=
ect.org/docs/1.7/mega-manual/mega-manual.html#runtime-package-management-bu=
ild</a>).<br>
<br>
I still think the opkg and opkg-collateral recipes should be refactored as =
I<br>
proposed in my previous email. I&#39;ll try to throw together some RFC patc=
hes this<br>
week.<br>
<br>
We could also consider moving distro-feed-config to oe-core if it is the<br=
>
recommended way to setup opkg feeds. I do think that a unified way of<br>
configuring ipk/deb/rpm feeds would be good to have in the long term, but w=
e can<br>
at least tidy up the opkg configuration for now.<br>
<br>
Thanks,<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
Paul Barker<br>
<br>
Email: <a href=3D"mailto:paul@paulbarker.me.uk">paul@paulbarker.me.uk</a><b=
r>
<a href=3D"http://www.paulbarker.me.uk" target=3D"_blank">http://www.paulba=
rker.me.uk</a><br>
</font></span><br>--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" target=3D"_blank">http://lists.openembedded.org/mailman/listinfo/openembe=
dded-core</a><br>
<br></blockquote></div></div>

--90e6ba6135706304fe050a1e1739--
