Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com
	[209.85.220.52])
	by mail.openembedded.org (Postfix) with ESMTP id F1EC76E64A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:55:47 +0000 (UTC)
Received: by mail-pa0-f52.google.com with SMTP id ur14so54818427pab.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=UKOU9M9YAiEf8CvuzwbirsgihFawAdDt6ak+NOWqh1E=;
	b=nYELlFvg22VDYur6lvZnz7Dw7Q7aOuDPdUB+nVGZ8olKJPgUwmkQ5nW0Gfc/+hHusa
	JYNbfkvO3zsbTsMsaXxeX2XiPs2O6WNcM0u6Wk3Z/SZ4xOSG7SitVQJw9jfgvp8C8c74
	IcehtXJtlkta+b7VJLtrnFQeP8DD/ORuf6muNct/Zuyo1BsZZchKMS8Fr5i2shp6+zkB
	XNtpBBz3YT+G5SI1ioQoQnZfcsKHA8npx4E0TOAR6tzqqkC6YcXZxIbmy9oZoXUSidDi
	bRN3qxT2MsPUKBWFdJtzxkqffPD8SgZKbo9z+Lh5ijYlHdPTi59BcQNp23ukceISGOiX
	/XHg==
X-Received: by 10.66.254.234 with SMTP id al10mr2561279pad.87.1450418147993;
	Thu, 17 Dec 2015 21:55:47 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:3df1:6e85:f350:aa60?
	([2601:646:8802:5d5c:3df1:6e85:f350:aa60])
	by smtp.gmail.com with ESMTPSA id
	26sm15006963pfn.61.2015.12.17.21.55.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 21:55:46 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJ86T=U3ELL1RsUw8+3UKjZ8mnRdg9eFgh13fkVKZMdpugs4dg@mail.gmail.com>
Date: Thu, 17 Dec 2015 21:55:42 -0800
Message-Id: <7F0B0F9B-D823-4933-9B1B-623E8F1B9BA3@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-3-git-send-email-armccurdy@gmail.com>
	<B851FF48-5C89-4537-A03D-DA4AA4C1AB73@gmail.com>
	<CAJ86T=U3ELL1RsUw8+3UKjZ8mnRdg9eFgh13fkVKZMdpugs4dg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4 v3] security_flags.inc: disable -fstack-protector-XXX for valgrind
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
X-List-Received-Date: Fri, 18 Dec 2015 05:55:48 -0000
X-Groupsio-MsgNum: 74971
Content-Type: multipart/signed;
	boundary="Apple-Mail=_17590DF3-ECCE-4F74-B4FE-D2EA8A859DD9";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_17590DF3-ECCE-4F74-B4FE-D2EA8A859DD9
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Dec 17, 2015, at 9:48 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>=20
> On Thu, Dec 17, 2015 at 9:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>=20
>>> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> =
wrote:
>>>=20
>>> Valgrind (v3.11.0) expects to build with stack protection disabled
>>> and includes -fno-stack-protector in its default CFLAGS. However, =
the
>>> CFLAGS provided by OE are included on the compiler command line =
after
>>> the defaults so any -fstack-protector-all / -fstack-protector-strong
>>> option provided by security_flags.inc will cause problems.
>>>=20
>>> | =
.../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgr=
ind-3.11.0/coregrind/m_mallocfree.c:892: undefined reference to =
`__stack_chk_guard'
>>> | =
.../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/valgr=
ind-3.11.0/coregrind/m_mallocfree.c:947: undefined reference to =
`__stack_chk_fail'
>>>=20
>>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>>> ---
>>> meta/conf/distro/include/security_flags.inc | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>=20
>>> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
>>> index 14ac0bf..1795750 100644
>>> --- a/meta/conf/distro/include/security_flags.inc
>>> +++ b/meta/conf/distro/include/security_flags.inc
>>> @@ -84,7 +84,7 @@ SECURITY_CFLAGS_pn-python-numpy =3D =
"${SECURITY_NO_PIE_CFLAGS}"
>>> SECURITY_CFLAGS_pn-python3 =3D "${SECURITY_NO_PIE_CFLAGS}"
>>> SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
>>> SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
>>> -SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
>>> +SECURITY_CFLAGS_pn-valgrind =3D =E2=80=9C"
>>=20
>> Can we instead add -lssp to LDFLAGS ?
>=20
> Probably. Valgrind deliberately adds -fno-stack-protector to it's own
> CFLAGS though, so by forcing it to use the stack protector you would
> be going against the wishes of the Valgrind developers.

I think you are right in this case.



--Apple-Mail=_17590DF3-ECCE-4F74-B4FE-D2EA8A859DD9
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzn+IACgkQuwUzVZGdMxR5jwCeMCWsEhLXLAxTJiUoaF4QvPPG
RO0An1/Xojj+HZVam3Mawj7WtKJEwfBT
=tgH3
-----END PGP SIGNATURE-----

--Apple-Mail=_17590DF3-ECCE-4F74-B4FE-D2EA8A859DD9--
