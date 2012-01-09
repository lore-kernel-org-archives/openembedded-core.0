Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RkNbr-0006Ew-Nf
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jan 2012 23:22:32 +0100
Received: by pbcc11 with SMTP id c11so2166025pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jan 2012 14:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=W9YfMHeR8f9HtQohidE2A22Zu4B6GtZ7efLTJNIEw6g=;
	b=MY1yPh9s2n2U5xwSc3I2w7WezhMoV6oTYxEyR/PrO0Tf43Gn7GvPAKWFT9fuUHre7C
	HIWJjbfSoRXTU73CCplD6/CswALwgNtesfVEEscm1pqyVhPZl7kGnbaIpYbs8YDzlRUJ
	g2E3HOTuTL+wR20dnFzsKu9FBsgZscwTRP0aE=
MIME-Version: 1.0
Received: by 10.68.72.136 with SMTP id d8mr44558448pbv.75.1326147302833; Mon,
	09 Jan 2012 14:15:02 -0800 (PST)
Received: by 10.142.213.7 with HTTP; Mon, 9 Jan 2012 14:15:02 -0800 (PST)
In-Reply-To: <4F0B1D7A.8020308@linux.intel.com>
References: <1325895236-22987-1-git-send-email-andrea.adami@gmail.com>
	<1325895659-23153-1-git-send-email-andrea.adami@gmail.com>
	<4F0B1D7A.8020308@linux.intel.com>
Date: Mon, 9 Jan 2012 23:15:02 +0100
Message-ID: <CAAQYJAunwX733=f=ZS-VzirXagBU=5KV45ZJywz0+5ryy1YuiQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] kexec-tools: split packaging of kexec and kdump
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
X-List-Received-Date: Mon, 09 Jan 2012 22:22:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 9, 2012 at 6:01 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 01/06/2012 04:20 PM, Andrea Adami wrote:
>>
>> * from meta-oe (originally from org.openembedded.dev)
>> * There are no reasons to install kdump when only kexec is needed.
>> *
>> * In oe-core/meta there are no references to kexec-tools so
>> * the recipes inn external layers rdepending on kexec-tools should be
>> * fixed and rdepend on kexec and/or kdump.
>> *
>
> You need to fix task-core-tools.bb in oe-core/meta itself also.
>
> Thanks
> =A0 =A0 =A0 =A0Sau!
>
>

Sure! My bad I overlooked this.
I'd add just kexec, being kdump is probably installed on demand with
capables kernels.
While there, I'd rename the recipe PN to 'kexec-tools' s upstream.

New patchset following soon.
Thanks for reviewing!

Cheers


>> * Bump PR.
>>
>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>> ---
>> =A0meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb | =A0 =A07 ++++++-
>> =A01 files changed, 6 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
>> b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
>> index caed816..8d2e606 100644
>> --- a/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
>> +++ b/meta/recipes-kernel/kexec/kexec-tools_2.0.2.bb
>> @@ -2,8 +2,13 @@ require kexec-tools.inc
>> =A0export LDFLAGS =3D "-L${STAGING_LIBDIR}"
>> =A0EXTRA_OECONF =3D " --with-zlib=3Dyes"
>>
>> -PR =3D "r1"
>> +PR =3D "r2"
>>
>> =A0SRC_URI +=3D " file://fix_for_compiling_with_gcc-4.6.0.patch"
>> =A0SRC_URI[md5sum] =3D "bc401cf3262b25ff7c9a51fc76c8ab91"
>> =A0SRC_URI[sha256sum] =3D
>> "549ab65c18a2229b6bf21b6875ca6bbe0e579bca08c3543ce6aaf8287a0b4188"
>> +
>> +PACKAGES =3D+ "kexec kdump"
>> +
>> +FILES_kexec =3D "${sbindir}/kexec"
>> +FILES_kdump =3D "${sbindir}/kdump"


