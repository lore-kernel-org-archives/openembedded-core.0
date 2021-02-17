Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.9436.1613577020700561524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 07:50:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=FWoLF06l;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1613577021;
  x=1645113021;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=G5VavjCGhoinUZ8Ku4ewHVHtqi/qAEfnAZhein1I/Og=;
  b=FWoLF06lDm1gWoeUgwTAdMU2HA7Gzj/6wm6ZVn8MXT8EprW5+Kn+k1z9
   b48vxiwI0YPKQf5NYhxEBS9WthhGkI4LdLbOSf2IllV/ZFD1bEVcGbMFO
   R+frHNbtpQrCJNpzeDMJ9R26wW+Weo8WZ9ep6d3mOgYVB3HqP+MGuyIKu
   FNm7UGk+R0Y+y8JDn2hwrdPuTPWMX6cTFuinOMjLXq2v24vauUZKbcwTf
   Tw6+rE1l24BGwwGA/dnEFov4zVxi/t6iEg0rhwaZAouB2lFtNMUoRxs2q
   emWR1KCp4x0PLagY/LM7qj5iqhP99aCVOlHVYbpcWF/vuw3Jin5uMSzjw
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Meh Mbeh Ida Delphine <idadelm@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for improvements?
Thread-Topic: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for
 improvements?
Thread-Index: AQHXBOGUxLBegMtK10epLqNNiSX32Kpcfjvw
Date: Wed, 17 Feb 2021 15:50:03 +0000
Message-ID: <d2c6bc1c604946f799ea00ec68ee6209@XBOX03.axis.com>
References: <20210217040033.21541-1-idadelm@gmail.com>
In-Reply-To: <20210217040033.21541-1-idadelm@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I tried to apply these patches, but the context does not match. Are=20
there other patches I need to apply before these can be applied?

//Peter

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Meh Mbeh Ida Delphine
> Sent: den 17 februari 2021 05:00
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [poky-contrib][RFC PATCH 0/5] Suggestions for
> improvements?
>=20
> Hello everyone,
>=20
> The following patchset is aimed at improving the Yocto Project license
> tracing.
>=20
> Initially, after a build I will come across 130 license warnings with som=
e
> false positives. I got rid of these by replacing "or-later" with "+" for
> source licenses (computedpkglics) and also passing the recipe license
> through canonical_license of license.py(). As a result, some of the
> licenses will match during comparism hence some warnings eliminate.
>=20
> Though some false positive warnings were eliminated, lots of warnings wer=
e
> ouputed as a result of several source licenses having "WITH Linux-syscall=
-
> note". With the help of a variable being set in local.conf, one can
> chooses whether or not to get lid of the "WITH Linux-syscall-note" string
> from the source licenses. Just by doing this, several warnings are droppe=
d
> and now left with 118.
>=20
> I later on added some logic depending on "source_spdx_license" variable
> whether or not for the user to allow the warnings being outputed during
> the build. It reduces the extra processing and reduces time if the user
> chooses not to display warnings. It uses bb.utils.contains() to find out
> if that particular vaiable is present. Also, I added
> package_qa_handle_error() to allow the user decide whether they want the
> issues treated as warnings, errors or not at all.
>=20
> Some of the license-related logic I added to take care of splitting recip=
e
> licences before canonicalizing, getting rid of "or-later" warnings, I
> moved it to license.bbclass and put it in functions. I also plan on fixin=
g
> the variable naming since some have underscores whereas others do not
> have. However, I will love to move more license logic in package.bbclass
> to license.bbclass but I need help with the right way to go about it.
> Also, general suggestions on any improvements to this are highly welcomed=
.
>=20
> Cheers,
> Ida.
>=20
> Ida Delphine (5):
>   package: Remove false positive lic warnings
>   package: Remove false positive lic warnings
>   package: Remove false positive lic warnings
>   license.bbclass: Add functions to split and canonicalise license
>     strings
>   package.bbclass: Remove false positive license warnings
>=20
>  meta/classes/license.bbclass |  27 ++++++++
>  meta/classes/package.bbclass | 127 +++++++++++++++++++----------------
>  2 files changed, 96 insertions(+), 58 deletions(-)
>=20
> --
> 2.25.1

