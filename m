Received: from col0-omc3-s5.col0.hotmail.com ([65.55.34.143])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kyoonn@hotmail.com>) id 1S9kvC-0005Lk-Pi
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Mar 2012 23:19:23 +0100
Received: from COL120-W43 ([65.55.34.136]) by col0-omc3-s5.col0.hotmail.com
	with Microsoft SMTPSVC(6.0.3790.4675); 
	Mon, 19 Mar 2012 15:10:30 -0700
Message-ID: <COL120-W436E890CF0879C1F67450CDD420@phx.gbl>
X-Originating-IP: [70.137.142.215]
From: simran singh <kyoonn@hotmail.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Mar 2012 15:10:29 -0700
Importance: Normal
In-Reply-To: <B0098CE307294E64ABD9A4F359B2382D@gmail.com>
References: <COL120-W391CDA1CEF0C6CE16540C8DD420@phx.gbl> <,>
	<,>,<1332192150.9740.72.camel@ted>
	<,>,<COL120-W278115027639B2C6CC9F7BDD420@phx.gbl>
	<, >, <EBB81F82C91641E49DD69302B85DB8BF@gmail.com>,
	<COL120-W6346678F9768AEFEA35D5EDD420@phx.gbl>,
	<B0098CE307294E64ABD9A4F359B2382D@gmail.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 19 Mar 2012 22:10:30.0378 (UTC)
	FILETIME=[18D0FCA0:01CD061D]
Subject: Re: Linking two recipes
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
X-List-Received-Date: Mon, 19 Mar 2012 22:19:23 -0000
Content-Type: multipart/alternative;
	boundary="_ad07faf1-7b39-4f47-abad-b859c5ba6172_"

--_ad07faf1-7b39-4f47-abad-b859c5ba6172_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


This is how I was able to install it:
do_install(){       python configure.py --prefix=3D${D}/${libdir}/botan}
But still the other recipe is unable to locate the files.

Date: Mon=2C 19 Mar 2012 14:59:33 -0700
From: kergoth@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Linking two recipes


                All installs should be placed relative to ${D}. See one of =
the many other recipes that define do_install for examples :)

               =20
-- Christopher Larson

                =20
                On Monday=2C March 19=2C 2012 at 2:57 PM=2C simran singh wr=
ote:
               =20
                   =20



So install something along the lines:
do_install(){       python configure.py --prefix=3D${libdir}/botan}

When I do that=2C I get a permission denied error:mkdir: cannot create dire=
ctory /usr/lib/botan
Sorry I am still significantly new to open embedded and bitbake.
Thanks=2CSimran

Date: Mon=2C 19 Mar 2012 14:39:13 -0700
From: kergoth@gmail.com
To: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] Linking two recipes


                /usr/botan isn't a path that'll be placed into the sysroot=
=2C which is the standard mechanism by which files from dependencies are ac=
cessed (e.g. headers=2C shared libraries=2C native scripts). You should ins=
tall to more standard system locations.

               =20
-- Christopher Larson

                 =20
                On Monday=2C March 19=2C 2012 at 2:33 PM=2C simran singh wr=
ote:
                   =20




Hello Richard=2C
I did try the DEPENDS variable before but still doesnt solve the problem.A =
configure script in recipe B has to run a program that is built under ${D}/=
usr/botan by recipe A. Even if i pass the path to the configure script=2C i=
t is unable to find the script. ./configure --with-botan=3D............./us=
r/botanThanks.
Simran

> From: richard.purdie@linuxfoundation.org
> To: openembedded-core@lists.openembedded.org
> Date: Mon=2C 19 Mar 2012 21:22:30 +0000
> Subject: Re: [OE-core] Linking two recipes
>=20
> On Mon=2C 2012-03-19 at 13:59 -0700=2C simran singh wrote:
> > Hello=2C
> > I have recipes for two applications Recipe A and Recipe B. Recipe B
> > requires a lib.so file and init.h file which are installed by Recipe
> > A.
> > How do I acknowledge this dependency in Recipe B. I tried doing
> > do_stage() function in recipe A with no success. Please advice.
> > I am attaching the two recipes.
> > Thank you for any help.
>=20
> recipe B needs to do:
>=20
> DEPENDS +=3D "recipeA"
>=20
> Cheers=2C
>=20
> Richard
>=20
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
 		 	   		 =20
