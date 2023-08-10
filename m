Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF242C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 14:09:16 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.17981.1691676548225633343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 07:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20221208.gappssmtp.com header.s=20221208 header.b=KYmDzUWU;
 spf=pass (domain: ossystems.com.br, ip: 209.85.160.48, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1bfca0ec8b9so854783fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20221208.gappssmtp.com; s=20221208; t=1691676546; x=1692281346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6Iosm7h0PS+6W4loJxXyqtSxK1ZCoDsYdQsODP4m0Uw=;
        b=KYmDzUWU20T8V4ECFuEs7UswKjoxzwHtYghub7NQlXukBs4jzOIRf789esza0Fg6hk
         MqLt63UemQK3y1qWuzoFUG40rtqiMSyY3K13XJSSWSwylA9XwBGLC6NT25fS/0CcUpfZ
         c2Rw02kHtJb9u2uuyPCgfMHniQyD0/yK3/98RGm+YLgSJ8Lxeu6zX7kPAGAqORLDDhOc
         40ejnfDDZMUmLbC0XPD4jXSBTZy7Mjyf1HqAxx8FQSTAAwXDdvcDOmBV3PhC3QzSfvaG
         06YMAP0pHsSE4MNDkLYaRPsD41MAP0rpbIUwP9XUJufncdeGUGPRuAKvu/EeRbU6Y/xO
         3A/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691676546; x=1692281346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6Iosm7h0PS+6W4loJxXyqtSxK1ZCoDsYdQsODP4m0Uw=;
        b=BFhQ42tAlfxfadDjXdR+CSuG86Och9j/4wR4QVXQ9hCb5T/YN+z5do8smNQdpX5sxi
         w5B9yH3aGc/tSVPxncLJT4AFriJtOP1bbhecV6UHSYBjjoF/4QdbSLxcAiYHCSjkIMir
         l+RqOBZLpG+DVN7VI4KziCDJb/dy6xe3qCCHnm9kJ6JdhLXFdc+CZjAmfqPY+Z7FYBPO
         egSkskVbPDCKNQGkNG6EZbCSCZdUHiw1Y0FPSxmruvcQIyka/7mmPWM3H2EGKB3uP21J
         f00gA04Ea9/L/Ht+PdWr1NDEvrN+mWt3Xw/2mNtFMoxtfFWQ8mlfgyUoOrJ8DOL40TuS
         Qvcg==
X-Gm-Message-State: AOJu0Yyo+D49fWjImcoSzRz17x4t/h66kDWyLK0CY1htY+lwkPA6VdlP
	KRkW1g6NxAA+73TS1KebhdyiS8ttKhGTT48F5sD45g==
X-Google-Smtp-Source: AGHT+IGQzwB7JnXG1johUF5Pk54Cu5yr7SefTPubE4i6YbEJ2tn6Z7J2V4EFe0DyPQ+VvppzfJ2ppw==
X-Received: by 2002:a05:6870:d355:b0:1bb:a912:9339 with SMTP id h21-20020a056870d35500b001bba9129339mr2846698oag.7.1691676546700;
        Thu, 10 Aug 2023 07:09:06 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id e8-20020a056830200800b006b8a959ac32sm675514otp.48.2023.08.10.07.09.06
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Aug 2023 07:09:06 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3a412653352so755647b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 07:09:06 -0700 (PDT)
X-Received: by 2002:a05:6808:1416:b0:3a7:d857:c5a3 with SMTP id
 w22-20020a056808141600b003a7d857c5a3mr923382oiv.20.1691676545777; Thu, 10 Aug
 2023 07:09:05 -0700 (PDT)
MIME-Version: 1.0
References: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
In-Reply-To: <3faef71d-caaf-3d10-a894-5dec092d0d3c@bootlin.com>
Date: Thu, 10 Aug 2023 11:08:53 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrPjcsSn6FViwUSTOe8CLm-J+1YAEcnb4hdUraNEw3=Ww@mail.gmail.com>
Message-ID: <CAP9ODKrPjcsSn6FViwUSTOe8CLm-J+1YAEcnb4hdUraNEw3=Ww@mail.gmail.com>
Subject: Re: [OE-core] Keep scripts/create-pull-request and send-pull-request ?
To: michael.opdenacker@bootlin.com
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 14:09:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185749

Hi Michael,

Em qui., 10 de ago. de 2023 =C3=A0s 11:04, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=3Dbootlin.com@lists.openembedded.org> escreveu:
>
> Greetings,
>
> I'm reviewing
> https://docs.yoctoproject.org/next/contributor-guide/submit-change.html#u=
sing-scripts-to-push-a-change-upstream-and-request-a-pull
> and trying to simplify it.
>
> Do people still use scripts/create-pull-request and send-pull-request? I
> see some obsolete URLs in the first script, and mostly old commits to
> their code.
>
> I'm also asking because I'm wondering whether it's better to document
> how to create and send pull requests from standard git tools. This way,
> people also learn how to submit pull requests to other upstreams.
>
> What do you think?

I completely agree that documenting standard git tools is a great
idea. This way, people will learn how to submit pull requests to other
upstreams, which is always a valuable skill to have.

Best regards,

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

