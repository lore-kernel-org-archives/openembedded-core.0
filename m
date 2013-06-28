Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f42.google.com (mail-pb0-f42.google.com
	[209.85.160.42])
	by mail.openembedded.org (Postfix) with ESMTP id CAD396AF00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 22:13:35 +0000 (UTC)
Received: by mail-pb0-f42.google.com with SMTP id un1so2775037pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 15:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=az9nuDp93v/xXWpIbEPpbG20KJ0lVjFGfb6JMGGeTpo=;
	b=rF1/+HfbatByjhuy/zyRLXgPrnwr7joZLitZyGlhVLxDSK/2hFvEHsNxnrF0J/xrtW
	EmHREvHlqYRLIbudqIhjdYz+g3sCnawfRGKtfd1PEoBx5vjKwiLTVfnbsX7Yud2w9E+d
	c0L17tKQpH23SzCFKfQDSKzuwY0zljBkp5eD6QogXquJiIWnxqFXBgk/VrYzRBrx8vmr
	l1FRj1zfheNHFkY7KgPWsclaS9HPVF4+TsvqD2j49pIAkYbFqsw/1Rv2g1ffh36s9yhK
	p+H+xsaW2R5ob6EelMkbfvJTABSOWSnlOwIbUeG2CzWvhX8NxdNUjKb5iXQmbsB/Ztm7
	8jXg==
X-Received: by 10.68.217.170 with SMTP id oz10mr13538257pbc.152.1372457617023; 
	Fri, 28 Jun 2013 15:13:37 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id pe9sm9851035pbc.35.2013.06.28.15.13.35
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 28 Jun 2013 15:13:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51CDE3D7.5060908@windriver.com>
Date: Fri, 28 Jun 2013 15:13:34 -0700
Message-Id: <AA3E90A6-3307-47BA-954D-117C339528EF@gmail.com>
References: <1372447427-31750-1-git-send-email-sgw@linux.intel.com>
	<51CDE3D7.5060908@windriver.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2 v2] bitbake.conf: Add SECURITY_*FLAGS overridable definition
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
X-List-Received-Date: Fri, 28 Jun 2013 22:13:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 28, 2013, at 12:28 PM, Mark Hatle <mark.hatle@windriver.com> =
wrote:

> On 6/28/13 2:23 PM, Saul Wold wrote:
>> This will allow for SECURITY_CFLAGS and SECURITY_LDFLAGS to be
>> defined in the security_flags.inc and override the empty default.
>>=20
>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>> ---
>>  meta/conf/bitbake.conf | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 62a3936..72e1a78 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -493,7 +493,8 @@ export TARGET_CPPFLAGS =3D ""
>>=20
>>  export BUILD_CFLAGS =3D "${BUILD_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>>  BUILDSDK_CFLAGS =3D "${BUILDSDK_CPPFLAGS} ${BUILD_OPTIMIZATION}"
>> -export CFLAGS =3D "${TARGET_CFLAGS}"
>> +SECURITY_CFLAGS ?=3D ""
>> +export CFLAGS =3D "${TARGET_CFLAGS} ${SECURITY_CFLAGS}"
>>  export TARGET_CFLAGS =3D "${TARGET_CPPFLAGS} =
${SELECTED_OPTIMIZATION}"
>=20
> I would prefer if the cflags came in via the TARGET_CFLAGS, similar to =
how the selected_optimization works.  In the past we've hacked around =
with CFLAGS itself and in the end it's always seem to have caused =
problems.  By modifing TARGET_CFLAGS instead, then the user can do (in a =
recipe):
>=20
> CFLAGS =3D "-fmy-custom-flag ${TARGET_CFLAGS}"

yes infact it should be added via TARGET_CFLAGS=20

>=20
>>  export BUILD_CXXFLAGS =3D "${BUILD_CFLAGS} -fpermissive"
>> @@ -523,7 +524,8 @@ LINKER_HASH_STYLE_mips64 =3D "sysv"
>>  LINKER_HASH_STYLE_mips64el =3D "sysv"
>>  TARGET_LINK_HASH_STYLE ?=3D =
"${@['-Wl,--hash-style=3Dgnu',''][d.getVar('LINKER_HASH_STYLE', True) !=3D=
 'gnu']}"
>>=20
>> -export LDFLAGS =3D "${TARGET_LDFLAGS}"
>> +SECURITY_LDFLAGS ?=3D ""
>> +export LDFLAGS =3D "${TARGET_LDFLAGS} ${SECURITY_LDFLAGS}"
>=20
> Same comment here.
>=20
>>  export TARGET_LDFLAGS =3D "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
>>  #export TARGET_LDFLAGS =3D "-L${STAGING_DIR_TARGET}${libdir} \
>>  #                         =
-Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
>>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


