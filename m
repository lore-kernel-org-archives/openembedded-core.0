Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QM19c-0003td-VT
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 19:00:26 +0200
Received: by ewy5 with SMTP id 5so1360294ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2011 09:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ujWeolIKSgMaO35Bix70HOXr54RV+jjVxeJc4ww7Uuo=;
	b=HCnnWN6fVYbXdmmlQZECVZjve6GPHQLwTuo76uAhlf2vE61gj/Fjheh8qG2YykpWNL
	oGfxb9EkBIJvxeX3uweY9bVkS8jQVr+xmNRX87NsuQJNQrnz+lL+gBPdopOSkoXXty8P
	+ReRhhLU14/AzhYokk3KhTkfibcFYnP8IJ2FE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ep2Ou+6JgshYtbUNrYrbcfiMANtJ2nb5wJAMYTEoOsbJl7TqQ/WtWzNGPP0zuCHf/X
	6/fWmJJbMfKqOOnd0qA61VcO2WvKDJ99eT4TvlR6qjrFGvOl498h/lcScB+dTPyppovD
	wDwmwUq9rehs9Q66fS/OBn0NiJu0wlB2mfKfU=
Received: by 10.14.95.8 with SMTP id o8mr1522190eef.76.1305565052405; Mon, 16
	May 2011 09:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Mon, 16 May 2011 09:57:02 -0700 (PDT)
In-Reply-To: <1305555853.3424.78.camel@rex>
References: <cover.1305422996.git.sgw@linux.intel.com>
	<51c904d03751c96d848617bb425f85635c33be87.1305422996.git.sgw@linux.intel.com>
	<1305555853.3424.78.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 May 2011 09:57:02 -0700
Message-ID: <BANLkTinYMNb=wV1tGiDd0YJsi68kGzrQUw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/15] bitbake.conf: move VENDOR variables from bitbake.conf to defaultsetup.conf
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
X-List-Received-Date: Mon, 16 May 2011 17:00:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, May 16, 2011 at 7:24 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Sat, 2011-05-14 at 18:32 -0700, Saul Wold wrote:
>> From: Martin Jansa <Martin.Jansa@gmail.com>
>>
>> * empty TARGET_VENDOR was set before weak assignment in defaultsetup.con=
f
>> * -oecore was changed to -oe to be more consistent with SDK_VENDOR as we=
 had -oesdk as SDK_VENDOR and not -oecoresdk
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>
> I know I probably indicated otherwise but looking at this patch, I think
> moving all these entries into distrosetup.conf is not desirable. The
> real issue here is the default:
>
> TARGET_VENDOR =3D "${BUILD_VENDOR}"
>
> which when you think about it doesn't actually make much sense. I'm
> happy for the default just to become:
>
> TARGET_VENDOR =3D "-oe"
>
> in bitbake.conf.

that sounds a good solution.

>
> Cheers,
>
> Richard
>
>
>> ---
>> =C2=A0meta/conf/bitbake.conf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 =C2=A04 ----
>> =C2=A0meta/conf/distro/defaultsetup.conf | =C2=A0 =C2=A05 ++++-
>> =C2=A02 files changed, 4 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
>> index 7c72de1..418a15d 100644
>> --- a/meta/conf/bitbake.conf
>> +++ b/meta/conf/bitbake.conf
>> @@ -62,7 +62,6 @@ target_datadir :=3D "${datadir}"
>>
>> =C2=A0BUILD_ARCH =3D "${@os.uname()[4]}"
>> =C2=A0BUILD_OS =3D "${@os.uname()[0].lower()}"
>> -BUILD_VENDOR =3D ""
>> =C2=A0BUILD_SYS =3D "${BUILD_ARCH}${BUILD_VENDOR}-${BUILD_OS}"
>> =C2=A0BUILD_PREFIX =3D ""
>> =C2=A0BUILD_CC_ARCH =3D ""
>> @@ -70,7 +69,6 @@ BUILD_EXEEXT =3D ""
>>
>> =C2=A0HOST_ARCH =3D "${TARGET_ARCH}"
>> =C2=A0HOST_OS =3D "${TARGET_OS}"
>> -HOST_VENDOR =3D "${TARGET_VENDOR}"
>> =C2=A0HOST_SYS =3D "${HOST_ARCH}${HOST_VENDOR}-${HOST_OS}"
>> =C2=A0HOST_PREFIX =3D "${TARGET_PREFIX}"
>> =C2=A0HOST_CC_ARCH =3D "${TARGET_CC_ARCH}"
>> @@ -78,14 +76,12 @@ HOST_EXEEXT =3D ""
>>
>> =C2=A0TARGET_ARCH =3D "INVALID"
>> =C2=A0TARGET_OS =3D "INVALID"
>> -TARGET_VENDOR =3D "${BUILD_VENDOR}"
>> =C2=A0TARGET_SYS =3D "${TARGET_ARCH}${TARGET_VENDOR}${@['-' + bb.data.ge=
tVar('TARGET_OS', d, 1), ''][bb.data.getVar('TARGET_OS', d, 1) =3D=3D ('' o=
r 'custom')]}"
>> =C2=A0TARGET_PREFIX =3D "${TARGET_SYS}-"
>> =C2=A0TARGET_CC_ARCH =3D ""
>>
>> =C2=A0SDK_ARCH =3D "${BUILD_ARCH}"
>> =C2=A0SDK_OS =3D "${BUILD_OS}"
>> -SDK_VENDOR =3D "-oesdk"
>> =C2=A0SDK_SYS =3D "${SDK_ARCH}${SDK_VENDOR}${@['-' + bb.data.getVar('SDK=
_OS', d, 1), ''][bb.data.getVar('SDK_OS', d, 1) =3D=3D ('' or 'custom')]}"
>> =C2=A0SDK_PREFIX =3D "${SDK_SYS}-"
>> =C2=A0SDK_CC_ARCH =3D "${BUILD_CC_ARCH}"
>> diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defau=
ltsetup.conf
>> index 8da6c0a..dd9ffc3 100644
>> --- a/meta/conf/distro/defaultsetup.conf
>> +++ b/meta/conf/distro/defaultsetup.conf
>> @@ -3,7 +3,10 @@ include conf/distro/include/default-versions.inc
>> =C2=A0include conf/distro/include/default-distrovars.inc
>> =C2=A0include conf/distro/include/world-broken.inc
>>
>> -TARGET_VENDOR ?=3D "-oecore"
>> +BUILD_VENDOR ?=3D ""
>> +TARGET_VENDOR ?=3D "-oe"
>> +HOST_VENDOR ?=3D "${TARGET_VENDOR}"
>> +SDK_VENDOR ?=3D "-oesdk"
>>
>> =C2=A0TARGET_FPU_arm ?=3D "soft"
>> =C2=A0TARGET_FPU_armeb ?=3D "soft"
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


