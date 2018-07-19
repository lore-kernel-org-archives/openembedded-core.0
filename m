Return-Path: <betacentauri@arcor.de>
Received: from mx009.vodafonemail.xion.oxcs.net
	(mx009.vodafonemail.xion.oxcs.net [153.92.174.39])
	by mail.openembedded.org (Postfix) with ESMTP id 854867489E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:25:46 +0000 (UTC)
Received: from vsmx002.vodafonemail.xion.oxcs.net (unknown [192.168.75.192])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTP id 54DF5D9B1C0;
	Thu, 19 Jul 2018 16:25:42 +0000 (UTC)
Received: from null (app-38.app.xion.oxcs.net [10.10.1.38])
	by mta-6-out.mta.xion.oxcs.net (Postfix) with ESMTPA id 30E8E199C67;
	Thu, 19 Jul 2018 16:25:38 +0000 (UTC)
Date: Thu, 19 Jul 2018 18:25:37 +0200 (CEST)
From: betacentauri@arcor.de
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Message-ID: <828545568.7654.1532017538070@mail.vodafone.de>
In-Reply-To: <66fc8713-3bf4-add4-0026-dbd029c8fea2@gmail.com>
References: <1530811589-29601-1-git-send-email-betacentauri@arcor.de>
	<66fc8713-3bf4-add4-0026-dbd029c8fea2@gmail.com>
MIME-Version: 1.0
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev34
X-Originating-Client: com.openexchange.ox.gui.dhtml
X-VADE-STATUS: LEGIT
Subject: Re: [PATCH] libnss-mdns: Fix search path for avahi socket file
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
X-List-Received-Date: Thu, 19 Jul 2018 16:25:48 -0000
Content-Type: multipart/alternative; 
	boundary="----=_Part_7653_12669079.1532017538062"

------=_Part_7653_12669079.1532017538062
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There are several ways to fix it.

1. Patching Makefiles (see patch in the ticket: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12843)

2. Add localstatedir = "/"

3. Adding --localstatedir=${root_prefix} to EXTRA_OECONF

4. Don't fix it as /var/run should be a link to /run.


So what is the preferred solution?


> Khem Raj <raj.khem@gmail.com mailto:raj.khem@gmail.com > hat am 5. Juli 2018 um 19:48 geschrieben:
> 
> 
>     On 7/5/18 10:26 AM, Betacentauri wrote:
> 
>         > > Since v0.7 avahi uses /run/avahi-daemon/socket.
> >         libnss searches in $(localstatedir)/run/avahi-daemon/.
> >         Set localstatedir to / to fix mdns resolving.
> >         ---
> >         meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 2 ++
> >         1 file changed, 2 insertions(+)
> > 
> >         diff --git a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >         index 5be5e4f..d0eb276 100644
> >         --- a/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >         +++ b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10.bb
> >         @@ -17,6 +17,8 @@ SRC_URI[sha256sum] = "1e683c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d81
> > 
> >         S = "${WORKDIR}/nss-mdns-${PV}"
> > 
> >         +localstatedir = "/"
> >         +
> > 
> >     >     Adding --localstatedir=${root_prefix} to EXTRA_OECONF perhaps is better
>     for description.
> 
>         > > inherit autotools
> > 
> >         EXTRA_OECONF = "--libdir=${base_libdir} --disable-lynx --enable-avahi"
> > 
> >     > 

------=_Part_7653_12669079.1532017538062
MIME-Version: 1.0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html>
<html><head>
    <meta charset=3D"UTF-8">
</head><body><p>There are several ways to fix it.<br></p><p>1. Patching Mak=
efiles (see patch in the ticket: <a href=3D"https://bugzilla.yoctoproject.o=
rg/show_bug.cgi?id=3D12843)">https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D12843)</a><br></p><p>2. Add localstatedir =3D &#34;/&#34;<br></p><p>3=
. Adding --localstatedir=3D${root_prefix} to EXTRA_OECONF<br></p><p>4. Don&=
#39;t fix it as /var/run should be a link to /run.<br></p><p><br></p><p>So =
what is the preferred solution?<br></p><p><br></p><blockquote type=3D"cite"=
>Khem Raj &#60;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&#62; hat am 5. Juli 2018 um 19:48 geschrieben:<br><br><br>On 7/5/18 10:26 =
AM, Betacentauri wrote:<blockquote type=3D"cite">Since v0.7 avahi uses /run=
/avahi-daemon/socket.<br>libnss searches in $(localstatedir)/run/avahi-daem=
on/.<br>Set localstatedir to / to fix mdns resolving.<br>---<br> meta/recip=
es-connectivity/libnss-mdns/libnss-mdns_0.10.bb | 2 ++<br> 1 file changed, =
2 insertions(+)<br><br>diff --git a/meta/recipes-connectivity/libnss-mdns/l=
ibnss-mdns_0.10.bb b/meta/recipes-connectivity/libnss-mdns/libnss-mdns_0.10=
.bb<br>index 5be5e4f..d0eb276 100644<br>--- a/meta/recipes-connectivity/lib=
nss-mdns/libnss-mdns_0.10.bb<br>+++ b/meta/recipes-connectivity/libnss-mdns=
/libnss-mdns_0.10.bb<br>@@ -17,6 +17,8 @@ SRC_URI[sha256sum] =3D &#34;1e683=
c2e7c3921814706d62fbbd3e9cbf493a75fa00255e0e715508d81<br> <br> S =3D &#34;$=
{WORKDIR}/nss-mdns-${PV}&#34;<br> <br>+localstatedir =3D &#34;/&#34;<br>+</=
blockquote><br>Adding --localstatedir=3D${root_prefix} to EXTRA_OECONF perh=
aps is better<br>for description.<blockquote type=3D"cite">inherit autotool=
s<br> <br> EXTRA_OECONF =3D &#34;--libdir=3D${base_libdir} --disable-lynx -=
-enable-avahi&#34;</blockquote></blockquote></body></html>
=20

------=_Part_7653_12669079.1532017538062--
