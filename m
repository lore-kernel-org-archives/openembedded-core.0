Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 892EA6AC00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 18:20:15 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 11:20:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; 
	d="asc'?scan'208,217";a="929588750"
Received: from afshjern.zpn.intel.com (HELO [10.219.16.250]) ([10.219.16.250])
	by fmsmga001.fm.intel.com with ESMTP; 22 Mar 2016 11:20:15 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
	<56F17581.70809@linux.intel.com>
	<CAJTo0LZv97ZB+x5t3toR=r00Dzcvy8jfpF0EzQZ7OZMhHqgQoQ@mail.gmail.com>
	<CAJTo0LaLRwcuY=-BJcRDUm9Y5Y_umixeq=Zm3NUL+2XTbBTxaw@mail.gmail.com>
From: Alex Franco <alejandro.franco@linux.intel.com>
Message-ID: <56F18D31.8020402@linux.intel.com>
Date: Tue, 22 Mar 2016 12:21:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaLRwcuY=-BJcRDUm9Y5Y_umixeq=Zm3NUL+2XTbBTxaw@mail.gmail.com>
Cc: Joshua G Lock <joshua.g.lock@intel.com>,
	Benjamin Esquivel <benjamin.esquivel@intel.com>,
	Andreas Schultz <aschultz@tpip.net>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nativesdk-buildtools-perl-dummy.bb: disable ICECC
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
X-List-Received-Date: Tue, 22 Mar 2016 18:20:17 -0000
X-Groupsio-MsgNum: 79971
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="o2Hv24hx4MusSCIONvLjc2gfnNrvEEAs6"

--o2Hv24hx4MusSCIONvLjc2gfnNrvEEAs6
Content-Type: multipart/mixed; boundary="W8TqF3Vx4cBO4OMafs2JEWSACW8BH33TO"
From: Alex Franco <alejandro.franco@linux.intel.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Joshua G Lock <joshua.g.lock@intel.com>,
 Benjamin Esquivel <benjamin.esquivel@intel.com>,
 Andreas Schultz <aschultz@tpip.net>
Message-ID: <56F18D31.8020402@linux.intel.com>
Subject: Re: [OE-core] [PATCH] nativesdk-buildtools-perl-dummy.bb: disable
 ICECC
References: <1458664665-20517-1-git-send-email-alejandro.franco@linux.intel.com>
 <56F17581.70809@linux.intel.com>
 <CAJTo0LZv97ZB+x5t3toR=r00Dzcvy8jfpF0EzQZ7OZMhHqgQoQ@mail.gmail.com>
 <CAJTo0LaLRwcuY=-BJcRDUm9Y5Y_umixeq=Zm3NUL+2XTbBTxaw@mail.gmail.com>
In-Reply-To: <CAJTo0LaLRwcuY=-BJcRDUm9Y5Y_umixeq=Zm3NUL+2XTbBTxaw@mail.gmail.com>

--W8TqF3Vx4cBO4OMafs2JEWSACW8BH33TO
Content-Type: multipart/alternative;
 boundary="------------050501020902070707030304"

--------------050501020902070707030304
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Ross, I suppose you mean " icc_is_allarch()" ?

