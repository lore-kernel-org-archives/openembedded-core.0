Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web12.2710.1600129891341888016
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Sep 2020 17:31:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lwI6qz3t;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id r8so1838828qtp.13
        for <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2020 17:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8vekM4edohoJ0TK4dddbu6Ci70/ONDoE8WFmr5FanAs=;
        b=lwI6qz3thoKGew9Beu7JLOt327hjCRS8FVsAB0pR2hFjdXmSTrmRiQFZYrPafyW0ur
         4kZFs0sY2xZuvEhLTRSKA7u10w3NMHUSyoCtLW4DPbFRepIjpKtZl1fXmhcSODdwcVBY
         4xIuaQwB9YWKJqvO/FDXd6M03mA5CyeSWq9xCmwRoQhhtRhwr1Qqqwr5kqU1ARZO4Nzi
         YD+k/hitHI+ScCjvO8I3fGP6nblynB7D6X7ZymIkJUMaBWVqF+7aPAt0/PwyCW0vZYcv
         7HdizMUtE+ddK+bQS+lEcebgnOsArN/NGWHy/Ev7DtV/7LPAB4g+KRwWQmBfXeEPqoYs
         c+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8vekM4edohoJ0TK4dddbu6Ci70/ONDoE8WFmr5FanAs=;
        b=SjV5dWcvlNtT38UNIQAsWj6783XyLrrw2/RFfDHcQma4SX/Y5HbDoYDDr12b4zEY3m
         kPz6cWNOg7dK2X25ADIGkUtdORFQeAePLmHDhy0BptsYHYW0aol6ruwpMMYrMXMhU0fw
         UdDQ6Q0zdjNaaxa+COOrS5edVFTnNk3CLI4rrPnBDVjptFgE8jOHx4W8My15vIyar3Yg
         5mipidqTrpebC53bKFvzmp/jymaHh/415IZ61aQ6OKBth09EgLEhPJICCqZ/dTRe7+uO
         SwCv3xrPnTD0QFrkH+BOW8g4Tyo3zNCZoAyompFwRlohzJZX0unCVdTXUd1VV7i9Kw0Z
         lvMw==
X-Gm-Message-State: AOAM533or4O1pEETr6+19rh1APwasmxIouYiIZkd9T2Fz2Ge97scvEBV
	isMm2ULibxQXmYa2SzRytPIYV3zg1bJs8yAZ/5A=
X-Google-Smtp-Source: ABdhPJwCafE5KgIuXKJukQZY4MHoFFW1/DOQqSKbLR1S9FF3h9e8ZWPu2mpfZhID72x3IN0pjW+PSDWERRLAg9WwsT4=
X-Received: by 2002:ac8:120a:: with SMTP id x10mr15525341qti.88.1600129890397;
 Mon, 14 Sep 2020 17:31:30 -0700 (PDT)
MIME-Version: 1.0
References: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
In-Reply-To: <08f090d6-65c6-da98-ac7f-a2bc803c805a@taitradio.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 14 Sep 2020 17:31:04 -0700
Message-ID: <CAMKF1soFHoBkMBQTtp7YXjxgzy1uyQQS=CePsOrOf_9BWV5chA@mail.gmail.com>
Subject: Re: [OE-core] nativesdk-linux-libc-headers with two different MACHINEs
To: Douglas Royds <douglas.royds@taitradio.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I think MACHINE should not matter for nativesdk packages. Does
something like this work

diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbcla=
ss
index 7f2692c51a..bb1dfd84c0 100644
--- a/meta/classes/nativesdk.bbclass
+++ b/meta/classes/nativesdk.bbclass
@@ -10,7 +10,7 @@ LIBCOVERRIDE =3D ":${NATIVESDKLIBC}"
 CLASSOVERRIDE =3D "class-nativesdk"
 MACHINEOVERRIDES =3D ""
 MACHINE_FEATURES =3D ""
-
+MACHINE =3D "${SDKMACHINE}"
 MULTILIBS =3D ""

 # we need consistent staging dir whether or not multilib is enabled

On Mon, Sep 14, 2020 at 5:13 PM Douglas via lists.openembedded.org
<douglas.royds=3Dtaitradio.com@lists.openembedded.org> wrote:
>
> For the experiment, I wanted to see whether I could achieve no task sign=
ature change when building nativesdk-glibc for two different MACHINEs, but =
I found that the do_install sigdata for nativesdk-linux-libc-headers change=
d. We're installing the linux-libc-headers for the build machine, so it see=
ms to make sense to take control of the TARGET_CC_KERNEL_ARCH:
>
> diff --git a/meta/classes/nativesdk.bbclass b/meta/classes/nativesdk.bbc=
lass
> index 32c3aa32ad..655439dd73 100644
> --- a/meta/classes/nativesdk.bbclass
> +++ b/meta/classes/nativesdk.bbclass
> @@ -47,6 +47,7 @@ TARGET_VENDOR =3D "${SDK_VENDOR}"
>  TARGET_OS =3D "${SDK_OS}"
>  TARGET_PREFIX =3D "${SDK_PREFIX}"
>  TARGET_CC_ARCH =3D "${SDK_CC_ARCH}"
> +TARGET_CC_KERNEL_ARCH =3D "${SDK_CC_ARCH}"
>  TARGET_LD_ARCH =3D "${SDK_LD_ARCH}"
>
> Which leaves me with:
>
> basehash changed from 42ed3480096bb7ea53b60dc876da0613 to 38ea60bdac0416=
73f2c491d7bbabe17c
> Variable MACHINE value changed from 'qemuarm' to 'qemux86-64'
> runtaskdeps changed:
> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:natives=
dk with hash cbb186fe33cd69cb0b06384e4d50a244
>  changed to
> linux-libc-headers/linux-libc-headers_4.18.bb.do_compile:virtual:natives=
dk with hash 4d34d6981b79d0fccc768566bf2fa533
> Hash for dependent task linux-libc-headers/linux-libc-headers_4.18.bb.do=
_compile:virtual:nativesdk changed from cbb186fe33cd69cb0b06384e4d50a244 to=
 4d34d6981b79d0fccc768566bf2fa533
>
> The configure and compile tasks for linux-libc-headers are both set to n=
oexec. For the experiment, I added an empty do_configure task, with this re=
sult on the do_configure sigdata:
>
> basehash changed from f13c2a2066fa48f0ccac35c085537c71 to bb13f2b1b1e7e6=
666376f3fb5a8ec888
> Variable MACHINE value changed from 'qemux86-64' to 'qemuarm'
>
> What to do? Why is the MACHINE variable included in the task signature (=
it is unset in run.do_configure)? Adding it to BB_HASHBASE_WHITELIST had no=
 effect. What am I missing here?
>
>=20
