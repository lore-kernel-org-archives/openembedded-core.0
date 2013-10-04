Return-Path: <rich.tollerton@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 0A40460FA4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Oct 2013 16:26:20 +0000 (UTC)
Received: from US-AUS-MAIL4.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.14.5/8.14.5) with ESMTP id
	r94GPOOt004940; Fri, 4 Oct 2013 11:25:24 -0500
MIME-Version: 1.0
Importance: Normal
X-Priority: 3 (Normal)
In-Reply-To: <1380886416.18603.598.camel@ted>
References: <1380886416.18603.598.camel@ted>,
	<1380755881-17842-1-git-send-email-rich.tollerton@ni.com>
From: Rich Tollerton <rich.tollerton@ni.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <OF45A5E8ED.9A5B3596-ON86257BFA.005A3767-86257BFA.005A376A@ni.com>
Date: Fri, 4 Oct 2013 11:25:24 -0500
X-Mailer: Lotus Domino Web Server Release 8.5.3FP2 HF169 September 14, 2012
X-MIMETrack: Serialize by HTTP Server on US-AUS-MAIL4/AUS/M/NIC(Release
	8.5.3FP2 HF169|September 14, 2012) at 10/04/2013 11:25:24 AM,
	Serialize complete at 10/04/2013 11:25:24 AM,
	Itemize by HTTP Server on US-AUS-MAIL4/AUS/M/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/04/2013 11:25:24 AM,
	Serialize by Router on US-AUS-MAIL4/AUS/M/NIC(Release 8.5.3FP2
	HF169|September 14, 2012) at 10/04/2013 11:25:24 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:5.10.8794, 1.0.431,
	0.0.0000
	definitions=2013-10-04_02:2013-10-04, 2013-10-04,
	1970-01-01 signatures=0
Cc: paul.eggleton@linux.intel.com, Gratian Crisan <gratian.crisan@ni.com>,
	Ken Sharp <ken.sharp@ni.com>, openembedded-core@lists.openembedded.org
Subject: Re: [dylan, master][PATCH] populate_sdk_base: Fix relocate_sdk.py execution on Arch
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
X-List-Received-Date: Fri, 04 Oct 2013 16:26:21 -0000
Content-Type: multipart/alternative;
	boundary="=_alternative 005A376986257BFA_="

--=_alternative 005A376986257BFA_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=ISO-8859-1

D'oh! I checked master for changes to .sh generation but not the .py itself=
. My bad.

Change 175f20e2 (relocate=5Fsdk.py: make it work also with python 3) appear=
s to work fine.

---
Richard Tollerton <rich.tollerton@ni.com> (512)683-6346


-----Richard Purdie <richard.purdie@linuxfoundation.org> wrote: -----
To: Richard Tollerton <rich.tollerton@ni.com>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
Date: 10/04/2013 06:34AM
Cc: openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.com=
, gratian.crisan@ni.com, ken.sharp@ni.com
Subject: Re: [OE-core] [dylan, master][PATCH] populate=5Fsdk=5Fbase: Fix re=
locate=5Fsdk.py execution on Arch

On Wed, 2013-10-02 at 18:18 -0500, Richard Tollerton wrote:
> relocate=5Fsdk.py is #!/usr/bin/env python, but is not python3-compatible.
> The PEP 394 alias `python2` is sadly not universally supported, so
> instead of modifying relocate=5Fsdk.py directly, change the `exec` in
> relocate=5Fsdk.sh to use it if it exists.
>=20
> Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
> ---
> =A0meta/classes/populate=5Fsdk=5Fbase.bbclass | 3 ++-
> =A01 file changed, 2 insertions(+), 1 deletion(-)

Wasn't the script fixed in master to avoid this problem?

Cheers,

Richard