_______________________________________________Openembedded-core mailing li=
stOpenembedded-core@lists.openembedded.orghttp://lists.linuxtogo.org/cgi-bi=
n/mailman/listinfo/openembedded-core
                 =20
                 =20
                 =20
                 =20
               =20
                   =20

               =20
           =20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 		 	 =
  		 =20
_______________________________________________Openembedded-core mailing li=
stOpenembedded-core@lists.openembedded.orghttp://lists.linuxtogo.org/cgi-bi=
n/mailman/listinfo/openembedded-core
                =20
                =20
                =20
                =20
               =20
                =20
               =20
                   =20

               =20
           =20
_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core 		 	 =
  		  =

--_ad07faf1-7b39-4f47-abad-b859c5ba6172_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style><!--
.hmmessage P
{
margin:0px=3B
padding:0px
}
body.hmmessage
{
font-size: 10pt=3B
font-family:Tahoma
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>
This is how I was able to install it:<div><br></div><div><div>do_install(){=
</div><div>&nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3Bpython configure.py --prefix=
=3D${D}/${libdir}/botan</div><div>}<br></div></div><br class=3D"Apple-inter=
change-newline">But still the other recipe is unable to locate the files.<d=
iv><br></div><div><br><div><div id=3D"SkyDrivePlaceholder"></div><hr id=3D"=
stopSpelling">Date: Mon=2C 19 Mar 2012 14:59:33 -0700<br>From: kergoth@gmai=
l.com<br>To: openembedded-core@lists.openembedded.org<br>Subject: Re: [OE-c=
ore] Linking two recipes<br><br>
                <div style=3D"font-family:Helvetica=3Bfont-size:13px">All i=
nstalls should be placed relative to ${D}. See one of the many other recipe=
s that define do_install for examples :)<br></div>
                <div><div><br></div><div>--&nbsp=3B</div><div>Christopher L=
arson</div><div><br></div></div>
                =20
                <p style=3D"color:#A0A0A8">On Monday=2C March 19=2C 2012 at=
 2:57 PM=2C simran singh wrote:</p>
                <blockquote style=3D"border-left-style:solid=3Bborder-width=
:1px=3Bmargin-left:0px=3Bpadding-left:10px">
                    <span><div><div>


<div dir=3D"ltr">
So install something along the lines:<div><br></div><div>do_install(){</div=
><div>&nbsp=3B &nbsp=3B &nbsp=3B &nbsp=3Bpython configure.py --prefix=3D${l=
ibdir}/botan</div><div>}<br><br>When I do that=2C I get a permission denied=
 error:</div><div>mkdir: cannot create directory /usr/lib/botan</div><div><=
br></div><div>Sorry I am still significantly new to open embedded and bitba=
ke.</div><div><br></div><div>Thanks=2C</div><div>Simran<br><br><div><hr>Dat=
e: Mon=2C 19 Mar 2012 14:39:13 -0700<br>From: <a href=3D"mailto:kergoth@gma=
il.com">kergoth@gmail.com</a><br>To: <a href=3D"mailto:openembedded-core@li=
sts.openembedded.org">openembedded-core@lists.openembedded.org</a><br>Subje=
ct: Re: [OE-core] Linking two recipes<br><br>
                <div style=3D"font-family:Helvetica=3Bfont-size:13px">/usr/=
botan isn't a path that'll be placed into the sysroot=2C which is the stand=
ard mechanism by which files from dependencies are accessed (e.g. headers=
=2C shared libraries=2C native scripts). You should install to more standar=
d system locations.<br></div>
                <div><div><br></div><div>--&nbsp=3B</div><div>Christopher L=
