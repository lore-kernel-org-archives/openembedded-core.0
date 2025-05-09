Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85419C3ABC3
	for <webhook@archiver.kernel.org>; Fri,  9 May 2025 12:35:26 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.13605.1746794122422619523
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 May 2025 05:35:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X13dqC+P;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f0ad74483fso23521166d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 05:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746794121; x=1747398921; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nFKlhVcvGH3Jbz34GEMEAibtzV++LQbseM3JRRzp6n8=;
        b=X13dqC+P46Q5ik0ommOWIPsyxRpJvy/GRVwgS2oIRzRm6tZE4duCVLxcDiDAZxzIM3
         G9U5ayAor0k8YnJvgfMp2bcbdjTSlSV0ZlHd1xYOoA+uyneOZDLPvXasUNtKB0CoZ2Xe
         Pqpk2ERlrxkRkMUkh7N7rl1Jxe9o6F4vSkZLwOoY+eoM+M0KsWexWyP2zBvyuZE6eLeq
         TxTGdOkzI2iJ3s4M4H00ugC3pZqzjrhlfCvvklYFuQddHiW7tmVPMmvm3iPj0Vq6UAFi
         AQfjx+hd6sp0n/NzURGKbNu+9R1k+d3f82rk5Gjy8OjJvq0NGoJlPIKKtOcjVghemXkL
         bNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746794121; x=1747398921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nFKlhVcvGH3Jbz34GEMEAibtzV++LQbseM3JRRzp6n8=;
        b=lZRehUewKL9wQVQ1NsxXNTYsr14Mn/Oe+C9BTm26tRlth0MOcDauQiR8xKPP6aiAcV
         zGeMpocPIyal0iIHZghyTcMLT/xXMxPf30hmT/gwca8T61rDSLzBKh0qPjo9RoY4h1CQ
         b0/ZfSggI95qDtSTitqoTcP/NHfTcTRBFd0LEv8+JXyRhACVMD+5PkrGPGoOWHprFaPT
         9DZPGpPI8RxU/H1BhQ7bNLsOmjkk9S5j41PKvLlr//xw8KApNMFvzkiDXCQ1BHVf9Moz
         501+RbvTQxxANXIG0nrCyTPR0NkdOElb5dyKqDhlkwCXJ/fhudHIaJP0bRdJ6i+GA1Ni
         jZxg==
X-Gm-Message-State: AOJu0YwDhXTQaKQYHTlcI6njTk3cDy1Ea9qrjT9Hrp+JB/KyMtrVxUGC
	raOX5sYy4KDl3SjVy4zGmWEg7K2grhajKh7ezmk1hj8y/oBugue6o0AA9StBUXa/hdj54jHC1eU
	cmFAOWue/qexINB2P/4ZzQZgzE+I=
X-Gm-Gg: ASbGnctRUqlYYj0eJ9+zvsGwj3io15krQAuQSiSSQb/B9/SZnPaM/NrGSQVaov2KN3O
	/Pkokc5w7L4wkpNYyGRzzxOhfvqUF//quGUoMUFXz8qqNnCGE4L8lxb9QsgZ0SqyghA44fXSVBy
	FIPeVYiHANHyl80NjUls6ZrZM=
X-Google-Smtp-Source: AGHT+IFrH64WUofaVxCLjbvrTE11RB4Xwk7kUYRjlzWtrhqKQHjvFRjcBfMA2IPLDnmcSeI/thF+KpBSFDfiMUGnV9g=
X-Received: by 2002:a05:6214:4105:b0:6d8:80e8:d567 with SMTP id
 6a1803df08f44-6f6e47c6b43mr51572736d6.18.1746794121355; Fri, 09 May 2025
 05:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250509093740.1367372-1-yi.zhao@windriver.com>
 <CANNYZj8+SvOzz7D0a_sEi81vhi3up699eYoJ1pgBsW0xMHuhog@mail.gmail.com> <b7826686-6580-41ea-bc93-89a28798d7fd@windriver.com>
In-Reply-To: <b7826686-6580-41ea-bc93-89a28798d7fd@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 9 May 2025 14:35:10 +0200
X-Gm-Features: AX0GCFuZ19rspgpK6gIC5MlC5DsjbaV07BsjTlrpQKYJ4kPPVH02wZrgDGbSIZM
Message-ID: <CANNYZj-pfxvDHcHwtCePMp4VZCyKFo-oCz_3dv9_rEcvOrC_OA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: add fips support
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 May 2025 12:35:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216203

> The "openssl fipsinstall" command will do the following things:
> 1. Runs the FIPS module self tests on target
> 2. Generates config file fipsmodule.conf containing information about
> the module such as the calculated MAC of the FIPS module and the MAC of
> the value of the self tests status
>
> We should not use the same fipsmodule.cnf on different machines. So it
> will be generated on the target.

Thanks. Is the original file (which is installed and then deleted)
pre-packaged with openssl tarball, or generated during build? Can you
show the difference between that, and the file that gets generated on
target? I'd like to see the actual content.

Alex

