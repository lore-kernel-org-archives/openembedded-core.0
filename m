Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.888.1600124066680734263
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 15:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=huKCJSPJ;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.193, mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f193.google.com with SMTP id u18so1138800iln.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 15:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pE0mi2qSGYnuM0DQx/BPDSftNdFiRcWeig0VVuEa3ms=;
        b=huKCJSPJhKZc/A7HbZXPG5Fjr5LIZpU/17rY6eyIViMIVmTB78JNwLou1O7KcF1eNj
         oxRXf7rsSsOd4YqWF7Kpn0x2c2V8OHOH9fvO14NVEhwnTmjynnfUXx4JZSGaChp36Aw9
         qzVV/K1UkDb9FGK6ge6AhE6tvDguFmqtpMnJ/XDqCuOXBnhbtBPIoRhvUHQMEYIo1JU0
         1SZPBK7RCYZhmiRp8/t1gcxjh3S2iCxOUN2TwXB93khUFWNA30s+Xdz2GLd1FRvAOzMa
         yh8W7WrFYxIEebHmxvBGYwbDfDHj9vCaPpmt8IHytNR2YJ95hFFte8s71S8JP4DDcN7B
         fiNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pE0mi2qSGYnuM0DQx/BPDSftNdFiRcWeig0VVuEa3ms=;
        b=ksG4/NsJST6zhabMuHD63HUt/hkp5katjIoCeISje1ZX7pA4Qb+0zU1BrmEYEOIwcY
         rJJdEcUE/Q/JuuQb6Hukk+4MxtddWO7viOvMzIzteZLTC5UvY/eH3f60bkIpbhdfGU52
         FqpiC0voO4q17/7IhdoTCHMXFIwaDoxSJ5pGNAzYmbeIt9YoAgMLJvLNg5t8rw1ccO+p
         ZFy5BU5jG48o38CY3BPIdjC0e2XJY/icWK3nAeFd2ttLHqd/oZMt8Bv6zKA9kWKfwLD1
         5QEeskhAH2ZrqaLKbIpavDL4wDTb2XDrsQPkJWuJ1kxI2sCi3+Zh8S2w9SXJHUvditJ1
         Fs+w==
X-Gm-Message-State: AOAM533x7m5chJGV2oaQa0Ho1c4SzRs6eMQ03y6Mm65rmHhoSpVkls7L
	8r6Hul0J4ehkLOmN7ejMeXTfV8tgD9vVb/0EsVSPgw==
X-Google-Smtp-Source: ABdhPJwaBPKfiW3/UHWtMG7ThNZCQmx1u0ehJ+gwcSvUUo0Y0+RdeebEgLpskVKB6YDVwbaDhI+FJeq2+IixWsIhU70=
X-Received: by 2002:a92:60b:: with SMTP id x11mr6217924ilg.163.1600124065783;
 Mon, 14 Sep 2020 15:54:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200914151359.11240-1-jon.mason@arm.com> <CA+chaQfAL+mvyG7smtku8za+6fvubybjjpOfu+g6dGfrJSoWJA@mail.gmail.com>
In-Reply-To: <CA+chaQfAL+mvyG7smtku8za+6fvubybjjpOfu+g6dGfrJSoWJA@mail.gmail.com>
From: "Jon Mason" <jdmason@kudzu.us>
Date: Mon, 14 Sep 2020 18:54:14 -0400
Message-ID: <CAPoiz9wQ684w=CDhKpQdcLG5K-4fmJ=dF_-Oi39PqsHbxeX9Rw@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH 0/5] ARMv8 Tune reorg
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2020 at 11:32 AM Martin Jansa <martin.jansa@gmail.com> wrot=
e:
>
> > This reduces the number of files from 12 to 2 for ARMv8a, and that is =
excluding the 13 I am adding in this series that would otherwise be unique =
files.
>
> I don't have a strong opinion on this anymore, but is the number of the =
include files the issue here?

This is the reason why I'm doing it.  Arm needs to support all the
cortex-a and cortex-m cores.  This would make the majority of the tune
files for only Arm cores.  We could move them into
meta/conf/machine/include/arm and not make the level down directory so
messy, but I think this is cleaner.

> I think the issue is the number of possible combinations and using the s=
ame TUNE_PKGARCH for different tunes (unlike 32bit arm tune files which use=
 different). Bundling all these combinations in fewer include files doesn't=
 IMHO improve it.

The multitude of combinations and redundancy code entries makes it
very error prone.  By putting them all in the same file, it makes it
much easier to see the differences in entries and catch errors.
Longer term, I'd like to see something that removes the redundancies
completely, but it will take some work.

