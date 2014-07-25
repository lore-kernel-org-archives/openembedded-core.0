Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id E06DD60C19
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 10:42:38 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id n3so747656wiv.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 03:42:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=dHwlRHKy/lhYkNuWi5HAaOZQw7bJ1oCKzla87gpa61c=;
	b=Q7T53NPOLzpCu2+s0B40kT2Ze23zsxYFGYyMPWABlv8UUcoJ/b/wtsRX1EqLLjvc9E
	TqoAVNgnuWhUO4jFNu4tc8NKzFGatKSGo04CWiajXibxI6ohetXrQXnb99pNrrYssSuV
	Lbr3H4s3sM0j27KK9CjnoJ5XnAO4+RGzDYuJ0SHVrYPHn7EExnZFiZLf7nT6l9wwIxpW
	85w1TbBX4OPB6tyt5H9pMFgVskwgVqX8wG5fbCN3DFHbeqWCgCvZ+IZ5V4tAdljmpjKQ
	Ck4tx9Od5pFvyGRZbYpoOCtHgBxAOl7DOkuUzM8x6GvjhadPNc3A3P2es8dJaZq3vz7b
	8ZWA==
X-Gm-Message-State: ALoCoQn6Y62Bukgw/v8gFbYv0DXRacl/TPpRJRW7NxW+JjRtae/Z1cqQ4PR1aOnfU2Vd/R8gVmuM
X-Received: by 10.180.39.33 with SMTP id m1mr4018544wik.82.1406284959440;
	Fri, 25 Jul 2014 03:42:39 -0700 (PDT)
Received: from ?IPv6:2001:610:612::6c83:8eb5:d127:d6a8?
	([2001:610:612:0:6c83:8eb5:d127:d6a8])
	by mx.google.com with ESMTPSA id
	ut2sm24150875wjc.49.2014.07.25.03.42.37 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 25 Jul 2014 03:42:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <53B66F26.5000800@communistcode.co.uk>
Date: Fri, 25 Jul 2014 12:42:35 +0200
Message-Id: <CD45798B-163C-401D-8CEF-63773E06BF12@dominion.thruhere.net>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
	<53B66F26.5000800@communistcode.co.uk>
To: ml@communistcode.co.uk
X-Mailer: Apple Mail (2.1878.6)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Fri, 25 Jul 2014 10:42:43 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 4 jul. 2014, om 11:08 heeft Jack Mitchell <ml@communistcode.co.uk> =
het volgende geschreven:

> On 16/06/14 11:52, Ross Burton wrote:
>> OpenSSL has license complications and GnuTLS is preferred, so =
although the
>> license complications don't impact wget use GnuTLS for consistency.
>>=20
>> Also add a recommendation on ca-certificates so that https: URLs =
work.
>>=20
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>> meta/recipes-extended/wget/wget.inc |    7 ++++---
>> 1 file changed, 4 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/meta/recipes-extended/wget/wget.inc =
b/meta/recipes-extended/wget/wget.inc
>> index a778bca..642d502 100644
>> --- a/meta/recipes-extended/wget/wget.inc
>> +++ b/meta/recipes-extended/wget/wget.inc
>> @@ -3,15 +3,16 @@ HOMEPAGE =3D "https://www.gnu.org/software/wget/"
>> SECTION =3D "console/network"
>> LICENSE =3D "GPLv3"
>> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae504"
>> -DEPENDS =3D "openssl zlib libpcre"
>> +DEPENDS =3D "gnutls zlib libpcre"
>>=20
>> INC_PR =3D "r16"
>>=20
>> inherit autotools gettext texinfo update-alternatives
>>=20
>> -EXTRA_OECONF =3D "--enable-ipv6 =
--with-libssl-prefix=3D${STAGING_DIR_HOST} \
>> -                --with-ssl=3Dopenssl --disable-rpath --disable-iri \
>> +EXTRA_OECONF =3D "--enable-ipv6 --with-ssl=3Dgnutls --disable-rpath =
--disable-iri \
>>                 ac_cv_header_uuid_uuid_h=3Dno"
>>=20
>> ALTERNATIVE_${PN} =3D "wget"
>> ALTERNATIVE_PRIORITY =3D "100"
>> +
>> +RRECOMMENDS_${PN} +=3D "ca-certificates"
>>=20
>=20
> Ross,
>=20
> I've just pulled this in today after being on holiday for a while and =
it
> causes a breakage on my system.
>=20
> | checking for libgnutls... no
> | configure: error: --with-ssl=3Dgnutls was given, but GNUTLS is not
> available.
> | Configure failed. The contents of all config.log files follows to =
aid
> debugging
>=20
> log: http://ix.io/dfO
>=20
> I would have expected gnutls to have been pulled in through the =
depends
> but it obviously hasn't, or the system hasn't managed to find it...

FWIW, I'm seeing the same problem.=

