Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web08.19373.1622947348447613320
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Jun 2021 19:42:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ok91CjqO;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: jupiter.hce@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id i4so19695183ybe.2;
        Sat, 05 Jun 2021 19:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gGvJXY/5S5lD3qhoQR1VpChZke3NCBHRCrwfn+WuCJM=;
        b=Ok91CjqOsK4QP9gwPvDvpNUk4T2H4ZBlWwpHxZIZCjrYQiOca6Un50ihyQnrdHOn5m
         ZCWOwodD9ou/7FEPtDNor4/9y1XaV+Rq5A9s+9hLC1H3oZCmHzPPsZBNZJkNvw/e9p6z
         6wL7vaMo15rYo2a/yQrjwJiz81asTv+qCB2yvGerwNcRANTYP6vP4q19R5ryIKDJAFrl
         VFxpRpUrHjY8r67o78VU2PoR2PdL1i5F7woDsOs868d6Dzkaz9WZAVhYoX/2uMLXaZDW
         Fn7l9h5Kf1l0WOLXSTvOqsFAejuFhFagRz8y5G4vqV50my1RQDzlaxgEx8a3fuyBrprr
         Qxwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gGvJXY/5S5lD3qhoQR1VpChZke3NCBHRCrwfn+WuCJM=;
        b=DtZ1DmHk0JJlXXYGM7InP72tFHxn/ojiIhS0lIu/o7p4BU7RXM4IV3OAh676atuoxZ
         6lTidC+hUI+wLvj2qNfl28SEyeNRNlly9vDKNWq7cx9TR+OCsOzhRtI2RO3DY2GXSoKh
         OqY08Vs2am+/I9LoJ00LhNnt27CB13UN03UK55zn0nUSNsQs8rnVhq8EY3vJ/QeMs6bu
         8FhNbAVjMXOcxW6JYOIYEobMkAykDR3feF38LObsajudUro1FMT9pdAjtbqjSHtRwpD5
         W4NCyDCVVBMnBrN2sas0B3yqO2PbhOXN1qqgr/fJq7KifWKm9hB5j9EKAnw4lu5dreMh
         sIaA==
X-Gm-Message-State: AOAM533xXWCVCii/CgpE/xZJSKPR41WohuhMogUS/ShN1+F7R1glGayG
	T7Yb88dgJNH/un88bXGjXETyPdOkOtCI1RBOwcs=
X-Google-Smtp-Source: ABdhPJxEWI3sSMO5bSzfaZF3dbNR5hsA+aImVco/BbzjaL4CRE9fTNSCbLb/g6ulr8c0MqqbmPow1irmfTPPZIToQq4=
X-Received: by 2002:a25:f208:: with SMTP id i8mr14630719ybe.340.1622947347590;
 Sat, 05 Jun 2021 19:42:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAA=hcWQ7vordSRwq-O2+8b5FV79EKHZM6s-dq49EWt6Ra5Owdg@mail.gmail.com>
 <06B2DF82-ACFE-4503-8174-39163A7DF959@0leil.net>
In-Reply-To: <06B2DF82-ACFE-4503-8174-39163A7DF959@0leil.net>
From: "JH" <jupiter.hce@gmail.com>
Date: Sun, 6 Jun 2021 12:41:51 +1000
Message-ID: <CAA=hcWQT-G5+92u8=4=u_aBLmREMUkNLm+y0hNvCOkvAu4_g6Q@mail.gmail.com>
Subject: Re: [yocto] Is it a bug or it does not support device tree /delete-node/?
To: Quentin Schulz <foss@0leil.net>
Cc: yocto <yocto@lists.yoctoproject.org>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks Quentin, that did the trick.


On 6/5/21, Quentin Schulz <foss@0leil.net> wrote:
> Hi,
>
> On June 5, 2021 12:43:19 AM UTC, JH <jupiter.hce@gmail.com> wrote:
>>Hi,
>>
>>I am building following imx6ulz-kobs.dts file to a dtb in zeus:
>>
>>$ cat imx6ulz-kobs.dts
>>
>>#include "imx6ulz.dts"
>>
>>/{
>>  model = "customized imx6ull";
>>  compatible = "fsl,imx6ull";
>>};
>>
>>&gpmi {
>>    /delete-node/ fsl,use-minimum-ecc;
>>};
>>
>>The building process was fine, but that fsl,use-minimum-ecc in dtb was
>>not deleted, is it a bug or it does not support  /delete-node/?
>>
>
> fsl,use-minimum-ecc is a property not a node, you need to use
> /delete-property/ instead, c.f.
> https://devicetree-specification.readthedocs.io/en/latest/chapter6-source-language.html?highlight=delete-property#node-and-property-definitions.
>
> Cheers,
> Quentin
>


--
"A man can fail many times, but he isn't a failure until he begins to
blame somebody else."
-- John Burroughs