Ok , so this recipe does inherit allarch but it is sort of nativesdk,
and when the test icc_is_allarch() checks for the value of
'PACKAGE_ARCH', it gets "buildtools-dummy-${SDKPKGSUFFIX}" (which should
expand to 'buildtools-dummy-nativesdk', but doesn't) instead of the
expected "all".

I am now modifying this test to check for an inherit of allarch, and
playing a bit with this. I'll keep you posted.

Other stuff to consider:

- Expand the value of PACKAGE_ARCH if necessary? I am doing it now as
part of my tests but not sure I will be committing this:

     package_arch =3D d.getVar("PACKAGE_ARCH", False)
     if '${' in package_arch:
         package_arch =3D d.expand(package_arch)
    ...

- All of these functions in the icecc.bbclass that incude "icc" in their
names, should probably be modified to say "icecc" instead. As it stands
now, it can cause confusion as some people might think we're talking
about the intel c compiler rather than the icecream compiler - I wonder
if there's a bug for this already

Alex Franco

On 03/22/2016 10:45 AM, Burton, Ross wrote:
>
> On 22 March 2016 at 16:41, Burton, Ross <ross.burton@intel.com
> <mailto:ross.burton@intel.com>> wrote:
>
>     Do we understand why this recipe breaks the icecc class?
>
>
> So I'm guessing it's because the architecture of the recipe is
> "special" - it's sort-of allarch and sort of nativesdk.
>
> I wonder if changing the icecc_is_allarch() test to check for inherit
> of allarch would fix this without working around the problem.
>
> Ross=20
>


--------------050501020902070707030304
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta content=3D"text/html; charset=3Dutf-8" http-equiv=3D"Content-Ty=
pe">
  </head>
  <body text=3D"#000000" bgcolor=3D"#FFFFFF">
    Ross, I suppose you mean "
    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3Dutf=
-8">
    icc_is_allarch()" ?<br>
    <br>
    Ok , so this recipe does inherit allarch but it is sort of
    nativesdk, and when the test icc_is_allarch() checks for the value
    of 'PACKAGE_ARCH', it gets "buildtools-dummy-${SDKPKGSUFFIX}" (which
    should expand to 'buildtools-dummy-nativesdk', but doesn't) instead
    of the expected "all".<br>
    <br>
    I am now modifying this test to check for an inherit of allarch, and
    playing a bit with this. I'll keep you posted.<br>
    <br>
    Other stuff to consider:<br>
    <br>
    - Expand the value of PACKAGE_ARCH if necessary? I am doing it now
    as part of my tests but not sure I will be committing this:<br>
    <br>
    =C2=A0=C2=A0=C2=A0=C2=A0 package_arch =3D d.getVar("PACKAGE_ARCH", Fa=
lse)<br>
    =C2=A0=C2=A0=C2=A0=C2=A0 if '${' in package_arch:<br>
    =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 package_arch =3D d.e=
xpand(package_arch)<br>
    =C2=A0=C2=A0=C2=A0 ...<br>
    <br>
    - All of these functions in the icecc.bbclass that incude "icc" in
    their names, should probably be modified to say "icecc" instead. As
    it stands now, it can cause confusion as some people might think
    we're talking about the intel c compiler rather than the icecream
    compiler - I wonder if there's a bug for this already<br>
    <br>
    Alex Franco<br>
    <br>
    <div class=3D"moz-cite-prefix">On 03/22/2016 10:45 AM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite=3D"mid:CAJTo0LaLRwcuY=3D-BJcRDUm9Y5Y_umixeq=3DZm3NUL+2XTbBTxaw@mail.=
gmail.com"
      type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra"><br>
          <div class=3D"gmail_quote">On 22 March 2016 at 16:41, Burton,
            Ross <span dir=3D"ltr">&lt;<a moz-do-not-send=3D"true"
                href=3D"mailto:ross.burton@intel.com" target=3D"_blank">r=
oss.burton@intel.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div class=3D"gmail_extra">Do we understand why this recipe=

                breaks the icecc class?</div>
            </blockquote>
            <div><br>
            </div>
            <div>So I'm guessing it's because the architecture of the
              recipe is "special" - it's sort-of allarch and sort of
              nativesdk.</div>
            <div><br>
            </div>
            <div>I wonder if changing the icecc_is_allarch() test to
              check for inherit of allarch would fix this without
              working around the problem.</div>
            <div><br>
            </div>
            <div>Ross=C2=A0</div>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------050501020902070707030304--

--W8TqF3Vx4cBO4OMafs2JEWSACW8BH33TO--

--o2Hv24hx4MusSCIONvLjc2gfnNrvEEAs6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBAgAGBQJW8Y0xAAoJEPR9uwMY2lTLOTAH/1ZPWNrNePlS87tfPy2xTHAj
OKPPKpLyyHj8aRhLG6GnWi3l9thhBueCZiqhs6I7gsKN55iOfatYCJI6RBViNL4H
zk/jpYxhwPCVAI62btTOjGAVMPCBIDt/qH0RvcDYu0gwG1tp+9veNO/Pg37XcP9v
iYd5ScjAjaCAU2ZBWnRaTiaMHi2v2enlijhmHlVrfnn5vUrBv9KuZ5PIZisoErS+
JObygt3FKlj+Flri06R3QpCUfFXf3E3x4dGD88i8tJNo5da59NphUulQmi9CK2GN
7KvyinkIFRuRTNv6Lm9Em28YE7H66Nx/MrZPbkfS+HvrPCgkOB89qL/3M2xF01s=
=YmgY
-----END PGP SIGNATURE-----

--o2Hv24hx4MusSCIONvLjc2gfnNrvEEAs6--
