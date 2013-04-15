Received: from mail-wg0-f53.google.com ([74.125.82.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1URjSH-0003S8-UD
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 15:28:23 +0200
Received: by mail-wg0-f53.google.com with SMTP id z11so802882wgg.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZQtGBABsmj2stG2iI/DudS6wLd+ra8B0XAcq8rDWSxw=;
	b=WBqPbU/lcq/mHIl29IY6EQuL+AhLWXWJXGA7iYfWzV59u/PvaN++iFpETaKe35qQeV
	dxgjRugFTTHZc2JQ2o/0TxYAXuWr5NJ7Gb4yBkt76bY2Wkn3yL1D8+PiOeLnWwoRT/bg
	yNlR/ZqnQJxxlgh8Up147jm1EH7thnCnooxxJzhH9aYd6iZlCIcUrhx11DFcL1D6x+Gm
	3uzWii4bFd3gkePIhD8RuSIX2Xg+Pi3T+TQPxaLG8s2BABUmXPWKaEXzV2Sq/5yCcGw5
	4A4+s2B1QSZeknvIYs2IbP78hI1zfskLHUurQHiQbe1NAXDBI6uOJTMJk2hF1nDlp19z
	410w==
X-Received: by 10.180.38.105 with SMTP id f9mr12035735wik.15.1366031453238;
	Mon, 15 Apr 2013 06:10:53 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id du2sm13473637wib.0.2013.04.15.06.10.51
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 06:10:52 -0700 (PDT)
Date: Mon, 15 Apr 2013 15:10:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Message-ID: <20130415131058.GB10628@jama.dyndns-home.com>
References: <CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
	<511D0669.6020903@communistcode.co.uk>
	<20130221222728.GA1833@sakrah.homelinux.org>
	<512738BF.9000404@communistcode.co.uk>
	<51277D87.3090703@communistcode.co.uk>
	<512785CE.5020508@communistcode.co.uk>
	<516BF98C.2080603@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <516BF98C.2080603@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 15 Apr 2013 13:28:25 -0000
X-Groupsio-MsgNum: 37944
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZfOjI3PrQbgiZnxM"
Content-Disposition: inline

--ZfOjI3PrQbgiZnxM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2013 at 01:58:52PM +0100, Jack Mitchell wrote:
> Ok, I have just come back to trying out the new systemd implementation,=
=20
> and this bug still exists.
>=20
> Exactly the same error as before:
>=20
> [    2.390730] systemd[1]: Failed to mount /run: No such file or directory
>=20
> Can we shed any light on why this directory is failing to be created and=
=20
> what can be done to fix it. Having looked in my final target filesystem=
=20
> there are no links to the volatiles in /var/voltatile/* to /*, should=20
> there be? The base-files packages looks like it should do it but=20
> obviously something is going wrong.
>=20
>    for d in ${volatiles}; do
>      ln -sf volatile/$d ${D}${localstatedir}/$d
>    done

We're using base-files bbappend to create it and also replacing few
symlinks to volatile with real directories (not mandatory for systemd
iirc, but useful in some cases).

https://github.com/shr-distribution/meta-smartphone/commit/24161eed3c185867=
b2fd91aab6532f370d327cdd

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ZfOjI3PrQbgiZnxM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFr/GIACgkQN1Ujt2V2gBzbaQCgoKLDr/vWk3OdOA3Gkha/JLdi
tKMAniMWL2OdXJTmDedOsEmchCY4Y3Cl
=dQ2I
-----END PGP SIGNATURE-----

--ZfOjI3PrQbgiZnxM--
