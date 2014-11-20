Return-Path: <jurobystricky@hotmail.com>
X-Greylist: delayed 301 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Nov 2014 19:04:15 UTC
Received: from BAY004-OMC2S14.hotmail.com (bay004-omc2s14.hotmail.com
	[65.54.190.89])
	by mail.openembedded.org (Postfix) with ESMTP id 59DE565C78
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 19:04:15 +0000 (UTC)
Received: from BAY179-W16 ([65.54.190.125]) by BAY004-OMC2S14.hotmail.com over
	TLS secured channel with Microsoft SMTPSVC(7.5.7601.22751); 
	Thu, 20 Nov 2014 10:59:14 -0800
X-TMN: [dtFTbiAwQpEknk7MqniyesCjd3tp7490]
X-Originating-Email: [jurobystricky@hotmail.com]
Message-ID: <BAY179-W1605EEB99827E586C23690BB760@phx.gbl>
From: Juro Bystricky <jurobystricky@hotmail.com>
To: Peter Seebach <peter.seebach@windriver.com>
Date: Thu, 20 Nov 2014 10:59:14 -0800
Importance: Normal
In-Reply-To: <20141119140933.4bef2a73@e6410-2>
References: <cover.1415390286.git.peter.seebach@windriver.com>,
	<d2ce73488a8afb7a8d10286da138810d30b4a4be.1415390286.git.peter.seebach@windriver.com>,
	<1415457765.2820.21.camel@linuxfoundation.org>,
	<1415703324.2820.37.camel@linuxfoundation.org>,
	<20141111122956.3e842de1@e6410-2>,
	<loom.20141119T185456-477@post.gmane.org>,
	<20141119140933.4bef2a73@e6410-2>
MIME-Version: 1.0
X-OriginalArrivalTime: 20 Nov 2014 18:59:14.0981 (UTC)
	FILETIME=[141E5D50:01D004F4]
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc-use-option-groups.patch: Several fixups
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
X-List-Received-Date: Thu, 20 Nov 2014 19:04:24 -0000
Content-Type: multipart/alternative;
	boundary="_548fde16-7faa-4bf8-98b0-86c997a1be28_"

--_548fde16-7faa-4bf8-98b0-86c997a1be28_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello Peter=2C=20
my concern is that if the file libc-symbols.h is patched like this:

#if defined(__OPTION_EGLIBC_LOCALE_CODE) && __OPTION_EGLIBC_LOCALE_CODE
# define HAVE_MBSTATE_T    1
# define HAVE_MBSRTOWCS    1
#endif

then it will be ALWAYS evaluated as: =20

#if 0
# define HAVE_MBSTATE_T    1
# define HAVE_MBSRTOWCS    1
#endif

because

#if defined __OPTION_EGLIBC_LOCALE_CODE

will always evaluate as 0.

To test this hypothesis=2C I actually build core-image-minimal with
an  explicit #error:

#if defined(__OPTION_EGLIBC_LOCALE_CODE) && __OPTION_EGLIBC_LOCALE_CODE
# error "I was wrong in my assumptions!!!"
# define HAVE_MBSTATE_T    1
# define HAVE_MBSRTOWCS    1
#endif

The image built fine=2C (Though I did not build/ran the glibc testsuite yet=
=2C nor did I try=20
to build tiny-poky).=20

I believe the purpose of this patching is simply to unconditionally prevent=
=20
suppport for mutibyte character handling if __OPTION_EGLIBC_LOCALE_CODE=3D0=
=20
If this is indeed the case=2C then the files posix/fnmatch.c and (possibly =
posix/fnmatch_loop.c
may need revised patching. ).

Juro


> Date: Wed=2C 19 Nov 2014 14:09:33 -0600
> From: peter.seebach@windriver.com
> To: jurobystricky@hotmail.com
> CC: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH 1/1] eglibc-use-option-groups.patch: Severa=
l fixups
>=20
> On Wed=2C 19 Nov 2014 17:59:49 +0000
> Juro Bystricky <jurobystricky@hotmail.com> wrote:
>=20
> > I am not sure why the HAVE_MBSTATE_T needs to be conditioned at all=2C =
my
> > understanding is
> > it is defined if the file <wchar.h> contains type definition "mbstate_t=
".
> > This typedef either exists or not and saying it not exists when in fact=
=20
> > it does might be confusing (as it already is for me) and I don't see an=
y=20
> > relation with __OPTION_EGLIBC_LOCALE_CODE.
>=20
> If it's not conditional=2C the build fails when the feature's not include=
d=2C
> because one of the test programs attempts to use it. It may be that somet=
hing
> else ought to be conditional to make that work. So it might be that your
> suggested change to fnmatch would fix poky-tiny as well.
>=20
> And you're right about the .out.
>=20
> -s
> --=20
> Listen=2C get this.  Nobody with a good compiler needs to be justified.
 		 	   		  =

