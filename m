Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id C1E9F6BA0D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 18:00:56 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id ur14so8510648igb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Mar 2014 11:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=G+eyC/g69ZRln4GHLEd7IaKoYsQM43ECnwvtzb+6274=;
	b=vkpm9giHBUUvQnxhvzI9IGBa2MqSjDxX5mkm2OREqGoIfTGiLTdOs8lk/I5MS12KYB
	hr31qazvVtJiP+jYkJNKpBZUQdX2KxjYGP56w0/58yi3ImMYQ4wcAMHJYRMPW84AC8JF
	tdlWs5MH+A04hT1DR3AWXJgoSI3JlyTeyrNQNN5QH1A7h1+WHkOh55TgnmLVArDkbNL4
	ew13+tru0ufRmLLicPsJDLt4ffaVOttVDPIK5s/zpHu4itJhWao1oRPBzJnbMDJPtnWy
	vwNSfiUVWYCiY8CmqkmMNCtrrGYfpg8MEoPuU/9hddx4BlbFNI2oc6+FlJV+fiqi7n5e
	iyZA==
X-Received: by 10.50.60.103 with SMTP id g7mr13320260igr.20.1395684057210;
	Mon, 24 Mar 2014 11:00:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Mon, 24 Mar 2014 11:00:27 -0700 (PDT)
In-Reply-To: <5330220F.8050504@dresearch-fe.de>
References: <5330220F.8050504@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Mar 2014 11:00:27 -0700
Message-ID: <CAMKF1sp1VXkkTVWEb-KU=G1c2J=KbNQ=53+iGR4TPT7WLWmfFQ@mail.gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: complex versioning scenario
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
X-List-Received-Date: Mon, 24 Mar 2014 18:00:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 24, 2014 at 5:16 AM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> We've a complex versioning scenario here which leads me to my limits. :(
>
> There are two recipes. One for a shared library and one for an applicatio=
n using this library.
>
> Both use GNU autotools (so they have internal version information). For c=
ontinuous integration purposes both use AUTOREV.
>
> At the moment the recipes look like this:
>
>
> ------------ libfoo_git.bb -------------
> PR =3D "r7"
> PE =3D "2"
> SRCREV=3D"${AUTOREV}"
> PV =3D "gitr${SRCPV}"
> ...
>
>
> ------------ app_git.bb ----------------
> DEPENDS =3D "... libfoo ..."
> PR =3D "r10"
> PE =3D "1"
> SRCREV=3D"${AUTOREV}"
> PV =3D "gitr${SRCPV}"
> ...
>
>
> Now we have the following problem. libfoo has some incompatible changes i=
n its interface (a new internal major version).
>

This is the key question here. what is this new interface doing, is it
breaking any API ?
if not then why bother if it does then use gnu versioning scheme and
create versioned symbols
for this interface and you can simplify the problem outside the build
system and your library
remains compatible with older app too.



> In my opinion this should find its represenation in the package versionin=
g in a way that the dependency checker can guarantee that the library and t=
he application package match each other.
>
> But how?
>
> Regards,
> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

