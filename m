Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id D2A686EFC3
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Mar 2014 03:29:02 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id uo5so2476690pbc.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Mar 2014 19:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=2+CjvOjVr27zrcXdxEt8y6+L0whHeONLFzWXpGDgrJg=;
	b=ELDZVjnnzECMDIDRP3AmLjVFd+5VEsiQ1uuDxWHg+ZdDKG8TBNMtnLpS2zyQHuIra8
	MR//mwiVrdgcLhRJd6T/l0slSTnXCfRp59xzYrPeD8Fw+0gyPg3vfQ3iHXdRlvwgrvUI
	sj/e2PjN6lCHRDUwFZOlqVLHZWXVt5HBDomm2ttx/UftLs+wyRXjk8RN2crHwin9+r6q
	TfXGKWHmvplaV84Y+8kpgVar+VhqNsM0Ouuy4hYbhQjFBqYHvDFo+zdRPxjGKbIEq6w/
	/SMphcAyVHpBTlkdy4egNpcRGsyZgzaPkHcmzWgm4zf6D4LBKm709MzDm1cZzn/LXFW6
	qXzQ==
X-Received: by 10.68.247.6 with SMTP id ya6mr16944015pbc.45.1393817343352;
	Sun, 02 Mar 2014 19:29:03 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id cz3sm30478402pbc.9.2014.03.02.19.29.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 02 Mar 2014 19:29:01 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5313F632.60207@windriver.com>
Date: Sun, 2 Mar 2014 19:29:00 -0800
Message-Id: <26065539-945D-4AB2-8AB3-797BB63B01D3@gmail.com>
References: <1393612134-15665-1-git-send-email-ross.burton@intel.com>
	<5313F632.60207@windriver.com>
To: Lu Chong <Chong.Lu@windriver.com>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ncurses: use ln -r to generate relative symlink
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
X-List-Received-Date: Mon, 03 Mar 2014 03:29:05 -0000
X-Groupsio-MsgNum: 50764
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9D0CB03E-2399-4DDA-BE5D-11D1B3924638";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9D0CB03E-2399-4DDA-BE5D-11D1B3924638
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Mar 2, 2014, at 7:25 PM, Lu Chong <Chong.Lu@windriver.com> wrote:

>=20
> On 03/01/2014 02:28 AM, Ross Burton wrote:
>> Instead of using a Python do_install() and calling
>> oe.path.make_relative_symlink, just pass -r to ln to generate a =
relative symlink
>> directly.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-core/ncurses/ncurses.inc |   10 ++--------
>>  1 file changed, 2 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/meta/recipes-core/ncurses/ncurses.inc =
b/meta/recipes-core/ncurses/ncurses.inc
>> index a94466a..835ecc3 100644
>> --- a/meta/recipes-core/ncurses/ncurses.inc
>> +++ b/meta/recipes-core/ncurses/ncurses.inc
>> @@ -147,12 +147,7 @@ _install_cfgs =3D "\
>>    PKG_CONFIG_LIBDIR=3D'${libdir}/pkgconfig' \
>>  "
>>  -python do_install () {
>> -    bb.build.exec_func("shell_do_install", d)
>> -    =
oe.path.make_relative_symlink(d.expand("${D}${libdir}/libtinfo.so"))
>> -}
>> -
>> -shell_do_install() {
>> +do_install() {
>>          # Order of installation is important; widec installs a =
'curses.h'
>>          # header with more definitions and must be installed last =
hence.
>>          # Compatibility of these headers will be checked in =
'do_test()'.
>> @@ -226,8 +221,7 @@ shell_do_install() {
>>                mv ${D}${libdir}/libtinfo.so.* ${D}${base_libdir}
>>              rm ${D}${libdir}/libtinfo.so
>> -            # We'll turn this into a relative symlink after =
do_install returns
>> -            ln -sf ${D}${base_libdir}/libtinfo.so.5 =
${D}${libdir}/libtinfo.so
>> +            ln -rsf ${D}${base_libdir}/libtinfo.so.5 =
${D}${libdir}/libtinfo.so
> Hi Ross,
>=20
> In Ubuntu 12.04, `ln' command doesn't have '-r' option.
> we will get following error during building ncurses
>    ln: invalid option -- =91r'


count debian in too.

>=20
> Best Regards
> Chong
>>          fi
>>            oe_multilib_header curses.h
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_9D0CB03E-2399-4DDA-BE5D-11D1B3924638
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMT9vwACgkQuwUzVZGdMxTvYQCgh7/cNxG3uz8MVD0v4omVWqHI
3jwAn1OyONSUNsrXLUw4Dwk49P93+UYl
=c+py
-----END PGP SIGNATURE-----

--Apple-Mail=_9D0CB03E-2399-4DDA-BE5D-11D1B3924638--
