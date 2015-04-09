Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 0FECD606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 06:59:48 +0000 (UTC)
Received: by paboj16 with SMTP id oj16so140605927pab.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 23:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=aPaGeP3UmYrpCvwiNRqkGM2qHZ0wLc+n8GVCwqFbfcc=;
	b=k4B8pYRFVbjKolQmdEWcwPMIRcpz244PU3WjTNEsGywtUB0dUUZo9Hueit32+8O3g6
	0cyS4SjQgKe6EZwPzuhmk66omopF/RGVOxr0/USevfAlt1Fh8IposcJ2LWjPZYS09UZt
	IJGdBIyRP1PD0mW8M0g1poyKVQus+V0mIbPSIqTZ+jUzRO0LYZ/6T1W8eqKZazJe3uD/
	sICVlNCUPZQnouJ4drxnRpH15RmkrHxxkL0WM8Y/azrwawyIDkK65OknNNHFRUofTZHb
	rLz/Xhg2tuGVK2gF4+Yy92BkEPqAsGp7muB+KREO4Ov1p8nAoGEEcNJ8UgoSSddlebqW
	vG7g==
X-Received: by 10.69.31.171 with SMTP id kn11mr51929933pbd.159.1428562789887; 
	Wed, 08 Apr 2015 23:59:49 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:68c8:2a57:ea69:48da?
	([2601:9:3580:84c:68c8:2a57:ea69:48da])
	by mx.google.com with ESMTPSA id
	ve3sm13148797pbc.22.2015.04.08.23.59.48
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 Apr 2015 23:59:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1428487193.14020.499.camel@linuxfoundation.org>
Date: Wed, 8 Apr 2015 23:59:47 -0700
Message-Id: <B7834FBD-E06E-4342-ABF3-AE5E176EEBEE@gmail.com>
References: <1428440035-6307-1-git-send-email-denis@denix.org>
	<1428440035-6307-2-git-send-email-denis@denix.org>
	<1428487193.14020.499.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.2070.6)
Cc: openembedded-core@lists.openembedded.org, Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH 2/2] security_flags.inc: disable PIE for bash due to issues in mkbuiltins
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
X-List-Received-Date: Thu, 09 Apr 2015 06:59:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


> On Apr 8, 2015, at 2:59 AM, Richard Purdie =
<richard.purdie@linuxfoundation.org> wrote:
>=20
> On Tue, 2015-04-07 at 16:53 -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>=20
>> As bash builds a native tool called mkbuiltins, it fails with PIE =
flags:
>>=20
>> ld: mkbuiltins.o: relocation R_X86_64_32 against `.rodata.str1.8' can =
not be used when making a shared object; recompile with -fPIC
>>=20
>> Affects at least version 3.2 of bash.
>=20
> I am a little worried about this one. Which architecture were you
> building for and is this just 3.x of bash or 4.x as well? I'd like to
> understand why we haven't seen this before=E2=80=A6

If its a tool used during building bash, then you need to adjust =
CFLAGS_FOR_BUILD
and make sure that bash=E2=80=99s build system is not mixing things up. =
I am not sure
if we need to disable PIE completely, there should be a better fix for =
this.

>=20
> Cheers,
>=20
> Richard
>=20
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>> meta/conf/distro/include/security_flags.inc | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/meta/conf/distro/include/security_flags.inc =
b/meta/conf/distro/include/security_flags.inc
>> index 21e1a53..3401c4b 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -16,6 +16,7 @@ SECURITY_CFLAGS_pn-lttng-tools_arm =3D =
"${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-elfutils_arm =3D "${SECURITY_NO_PIE_CFLAGS}"
>>=20
>> SECURITY_CFLAGS_pn-aspell =3D "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-bash =3D "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-beecrypt =3D "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-blktrace =3D "${SECURITY_NO_PIE_CFLAGS}"
>> # Curl seems to check for FORTIFY_SOURCE in CFLAGS, but even assigned
>> --=20
>> 2.2.0
>>=20
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


