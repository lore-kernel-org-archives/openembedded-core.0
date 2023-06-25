Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 181D6EB64DC
	for <webhook@archiver.kernel.org>; Sun, 25 Jun 2023 08:46:44 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.8149.1687682796731251643
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jun 2023 01:46:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=a9rBo8OP;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-3f9ede60140so19697845e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 01:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687682795; x=1690274795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VMtwmXg0zOHCn258EAMGqmSW7VwGjdhm2/kc81+Bp98=;
        b=a9rBo8OPW65K2cYCLx/MW+0Q6+mQlDijcZX1GxVZtX1u2he+ybz43B4p7P9fbFWi89
         AmxEsj+p6zCbs+R8J3pb31p5raTCY7B51awqk9wtkD7gmv9PbEoHCYvVTehm1IIehGGo
         hTD9M3jhhxdcl37IC/m0cGvKXuE9srRSKIPyoXJJ/KKwuL3Tmm6eI613I0FV7zyHNYqI
         aE5eFiqol1irDV0gbi6Y68MOuyBYAuIY2MMBFwnpN1sLDWMPB+Jsdq+vu09DJxk6LhF1
         3gj4rYlk65WQ8ot9Tr0fjLgLRmffcfUvYHdV9sdwUh6q+YSNO3UdPssL5shG/uVfYvaG
         SRpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687682795; x=1690274795;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VMtwmXg0zOHCn258EAMGqmSW7VwGjdhm2/kc81+Bp98=;
        b=JmuhD8iuqDu6EoEFnOXn8SJfUQbH13rxGGYd1+DsCgTALno8d5f+YOvCdEvZnQ0vrR
         hCkQ1qjgDUK3o3mHb59VfFxTQVpVGHiHMNxpSyY5z6C/uhs9D1BzeKMOVjPxrDcAOprg
         zcl9v4gx89TVXp3osESQUIZjWypEqUXoCcJ1mxVxvWpooJM2erVa2uLEG/MnjuelX++v
         ABci9SNbMC68Rs1QEhfjxE3zFVDag/ia4H/fsO/W8D1QCFXiPePnfqehffwKRHEzt0SL
         kgWI5n1OGGGhEK8pD9zv7fQ2wilgOT/2I8abOgdHoSKMt6W7OhjnW9BvWNgU+D/1fUh+
         7lfg==
X-Gm-Message-State: AC+VfDynGOYGxaG+fgkR0GrpanaIVJoaZvT+TzMcmoLyGcZYbKpKUrQe
	t7xXo9U1jVDtRJ0LW+gek5o=
X-Google-Smtp-Source: ACHHUZ6DKQBdyu+Ypvx0ygfR47Wddzf3STJvnsQcIrUvtjjMsnogjnUiW2QoYjs8oHH3dLZho6cSOg==
X-Received: by 2002:a7b:c3d2:0:b0:3f7:a552:2ec7 with SMTP id t18-20020a7bc3d2000000b003f7a5522ec7mr18130100wmj.33.1687682794850;
        Sun, 25 Jun 2023 01:46:34 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id n12-20020a1c720c000000b003f90b58df65sm7007866wmc.29.2023.06.25.01.46.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jun 2023 01:46:34 -0700 (PDT)
Message-ID: <469ea730c421b65ca54af1ec0c9462fa411ccdfa.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] runqemu: Fix automated call to runqemu-ifup
From: adrian.freihofer@gmail.com
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>, 
	openembedded-core@lists.openembedded.org
Date: Sun, 25 Jun 2023 10:46:33 +0200
In-Reply-To: <20230625042706.3998722-1-alejandro@enedino.org>
References: <20230625042706.3998722-1-alejandro@enedino.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Jun 2023 08:46:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183369

Hi Alejandro

Thank you.
I will prepare another patch to bring the ifdown script to the same
level. There is still the <native-sysroot-basedir> parameter. But maybe
after learning from ifup part of the story, when the autobuilder
confirmed that everything is consistent again.

Regards,
Adrian


