Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C880AC433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 15:07:54 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.24232.1642000073581502332
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:07:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112
 header.b=qLoJzmgS;
 spf=pass (domain: ossystems.com.br, ip: 209.85.222.174,
 mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-qk1-f174.google.com with SMTP id m2so2749758qkd.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112;
        h=from:mime-version:references:in-reply-to:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8fHjbohtH0fCqEXm9Nc7tcAKhhjpmnd/I04l1IputOs=;
        b=qLoJzmgSyCqXMjqtYh5zF2UtjVfH8ruHb06vOdIOjERKo+lr7HXCl37kkr088cTpF3
         UqhS4oKZgRv7haLS2gkd7PJSvq5ubDbpiZvqpXZiOCJAFANbXOKPuxhrYE7pyAssQTyz
         2E7IiCKmbk/L/0qMy6lMINHailaXf1N9d8XQl2T5fxIupanqvIrKzr0mr24xF2UiuLbh
         JGgobgYPHqFrkYy9zXrY0odcXGglk45El5ZJW4QUJ2uRsk8HJ9/E7gWm/fzzN4zEASsm
         s7KWkiNFQK3K980iDIVljyskd9EFvt5I3aocX/ZKlbABsaM7do1nye09wc7jVRHmo0Rt
         iuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:mime-version:references:in-reply-to:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8fHjbohtH0fCqEXm9Nc7tcAKhhjpmnd/I04l1IputOs=;
        b=cpstR2F1fKS/WJV6rox+u1waJganukcfT+MrUftoDdzSsqqSHj4JIjle40ZXsJezj6
         TelYRSwSXqdAZ6JPC/kAoDC9BeWaWj71+Aw8B5T5v8cgUMumsI/zhTFKzojNL6qrN8Vv
         yJD+LFJWw0dfVzkCWJWC2H7sSEzArfV0Pjsp1GdNxlDyNzP3YBrd+fQwD3kOf5vLr44B
         sVci1y48gkQHYWZD162aTFP/YyT+PRzq5LOq+ADaVsXT5Ns/SVFOW9bza3r8RBmMtS94
         /FwsabT5V0AM3/x1HOOdBI6t4UBXuMyxJf3APqLSRxdU4LsnVgbJL5Ppvs3z03Fvwzpr
         pWjg==
X-Gm-Message-State: AOAM533pE3vBP4/f38MRYzBhrzsXjKlHPrCs3+bL9h+HvK8jzChoaEhx
	+LEmsUR9skoaKisKt0FblypBoJrilKz+m2V3
X-Google-Smtp-Source: 
 ABdhPJw/Z407ofVBNI4TWl4k8wCxRn6LfswuqKAn+K4VondJYYTxsTVi3bm5sRsVAmf0M9vS+MUPCw==
X-Received: by 2002:a05:620a:4251:: with SMTP id
 w17mr87503qko.284.1642000072306;
        Wed, 12 Jan 2022 07:07:52 -0800 (PST)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com.
 [209.85.160.178])
        by smtp.gmail.com with ESMTPSA id
 t18sm9145325qkp.84.2022.01.12.07.07.51
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 07:07:51 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-qt1-f178.google.com with SMTP id b14so395129qtb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 07:07:51 -0800 (PST)
X-Received: by 2002:ac8:57cc:: with SMTP id w12mr8117553qta.82.1642000071575;
 Wed, 12 Jan 2022 07:07:51 -0800 (PST)
MIME-Version: 1.0
References: <20220101112959.1866747-1-alex@linutronix.de>
 <20220101112959.1866747-3-alex@linutronix.de>
 <CALT56yMfCmtcbzxs+j=R0NJZZLAMtVenZgbj0rzR0+gzXnpLvw@mail.gmail.com>
 <CANNYZj9rFvsK-tBr+0_H_69=1peh4HkH9nqwj6o168x0G5u23w@mail.gmail.com>
 <CALT56yNhE3T3yqmFDiAvX2yOYX5LgdcYcuF07GX_-1-AnXPC6w@mail.gmail.com>
 <CANNYZj9x0C0tsdMYQSbGSptQ3fNsCuyS6bkmsB-icL-VnFh5Tg@mail.gmail.com>
In-Reply-To: 
 <CANNYZj9x0C0tsdMYQSbGSptQ3fNsCuyS6bkmsB-icL-VnFh5Tg@mail.gmail.com>
Date: Wed, 12 Jan 2022 12:07:40 -0300
X-Gmail-Original-Message-ID: 
 <CAP9ODKq-Z4s5MrUq598sHM7Ofy36NK098AaesKHJAtHogAyASA@mail.gmail.com>
Message-ID: 
 <CAP9ODKq-Z4s5MrUq598sHM7Ofy36NK098AaesKHJAtHogAyASA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] go: correctly set debug-prefix-map and
 build directory
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 15:07:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160488

Em qua., 12 de jan. de 2022 =C3=A0s 12:01, Alexander Kanavin
<alex.kanavin@gmail.com> escreveu:
> I'm not immediately sure how to solve this though. We do want to keep tho=
se flags when they're defined.
>
> Ideas? Perhaps they could be defined empty in some place which is present=
 in all distributions?

I believe it does make sense; it ought to have a default.
https://github.com/openembedded/openembedded-core/blob/master/meta/conf/dis=
tro/include/default-distrovars.inc
sounds like the right place.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

