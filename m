Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0234C07E8E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:36:33 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.11653.1713947787155127355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LW1YrlVU;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-51acb95b892so5825113e87.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 01:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713947785; x=1714552585; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDC1h6yruY/HpsaaHC3/rLF4XHehYmfPw5m4lXwP7QA=;
        b=LW1YrlVUoueJC/ptcA2jbMLAKFjJAWjCiNuGeS00EMYlake79XOV7cygPCS+iaarJ/
         zDdUBBNKcggn120EmmDtySR/cRa1I1X8kiiGPjxCBVkqK5m1yN2S9CfwLeQohwSw3tO/
         fVsA1h02GF/KVbfB7qZJds+K1psZToNJeG7kToFDc1NPp7BGiTbkGgbT7IBXP/Ym8FTs
         jqt870vvyh0lDZWPr4wHzHiO1ILmNpGbeHKTBWBa9LL5a3S1NMRkN3N8V0zlibLmHwQc
         qD8+hNbS4o+rKU1kk53dsnak0WUM+xOOHY87qTaGzOqOI5ct0q1dzzCiceDbPn93hiAU
         vjiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947785; x=1714552585;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDC1h6yruY/HpsaaHC3/rLF4XHehYmfPw5m4lXwP7QA=;
        b=Crxnwc1bnl2SsFOV0oB7qkbdy5naK3yBaQmeMAm5h+0/MRoTMvcvO26O0AJAkluHFA
         pE7Ux25aGRSf5jj9JprbN+2SCbLIIicYDP2jFRYDktv91gun9lc7KhYUOjzl6DQiRsqL
         2D7Mn/pc5f0ybXNbiAnpqpN3reZNOsNeAOHNryfSv+fS9Igw6Z1sHDka9+l/xnc8Cpgp
         JeE+8J7rqTe/C6kzhp+SH6wzndlM0xGydnYAkaEvb6QyfQz1dHG606oDjIeluisLl6uo
         Tfj+CuRmGquKLY3TFq7xqFeMv8S+7D16lMP0r0Vmfi6VoVHtSVQDX5mn7vQYGE0ALlXn
         Tzcg==
X-Gm-Message-State: AOJu0YzF1gt1SmYtw7VI6+GRXLfjTASItMPJWFKsSiLUTBrT0Afc7/o6
	OApiTLvsltOVIY/2gMoRCOnSJfVLwOR4zglo0j3/1wCin8SaBxpAtkEuwWmm9oEtpBERs8t4uAb
	PXJKfivb2buHMM08Hy5G0UZCEH0w=
X-Google-Smtp-Source: AGHT+IFUZRpf87TJo+op+XdndVpcUUrp6zEyzby/133kObHspRiQm0T2RQd23Hb7T1QbPIuoKKigJ160rjgfqBeQLIU=
X-Received: by 2002:ac2:5e39:0:b0:513:cf5e:f2ad with SMTP id
 o25-20020ac25e39000000b00513cf5ef2admr1616755lfg.60.1713947785007; Wed, 24
 Apr 2024 01:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240418055843.547573-1-yocto@bsorensen.net> <e34afde6-9687-4f4e-bc98-b9d0c8260169@bsorensen.net>
In-Reply-To: <e34afde6-9687-4f4e-bc98-b9d0c8260169@bsorensen.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 10:36:13 +0200
Message-ID: <CANNYZj_syk3DmGvutvxT11P0hO7L8E7tRm7-ga_QKO7Z_PoKZw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: sed ROOT_HOME only if sysusers
 PACKAGECONFIG is set
To: yocto@bsorensen.net
Cc: openembedded-core@lists.openembedded.org, Qi.Chen@windriver.com, 
	alexandre.belloni@bootlin.com, richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:36:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198644

On Wed, 24 Apr 2024 at 10:19, Christian B. S=C3=B8rensen via
lists.openembedded.org <yocto=3Dbsorensen.net@lists.openembedded.org>
wrote:

> Any input on the patchset ? Would appreciate if it could be included in t=
he scarthgap release.

A little patience would help. The patch is fine (and so there's not
input), it's in a staging branch, but integration to master would
happen after scarthgap is out.

Alex

