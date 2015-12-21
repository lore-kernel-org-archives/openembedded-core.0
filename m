Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6825F6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 20:57:19 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id l126so86302682wml.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Dec 2015 12:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=U5cHVlQDdjTlTHj7dpeiZbGhYe5eYV4SfykDjVRsrqY=;
	b=vGVl0UU+c6EJ+bJJe1+vm26fUvKVCYvy6CucT6L/LAc7ylerFRC1uoG3zCsIF0FTjK
	BrMyLqsNgO8AK2SuubZwN67vag7YsEXWngfghBkjMwvnZefS1puoHEnylFDxVzYgXu1c
	1BAtdATHNkpkwfy/hEs2I7iPQf1Zizwyux8fH0bzXIkPySuN8bGhkcghq7Ta+2/VaHLt
	x1qZUf0166hs+unBLzh+yWy/PsrnIrFisqMKN6OFhtkYMWNPag3nj6oEbXjh5UHqGqBG
	81LBpg5uRmQgh1M1IvhOcJ/5TAqXTAoqDdh7K1mvwQHuOkm2UkxPcaSBszgZGsR+GTha
	OumQ==
MIME-Version: 1.0
X-Received: by 10.28.104.130 with SMTP id d124mr21914791wmc.72.1450731439661; 
	Mon, 21 Dec 2015 12:57:19 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Mon, 21 Dec 2015 12:57:19 -0800 (PST)
In-Reply-To: <CAJ86T=UwarUoEkGNkDG8Y9m6_6NOOW+YhDTN53AkgqJBCsNw3g@mail.gmail.com>
References: <cover.1450568936.git.raj.khem@gmail.com>
	<81170e1970685f34735007c496ce175279d46304.1450568936.git.raj.khem@gmail.com>
	<ab5e796a793f112dbfb186d31d9006c6ed78d03b.1450568936.git.raj.khem@gmail.com>
	<CAJ86T=UwarUoEkGNkDG8Y9m6_6NOOW+YhDTN53AkgqJBCsNw3g@mail.gmail.com>
Date: Mon, 21 Dec 2015 12:57:19 -0800
Message-ID: <CAJ86T=WhZvqgih--Lm7ymeOkZcR4RQ0gHRCVOCY3bnC6GNBqUw@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/17] valgrind: Define __UCLIBC__ for uclibc based systems
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
X-List-Received-Date: Mon, 21 Dec 2015 20:57:22 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Dec 21, 2015 at 12:38 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
> On Sat, Dec 19, 2015 at 3:52 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> Helps configure valgrind for uclibc targets otherwise it tries to assume
>> funcitons that are implemented in glibc like __free_res
>
> This is going to conflict with the valgrind version update patches
> already posted to the list.
>
> Ross, any thoughts on which set of patches might get merged first, so
> that either Khem or I can rebase accordingly? Or perhaps I could just
> pull this one change into the valgrind update series and Khem could
> drop it?

Never mind, I see Alexander's original valgrind update patch got merged to mut2.

>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  meta/recipes-devtools/valgrind/valgrind_3.10.1.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> index c38a07b..c1c11d4 100644
>> --- a/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> +++ b/meta/recipes-devtools/valgrind/valgrind_3.10.1.bb
>> @@ -44,6 +44,8 @@ EXTRA_OECONF_armv7a = "--enable-tls -host=armv7-none-linux-gnueabi --without-mpi
>>  EXTRA_OECONF += "${@['--enable-only32bit','--enable-only64bit'][d.getVar('SITEINFO_BITS', True) != '32']}"
>>  EXTRA_OEMAKE = "-w"
>>
>> +CFLAGS_append_libc-uclibc = " -D__UCLIBC__ "
>> +
>>  do_install_append () {
>>      install -m 644 ${B}/default.supp ${D}/${libdir}/valgrind/
>>  }
>> --
>> 2.6.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core

