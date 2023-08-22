Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9E4EE49AB
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 20:09:46 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web10.6344.1692734983641589037
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Aug 2023 13:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=TW62P4Co;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-500760b296aso3710718e87.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 13:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692734982; x=1693339782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OoKmJLXKowHKznNN35mC4kORY4Oh8iAcXMa+NfV/eHA=;
        b=TW62P4Co/mbEcpm6zK4Ox8rykwMlX/A+z6+AB8qBE09eLE6ZXUN2c7CK3dRvD/712D
         /7qYB1KBiTloy5yhTV4wCLn9WQesLwsMtNqYIfJR9jkijd0VDjnkXO03MHE5BGpscso2
         QkMqrEOV14sAOf07hXXDG3lKohAldwjL8jw+iikW2TdV2huaNPoiGUVA/H9tdp/kLnCi
         1L2DzTL8/Oc/IVmFZX+SRL208xz41Ae7khFjN6c8qfyLhaYwC2rcA1Enj2mTxopSUxrp
         JLjRG7FoeqIoexzwE/Qjj5funzBxQLVw7uSSxRgX/oeEuDhtk42nxYQ7CJLZhSlbBrKx
         j5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692734982; x=1693339782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OoKmJLXKowHKznNN35mC4kORY4Oh8iAcXMa+NfV/eHA=;
        b=gIKgfn+3MrO5L+UsxAVOIjMjS9Sq8GCAMS2/FTK0nY3GkJGnEI8B9/fLHVDel3pA+q
         g2+m5FEsUR9VsYnXwu4LP997LdtsNr1iRqVu0axPi6yGQcxG1acNMkmwmd+3qHcS7PzL
         K/7n7QL+HmdMAl/aIYYEuqDh3gOrsL+bqHV8NaQz0pbDBDH0g00aWe4brUXDXRhleOvc
         U9fFzzn/5/Rr5D6gkJiPeTElAzXY7YrVATG/DKcp7g/pJC/PU8HTgfa/TCGse5Kk9L80
         gythUrT9wEgcCn6/wrgzvNWIG189sHTwU7SAiaKkcgwk4xOF9q0ApbRr0qltlwDgUHRu
         oMiQ==
X-Gm-Message-State: AOJu0YzE0Cmro20WD0lwbnaJMVmVeQwefoy8jm5/0oxIGdRuX41cTR2e
	5B+u3cSHsYkp9RQHyos9Cc97tjkw0s2xjqHdlSY=
X-Google-Smtp-Source: AGHT+IFFDYvQgomOpwypJnxneS9sLIk6yLcV7DZuu941W+oc0bvYvk19WzS0hTRQNkVgxeZgCuBfNJ93w/TgQm7Uxq0=
X-Received: by 2002:a05:6512:693:b0:4ef:edb4:2c77 with SMTP id
 t19-20020a056512069300b004efedb42c77mr4185830lfe.11.1692734981372; Tue, 22
 Aug 2023 13:09:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230821161120.171956-1-adrian.freihofer@siemens.com>
 <20230821161120.171956-3-adrian.freihofer@siemens.com> <20230821215634.349b3509@booty>
 <a76ad1f4279c33a470050da46395839096c3cf58.camel@siemens.com>
 <CANNYZj83zUc6qAknx03Rc7cxW1ZgkCH5tiY_rW5ueMrdMNqbbQ@mail.gmail.com> <a789650e141c502ed63e5002eab77a4e3cee31e3.camel@siemens.com>
In-Reply-To: <a789650e141c502ed63e5002eab77a4e3cee31e3.camel@siemens.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 22 Aug 2023 22:09:29 +0200
Message-ID: <CANNYZj-zdUaGvPeS4juieXME2CLMwCRr1QFruZtZ361Xhi8SxA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 02/14] build: vscode configuration
To: "Freihofer, Adrian" <adrian.freihofer@siemens.com>
Cc: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Aug 2023 20:09:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186537

On Tue, 22 Aug 2023 at 21:11, Freihofer, Adrian
<adrian.freihofer@siemens.com> wrote:
> Do you mean something like this:
>
> cd poky
> . oe-init-build-env ../poky-build
>
> Yes, it would probably work. But moving the build folder would break a
> long-established standard. I'm not sure if such a change would be
> accepted by the users.

I'm not sure there's a standard. You can do

. /path/to/poky/oe-init-build-env

from any directory, and the build directory will be made there, and
not in poky/. As long as you don't let users run oe-init-build-env
directly (such as with upcoming oe-setup-build :) we should be fine?

A more radical idea is to indeed prevent build directories from being
created under poky/ directly in oe-init-build-env. I'll be everyone's
favorite blame target again for this.

Alex

