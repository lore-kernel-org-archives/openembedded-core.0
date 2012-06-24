Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SiutY-0006ad-HU
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jun 2012 00:03:00 +0200
Received: by dalh21 with SMTP id h21so4288117dal.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jun 2012 14:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3jGgpfo6N/jIUz+KtogmSw44f1fvl6ryBDVGJhDJHHo=;
	b=0P81Rc4HjDnqh64vPyiuUf73QELneYgERKkojFCYwMaXDT7ywlUuvcQ29lX2aXTDW9
	ohdK6I/o7lDOPSnOJeYJL6SlvY591ZslWbmnuWOcizeeD7LEpDACx5eWP64gN7Kp6Xxi
	RYtktkT7rn2mMqHp/Q/0PJC/IF5Y6P/TupdvYZSzZISqaXd4P0qTxIb6Trk3g9Qk7Ekr
	Tc3+tWA0NC0uqQTyYBi9V1vLUjERz/jmpQOpZaQX2qIEKK/ONG3T+3BurDZBrqNRdQpA
	19Yzvgp4rKORhKceWGDDHkjmkSm5Fn4GEpuQhGoiir357LyKi2lm/rXL3ujzAev5NY74
	QPwg==
MIME-Version: 1.0
Received: by 10.68.230.68 with SMTP id sw4mr10598780pbc.142.1340574729443;
	Sun, 24 Jun 2012 14:52:09 -0700 (PDT)
Received: by 10.142.203.12 with HTTP; Sun, 24 Jun 2012 14:52:09 -0700 (PDT)
In-Reply-To: <4FE74FD8.9000204@linux.intel.com>
References: <1340319423-24865-1-git-send-email-andrea.adami@gmail.com>
	<4FE74FD8.9000204@linux.intel.com>
Date: Sun, 24 Jun 2012 23:52:09 +0200
Message-ID: <CAAQYJAu9-xuDQnG60J76eBHGc_jH6WYQwBic0MjjFuJhAFwEHw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mtd-utils: do not stage headers in sysroot
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
X-List-Received-Date: Sun, 24 Jun 2012 22:03:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 24, 2012 at 7:35 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/21/2012 03:57 PM, Andrea Adami wrote:
>>
>> * Headers are included in the package for compatibility
>> * but have not yet been synched with linux 3.0
>> * The actual issue was that ubi-user.h in sysroot
>> * was overwritten by the older version.
>> * Unfortunately one ioctl was renamed:
>> * http://lists.infradead.org/pipermail/linux-mtd/
>> * 2011-March/034419.html
>> * Note: the recipe will still use its own older header,
>> * following upstream.
>>
>> Signed-off-by: Andrea Adami<andrea.adami@gmail.com>
>> ---
>> =A0meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb | =A0 =A06 +-----
>> =A01 files changed, 1 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>> b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>> index daa3554..1a9d4d3 100644
>> --- a/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>> +++ b/meta/recipes-devtools/mtd/mtd-utils_1.5.0.bb
>> @@ -11,16 +11,12 @@ SRC_URI =3D
>> "git://git.infradead.org/mtd-utils.git;protocol=3Dgit;tag=3Dca39eb1d98e7=
36
>>
>> =A0S =3D "${WORKDIR}/git/"
>>
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =A0EXTRA_OEMAKE =3D "'CC=3D${CC}' 'RANLIB=3D${RANLIB}' 'AR=3D${AR}'
>> 'CFLAGS=3D${CFLAGS} -I${S}/include -DWITHOUT_XATTR' 'BUILDDIR=3D${S}'"
>>
>> =A0do_install () {
>> =A0 =A0 =A0 =A0oe_runmake install DESTDIR=3D${D} SBINDIR=3D${sbindir} MA=
NDIR=3D${mandir}
>> INCLUDEDIR=3D${includedir}
>> - =A0 =A0 =A0 install -d ${D}${includedir}/mtd/
>> - =A0 =A0 =A0 for f in ${S}/include/mtd/*.h; do
>> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 install -m 0644 $f ${D}${includedir}/mtd/
>> - =A0 =A0 =A0 done
>> =A0}
>
> Just curious how this was tested?
>
> I did a couple of different builds and on one clean rebuild, I found that
> udev failed because it could not find mtd/mtd-user.h
>
> Thanks
> =A0 =A0 =A0 =A0Sau!
>
>
>>
>> =A0PARALLEL_MAKE =3D ""

Strange...
I've done build from scratch of core-image-base to test and all was
built just fine, included udev_164.
It would be indeed bizarre if udev would depend on headers provided by
mtd-utils, though.

Finally, mtd-user.h belongs to linux-libc-headers(-dev) package.

Regards

Andrea