arson</div><div><br></div></div>
                 =20
                <p style=3D"color:#A0A0A8">On Monday=2C March 19=2C 2012 at=
 2:33 PM=2C simran singh wrote:</p><blockquote><div>
                    <span><div><div>


<div dir=3D"ltr">

Hello Richard=2C<div><br></div><div>I did try the DEPENDS variable before b=
ut still doesnt solve the problem.</div><div>A configure script in recipe B=
 has to run a program that is built under ${D}/usr/botan by recipe A.&nbsp=
=3B</div><div>Even if i pass the path to the configure script=2C it is unab=
le to find the script. ./configure --with-botan=3D............./usr/botan</=
div><div>Thanks.</div><div><br></div><div>Simran</div><div><br><br><div>&gt=
=3B From: <a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.pur=
die@linuxfoundation.org</a><br>&gt=3B To: <a href=3D"mailto:openembedded-co=
re@lists.openembedded.org">openembedded-core@lists.openembedded.org</a><br>=
&gt=3B Date: Mon=2C 19 Mar 2012 21:22:30 +0000<br>&gt=3B Subject: Re: [OE-c=
ore] Linking two recipes<br>&gt=3B <br>&gt=3B On Mon=2C 2012-03-19 at 13:59=
 -0700=2C simran singh wrote:<br>&gt=3B &gt=3B Hello=2C<br>&gt=3B &gt=3B I =
have recipes for two applications Recipe A and Recipe B. Recipe B<br>&gt=3B=
 &gt=3B requires a lib.so file and init.h file which are installed by Recip=
e<br>&gt=3B &gt=3B A.<br>&gt=3B &gt=3B How do I acknowledge this dependency=
 in Recipe B. I tried doing<br>&gt=3B &gt=3B do_stage() function in recipe =
A with no success. Please advice.<br>&gt=3B &gt=3B I am attaching the two r=
ecipes.<br>&gt=3B &gt=3B Thank you for any help.<br>&gt=3B <br>&gt=3B recip=
e B needs to do:<br>&gt=3B <br>&gt=3B DEPENDS +=3D "recipeA"<br>&gt=3B <br>=
&gt=3B Cheers=2C<br>&gt=3B <br>&gt=3B Richard<br>&gt=3B <br>&gt=3B <br>&gt=
=3B <br>&gt=3B _______________________________________________<br>&gt=3B Op=
enembedded-core mailing list<br>&gt=3B <a href=3D"mailto:Openembedded-core@=
lists.openembedded.org">Openembedded-core@lists.openembedded.org</a><br>&gt=
=3B <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembe=
dded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/lis=
tinfo/openembedded-core</a><br></div></div> 		 	   		  </div>
</div><div><div>_______________________________________________</div><div>O=
penembedded-core mailing list</div><div><a href=3D"mailto:Openembedded-core=
@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></div>=
<div><a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a></div></div></div></span>
                 =20
                 =20
                 =20
                 =20
                </div></blockquote><div>
                    <br>
                </div>
            <br>_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
<a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded=
-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/listinf=
o/openembedded-core</a></div></div> 		 	   		  </div>
</div><div><div>_______________________________________________</div><div>O=
penembedded-core mailing list</div><div><a href=3D"mailto:Openembedded-core=
@lists.openembedded.org">Openembedded-core@lists.openembedded.org</a></div>=
<div><a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core" target=3D"_blank">http://lists.linuxtogo.org/cgi-bin/mailman/li=
stinfo/openembedded-core</a></div></div></div></span>
                =20
                =20
                =20
                =20
                </blockquote>
                =20
                <div>
                    <br>
                </div>
            <br>_______________________________________________
Openembedded-core mailing list
Openembedded-core@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core</div>=
</div> 		 	   		  </div></body>
</html>=

--_ad07faf1-7b39-4f47-abad-b859c5ba6172_--
