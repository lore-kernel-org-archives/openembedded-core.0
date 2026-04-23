Return-Path: <jonas.gorski@bisdn.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 083B6F589DE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 14:28:40 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21123.1776954511896237850
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Apr 2026 07:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bisdn.de header.s=google header.b=jaP6g73Z;
 spf=pass (domain: bisdn.de, ip: 209.85.167.49, mailfrom: jonas.gorski@bisdn.de)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c0615d6fso554860e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 07:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776954510; cv=none;
        d=google.com; s=arc-20240605;
        b=Qo7F8Fw/s+yUZ84ZvV0sMg6uuupetRaCqxKHlH54CAezqu10Ia+Z847I+sGDj23LXz
         /NMiECgDZvOv+w8aOGEASJ1aReIDoHK0jyK3ZceF1lqUuts8KqncZiF+nXsfk0q2bGiT
         47+VfJXECCsBSi51WTOAcxaSAEW9dB5PI0oisTZ/7Zkc0lmcadeutYiVsVXYn7HQpZWA
         J8XEP7aMRIs9SfW9pAx1eA+us+rkkvpi+R0TniGUqutyvnYD/Lp9XeGJgPN3Oqn0GUEg
         Ze5Y1oQneMn2yXWxlysIZ/uBMGaiTifW/8SQddNoU1LW4Svj3f2HIAyEsx+Dv79pHDjb
         ZYow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=o3M1DkrlKYcQjosrlUra7LdLytBvfakFs7vOj6gVV8k=;
        fh=AWggaWrKTgWJTc+6FkvE3V8kb5xAoFX50Iwj1AleN1U=;
        b=WS8EAlFA8C/LKQvsX8Wtdf4Vuc/CQSGMUTO0iMFrRwZERBEe4lYF25PBJ5CuT7PxvE
         pI95Zfxdldu0KMp0FZIAz2SOzOO978uLQrOjJUtksfStMIMwZg2r4pRYhegKpVj4P3H6
         OYabrnyWe2TW5h85OJyAUhX3GgOGasS0Kd3yHST7xZUEDoVTCco2UntyZSAV6a9kykF8
         7+o9R78wUfscs9TU7Ttz7stVif4zN4lUkzPQZxCD0cNdZSsZlTlT8Jjcbp1bMphIxdgo
         goPv85UPIOFcTSYDjWqX9byBAIoHhj/RJzmFyRAfG0i8jmDgxrNpObpMMyUZDZcX4Xrq
         Td9w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bisdn.de; s=google; t=1776954510; x=1777559310; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3M1DkrlKYcQjosrlUra7LdLytBvfakFs7vOj6gVV8k=;
        b=jaP6g73ZJvSy3tffezHAgAjUsAtP4bHKCbt8cTdlBHP6pdr7kPAY58TugMFP2ApkQn
         0Ie513OC7JLx7A9pCZoIs8NHMuEOAmGVr8r+N9nICnjebGzZ+wKvAKwuoT2wgb0aUI7H
         QRigllLDhrfCR1zw0zxk+ci8QOgJefWazpaWSRAGTjkpcY2sVBxrK21nZczHNnSw7S11
         lMI2BjX2TdPkTPNAdUMy4yHNEZQ9Mvv+AUw1AeFchWN3jdd++oNxWYh3Q/2mvu5Q2Uzs
         EEqggZ433Kvt3kSz+mMk+eHoyEF63nzX5bdqLjDSOE0B66h2/D9FxeJOw43rZFuvobBO
         pyiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776954510; x=1777559310;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o3M1DkrlKYcQjosrlUra7LdLytBvfakFs7vOj6gVV8k=;
        b=VjqoagNQOsPb/s4ccFISD05fWsZKrihjeBw36rc6CkQ4UKzEseXwzubQfbGjYCZwSs
         dHlBaOpguUUv/4rJMXgfpQ6zgwMUk8puClpykk90pW58hOURHCRY5MIvcf/LTUEJdAN8
         JOvYDVq56vdGEXN1W2A4Vy/jJG2VIElmxl/gdUTqootm9TPmVzycwnY4dZoKePG97ssA
         sgYMgijrzrGALM5XqClA4kezOH9IlZhUkGtFCxwF+Waw8elc4W+7acm8AT9+to+X56cW
         OrWKYlANlEu9I0h8+Kn0ea1qTcrc/VAAMSDqHr10kvSwzT6gvdvmnsqJ65//lnvZLVNa
         5TgA==
