Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QLuZs-00027U-C4
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 11:59:04 +0200
Received: by ewy5 with SMTP id 5so1243142ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=h7sDV/VdKIH9GaSSbhWZueTOiIciBgLyxLFnCWF+9jE=;
	b=t1CTtYbHEBmJAaL2t7T9Hq9X8FMh3MfIEkqjzp4wj7mNm1IBbIvJlm6JDf/lDj/8HS
	qOHw1thkOn4ORnTyFrOWyDuC1uijmAfGPRXBIyrWowYw99OBhWeuMDHJKw3z9uuWSx/F
	SqgBR0yxWEY7kHS3n3BpELLqTW1pQR3sFotOY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=dzga/SWXAOt89szQqGcSS+4OESbnAXezix40hMOSsVSCuBgECLm3QUeCmvz+9GYoQA
	sNAEogb2yeCopf7TSFgTwbtCvfd3H/iPM5PB8eY2b1S3op/9bvB4K0j4Q1+boIG50ma1
	W7sX6DuMUsU5IziBGfoF+Oc+J7/TeWheJEaM0=
Received: by 10.14.49.210 with SMTP id x58mr1613947eeb.12.1305539772139; Mon,
	16 May 2011 02:56:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 02:55:42 -0700 (PDT)
In-Reply-To: <13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
References: <cover.1305525725.git.raj.khem@gmail.com>
	<ca9a918a98510eac991c84ce1ebe8fecbdf38361.1305525725.git.raj.khem@gmail.com>
	<13617913-C458-40F1-AA46-489ACEADF340@dominion.thruhere.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 02:55:42 -0700
Message-ID: <BANLkTik7k7pd5+cc+5-K3-Di7+hdryow9Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] tclibc-uclibc.inc: Append -uclibc only to target recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 May 2011 09:59:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, May 15, 2011 at 11:58 PM, Koen Kooi <koen@dominion.thruhere.net> wr=
ote:
>
> Op 16 mei 2011, om 08:04 heeft Khem Raj het volgende geschreven:
>
>> Do not define DEPLOY_DIR_IMAGE
>> Append -uclibc to STAGING_DIR_TARGET only for target recipe and cross
>> recipes
>> Append -uclibc to STAGING_DIR_HOST only for target recipes.
>>
>> These changes make sure that we still share the native sysroot
>
> I still stay we append tclibc unconditionally.

yes thats would simplify things if we agree to use TCLIBC in bitbake.conf

>
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> meta/conf/distro/include/tclibc-uclibc.inc | =C2=A0 =C2=A05 ++---
>> 1 files changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/conf/distro/include/tclibc-uclibc.inc b/meta/conf/dist=
ro/include/tclibc-uclibc.inc
>> index 27f6ec6..4bd313f 100644
>> --- a/meta/conf/distro/include/tclibc-uclibc.inc
>> +++ b/meta/conf/distro/include/tclibc-uclibc.inc
>> @@ -20,10 +20,9 @@ CXXFLAGS +=3D "-fvisibility-inlines-hidden"
>>
>> IMAGE_LINGUAS =3D ""
>>
>> -DEPLOY_DIR_IMAGE =3D "${TMPDIR}/deploy/images"
>> DEPLOY_DIR_append =3D "-uclibc"
>> -STAGING_DIR_TARGET_append =3D "-uclibc"
>> -STAGING_DIR_HOST_append =3D "-uclibc"
>> +STAGING_DIR_TARGET_append =3D "${@['-uclibc', ''][oe.utils.inherits(d, =
'native', 'nativesdk')]}"
>> +STAGING_DIR_HOST_append =3D "${@['-uclibc', ''][oe.utils.inherits(d, 'n=
ative', 'nativesdk', 'cross', 'crosssdk')]}"
>> SSTATE_MANIFESTS_append =3D "-uclibc"
>>
>> LIBC_DEPENDENCIES =3D "\
>> --
>> 1.7.4.1
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


