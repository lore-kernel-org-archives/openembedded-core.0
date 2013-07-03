Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3FED66A9E3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 20:19:13 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp16so481562pbb.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Jul 2013 13:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ZIS4HUJwOxzlP5ZrDNbwkI1n7YF1/MF4VLZxlWgDF2M=;
	b=uMFAcfEWsZ6gC6UcpdAkC1eC9iUDlV5vTiI/AJvxl8NDU+l3iTNDPiuNKakm+rMwbC
	NTgcscXIg33GDTuONBz8c9foPmEzlzOdJ5kEQHnLkivixsFVtCnKgcHoJVc8rS8wY43v
	k3T11YJ5uyUkoUOEDlKeDzFYb/q3LetoX7f5kMp5Ocv6A79ury87LxsxAR17w2umD7go
	/pC6AwLnOTBHnUmzL1lBuuBjaV/d6licCqGOvbM1tewHNXe08VENyPJsm/fS4cG/qb3O
	AzeIEbErIgtYeHmzZ3cQs2VVSOnx4L5ZJssbpFiCt1pzLPrI3oxJLz4X6TkMDLDEX1E7
	ZFGw==
X-Received: by 10.68.17.70 with SMTP id m6mr2316048pbd.142.1372882754202;
	Wed, 03 Jul 2013 13:19:14 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	dj5sm32713123pbc.25.2013.07.03.13.19.12 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 03 Jul 2013 13:19:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <51D4857E.9060602@linux.intel.com>
Date: Wed, 3 Jul 2013 13:19:11 -0700
Message-Id: <A0A781A4-41F4-47AC-954B-C3E55283B32F@gmail.com>
References: <1372856665-29178-1-git-send-email-v.mayoralv@gmail.com>
	<51D4857E.9060602@linux.intel.com>
To: Saul Wold <sgw@linux.intel.com>
X-Mailer: Apple Mail (2.1508)
Cc: vmayoral <v.mayoralv@gmail.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] apr_cv_mutex_recursive=yes added to apr_1.4.6.bb to make rosnodes work
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
X-List-Received-Date: Wed, 03 Jul 2013 20:19:13 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jul 3, 2013, at 1:11 PM, Saul Wold <sgw@linux.intel.com> wrote:

> On 07/03/2013 06:04 AM, vmayoral wrote:
>> From: victor <v.mayoralv@gmail.com>
>>=20
>> Working with the meta-ros project we detected that the ROS nodes =
didn't launch properly
>> the reason was that by default apr_cv_mutex_recursive in apr is set =
to no and this leads
>> to the APRENOTIMPL return value of apr_thread_mutex_create in =
thread_mutex.c when
>> APR_THREAD_MUTEX_NESTED is requested via flags.
>>=20
>> Added CACHED_CONFIGUREVARS +=3D "apr_cv_mutex_recursive=3Dyes" to =
sources/openembedded-core/meta/recipes-support/apr/apr_1.4.6.bb
>> to fix this issue. It has also been removed the mention of this =
variable in
>> meta/site/powerpc32-linux.
>>=20
>> Signed-off-by: V=EDctor Mayoral Vilches <v.mayoralv@gmail.com>
>> ---
>>  meta/recipes-support/apr/apr_1.4.6.bb |    3 +++
>>  meta/site/powerpc32-linux             |    1 -
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>=20
> This really should be 2 patches, I know it was mentioned that you =
should make the change at the same time.  But it should be done in =
seperate patches since they actually accomplishing different things.

You don't want two patches here since logically you are moving the =
define from global space to recipe space.
its aimed at same things.

>=20
> Also, the summary title of the commit should be in the format of:
>=20
> recipe or file: <Summary>
>=20
> So in your case:
>=20
> apr: add apr_cv_mutex_recursive=3Dyes to support meta-ros
>=20
> <full commit messaage>
>=20
> powerpc32-linux: remove apr_cv_mutex_recurisve
>=20
> ...
>=20
>=20
> Thanks
> 	Sau!
>=20
>> diff --git a/meta/recipes-support/apr/apr_1.4.6.bb =
b/meta/recipes-support/apr/apr_1.4.6.bb
>> index 896f79f..ba59639 100644
>> --- a/meta/recipes-support/apr/apr_1.4.6.bb
>> +++ b/meta/recipes-support/apr/apr_1.4.6.bb
>> @@ -23,6 +23,9 @@ inherit autotools lib_package binconfig =
multilib_header
>>=20
>>  OE_BINCONFIG_EXTRA_MANGLE =3D " -e =
's:location=3Dsource:location=3Dinstalled:'"
>>=20
>> +# Added to fix some issues with cmake. Refer to =
https://github.com/bmwcarit/meta-ros/issues/68#issuecomment-19896928
>> +CACHED_CONFIGUREVARS +=3D "apr_cv_mutex_recursive=3Dyes"
>> +
>>  do_configure_prepend() {
>>  	cd ${S}
>>  	./buildconf
>> diff --git a/meta/site/powerpc32-linux b/meta/site/powerpc32-linux
>> index 4550df3..b3973c9 100644
>> --- a/meta/site/powerpc32-linux
>> +++ b/meta/site/powerpc32-linux
>> @@ -203,7 +203,6 @@ apr_cv_use_lfs64=3D${apr_cv_use_lfs64=3Dyes}
>>  apr_cv_epoll=3D${apr_cv_epoll=3Dyes}
>>  apr_cv_pthreads_cflags=3D${apr_cv_pthreads_cflags=3D-pthread}
>>  apr_cv_pthreads_lib=3D${apr_cv_pthreads_lib=3D-lpthread}
>> -apr_cv_mutex_recursive=3D${apr_cv_mutex_recursive=3Dyes}
>>  ac_cv_func_mmap=3D${ac_cv_func_mmap=3Dyes}
>>  ac_cv_file__dev_zero=3D${ac_cv_file__dev_zero=3Dyes}
>>  ac_cv_sizeof_off_t=3D${ac_cv_sizeof_off_t=3D4}
>>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