X-Gm-Message-State: AOJu0YwtNPMp082Fq+yOCJGU/S4v4hb3jrh016nru16vXTP97YQdqZkg
	dqg8J/TIA0Gje0p70n6Qwdk2214Ol7bwPteNaYdxb5OSzO2T6RcYJvog6CEWAyIE7ar81Y+8AmA
	JzW4P6J5E0OptA+D4ux3nxfC6HKCWV/QWIsrHNFguV6WeAng/UQdSQDgoZsjwqivTGHyBBpypWS
	zYXEk6NZrKW/oIX6ZZwnw+APimmbteruHFkKyjBnJ+zE8VutEeyg==
X-Gm-Gg: AeBDieuPdJxGR4rRexBxBWgUacQoKLD/Du1EvYRty9BgqLuSnDuKXxFSSBaEpuufYx4
	hlT8Svid7h/tQ2WaBSZZKwOEBPBUfd67DKAMLsYt0kQbsnFQIcJnzo8PrMNvUUclorZbO686kHu
	r0fc8jCjGIiBCvZpQjegla4PxqE9W0KqacKIU9obWYTkX1aoyAEyDjMXz20ZxtRz3KqHcpH4H8a
	zX2EGzJukReqQLNG3TjVmGugz0T0Q7LjgCFy7vXCDW9+dURubo4nBoEhgzAJi8LEuwwMvW1I+Ix
	GAcE31AyYtvq92I=
X-Received: by 2002:a05:6512:1386:b0:5a4:6f3:dfc with SMTP id
 2adb3069b0e04-5a4172e3181mr3759427e87.6.1776954509735; Thu, 23 Apr 2026
 07:28:29 -0700 (PDT)
MIME-Version: 1.0
References: <20260423092242.324644-1-jonas.gorski@bisdn.de> <CADkTA4NxNp0bJa=hCRqhGacETU1tzJW00Qrd6xE1_5yBx4MNZw@mail.gmail.com>
In-Reply-To: <CADkTA4NxNp0bJa=hCRqhGacETU1tzJW00Qrd6xE1_5yBx4MNZw@mail.gmail.com>
From: Jonas Gorski <jonas.gorski@bisdn.de>
Date: Thu, 23 Apr 2026 16:28:13 +0200
X-Gm-Features: AQROBzD20UDH980HACxsGxCON3sxMcgeDARVl3hHaGW4tzOVdCZbwwUOJ2ViLYM
Message-ID: <CAJpXRYRZwWGN9duNuQnJq9cniAH795VXR=zWPVAV7GJKNKj82w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] kernel.bbclass: copy scripts/mod/modpost to STAGING_KERNEL_BUILDDIR
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Apr 2026 14:28:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235774

On Thu, 23 Apr 2026 at 15:06, Bruce Ashfield <bruce.ashfield@gmail.com> wro=
te:
>
>
>
> On Thu, Apr 23, 2026 at 5:22=E2=80=AFAM Jonas Gorski via lists.openembedd=
ed.org <jonas.gorski=3Dbisdn.de@lists.openembedded.org> wrote:
>>
>> Copy the scripts/mod/modpost binary required for creating Module.symvers
>> as well to STAGING_KERNEL_BUILDDIR.
>>
>> Without this, external modules will fail with the following error:
>>
>> | make -C .../kernel-source M=3D.../selftest-kmodule/1.0/sources
>> | make[1]: Entering directory '.../kernel-source'
>> | make[2]: Entering directory '.../kernel-build-artifacts'
>> |   CC [M]  .../selftest-kmodule/1.0/sources/selftest-kmodule.o
>> | make[4]: *** No rule to make target 'scripts/mod/modpost', needed by '=
.../selftest-kmodule/1.0/sources/Module.symvers'.  Stop.
>> | make[3]: *** [.../kernel-source/Makefile:1906: modpost] Error 2
>> | make[2]: *** [.../kernel-source/Makefile:224: __sub-make] Error 2
>> | make[2]: Leaving directory '.../kernel-build-artifacts'
>>
>> Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
>> ---
>> I encountered this on master with a custom kernel (at 6.12), for
>> context, which is mostly vanilla except for some additional platform
>> support.
>
>
> We need a better reproducer than this.
>
> because obviously, this is working fine for external modules over quite s=
ome time.
>
> Which means we really need to understand what timing issue, or something =
else, that
> was triggered.

Hrm, I can't reproduce it anymore, so feel free to disregard this.
Might have been some transient issue while fixing up recipes for
master.

Best regards,
Jonas

--=20
BISDN GmbH
K=C3=B6rnerstra=C3=9Fe 7-10
10785 Berlin
Germany
Phone: +49 30 610 816 100
Managing Directors:=C2=A0Dr.-Ing. Hagen Woesner, Andreas K=C3=B6psel


Commercial=20
register:=C2=A0
Amtsgericht Berlin-Charlottenburg HRB 141569 B
VAT ID No:=C2=A0
DE283257294 <http://goog_1008408251>
=20
<https://angacom.de/en/visitors/tickets>




