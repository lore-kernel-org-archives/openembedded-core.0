Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1RJEJW-0007nJ-Ov
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Oct 2011 02:59:22 +0200
Received: by wwf10 with SMTP id 10so2786066wwf.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2011 17:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=XmaaLmB0K/L/Zg3WFfXhXex/h88EPf+1tSrpNQ89ImM=;
	b=Q05/33V0MSuucsaLNWKE84r9wB6LlaSldOFng6iT7DI9G5fOxYgS9yaVggG4TjAFfh
	MSuY4065OV3VgjvEI8oswuaiqvBvV4QTn8cPDI7+jaEHyyRzUxf7SWDUU3kzwMujk/Lq
	fOalsZYoa5616JzdPaye5j8DICkp06p3rE0DI=
MIME-Version: 1.0
Received: by 10.227.205.78 with SMTP id fp14mr12711625wbb.23.1319676797439;
	Wed, 26 Oct 2011 17:53:17 -0700 (PDT)
Received: by 10.180.96.169 with HTTP; Wed, 26 Oct 2011 17:53:17 -0700 (PDT)
In-Reply-To: <1319662875.12054.7.camel@ted>
References: <cover.1319652972.git.bruce.ashfield@windriver.com>
	<0ec24ded3f71c54e544d953de65d142717f48022.1319652972.git.bruce.ashfield@windriver.com>
	<1319662875.12054.7.camel@ted>
Date: Wed, 26 Oct 2011 20:53:17 -0400
Message-ID: <CADkTA4O1g7wr5BnYgyvoxs7T6L6jAy5hQMbu6Gc4yDcsp2j_Mg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: saul.wold@intel.com
Subject: Re: [PATCH 1/1] linux-libc-headers: provide 3.0.x and 3.1 headers
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
X-List-Received-Date: Thu, 27 Oct 2011 00:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 26, 2011 at 5:01 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Wed, 2011-10-26 at 14:25 -0400, Bruce Ashfield wrote:
>> This changes makes two different 3.x headers available to the
>> toolchain. The latest 3.0.x and 3.1 tarballs. Compatibility is
>> maintained with older 2.6 headers by creating a new variable
>> that changes the SRC_URI based on the major version number of
>> the kernel.
>>
>> Tested with 2.6.37.2, 3.0.8 and 3.1 builds and boots.
>>
>> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>> ---
>> =A0meta/conf/distro/include/tcmode-default.inc =A0 =A0 =A0 =A0| =A0 =A02=
 +-
>> =A0.../linux-libc-headers/linux-libc-headers.inc =A0 =A0 =A0| =A0 15 +++=
++-
>> =A0.../linux-libc-headers/linux-libc-headers_3.0.8.bb | =A0 53 +++++++++=
+++++++++++
>> =A0.../linux-libc-headers/linux-libc-headers_3.1.bb =A0 | =A0 53 +++++++=
+++++++++++++
>> =A04 files changed, 120 insertions(+), 3 deletions(-)
>> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-=
headers_3.0.8.bb
>> =A0create mode 100644 meta/recipes-kernel/linux-libc-headers/linux-libc-=
headers_3.1.bb
>>
>> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dis=
tro/include/tcmode-default.inc
>> index 2bf1beb..ed722be 100644
>> --- a/meta/conf/distro/include/tcmode-default.inc
>> +++ b/meta/conf/distro/include/tcmode-default.inc
>> @@ -21,7 +21,7 @@ SDKGCCVERSION ?=3D "4.6%"
>> =A0BINUVERSION ?=3D "2.21.1a"
>> =A0EGLIBCVERSION ?=3D "2.13"
>> =A0UCLIBCVERSION ?=3D "0.9.32"
>> -LINUXLIBCVERSION ?=3D "2.6.37.2"
>> +LINUXLIBCVERSION ?=3D "3.1"
>>
>> =A0# Temporary preferred version overrides for PPC
>> =A0PREFERRED_VERSION_u-boot-mkimage-native_powerpc ?=3D "2009.08"
>> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.i=
nc b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> index 014024f..4e874fe 100644
>> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
>> @@ -1,9 +1,20 @@
>> -DESCRIPTION =3D "Sanitized set of 2.6 kernel headers for the C library'=
s use."
>> +DESCRIPTION =3D "Sanitized set of kernel headers for the C library's us=
e."
>> =A0SECTION =3D "devel"
>> =A0LICENSE =3D "GPLv2"
>>
>> =A0LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1=
be7cd7"
>> -SRC_URI =3D "${KERNELORG_MIRROR}/linux/kernel/v2.6/linux-${PV}.tar.bz2"
>> +
>> +python __anonymous () {
>> + =A0 =A0import bb, re, string
>> +
>> + =A0 =A0major =3D bb.data.getVar("PV",d,1).split('.')[0]
>> + =A0 =A0if major =3D=3D "3":
>> + =A0 =A0 =A0 =A0bb.data.setVar("HEADER_FETCH_VER", "3.0", d)
>> + =A0 =A0else:
>> + =A0 =A0 =A0 =A0bb.data.setVar("HEADER_FETCH_VER", "2.6", d)
>> +}
>> +
>
> Just for reference, this kind of code whilst nice, does have a
> reasonable amount of overhead. For something which is effectively legacy
> setting MAJORVERSION =3D "3.0" in the recipe probably isn't a big deal.
>
> Also, please do d.getVar("PV", True) instead of the above. The "1" is
> bad and should be "True" and its neater to access d's getVar method
> directly now. I appreciate there is a lot of older code but any new code
> should use this approach.

Ack'd. I stole this from an old example, so I propagated a crime. I can
fix it up and send v3.  I was a bit worried about users of the .inc I
couldn't see, so I think I'll keep the python code around (unless I hear
a strong objection) for now, and we can slate it to be killed off entirely
in the future.

>
> There is also no need to import string (since its unused) and bb above
> (since its already always included).
>
> In answer to your other question, its probably safe to drop the older
> versions and switch to 3.1 at this point unless there are known
> compatibility issues?

I don't know of any, everything worked here. So I'll spin a 3 part
series, update, addition and removal and I'll leave it up to you about whic=
h
parts you want.

>
> My other comment about moving code to the .inc also stands and I didn't
> intend to sound as grumpy as it does when I read it back!

No worries. I didn't read it that way either!

Bruce

>
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


