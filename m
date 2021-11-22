Return-Path: <jupiter.hce@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CA6C433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 09:52:14 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web09.4507.1637574734132781829
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 01:52:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JVIqhI3v;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: jupiter.hce@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id az37so35202793uab.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Nov 2021 01:52:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=c8/e2gxC4GAorKa+25iwdDZemsJZMbbSA16k7IofqxQ=;
        b=JVIqhI3vXvGLzkSulEIt8rVKQbUn09HJqFSm0e2yOodBrzluHKprjp7WkH6ctZWnuK
         DE1HI5GQx/cv3Pwxv93KiQBBu/N7TVnWaKyzCpmY/oSGgMEv9xTB++oFohTCL+MDigG0
         vREs5P9whtF5hXNPyc42nb059z/a1myzjYxR85Nr9lEesDmjec1GK2a4xORu+ajB+1E9
         mL793EW8kCi/KByvJAFyaV5gRoEu/VQnk0DsN6ciWRekgH3CLP9QQTU6wuPBQmWSMxBM
         8KJA0MhWk9M1fY+vGH1ZIdk0qMZnoEAAf4QbK5YDVdWGnhCZagkmjg0QcHTDigvAGhSk
         sOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=c8/e2gxC4GAorKa+25iwdDZemsJZMbbSA16k7IofqxQ=;
        b=W/N85LTjlo/0idXs1ew2irsBywSBf1Mm9ZtDuEAk7g8+0TdkwsOGv0tU1CzW2jqsh1
         LbZRdIz6S78o+fsX0SqIT9MCPD62ZRhCDchb+VzLIORGgEbgFuZMYB1t9yqyBs5ozem3
         FvmCdjJS0miAyV9cnxdKzlkbMrCX/NgnV1f40aABoYkOBjB4j9WKQAzKc5TzAJWVDwRz
         ZWZaFDC7xftVopWHnVWxypF91VlBoPaeoAiYy0+vp/2U32PhS0ewWvCSl2WTc26KG658
         cgSw7BH3gEhmizt8Fbwdac8Fc2Qj7TxVCcEbRNlrNjcVLCVWb3HEIODaX4TsLkjvKbTl
         Q/3A==
X-Gm-Message-State: AOAM533C5tmGBTnaeLh9ICfLQssQE4VeQqA9YPqpOpCq7qIPIj3scAp2
	FcL/X1GMvaDJBPE49VNUCjmOfmBpt9fszSysiql52Sxk
X-Google-Smtp-Source: 
 ABdhPJx2bRxEDibcOVMzyDSQjbdtvDAujJw3NFew/PB3csmfU17VxLTyoGRpKulRpg+NQtnR2obfqgPe0Dd4V3Myfps=
X-Received: by 2002:a05:6102:3166:: with SMTP id
 l6mr127367323vsm.51.1637574733157;
 Mon, 22 Nov 2021 01:52:13 -0800 (PST)
MIME-Version: 1.0
From: Jupiter <jupiter.hce@gmail.com>
Date: Mon, 22 Nov 2021 20:51:37 +1100
Message-ID: 
 <CAA=hcWQt4W4F16jZpNfj427+Om7EvJMs+-QKbeq1_NkoQSQW_A@mail.gmail.com>
Subject: Honister version: ERROR: QA Issue: Files/directories were installed
 but not shipped
To: yocto <yocto@lists.yoctoproject.org>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 09:52:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158560

Hi,

I was able to build my package in Zeus, I am now upgrading from Zeus
to Honister, the same package I could build in Zeus now failed in
Honister at do_package where I installed my libraries and symbolic
libraries links to my own RW locations:

ERROR: QA Issue: Files/directories were installed but not shipped

I purposely separate my application libraries and symbolic libraries
links from traditional system RO library location to my application RW
locations, I know how to handle it, it works perfectly built in Zeus,
I don't need the Yocto QA to police it, I tried to add an empty
do_package_qa() in my receipt, it does not work either. Are there any
ways to disable package QA?

Appreciate your advice either how to fix it or disable package QA.

Thank you.

Kind regards,

- JH

