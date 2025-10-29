Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA3ECCF9E9
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 10:45:46 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.3639.1761734737432334885
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Oct 2025 03:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PAlZ03Wg;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4e89c433c00so76579351cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761734736; x=1762339536; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uAvLuDFTu31+QcnfMlLMJu+5kjYf5zxGmVJlpkguY+M=;
        b=PAlZ03WgIycFqgeMdbT9684345csQCw4/tW9GtzwMRJEYezbJ26ByZ53OZGYnh2DiV
         uZHCN3jewyyEAXlcff0HiwVWEGFVxuKyVzxpAFvAPRwSfjcB2nhQ2YqKfH1Q5EAMYTqr
         xQVeqHL0e7cX4VSPndEXLT7BfHNxfkX0tjEBzdyW+ThJFsSjNM6vfksN3/HpoyHzgrHo
         y3udbSJoQV6Pn+p97pq/pCAXRvo1+EnvAMhjvFy0R4RCTINs5BBZEwVE/Ywp3y1Wq8LD
         /ldrBkpH2MfYnZsZsLdGL83tKKmMpOOoafRuT3NcB8vvUTnrisd9eVDQrsiUmbZHCsqA
         +Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734736; x=1762339536;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uAvLuDFTu31+QcnfMlLMJu+5kjYf5zxGmVJlpkguY+M=;
        b=ugio7MMfRQGKsRbtmdutU42zmMjpgyBc2r+AvN4Avplj93NQY4jfW7L+OqlkGSQx3n
         ZkdZmflCAf7ATksehTC48nud5MiflkXu2UmkElZ9yCYObXXs89IlOZ8XaY8p3Ua8d8Q1
         HrNNbw72Q+fsEhOSmqnbXDXbmdYYBtcGGmRCV7RAv1H3NPIRiOO3wrMDnUjuSix3xIdC
         BG8YjJ93tnAVhkysY6J6PbdD9BwK1ilBS9nK06MdhLp7tsRAelZpvCxfv/k3IP/ciqF4
         lEPAZ95pwuzgKlGxDGeSbP/oPpJumVqJusx/z3UovTr/lQ5vxgbp0KXVGwFjlYG/xIq8
         2Jjw==
X-Gm-Message-State: AOJu0Yze5aeDzVDnAepXUvbydLHAzOP/bZSGQi/Khct9LnyqBnBgZaMj
	xBzOqntHBQU9KBBl8PBLe8Brkn54yfvN8yCKTSR+o5BAUaSPusVm6DlPpQcoO1k7sZp+d9q1ovy
	0FZVYWBFDb3mz/XYv/94/N37JztfaZ+g=
X-Gm-Gg: ASbGnctfX1c5/SQcuuOk3Q0i6+d2uJr9X3AriJB8j4/joo1LrjZgJfqo5y8+WqghNyM
	MNq8+tliyXv4sO0MTlvmOi/2OnWxJhmVwMNPxacnga7+CtcSmDXj19CX37t1tnrSyFA8Vm4f2a6
	d+YJEtCEInIdJdVU0uwxCDioJG8h/CWrEu5MNfaqxM/fzgH5wBN/dMsYRlZ+Otn2389BhT/nLZ/
	DMHbZKh/p/rtd966ySG1M4jVXJS3SWw5yCM/JFsGvDgRY9ozC96XEL945i4uoTK7TawSODPj07K
	QlgzrqqT1Sc75PE9Oko99798IISjhwxlNk79AYbnMbDIVXDHPSSprnFhIyUJ+RmzCEORxbbaqBE
	XL+GPcHvs9/qAsbofWzil1wKcLDp+
X-Google-Smtp-Source: AGHT+IFEa9LrnX4rPU2q/Ow267E9LYwiQKzaRsabhLsaQYDrDjQFjxMQHQmb7EkevRTnDd/yyqCqiqpwSbMewGI+3OY=
X-Received: by 2002:a05:622a:190c:b0:4ec:fc63:257e with SMTP id
 d75a77b69052e-4ed15c8948cmr30847171cf.53.1761734736454; Wed, 29 Oct 2025
 03:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <20251029002918.3728797-1-dmitry.baryshkov@oss.qualcomm.com> <CANNYZj83omwdp2NNvBf5i_AVMSgWtT4F9_Gyq6HMsDhsNzyKDQ@mail.gmail.com>
In-Reply-To: <CANNYZj83omwdp2NNvBf5i_AVMSgWtT4F9_Gyq6HMsDhsNzyKDQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 Oct 2025 11:45:25 +0100
X-Gm-Features: AWmQ_bm94hIg6AyK09spDIQL0raqc9Xsd7bYeM-SOD0WnxmcEHMVFdVUugkcplI
Message-ID: <CANNYZj-Ok_ZKSZb92GfJbBo7sqAWiEYmZ7NaSiwtNv1OA2gDTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] libconfig: import recipe from meta-oe
To: dmitry.baryshkov@oss.qualcomm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 10:45:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225444

On Wed, 29 Oct 2025 at 11:44, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> On Wed, 29 Oct 2025 at 01:29, Dmitry Baryshkov via
> lists.openembedded.org
> <dmitry.baryshkov=oss.qualcomm.com@lists.openembedded.org> wrote:
> > +RECIPE_MAINTAINER:pn-libconfig = "Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>"
>
> You don't have to do the below straight away, but there are a couple
> possible cleanups.
>
> > +UPSTREAM_CHECK_URI = "https://github.com/hyperrealm/libconfig/releases"
> > +UPSTREAM_CHECK_REGEX = "Version (?P<pver>\d+(\.\d+)+)"

Oh, and: the latest upstream version is 1.8.1. Putting that into
oe-core would be much preferred from the start.

Alex