> With 32bit arm include files it was useful to be able to compare various=
 include files to check that they follow the same "structure" (or to add ne=
w cortexa* one by copying existing and regex-replace).
>
> Also AVAILTUNES will now contain all possible tunes from given family (w=
hich makes it almost useless for aarch64 tunes). So instead of BSP includin=
g .inc file corresponding with the core used in the MACHINE and getting som=
e "sane" default DEFAULTTUNE (plus some other possible options listed in AV=
AILTUNES) we now force every BSP to set more specific DEFAULTTUNE and then =
let user figure out what other DEFAULTTUNEs might be compatible with it, e.=
g. when someone is doing multi MACHINE builds and wants to share TUNE_PKGAR=
CH between them (to save build time, package feed size etc).

You can still set a generic default for all the machines of a given
family.  By including armv8a.inc, you still get 'DEFAULTTUNE ?=3D
"armv8a-crc"'.  This will allow for a generic for an entire family.
I'm not seeing the issue.

Thanks,
Jon


>
> Cheers,
>
> On Mon, Sep 14, 2020 at 5:14 PM Jon Mason <jdmason@kudzu.us> wrote:
>>
>> There is a large number of Arm Tune files located in
>> meta/conf/machine/include/, and to support the current and upcoming Arm
>> cores, more are needed.  Adding more files is simply going to make it
>> harder to find the relevant ones for an OE/YP developer/user.  Also,
>> there are problems with stale and erroneous configs (see my previous
>> series), which will only be exacerbated by having more files.
>>
>> I am proposing a reorganization of the existing tune files by including
>> them in the generic family include file.  For example, the
>> tune-cortexa55.inc would be moved into arch-armv8-2a.inc, and
>> tune-cortexa57.inc would be moved into arch-armv8a.inc.  This reduces
>> the number of files from 12 to 2 for ARMv8a, and that is excluding the
>> 13 I am adding in this series that would otherwise be unique files.
>>
>> To use, simply add
>> ...
>> DEFAULTTUNE ?=3D "neoversen1"
>> require conf/machine/include/arm/arch-armv8-2a.inc
>> ...
>>
>> Which is arguably what should be done anyway (instead of taking the
>> default of the tune include file).
>> See the qemuarm64 patch in the series for a working example.
>>
>> Of course, by removing the existing tune files, current users are going
>> to break.  A simple script can be written to use sed (or similar) to
>> replace the relevant parts for those users that would be affected (at
>> least for those that are in the layer index and update regularly).
>>
>> Thanks,
>> Jon
>>
>> ---
>>
>> Originally sent as a RFC in
>> https://lists.openembedded.org/g/openembedded-core/message/142324
>>
>> Given the generally positive feedback, sending as a patch series.
>> Keeping the "hard fail" of the file removal (per Richards comment in
>> https://lists.openembedded.org/g/openembedded-core/message/142356).
>> Only difference of note is the removal of the "arm64: set BASE_LIB to
>> lib64", as there needs to be more investigation (see
>> https://lists.openembedded.org/g/openembedded-core/message/142414).
>>
>>
>> Jon Mason (5):
>>   arch-armv8-2a.inc: Add Cortex-A55 tunings
>>   arch-armv8a.inc: Add existing tunings
>>   qemuarm64: change tuning
>>   arch-armv8a.inc: Add tunes for supported ARMv8a cores
>>   arch-armv8-2a.inc: Add tunes for supported ARMv8.2a cores
>>
>>  .../machine/include/arm/arch-armv8-2a.inc     | 175 ++++++++++++++-
>>  meta/conf/machine/include/arm/arch-armv8a.inc | 206 +++++++++++++++++-
>>  meta/conf/machine/include/tune-cortexa32.inc  |  18 --
>>  meta/conf/machine/include/tune-cortexa35.inc  |  17 --
>>  meta/conf/machine/include/tune-cortexa53.inc  |  18 --
>>  meta/conf/machine/include/tune-cortexa55.inc  |  13 --
>>  .../include/tune-cortexa57-cortexa53.inc      |  15 --
>>  meta/conf/machine/include/tune-cortexa57.inc  |  17 --
>>  .../include/tune-cortexa72-cortexa53.inc      |  20 --
>>  meta/conf/machine/include/tune-cortexa72.inc  |  13 --
>>  .../include/tune-cortexa73-cortexa53.inc      |  20 --
>>  meta/conf/machine/include/tune-thunderx.inc   |  19 --
>>  meta/conf/machine/qemuarm64.conf              |   3 +-
>>  13 files changed, 371 insertions(+), 183 deletions(-)
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa32.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa35.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa53.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa55.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa57-cortexa53.=
inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa57.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa72-cortexa53.=
inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa72.inc
>>  delete mode 100644 meta/conf/machine/include/tune-cortexa73-cortexa53.=
inc
>>  delete mode 100644 meta/conf/machine/include/tune-thunderx.inc
>>
>> --
>> 2.20.1
>>
>>=20
