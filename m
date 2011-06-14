Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QWbHB-0003oX-KC
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Jun 2011 23:35:57 +0200
Received: by wwb17 with SMTP id 17so5311602wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2011 14:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ZonJnu1Pku00NYrJIx3TBH9o8dooCHHeWU/jQkFOT/0=;
	b=CtxXLsh+WAWOInxz9bKuER9+s7Dju/jGSKgbOwrNcPmEbbgHe1CoZcHKY8hylvYX59
	Rl+FjvduolVAnuVs6x8Vcieo37iAH03/L32AHdf4mR8oCeH27PdLIW0YGThckaRJZTMJ
	utXipBfJSt0/aXrYvJrrg6yEybKgHE1oYgQDg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=lP+wT7KnxeAHDH9KDjt/P14Wy1R7a+0WEVCvIYFBgGH3HPsOHyLG6MBDyFDJkK1QTk
	DjVGn1iUM/L1zXVS0aLUO8dT89AEH44Hdz8yjKFfrFVko3UkKY6ZvdayawD0Y5z9E0uh
	g5SGRG3IZPb6IYWyS5RxlXu+BapBUPrSko+pI=
Received: by 10.216.203.142 with SMTP id f14mr1316664weo.28.1308087151172;
	Tue, 14 Jun 2011 14:32:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.37.197 with HTTP; Tue, 14 Jun 2011 14:32:00 -0700 (PDT)
In-Reply-To: <1308086688.15712.362.camel@rex>
References: <1308086002-16398-1-git-send-email-raj.khem@gmail.com>
	<1308086688.15712.362.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 14 Jun 2011 14:32:00 -0700
Message-ID: <BANLkTindy9m5Vd7B8ccC9RnkhaC9KbscQA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] allarch.bbclass: Set FEED_ARCH to original value of BASE_PACKAGE_ARCH and then set BASE_PACKAGE_ARCH to 'all'
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
X-List-Received-Date: Tue, 14 Jun 2011 21:35:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 2:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2011-06-14 at 14:13 -0700, Khem Raj wrote:
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/classes/allarch.bbclass | =C2=A0 =C2=A05 +++--
>> =C2=A01 files changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
>> index e3ac392..b9ba28b 100644
>> --- a/meta/classes/allarch.bbclass
>> +++ b/meta/classes/allarch.bbclass
>> @@ -2,9 +2,10 @@
>> =C2=A0# This class is used for architecture independent recipes/data fil=
es (usally scripts)
>> =C2=A0#
>>
>> +# We need to pour the value of BASE_PACKAGE_ARCH into FEED_ARCH
>> +# before we reset it
>> +FEED_ARCH :=3D ${BASE_PACKAGE_ARCH}
>> =C2=A0BASE_PACKAGE_ARCH =3D "all"
>> -PACKAGE_ARCH =3D "all"
>> -
>> =C2=A0# No need for virtual/libc or a cross compiler
>> =C2=A0INHIBIT_DEFAULT_DEPS =3D "1"
>
> This is a *really* bad idea. An "all" package should have no need to set
> architecture specific values into FEED_ARCH.
>
> Just for those not following IRC, the problem is Angstrom adds FEED_ARCH
> to OVERRIDES. Adding "all" to overrides turns out to do nasty things to
> classes like rm_work with "_all" in the function names.
>
> I'd suggest that various machines should start adding things like armv7a
> to ${MACHINEOVERRIDES} which has a much more clearly defined scope and
> that FEED_ARCH should quietly die ;-).

Would it make sense to add TARGET_SUBARCH variable ?

TARRGET_ARCH =3D arm
TARGET_SUBARCH =3D armv7a
MACHINE=3Dbeagleboard

and in bitbake.conf

TARGET_SUBARCH ??=3D "${TARGET_ARCH}"

>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