> diff --git a/meta/classes/populate=5Fsdk=5Fbase.bbclass b/meta/classes/po=
pulate=5Fsdk=5Fbase.bbclass
> index e5bc0b4..e67d8b6 100644
> --- a/meta/classes/populate=5Fsdk=5Fbase.bbclass
> +++ b/meta/classes/populate=5Fsdk=5Fbase.bbclass
> @@ -256,8 +256,9 @@ if [ x$tdir =3D x ] ; then
> =A0 =A0 echo "SDK relocate failed, could not create a temporary directory"
> =A0 =A0 exit 1
> =A0fi
> +python=5Fbin=3D"$(command -v python2 2>/dev/null)" || python=5Fbin=3Dpyt=
hon
> =A0echo "#!/bin/bash" > $tdir/relocate=5Fsdk.sh
> -echo exec ${env=5Fsetup=5Fscript%/*}/relocate=5Fsdk.py $target=5Fsdk=5Fd=
ir $dl=5Fpath $executable=5Ffiles >> $tdir/relocate=5Fsdk.sh
> +echo exec $python=5Fbin ${env=5Fsetup=5Fscript%/*}/relocate=5Fsdk.py $ta=
rget=5Fsdk=5Fdir $dl=5Fpath $executable=5Ffiles >> $tdir/relocate=5Fsdk.sh
> =A0$SUDO=5FEXEC mv $tdir/relocate=5Fsdk.sh ${env=5Fsetup=5Fscript%/*}/rel=
ocate=5Fsdk.sh
> =A0$SUDO=5FEXEC chmod 755 ${env=5Fsetup=5Fscript%/*}/relocate=5Fsdk.sh
> =A0rm -rf $tdir



--=_alternative 005A376986257BFA_=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1
Content-ID: <>

<font face=3D"Default Sans Serif,Verdana,Arial,Helvetica,sans-serif" size=
=3D"2"><div>D'oh! I checked master for changes to .sh generation but not th=
e .py itself. My bad.</div><div><br></div><div>Change 175f20e2 (relocate=5F=
sdk.py: make it work also with python 3) appears to work fine.</div><div><b=
r>---<br>Richard Tollerton &lt;rich.tollerton@ni.com&gt; (512)683-6346</div=
><br><br><font color=3D"#990099">-----Richard Purdie &lt;richard.purdie@lin=
uxfoundation.org&gt; wrote: -----</font><div style=3D"padding-left:5px;"><d=
iv style=3D"padding-right:0px;padding-left:5px;border-left:solid black 2px;=
">To: Richard Tollerton &lt;rich.tollerton@ni.com&gt;<br>From: Richard Purd=
ie &lt;richard.purdie@linuxfoundation.org&gt;<br>Date: 10/04/2013 06:34AM<b=
r>Cc: openembedded-core@lists.openembedded.org, paul.eggleton@linux.intel.c=
om, gratian.crisan@ni.com, ken.sharp@ni.com<br>Subject: Re: [OE-core] [dyla=
n, master][PATCH] populate=5Fsdk=5Fbase: Fix relocate=5Fsdk.py execution on=
 Arch<br><br><div><font face=3D"Courier New,Courier,monospace" size=3D"3">O=
n Wed, 2013-10-02 at 18:18 -0500, Richard Tollerton wrote:<br>&gt; relocate=
=5Fsdk.py is #!/usr/bin/env python, but is not python3-compatible.<br>&gt; =
The PEP 394 alias `python2` is sadly not universally supported, so<br>&gt; =
instead of modifying relocate=5Fsdk.py directly, change the `exec` in<br>&g=
t; relocate=5Fsdk.sh to use it if it exists.<br>&gt; <br>&gt; Signed-off-by=
: Richard Tollerton &lt;rich.tollerton@ni.com&gt;<br>&gt; ---<br>&gt; &nbsp=
;meta/classes/populate=5Fsdk=5Fbase.bbclass | 3 ++-<br>&gt; &nbsp;1 file ch=
anged, 2 insertions(+), 1 deletion(-)<br><br>Wasn't the script fixed in mas=
ter to avoid this problem?<br><br>Cheers,<br><br>Richard<br><br>&gt; diff -=
-git a/meta/classes/populate=5Fsdk=5Fbase.bbclass b/meta/classes/populate=
=5Fsdk=5Fbase.bbclass<br>&gt; index e5bc0b4..e67d8b6 100644<br>&gt; --- a/m=
eta/classes/populate=5Fsdk=5Fbase.bbclass<br>&gt; +++ b/meta/classes/popula=
te=5Fsdk=5Fbase.bbclass<br>&gt; @@ -256,8 +256,9 @@ if [ x$tdir =3D x ] ; t=
hen<br>&gt; &nbsp; &nbsp; echo "SDK relocate failed, could not create a tem=
porary directory"<br>&gt; &nbsp; &nbsp; exit 1<br>&gt; &nbsp;fi<br>&gt; +py=
thon=5Fbin=3D"$(command -v python2 2&gt;/dev/null)" || python=5Fbin=3Dpytho=
n<br>&gt; &nbsp;echo "#!/bin/bash" &gt; $tdir/relocate=5Fsdk.sh<br>&gt; -ec=
ho exec ${env=5Fsetup=5Fscript%/*}/relocate=5Fsdk.py $target=5Fsdk=5Fdir $d=
l=5Fpath $executable=5Ffiles &gt;&gt; $tdir/relocate=5Fsdk.sh<br>&gt; +echo=
 exec $python=5Fbin ${env=5Fsetup=5Fscript%/*}/relocate=5Fsdk.py $target=5F=
sdk=5Fdir $dl=5Fpath $executable=5Ffiles &gt;&gt; $tdir/relocate=5Fsdk.sh<b=
r>&gt; &nbsp;$SUDO=5FEXEC mv $tdir/relocate=5Fsdk.sh ${env=5Fsetup=5Fscript=
%/*}/relocate=5Fsdk.sh<br>&gt; &nbsp;$SUDO=5FEXEC chmod 755 ${env=5Fsetup=
=5Fscript%/*}/relocate=5Fsdk.sh<br>&gt; &nbsp;rm -rf $tdir<br><br><br></fon=
t></div></div></div></font>

--=_alternative 005A376986257BFA_=--
