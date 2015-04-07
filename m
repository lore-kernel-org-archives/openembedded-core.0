Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id E01B173C89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 22:02:36 +0000 (UTC)
Received: by pddn5 with SMTP id n5so92506864pdd.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Apr 2015 15:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=nQOhEkQdiYBAWW3PrphT4/MQUoNDkZx91BTPGnlPP1E=;
	b=l+PwQA9zzbhG+jmIUrivvakWDdF/1VjcDGnbvO1jCzT4cXA+oPedDB78GLNr29Xx7O
	3uxabD2x8aFOFNUqc+jsSjcRg5jKy5nUZp7F6tsoB2csWakXP0w/A20xyY3CXRfDKV95
	/JMpx2Lz2mh67mFfSxiQ1IwpcO/myP+cfxl4p6gRlKNaqcyVZ/DRUMQrKQYaE02uQzv4
	O4GwRjWQR5/7xkz/0ikyLzxrlMjMnxflGB/PKMVO6yzWfm6KAb9LmyBFIUuVzM46gt3s
	dE1G/fhfdmoGhWlfG1hyKMj9s9b4O89P94ieOGoyRsoPdgaJ4atYCJ29O0WSYIdoOdjL
	QlvQ==
X-Received: by 10.70.44.76 with SMTP id c12mr40840540pdm.49.1428444157658;
	Tue, 07 Apr 2015 15:02:37 -0700 (PDT)
Received: from ?IPv6:2601:9:500:ece:6173:5e9d:a616:6d78?
	([2601:9:500:ece:6173:5e9d:a616:6d78])
	by mx.google.com with ESMTPSA id pb2sm9109758pdb.33.2015.04.07.15.02.36
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 07 Apr 2015 15:02:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428443770.14020.483.camel@linuxfoundation.org>
Date: Tue, 7 Apr 2015 15:02:35 -0700
Message-Id: <9784A816-8575-4934-8ED6-EB4D2105D367@gmail.com>
References: <1428418272.14020.467.camel@linuxfoundation.org>
	<F8FD5455-119C-4814-8871-320AF0E7B72F@gmail.com>
	<1428443770.14020.483.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] binutils: Allow gold to build even when not the default
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
X-List-Received-Date: Tue, 07 Apr 2015 22:02:37 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 7, 2015, at 2:56 PM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2015-04-07 at 12:33 -0700, Khem Raj wrote:
>>> On Apr 7, 2015, at 7:51 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>>>=20
>>> It can be useful to have gold available for testing even when its =
not the
>>> default, therefore build gold by default in all configurations.
>>>=20
>>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>>=20
>>> diff --git a/meta/recipes-devtools/binutils/binutils.inc =
b/meta/recipes-devtools/binutils/binutils.inc
>>> index afb582a..3c65efc 100644
>>> --- a/meta/recipes-devtools/binutils/binutils.inc
>>> +++ b/meta/recipes-devtools/binutils/binutils.inc
>>> @@ -73,7 +73,7 @@ EXTRA_OECONF =3D =
"--program-prefix=3D${TARGET_PREFIX} \
>>>=20
>>> LDGOLD_class-native =3D ""
>>> LDGOLD_class-crosssdk =3D ""
>>> -LDGOLD ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', =
'--enable-gold=3Ddefault --enable-threads', '', d)}"
>>> +LDGOLD ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', =
'--enable-gold=3Ddefault --enable-threads', '--enable-gold =
--enable-ld=3Ddefault', d)}=E2=80=9D
>>>=20
>>=20
>> may be enable-gold could be done unconditionally ? and then =
=E2=80=94enable-gold|ld=3Ddefault controlled with ld-is-gold ?
>> ld-is-gold anyway meant that default linker is gold, it did not mean
>> to just build gold, so we are not changing semantics
>=20
> The above effectively does mean we're always building gold, it just
> controls whether ld is gold or not as before?
>=20

yes but only for cross toolchain. I was suggesting was to incorporate =
=E2=80=94enable-gold generally for all binutils variants
while keeping ld.bfd as default.=20

> Cheers,
>=20
> Richard


