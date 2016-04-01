Return-Path: <net147@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id C06E273204
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 11:42:19 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id e3so148395964ioa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Apr 2016 04:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=1E0UNOFjj9cU+LY6DViArrJUVxcSYHY6NQMTNZ1dC70=;
	b=Wyy7Mi4hcWEo5hTWonvcuhMPMwFACz0JZ7/fpT0IO/YW9oPLZYFfjsgTudjsv1nbBh
	RwrqEP6ooMq2V8l10m9YG4QRBIF6cD1HmNFXTy11fQ1PpG5ipiQGi1KPlKypnkWBhuAe
	pEV43EPhk4nsgOpO0N0xWs6lenoc6DKeu5bSV/VeYCjEjG2znTvpl45xNB3D+6Eyq6J+
	AmrdpuwogigPyGG9cWGjoGWb2Mw3oyu1bCea1gv4LzqOAPyIcSRNhYybuDwVI1arQcYM
	YAioXPT5hiyoT7xaRfc/sp7kK9mayObe5JlxQtCdSb7bX0VjE8epiPoy9lxlYdBz93z9
	rNFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=1E0UNOFjj9cU+LY6DViArrJUVxcSYHY6NQMTNZ1dC70=;
	b=HzO3DbqXBOpykiHFZVXpZT1ChprmKwMCDdynLkbTrR7buWryxfwAqVentk4pVHr8T1
	ZkLHdq5lYeX/DFWBhi8Da1ivbrJkS4kK22CuWyh6ruL7fjq6cmJZoHATQMw4zwfys97f
	Zys9K9AsbZ1svxkQzIfa/5n1ZnXI9+dsRBZTP7nDgHYflfR/ZYBuFLbFyeqOSToKjGOf
	/fPWkp+P69sQzpSsfjE9iiOtJSac2RCUkLvSsdfTbiiONvGnGIAAQNYaTJEA/Fmu8+ma
	ZOjQF4f6Sam3cf4bw3CRucpzDhFZtxAt3Zx09rWrghFGdgehjoGLwil5hEl4YEHI46Ca
	qWjg==
X-Gm-Message-State: AD7BkJLCex1qIZKX8XkI0kEuY/jI558heySiLV1+TrHg7dcuFTKncrwma/h/ftK7YRDmY5p9N8wxuT07OYg2dg==
MIME-Version: 1.0
X-Received: by 10.107.32.20 with SMTP id g20mr4067824iog.149.1459510940011;
	Fri, 01 Apr 2016 04:42:20 -0700 (PDT)
Received: by 10.36.69.12 with HTTP; Fri, 1 Apr 2016 04:42:19 -0700 (PDT)
In-Reply-To: <CAMKF1sqV+PeZZvH1Am-MEs-f3e4JtENPdX=ByDesatb3EGM76Q@mail.gmail.com>
References: <1459039503-5526-1-git-send-email-net147@gmail.com>
	<CAMKF1sqV+PeZZvH1Am-MEs-f3e4JtENPdX=ByDesatb3EGM76Q@mail.gmail.com>
Date: Fri, 1 Apr 2016 22:42:19 +1100
Message-ID: <CANwerB3q0tnyeqGGYddsZQ5CE4yDC6znL3NY8oJXLMOU4u9fTQ@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gdb-cross-canadian: disable conflicting PACKAGECONFIG variables
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
X-List-Received-Date: Fri, 01 Apr 2016 11:42:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 27 March 2016 at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
> On Sat, Mar 26, 2016 at 5:45 PM, Jonathan Liu <net147@gmail.com> wrote:
>> The PACKAGECONFIG variables in gdb-common.inc don't work correctly for
>> the cross recipes so they need to be disabled.
>>
>> Python support was not being enabled because the python PACKAGECONFIG
>> added --without-python to OE_EXTRACONF.
>>
>> The recipe depends on nativesdk-readline and the readline PACKAGECONFIG
>> just adds an unnecessary extra dependency on readline. The
>> --with-system-readline configure argument is explicitly added
>> to EXTRA_OECONF to ensure we link to nativesdk-readline.
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>  meta/recipes-devtools/gdb/gdb-cross-canadian.inc | 7 ++++++-
>>  1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> index ae97759..952f28f 100644
>> --- a/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> +++ b/meta/recipes-devtools/gdb/gdb-cross-canadian.inc
>> @@ -13,7 +13,12 @@ RDEPENDS_${PN} += "nativesdk-python-core nativesdk-python-lang nativesdk-python-
>>
>>  GDBPROPREFIX = "--program-prefix='${TARGET_PREFIX}'"
>>
>> -EXTRA_OECONF_append = " --with-python=${WORKDIR}/python"
>> +EXTRA_OECONF += "--with-python=${WORKDIR}/python"
>
> should this point to a valid python location ?

${WORKDIR}/python is created by do_configure_prepend()

>
>> +EXTRA_OECONF += "--with-system-readline"
>> +
>> +# Disable conflicting PACKAGECONFIG variables in gdb-common.inc
>> +PACKAGECONFIG[python] = ""
>> +PACKAGECONFIG[readline] = ""
>>
>>  SSTATE_DUPWHITELIST += "${STAGING_DATADIR}/gdb"
>>
>> --
>> 2.7.4

Regards,
Jonathan

