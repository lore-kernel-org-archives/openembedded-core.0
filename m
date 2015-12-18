Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id A694B73173
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 05:48:05 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id p187so49853846wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 21:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=wC0SkEpUFwWQmq8k746Fcw7besEL2/bn6F5GYWH6QeI=;
	b=ZQQIUr+CHh0S+3eukA2D4eIhk1Oi3OFN7t0QC4hwWk0l3mzDnJPPmbAJA7HTZcisWu
	KzK8ucD+F5JCcX0inbDfTUnu1Rgi9vjBIzalAqBhUhFnkbHcOCWcblAuotf/Ldv4eUHB
	HzRrcrwqVXsHztZCG3avoaF/vRv4XuJ6lP/0tBP85Oy5cVzVmQShlgGkKMvaC3KH+qlr
	PlHFKD0wAsfPXG8JGRw0j+Jb6mQG6rNeCawF/gm3O6oXkheZR5W6cTVWgXu0XmLysPP8
	Z9+++wK6il+XKsl3XZ4p2Z9N+hv0Yy+6XFouPt8AxTLa1aX7G3qTts06mVkMfJlLFPaV
	dDRw==
MIME-Version: 1.0
X-Received: by 10.28.146.18 with SMTP id u18mr728794wmd.72.1450417685481; Thu,
	17 Dec 2015 21:48:05 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Thu, 17 Dec 2015 21:48:05 -0800 (PST)
In-Reply-To: <B851FF48-5C89-4537-A03D-DA4AA4C1AB73@gmail.com>
References: <1450413723-22208-1-git-send-email-armccurdy@gmail.com>
	<1450413723-22208-3-git-send-email-armccurdy@gmail.com>
	<B851FF48-5C89-4537-A03D-DA4AA4C1AB73@gmail.com>
Date: Thu, 17 Dec 2015 21:48:05 -0800
Message-ID: <CAJ86T=U3ELL1RsUw8+3UKjZ8mnRdg9eFgh13fkVKZMdpugs4dg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 18 Dec 2015 05:48:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 17, 2015 at 9:16 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Dec 17, 2015, at 8:42 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> Valgrind (v3.11.0) expects to build with stack protection disabled
>> and includes -fno-stack-protector in its default CFLAGS. However, the
>> CFLAGS provided by OE are included on the compiler command line after
>> the defaults so any -fstack-protector-all / -fstack-protector-strong
>> option provided by security_flags.inc will cause problems.
>>
>> | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/v=
algrind-3.11.0/coregrind/m_mallocfree.c:892: undefined reference to `__stac=
k_chk_guard'
>> | .../build-bcm97425vms/tmp/work/mips32el-rdk-linux/valgrind/3.11.0-r0/v=
algrind-3.11.0/coregrind/m_mallocfree.c:947: undefined reference to `__stac=
k_chk_fail'
>>
>> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
>> ---
>> meta/conf/distro/include/security_flags.inc | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dis=
tro/include/security_flags.inc
>> index 14ac0bf..1795750 100644
>> --- a/meta/conf/distro/include/security_flags.inc
>> +++ b/meta/conf/distro/include/security_flags.inc
>> @@ -84,7 +84,7 @@ SECURITY_CFLAGS_pn-python-numpy =3D "${SECURITY_NO_PIE=
_CFLAGS}"
>> SECURITY_CFLAGS_pn-python3 =3D "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-tcl =3D "${SECURITY_NO_PIE_CFLAGS}"
>> SECURITY_CFLAGS_pn-tiff =3D "${SECURITY_NO_PIE_CFLAGS}"
>> -SECURITY_CFLAGS_pn-valgrind =3D "${SECURITY_NO_PIE_CFLAGS}"
>> +SECURITY_CFLAGS_pn-valgrind =3D =E2=80=9C"
>
> Can we instead add -lssp to LDFLAGS ?

Probably. Valgrind deliberately adds -fno-stack-protector to it's own
CFLAGS though, so by forcing it to use the stack protector you would
be going against the wishes of the Valgrind developers.

>> SECURITY_CFLAGS_pn-zlib =3D "${SECURITY_NO_PIE_CFLAGS}"
>>
>> # These 2 have text relco errors with the pie options enabled
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

