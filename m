Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E37F0C369D9
	for <webhook@archiver.kernel.org>; Wed, 30 Apr 2025 09:54:49 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.13094.1746006886394180867
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Apr 2025 02:54:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V4qW3pdj;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6f0c30a1cf8so105939346d6.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 02:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746006885; x=1746611685; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko5nRCgoaasIE5NFmO97S/3RG8AmJ64kZUuW0A/2G8U=;
        b=V4qW3pdjKCqbTM1GhDLN4vTo5tzZjIhLaTdz9AQ4q92oRoRsv4SWa6yPzZiXLTXRL8
         gBJSacK7kz68p3LtYi0b1fe44xsx5fts1PjIO3C6UlBBKhXQkwb52nsftL2uPZHGGcL8
         MOH/GjmomazZrWSEW4qGVkeaG83hVMBvER7cG0Pm8MLBFrRJvp3N7ow5dAeuAVYlaNBY
         H8hDp7t42jweJ3bmdFag4fflOY+4wasyJV8Ftv33gjy3+H//r7irceQ2Zpw/GVIgDl2y
         A09G3Y8SuSY5+Btgzo2j5szDeC+5HyvrjnQMt4F0Z+R89jrEdLTJaNdM1qKD+hMQ7ns/
         FOLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746006885; x=1746611685;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko5nRCgoaasIE5NFmO97S/3RG8AmJ64kZUuW0A/2G8U=;
        b=sVvYwZIZM8mprkS53YSH8fv2N6KbVrq8hUxZHtCSr/xqbl9MId19eVMhtAoxlfxIeh
         jtogr0aydziMQT5RTQZlxSvad8OWBJNaP9fDTZrpfzHdz2u/spRRvSCEJlDojL2qSabU
         eAOL8mOVGyBBpwF22iskdOy87Gi9k8XJhHFtQAXPsyfqllLdYNiZWGPvXhempeiKQ9mE
         e/eYAouXad7d1b6v7Xbc3plfExx6HFS/QaB2pKf6jMbkP/WdbtQFKqs7DvMtWiFS+cDx
         y/KWWrZtAVshOTuBBONODWgKjFzhgw8Zn4PGxjeFz5TduIb0fpc3WnoiGGiF1kVQDQHr
         W6DQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0RF5jBF2yg2Oh+gDD4HnON3OpGYqVUc9ahbqm1p2FaewTr6SfHa2uQf5AB+eBVc0AuCXbShCeLnf56SrEk7fjag==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywdz2tmApmRGyA51wQ++AgAnMlw8s4vmzQZxzyQ73HvB9YbEtO0
	aOvWyQ7AK4RXVphtge1kotIGyzJmQb6ANgGGl8loDNlkyQwd4Jm57Ut6ELGx+m8lSrHPGh1GybI
	o9OcydT23pnZMU3cIaNRwEgjJ0/Y=
X-Gm-Gg: ASbGnctDQgWLRTZIunTobwXioc2gbvpEAwkcaOxSgZKCcYXraNRqE//tHlOAObZ5Me9
	CyOsCI88CALVmIorzEq9WQ0t3pBLdKFQ6Qu9bSL2JnepwblUO3r02C8FR+CF1o/9uBM8YMQv47J
	LUj3ldqU8zLH1SWksZXUvp1SdiT9F5JBDrku7NDfEeQ/G+JkuhfMnalQQL
X-Google-Smtp-Source: AGHT+IENES/BIq3cAoCZQgHGdj9yY8UZhaUNqXcR41ANzN26s5T+XApw+QWgi1RNDinrWSPi7qVEEGuNrC1toi0LC/E=
X-Received: by 2002:a05:6214:509d:b0:6e8:ede1:237 with SMTP id
 6a1803df08f44-6f4fcfcc20bmr38770846d6.43.1746006885494; Wed, 30 Apr 2025
 02:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250428174416.379821-1-tgamblin@baylibre.com>
 <20250428174416.379821-3-tgamblin@baylibre.com> <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
In-Reply-To: <DFBD12CD-630F-4D62-9655-1F262813F9E6@arm.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 30 Apr 2025 11:54:33 +0200
X-Gm-Features: ATxdqUGFYRu93KFmIfb5du5aFllZe_Mk-Vxngb3V1wC22DPaF5euDrNB7-SIYQY
Message-ID: <CANNYZj8SECgw5Qoef2iqaOb9mtyOK2C4Gub8NjF6qXPDAWQ=3w@mail.gmail.com>
Subject: Re: [OE-core][PATCH 2/2 v4] python3-numpy: fix ptests
To: ross.burton@arm.com
Cc: "tgamblin@baylibre.com" <tgamblin@baylibre.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Apr 2025 09:54:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215736

On Tue, 29 Apr 2025 at 14:57, Ross Burton via lists.openembedded.org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> On 28 Apr 2025, at 18:44, Trevor Gamblin via lists.openembedded.org <tgam=
blin=3Dbaylibre.com@lists.openembedded.org> wrote:
> > - Add gcc and meson as ptest RDEPENDS in the recipe;
>
> Personally I=E2=80=99d prefer to skip a few tests than pull in GCC and Me=
son=E2=80=A6

That ship has sailed. Gcc is required in many other ptests, and so
building it is pretty much inevitable when they are enabled.

Alex

