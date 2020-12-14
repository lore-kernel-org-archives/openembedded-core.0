Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com [209.85.167.65])
 by mx.groups.io with SMTP id smtpd.web10.32586.1607942981651037401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Dec 2020 02:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sYJOVLv1;
 spf=pass (domain: gmail.com, ip: 209.85.167.65, mailfrom: outbackdingo@gmail.com)
Received: by mail-lf1-f65.google.com with SMTP id l11so29020791lfg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Dec 2020 02:49:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IzLoFmOkBLd7wtRo+olqdIJnb0TIc5FqIk9PSS2gqz4=;
        b=sYJOVLv19ynOvfIqS5QOIzLV/VJh3fXSZbFqLZgdYs5rP3SMZxygqFmfQZbz9owTGK
         y4jUoWL0WWhm1j85mRtK2N8P8YPcUJ36cpkTLLO41sBBOT2IOuJmUKyjPF0yliJXiiAE
         kTL6NwDOX2ZiBmlWFBCadbdY7Pe2KdJx4kUTd1FnZQ9oCE0IlxzBpgFptsmktIH0gadx
         sbL09zexvEUVsAji0njPDmxToWuAR8epRm4WYyGKuVrplff98WOGQYrHXugKsFpmJzL8
         cyqMsBCn6xpZ11LodxpLcyFidyj3bR7DXRPad5o2L5cWCWcaNCAIp/8pYRB7cHYzS6Bv
         qjwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IzLoFmOkBLd7wtRo+olqdIJnb0TIc5FqIk9PSS2gqz4=;
        b=KhEZR3Yw2sxzGS/kBKPlyAoDyEeXhbJXadNR8XX3439clDWd67BKANI7bbcq/vOBlv
         lD3rmsBYJ4QlmZhbaXQY7IZ+diTJuqmgqKOgoQgIR/fgWrOj38dcrxjJzqyQIwNj9aVJ
         WcGYW3SPOlSTRYHGUIJ3ZOzvziGFiQigz0MESjtopQbMSdWMYcTGsE5IVzZX7JKqv3FC
         3FxpU2hkptI0oz3A8S64WqBnAgkTf/ACg3uoX1Dyoy25Ckg0xxdfJz+3ydK4qtiPLrg/
         yhzF7VoCzA/ydbMl17a41CsSlUivJrdHS436yByQSerIdJBkL7Dkgvm1rBxBf0Y4TIio
         J6kA==
X-Gm-Message-State: AOAM531xCvZKr6FmF+nUy3LpLMjs+XASgfkFvzsNi0aCn/XJtPBwKpYn
	Ofju4h9kb35Eda0QN2UVTV5fMZLronXXEBjMkGY=
X-Google-Smtp-Source: ABdhPJwai7B2/2NA8Q/VpuwJfTjE5OcpR2MDpSr4+GEi1R4ndqlbFQE8higDlqFjhoVqIR6InXYoyuWUIxQWNNdtdQU=
X-Received: by 2002:a2e:8250:: with SMTP id j16mr2056480ljh.354.1607942979954;
 Mon, 14 Dec 2020 02:49:39 -0800 (PST)
MIME-Version: 1.0
References: <20201214103248.2227-1-outbackdingo@gmail.com> <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
In-Reply-To: <CANNYZj_EoiG+MXJ-fjsZ8YsxwRhD6SSwv9xXLTzw3PMTvBqXdA@mail.gmail.com>
From: "Outback Dingo" <outbackdingo@gmail.com>
Date: Mon, 14 Dec 2020 17:49:03 +0700
Message-ID: <CAKYr3zzDd02Q8A7X3zBRRczFHwxCHL-rcpqtCv+OX15sn37tSA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] file /etc/ethertypes conflicts between netbase-1:6.2-r0.corei7_64 and ebtables-2.0.10+4-r4.corei7_64
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 5:39 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Sorry, but you need to explain why the file from from ebtables (an optional package from a 3rd party layer) takes precedence over file from netbase (which is a core item).

I happened to run across it using poky and it was suggested i send a
patch, the fact it conflicts with an optional package, well i guess
Ill have to look at both, might just be that
it should come out of ebtables, either way i hit it due to the recent
change commit in netbase_6.2.bb telling me it was not previously there
until you actually added that line this month!

git show ba069a5a3dae374744f68a57ab9e7869167beb2b

-SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}~bpo10+1.tar.xz"
-S = "${WORKDIR}/${BPN}-${PV}~bpo10+1"
+SRC_URI = "${DEBIAN_MIRROR}/main/n/${BPN}/${BPN}_${PV}.tar.xz"

-SRC_URI[md5sum] = "4fa7517285b4045ac0dc8dbf6730dd7a"
-SRC_URI[sha256sum] =
"4e9c3082dff8896cb6b6bea9bb2200d82fb0d7c8d8c8fc9b18704fe553316237"
+inherit allarch
+
+SRC_URI[sha256sum] =
"309a24146a06347d654b261e9e07a82fab844b173674a42e223803dd8258541e"

 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/n/netbase/"
-do_install () {

-       install -d ${D}/${mandir}/man8 ${D}${sysconfdir}
+do_install () {
+       install -d ${D}${sysconfdir}
        install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
        install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
        install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
+       install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
 }



>
> Alex
>
> On Mon, 14 Dec 2020 at 11:33, Outback Dingo <outbackdingo@gmail.com> wrote:
>>
>> ---
>>  meta/recipes-core/netbase/netbase_6.2.bb | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/netbase/netbase_6.2.bb b/meta/recipes-core/netbase/netbase_6.2.bb
>> index a54d2e7764..262b2cf1bc 100644
>> --- a/meta/recipes-core/netbase/netbase_6.2.bb
>> +++ b/meta/recipes-core/netbase/netbase_6.2.bb
>> @@ -19,5 +19,4 @@ do_install () {
>>         install -m 0644 ${S}/etc/rpc ${D}${sysconfdir}/rpc
>>         install -m 0644 ${S}/etc/protocols ${D}${sysconfdir}/protocols
>>         install -m 0644 ${S}/etc/services ${D}${sysconfdir}/services
>> -       install -m 0644 ${S}/etc/ethertypes ${D}${sysconfdir}/ethertypes
>>  }
>> --
>> 2.20.1
>>
>>
>> 
>>
