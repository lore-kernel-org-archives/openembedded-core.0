Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id A5AC260017
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 20:53:45 +0000 (UTC)
Received: by pacex6 with SMTP id ex6so104364364pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 13:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=BsNu2hCnmkGcTsBXUHYJe8wXM9HqBQr65ZvgKIyi5Zg=;
	b=AUlGOtapajgKy59kuR+HjMpN7m+JUogF7m0R2W807VUtFTo9PPpe2y5Yo8jzCfzjGy
	0IwZx/WVCaMDNBN2di8uxDpRxqnl+4i5hAezLXGD/c2Lo6uO99Vcx8KNFVjqT47HyFbf
	2m7ZNppcKxJIaBGTUdc39Jxjc3l+BMiEcp/MqTheSELyePeEvEkt4WwbV/V8NkD0WG+i
	Xl30piZzRpmybWTrfTfpUIQk2tqR7/MxP3WeDkHGecS9ZK5J7x8eoO2j2V7YxSa3qHlF
	c8+iy4QP5a0dBKRXDjdCUcE1Ocv+BTw6eTxflPPkyeOC+s7CWRq/b1XgklAa5s8EdSpi
	Fe/Q==
X-Received: by 10.68.98.34 with SMTP id ef2mr49251585pbb.45.1441659225530;
	Mon, 07 Sep 2015 13:53:45 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:5:1a19:78e8:b08e?
	([2601:646:8601:4580:5:1a19:78e8:b08e])
	by smtp.gmail.com with ESMTPSA id cz1sm798017pdb.14.2015.09.07.13.53.43
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Sep 2015 13:53:44 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441654013.24871.259.camel@linuxfoundation.org>
Date: Mon, 7 Sep 2015 13:53:38 -0700
Message-Id: <4A72FD2B-1B79-4827-B02E-E3B23A966AE7@gmail.com>
References: <cover.1441552859.git.raj.khem@gmail.com>
	<1441654013.24871.259.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2104)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Systemd Upgrade
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
X-List-Received-Date: Mon, 07 Sep 2015 20:53:46 -0000
X-Groupsio-MsgNum: 70766
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CF3059C3-E7B9-439F-98B7-0F97974D89DC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CF3059C3-E7B9-439F-98B7-0F97974D89DC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Sep 7, 2015, at 12:26 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Sun, 2015-09-06 at 15:25 +0000, Khem Raj wrote:
>> Changes Since last time
>> - Now that 225 is out upgrade recipe to 225, changes between 224 and =
225 are minor
>>  but fixes in networkd are important
>> - Implement systemd-sysv-install for OE
>> - Enable getopt in busybox needed for systemd-sysv-install
>> - Remove update-rc.d from default uninstall list in rootfs creation
>> - Tested date and systemd unit tests manually to pass
>> - Booted core-image-cmdline-full on all qemu targets
>=20
> =
https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/buil=
ds/480
>=20
> The date test failed in two of the sanity runs with this series
> applied :(

I think this testcase needs revisiting. My manual runs of sequence of =
exact same commands on qemux86-64 and qemuarm64 succeeds all the time. I =
have built core-image-full-cmdline
One thing I wonder is if in AB case there might network time is =
configured and systemd-timesyncd/systemd-timedated syncs it back
immediately when its tempered with. I see this happening with =
systemd-219 as well when I have networkd and timesyncd started on =
another instance running on minnow ( without the proposed patchset)

and for systemd we should try to test timedatectl to manipulate date =
instead of date cmd e.g. timedatectl set-time =E2=80=9CYYYY-MM-DD =
HH:MM:SS=E2=80=9D

I will try to reproduce it on my end and see if I can get something to =
whats going on.



--Apple-Mail=_CF3059C3-E7B9-439F-98B7-0F97974D89DC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXt+VYACgkQuwUzVZGdMxQBigCeObL2b+gWOOyJxkv17mGuqu1V
/4QAn2tSQ1w36GJr6Y9lbbfAPRp2nm4C
=CrBw
-----END PGP SIGNATURE-----

--Apple-Mail=_CF3059C3-E7B9-439F-98B7-0F97974D89DC--