--_548fde16-7faa-4bf8-98b0-86c997a1be28_
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
font-size: 12pt=3B
font-family:Calibri
}
--></style></head>
<body class=3D'hmmessage'><div dir=3D'ltr'>Hello Peter=2C <br>my concern is=
 that if the file libc-symbols.h is patched like this:<br><br>#if defined(_=
_OPTION_EGLIBC_LOCALE_CODE) &amp=3B&amp=3B __OPTION_EGLIBC_LOCALE_CODE<br>#=
 define HAVE_MBSTATE_T&nbsp=3B&nbsp=3B&nbsp=3B 1<br># define HAVE_MBSRTOWCS=
&nbsp=3B&nbsp=3B&nbsp=3B 1<br>#endif<br><br>then it will be ALWAYS evaluate=
d as:&nbsp=3B <br><br>#if 0<br># define HAVE_MBSTATE_T&nbsp=3B&nbsp=3B&nbsp=
=3B 1<br># define HAVE_MBSRTOWCS&nbsp=3B&nbsp=3B&nbsp=3B 1<br>#endif<br><br=
>because<br><br>#if defined __OPTION_EGLIBC_LOCALE_CODE<br><br>will always =
evaluate as 0.<br><br>To test this hypothesis=2C I actually build core-imag=
e-minimal with<br>an&nbsp=3B explicit #error:<br><br>#if defined(__OPTION_E=
GLIBC_LOCALE_CODE) &amp=3B&amp=3B __OPTION_EGLIBC_LOCALE_CODE<br># error "I=
 was wrong in my assumptions!!!"<br># define HAVE_MBSTATE_T&nbsp=3B&nbsp=3B=
&nbsp=3B 1<br># define HAVE_MBSRTOWCS&nbsp=3B&nbsp=3B&nbsp=3B 1<br>#endif<b=
r><br>The image built fine=2C (Though I did not build/ran the glibc testsui=
te yet=2C nor did I try <br>to build tiny-poky). <br><br>I believe the purp=
ose of this patching is simply to unconditionally prevent <br>suppport for =
mutibyte character handling if __OPTION_EGLIBC_LOCALE_CODE=3D0 <br>If this =
is indeed the case=2C then the files posix/fnmatch.c and (possibly posix/fn=
match_loop.c<br>may need revised patching. ).<br><br>Juro<br><br><br><div>&=
gt=3B Date: Wed=2C 19 Nov 2014 14:09:33 -0600<br>&gt=3B From: peter.seebach=
@windriver.com<br>&gt=3B To: jurobystricky@hotmail.com<br>&gt=3B CC: openem=
bedded-core@lists.openembedded.org<br>&gt=3B Subject: Re: [OE-core] [PATCH =
1/1] eglibc-use-option-groups.patch: Several fixups<br>&gt=3B <br>&gt=3B On=
 Wed=2C 19 Nov 2014 17:59:49 +0000<br>&gt=3B Juro Bystricky &lt=3Bjurobystr=
icky@hotmail.com&gt=3B wrote:<br>&gt=3B <br>&gt=3B &gt=3B I am not sure why=
 the HAVE_MBSTATE_T needs to be conditioned at all=2C my<br>&gt=3B &gt=3B u=
nderstanding is<br>&gt=3B &gt=3B it is defined if the file &lt=3Bwchar.h&gt=
=3B contains type definition "mbstate_t".<br>&gt=3B &gt=3B This typedef eit=
her exists or not and saying it not exists when in fact <br>&gt=3B &gt=3B i=
t does might be confusing (as it already is for me) and I don't see any <br=
>&gt=3B &gt=3B relation with __OPTION_EGLIBC_LOCALE_CODE.<br>&gt=3B <br>&gt=
=3B If it's not conditional=2C the build fails when the feature's not inclu=
ded=2C<br>&gt=3B because one of the test programs attempts to use it. It ma=
y be that something<br>&gt=3B else ought to be conditional to make that wor=
k. So it might be that your<br>&gt=3B suggested change to fnmatch would fix=
 poky-tiny as well.<br>&gt=3B <br>&gt=3B And you're right about the .out.<b=
r>&gt=3B <br>&gt=3B -s<br>&gt=3B -- <br>&gt=3B Listen=2C get this.  Nobody =
with a good compiler needs to be justified.<br></div> 		 	   		  </div></bo=
dy>
</html>=

--_548fde16-7faa-4bf8-98b0-86c997a1be28_--
