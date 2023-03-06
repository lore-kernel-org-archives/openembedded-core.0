Return-Path: <otavio.salvador@ossystems.com.br>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 666E9C61DA4
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 15:55:55 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.37435.1678118150171970938
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Mar 2023 07:55:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ossystems-com-br.20210112.gappssmtp.com header.s=20210112 header.b=z2nCcVUh;
 spf=pass (domain: ossystems.com.br, ip: 209.85.167.176, mailfrom: otavio.salvador@ossystems.com.br)
Received: by mail-oi1-f176.google.com with SMTP id bh20so7369854oib.9
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ossystems-com-br.20210112.gappssmtp.com; s=20210112; t=1678118149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s/mDqMM2nUzHZNfw/azh9ZMH83dAeiNLXQMPEM4YgF8=;
        b=z2nCcVUhd0wsNay/d+0d+bHSogGnvBZd89nx5mqmT9T6eIk8ZJqm/eo8YYvPMX68j0
         rJtozGK2GGycfxYCBXvnUY2MNiaEgM+TWCXlTKamB48sXJK7dL1asNbxDCXS5O6+c9vb
         D2ZYETogNIdLUeDpiuHoXf2lkQaZf/So4Q4/nH9Q4T5b74pDTb9P1NfTh/yHSsyEG4/R
         5MgKFb4OCTYqqrK46rSNjWb2Ro6PMAaD3/zAGUiNXCm3DkwYqsLsBzOE5qpcHbLlJL2s
         RpqPOsFTJWbvkA4POCLz1Iawi6lWDqfVHDAfTK3nNsYfoNHpQ4TJzpc5vbHruO+qZzD/
         yolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678118149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:in-reply-to
         :references:mime-version:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=s/mDqMM2nUzHZNfw/azh9ZMH83dAeiNLXQMPEM4YgF8=;
        b=jPsFUVKDaqcOxPK6ASB3ZIWrIYAa70JcNkrGTPnaverx/nPW+bYPaNE8mzGMwztHCI
         Nxwjv35RhNhS3DtWsYN97AGdfsK8vBIYkFX6sFe3nksDRU0ITDMwKMSbLaysEB29CWkS
         8lf1dCj6R8DLiFNddcoSSwacA68cKepO9gPM3Vkb1ahyZH5cArfUzeK5xpHgcewEVHAQ
         /rk1dkw9qhUJ8mhbiUFUlroT65o0I76WfSjRcx2su5vnFE6L+zmUYXYDwy9fC9PSjcNN
         NyCBvxNBPIkiUHK5dO6hxjytgKc/CSCjmsbrzyZRfZZ1aNmUym8tTsN5VqKcKDFvDD+E
         IDsw==
X-Gm-Message-State: AO0yUKWbqSXbREoifuacBau18Eju883iSKun2L58vBeHi9J/sKr5UuUB
	pbKnQbrInyXH1v+VJtjMtDUtQAFSX7UIuroLstyEYQ==
X-Google-Smtp-Source: AK7set8WZ2VDAL/eAIItnQU7hkXA1oXxF6cPNCY7v6pBzWLZ0GWlzJO5wO1usZtgbuJzKl+b4dzrLg==
X-Received: by 2002:aca:f0f:0:b0:378:2270:8876 with SMTP id 15-20020aca0f0f000000b0037822708876mr5036861oip.29.1678118148878;
        Mon, 06 Mar 2023 07:55:48 -0800 (PST)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com. [209.85.160.54])
        by smtp.gmail.com with ESMTPSA id l7-20020a544507000000b0037d8c938d62sm4037058oil.50.2023.03.06.07.55.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 07:55:48 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-176eae36feaso1122379fac.6
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 07:55:48 -0800 (PST)
X-Received: by 2002:a05:6870:3a07:b0:176:1def:9c31 with SMTP id
 du7-20020a0568703a0700b001761def9c31mr3074564oab.10.1678118148135; Mon, 06
 Mar 2023 07:55:48 -0800 (PST)
MIME-Version: 1.0
References: <17474798FA156F5A.18951@lists.openembedded.org>
 <20230306091108.3347363-1-zboszor@gmail.com> <20230306091108.3347363-3-zboszor@gmail.com>
In-Reply-To: <20230306091108.3347363-3-zboszor@gmail.com>
Date: Mon, 6 Mar 2023 12:55:37 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqiFpuJ3bu833OV1EPEYCkWcKtHk8Q36j75T7kj667wBw@mail.gmail.com>
Message-ID: <CAP9ODKqiFpuJ3bu833OV1EPEYCkWcKtHk8Q36j75T7kj667wBw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/3] mesa: Rename PACKAGECONFIG "opencl" to "clover"
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex.kanavin@gmail.com>, Ross Burton <Ross.Burton@arm.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Alex Kiernan <alex.kiernan@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 15:55:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178078

Em seg., 6 de mar. de 2023 =C3=A0s 06:11, Zoltan Boszormenyi
<zboszor@gmail.com> escreveu:
>
> There is another OpenCL frontend called "rusticl" now.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
...
> +PACKAGECONFIG[clover] =3D "-Dgallium-opencl=3Dicd -Dopencl-spirv=3Dtrue =
${OPENCL_NATIVE},-Dgallium-opencl=3Ddisabled -Dopencl-spirv=3Dfalse,libclc =
spirv-tools"

PACKAGECONFIG[opencl-clover]

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9 9981-7854          Mobile: +1 (347) 903-9750

