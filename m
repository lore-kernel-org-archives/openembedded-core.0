Return-Path: <matt.hoosier@gmail.com>
Received: from mail-vk0-f44.google.com (mail-vk0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id E4A606FF73
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 13:05:18 +0000 (UTC)
Received: by mail-vk0-f44.google.com with SMTP id y70so29170461vky.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Jul 2017 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=UX8ule2P2dXS+mfudmW07Ic6pE+PsCo0gPqQDnJ0kL4=;
	b=kX/fpIyPCG65c6hMFei+4ZRg1JZCx99x/MhRb+pHIJ2aEXU+A8tnalPZwDe5mRkIny
	dGk+O5Mbd+wFY9q1Pfn+dFPZUke1u32CsT3ZUrMb0msBG36Eilv6XJaLeRhqUTwLQAPO
	Ed378jhmctcII2Janjv2s4bVWxTup3rjj83AikEVhJmpYPixWnp7PRRNLS9GXGCc82oY
	PP5GVYYDyS4WgyPEzetCJN92OMTc6LVQyNMo8gKC0IrEXY4OwhPhX8IqaSrUEU4YXswq
	CH1whj8hYeLA47Vjij0e3K1aCY45P2Umpsz1oitEXJavXik2J5rsSwp1/WGl+gumBMUa
	xxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=UX8ule2P2dXS+mfudmW07Ic6pE+PsCo0gPqQDnJ0kL4=;
	b=F2s0q1O8LQCjnx5cf1KPgywEYftNB4TWGEPKjAbisDEeZAZqLAxl5aL3EwFhUjyNig
	agWTe2ZEWdjUfDiFYRH7ze0BGSVp5DhEZ1+UYCj4wk4kYxP4/+0jA1rMJvFhm/26uz/H
	qQ+9Ukkkv8DIgv/NJPHynZHMANIKvfjgtXEsbLKoIyKBweMdoDLnfaCtRBcB4S8ffgGX
	2FjLP3TNfctVv5lZW/i0qtuu8JcM0eEYYM4mq+971uiwISyZukyrjCOSOM464YvE4h2h
	EQG3kV25syP4jNwDZ4gdool3LEf9cxLU7yn6lTJMKKmNP/vmmVQrBi6bRQ9YuOWVz/7C
	u1NA==
X-Gm-Message-State: AIVw111HPXldXI8+xaKFf3RNFW6UBOTsZyXUHRzjJPSaJgxzQXAkcQEz
	Bq+5p2s3G1GI54BNdGEm8mOAyHxTWN3sfEU=
X-Received: by 10.31.153.66 with SMTP id b63mr2092079vke.44.1499951119571;
	Thu, 13 Jul 2017 06:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.2.109 with HTTP; Thu, 13 Jul 2017 06:04:39 -0700 (PDT)
From: Matt Hoosier <matt.hoosier@gmail.com>
Date: Thu, 13 Jul 2017 08:04:39 -0500
Message-ID: <CAJgxT38yLAW3eNk+5HMUid70WNMP_qCTfuKTW22Nthb73jgX1Q@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: akuster@mvista.com
Subject: Reasons for reverting "openssl: prevent ABI break from earlier krogoth releases" ?
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
X-List-Received-Date: Thu, 13 Jul 2017 13:05:19 -0000
Content-Type: multipart/alternative; boundary="001a1140f4eaa9a0610554329523"

--001a1140f4eaa9a0610554329523
Content-Type: text/plain; charset="UTF-8"

Back on the Krogoth branch, there was a changed applied briefly last year
to smooth over some symbol-versioning breakage that occurred when OpenSSL
got upgraded past version 1.0.2g:

    openssl: prevent ABI break from earlier krogoth releases

    The backported upgrade to 1.0.2h included an updated GNU LD
    version-script which results in an ABI change. In order to try and
    respect ABI for existing binaries built against fido this commit
    partially reverts the version-script to maintain the existing ABI
    and instead only add the new symbols required by 1.0.2h.

    Suggested-by: Martin Jansa <martin.jansa@gmail.com>
    (From OE-Core rev: 480db6b)

    Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
    Signed-off-by: Armin Kuster <akuster@mvista.com>
    Signed-off-by: Armin Kuster <akuster808@gmail.com>

However, it got reverted nearly immediately (in
08f85da10b3a7fc6165f163fd0f23784a2c9c8e4), but there wasn't much discussion
in the commit message about why the reversion happened.

I'm running into the same kinds of troubles that the original commit
message cited as justification for implementing backwards-compatibility
with the SSL symbols. Is there any memory about why the old
foo@OPENSSL_1.0.0 versioned symbols ultimately got dropped?

-Matt

--001a1140f4eaa9a0610554329523
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Back on the Krogoth branch, there was a changed applied br=
iefly last year to smooth over some symbol-versioning breakage that occurre=
d when OpenSSL got upgraded past version 1.0.2g:<div><br></div><div><div>=
=C2=A0 =C2=A0 openssl: prevent ABI break from earlier krogoth releases</div=
><div><br></div><div>=C2=A0 =C2=A0 The backported upgrade to 1.0.2h include=
d an updated GNU LD</div><div>=C2=A0 =C2=A0 version-script which results in=
 an ABI change. In order to try and</div><div>=C2=A0 =C2=A0 respect ABI for=
 existing binaries built against fido this commit</div><div>=C2=A0 =C2=A0 p=
artially reverts the version-script to maintain the existing ABI</div><div>=
=C2=A0 =C2=A0 and instead only add the new symbols required by 1.0.2h.</div=
><div><br></div><div>=C2=A0 =C2=A0 Suggested-by: Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt;</div><div=
>=C2=A0 =C2=A0 (From OE-Core rev: 480db6b)</div><div><br></div><div>=C2=A0 =
=C2=A0 Signed-off-by: Joshua Lock &lt;<a href=3D"mailto:joshua.g.lock@intel=
.com">joshua.g.lock@intel.com</a>&gt;</div><div>=C2=A0 =C2=A0 Signed-off-by=
: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">=
richard.purdie@linuxfoundation.org</a>&gt;</div><div>=C2=A0 =C2=A0 Signed-o=
ff-by: Armin Kuster &lt;<a href=3D"mailto:akuster@mvista.com">akuster@mvist=
a.com</a>&gt;</div><div>=C2=A0 =C2=A0 Signed-off-by: Armin Kuster &lt;<a hr=
ef=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt;</div><div><=
br></div><div>However, it got reverted nearly immediately (in 08f85da10b3a7=
fc6165f163fd0f23784a2c9c8e4), but there wasn&#39;t much discussion in the c=
ommit message about why the reversion happened.</div><div><br></div><div>I&=
#39;m running into the same kinds of troubles that the original commit mess=
age cited as justification for implementing backwards-compatibility with th=
e SSL symbols. Is there any memory about why the old foo@OPENSSL_1.0.0 vers=
ioned symbols ultimately got dropped?</div></div><div><br></div><div>-Matt<=
/div></div>

--001a1140f4eaa9a0610554329523--
