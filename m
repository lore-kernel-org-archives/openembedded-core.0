Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQ4GB-0004PF-3a
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 00:12:27 +0200
Received: by laai10 with SMTP id i10so916291laa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 15:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=MjxsjsR7oY6znNBMiOJ3GYrCwnkKZU/DCCIRTyi+YyA=;
	b=AEs9/v0Ly+BBgXbobUa3+EadC9sarYJZLDo1aecpOK8X+9eeKjO3iMR3HgHdWYRICp
	DRoNX5f8RP6u2Y6PVE3dYEgbERw9CcQbxXmUbJwSc5lwpiQ5gyT3o/i71A6uk/10pNRO
	5gQPjgkoPEtvdYitzffnZ4iUiUAFu40gDomVYCBCutSD/Q4zLL3AFEGzHuCHdNovdJRY
	S0MSPg/HPsdgX5r0YE1xYVyvttycsKWCvYmhO58AXeVVVfroo2etezNai8fbXyNGNjoI
	ITswvBqfWRQt0KTjRxdJ8wtE3M+Pt3gahaTRlwqcKIJZPW+0Si/EisOsysyuTe7E8l0b
	36iQ==
Received: by 10.152.133.144 with SMTP id pc16mr1274522lab.0.1336082561116;
	Thu, 03 May 2012 15:02:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Thu, 3 May 2012 15:02:10 -0700 (PDT)
In-Reply-To: <4FA2F31E.2030707@linux.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<e03556364318f69ce5914cc5375bfdf51b9c27d4.1328510188.git.raj.khem@gmail.com>
	<4FA2F31E.2030707@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 3 May 2012 15:02:10 -0700
Message-ID: <CAMKF1spcFsCgixDX9j=DWKQVcZPFP=f9XSFkf-6GEbUB8TNRXg@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 07/20] kmod: Add recipes
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
X-List-Received-Date: Thu, 03 May 2012 22:12:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 3, 2012 at 2:05 PM, Darren Hart <dvhart@linux.intel.com> wrote:
>
>
> On 02/05/2012 10:40 PM, Khem Raj wrote:
>> kmod is replacement for module-init-tools
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-kernel/kmod/kmod-native_git.bb =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 14 +++++
>> =C2=A0meta/recipes-kernel/kmod/kmod.inc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 31 +++++++++++
>> =C2=A0meta/recipes-kernel/kmod/kmod/depmod-search.conf | =C2=A0 =C2=A06 =
++
>> =C2=A0meta/recipes-kernel/kmod/kmod_git.bb =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | =C2=A0 62 ++++++++++++++++++++++
>> =C2=A04 files changed, 113 insertions(+), 0 deletions(-)
>> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod-native_git.bb
>> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod.inc
>> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod/depmod-search.con=
f
>> =C2=A0create mode 100644 meta/recipes-kernel/kmod/kmod_git.bb
>>
>> diff --git a/meta/recipes-kernel/kmod/kmod-native_git.bb b/meta/recipes-=
kernel/kmod/kmod-native_git.bb
>> new file mode 100644
>> index 0000000..96de8b8
>> --- /dev/null
>> +++ b/meta/recipes-kernel/kmod/kmod-native_git.bb
>> @@ -0,0 +1,14 @@
>> +# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
>> +# Released under the MIT license (see COPYING.MIT for the terms)
>> +
>> +require kmod.inc
>> +inherit native
>> +
>> +PR =3D "${INC_PR}.0"
>> +
>> +do_install_append (){
>> + =C2=A0 =C2=A0 for tool in depmod insmod lsmod modinfo modprobe rmmod
>> + =C2=A0 =C2=A0 do
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -s kmod ${D}${bindir}/$to=
ol
>> + =C2=A0 =C2=A0 done
>
> Do we have to ensure to disable module tools in busybox to avoid
> conflict here?
>

hmm I guess this could be made as a virtual choice. It was not there
so I did not do it.

> I had a few other questions, but managed to resolve them by the time I
> finished reading. It looks good with only the one concern above.


