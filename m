Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id D7940605F2
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Aug 2013 18:26:08 +0000 (UTC)
Received: by mail-pa0-f46.google.com with SMTP id fa1so539764pad.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Aug 2013 11:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=QQsomMybyV/dac1GFs6MUzP7lSqcTNiQM7BI+qhB1c8=;
	b=WblXbtPeWUueKoi+POkmRHPNN8uUpzyhGBk/IMjAxdcyptVOUOvx2G3jB5UIeeu6rG
	HabXPZvGnXL0Bb67RXR4kqF0dwhSSXfzmLrK0J26I5//lr2+tJkKLhLQnrKw4CmTXJjr
	k5w9JrfutYejYV5Yt4J4b6rFmHiM3d+J6pCiVOE5+mUi7fa7n0vLpqntVeSsors807Aw
	KR/JwXfY22QcwVJbm0pz05QA/S62i9tDE9YJuZR8XJBGRMvsBOASNsz6cLRIJVxr8+AY
	BUURHbMpGAoQSw1HLajdxkRJquvY3cKitvq0YyV7w2XzUr5+6es67l0Ft53fcscDmwkw
	0wKQ==
X-Received: by 10.66.216.129 with SMTP id oq1mr2030072pac.75.1375899969656;
	Wed, 07 Aug 2013 11:26:09 -0700 (PDT)
Received: from gourish-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id y6sm9580686pbl.23.2013.08.07.11.26.07
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 07 Aug 2013 11:26:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5201F783.4020601@windriver.com>
Date: Wed, 7 Aug 2013 11:26:06 -0700
Message-Id: <1318833D-CF46-4453-8ECA-ED9C92AD59C8@gmail.com>
References: <cover.1374643300.git.rongqing.li@windriver.com>
	<947336a1ef2b936328ba6fcf519d55a4eda7085d.1374643300.git.rongqing.li@windriver.com>
	<5201F783.4020601@windriver.com>
To: Rongqing Li <rongqing.li@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: ignore qemu output, and check its return code
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
X-List-Received-Date: Wed, 07 Aug 2013 18:26:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 7, 2013, at 12:30 AM, Rongqing Li <rongqing.li@windriver.com> =
wrote:

> ping
>=20
> On 07/24/2013 01:24 PM, rongqing.li@windriver.com wrote:
>> From: "Roy.Li" <rongqing.li@windriver.com>
>>=20
>> qemu prints errors sometime, but it works well,


how do you know ?

>> the error information
>> can be captured by rpm, and lead to rpm failure. like:
>>=20
>> 	$export D=3D/tmp/rootfs;.../usr/bin/qemu-i386 -L $D \
>> 		-E LD_LIBRARY_PATH=3D$D/usr/lib:$D/lib $D/bin/udevadm =
hwdb --update --root $D
>> 	qemu: Unsupported syscall: 240
>> 	$echo $?
>> 	$ 0
>>=20
>> Signed-off-by: Roy.Li <rongqing.li@windriver.com>
>> ---
>>  meta/recipes-core/systemd/systemd_204.bb |    4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/meta/recipes-core/systemd/systemd_204.bb =
b/meta/recipes-core/systemd/systemd_204.bb
>> index b8b1290..10bde33 100644
>> --- a/meta/recipes-core/systemd/systemd_204.bb
>> +++ b/meta/recipes-core/systemd/systemd_204.bb
>> @@ -277,7 +277,9 @@ ALTERNATIVE_PRIORITY[poweroff] ?=3D "300"
>>  pkg_postinst_udev-hwdb () {
>>  	if test -n "$D"; then
>>  		${@qemu_run_binary(d, '$D', '${base_bindir}/udevadm')} =
hwdb --update \
>> -			--root $D
>> +			--root $D 2>/dev/null
>> +
>> +		[ $? -ne 0 ] && exit 1
>>  	else
>>  		udevadm hwdb --update
>>  	fi
>>=20
>=20
> --=20
> Best Reagrds,
> Roy | RongQing Li
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


