Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0EFEB64D7
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 14:57:48 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.14473.1688137060064945717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jun 2023 07:57:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=eHmSJgeK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.167.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso3227064e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 07:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1688137058; x=1690729058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wqaNdnA6f7lRAa0HmJuHVKFmgdwqokSj29gBjcBt/sc=;
        b=eHmSJgeKM87caUh2KX1Yz6ouoaLiCCcg/iQ7htKjhgwHa+mm87Wp4+dmWA27NTfQRX
         lQfV+Z/+G2EK5lGswA4bFrTw9HJqLkiIucFVTJroBWxnAR2/JxsCAbHx5q315uwhUhFg
         lTtnD5Elqu54QOyEzQcF9IM6vog2ac3zoGxwc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688137058; x=1690729058;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wqaNdnA6f7lRAa0HmJuHVKFmgdwqokSj29gBjcBt/sc=;
        b=avQ6dFNA+tQWfcez+G8/U8cYP9rUXDTi4ydi1abqqbJPu8+c8LdOl1GHR8Fg9oxLjX
         KuRjGJpP9Fp5suZ+KaaZHL9Aiir13WOzXYBCfoa7CpvaAiUricKz1q3RSzLhz7+kCiRb
         Kte3tivHpcoWJDI1z+kHL92OfZ1yfqs1dQDjyWYX/megKdwI4xVd8nBIOtHuoyopK/Qf
         J1cbFv5NlRkMGEe1dCq2qMq7tVDLtFaa331rCNzM/AMnSisXj3Oq3CX+uT8kRHflXw/S
         ONqj/xvvr7rvLJ06x3qLqaWiBSdji6zXxlLDA+ema7NM1Ml8Q51ufyakBNhfKm57aNOL
         AmyQ==
X-Gm-Message-State: ABy/qLYAEgT+xslCO5Xb+rG/lteoSPyoERT5Z3e/K91oWNUMpQTr0vFv
	DcpzvJQ8j7prMqFZ93zyXTy/kA==
X-Google-Smtp-Source: APBJJlG1g1nZGd1WRklRZwVwPIKWmn6B2ljckD4NOWbMwwTPA7ec9XayPOOcwtfVCL2/ORs72NQdew==
X-Received: by 2002:a05:6512:15a8:b0:4fb:7933:dd4f with SMTP id bp40-20020a05651215a800b004fb7933dd4fmr3094787lfb.56.1688137058336;
        Fri, 30 Jun 2023 07:57:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6269:f4b4:b452:51cc? ([2001:8b0:aba:5f3c:6269:f4b4:b452:51cc])
        by smtp.gmail.com with ESMTPSA id cs7-20020a056000088700b0030ada01ca78sm18521636wrb.10.2023.06.30.07.57.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 07:57:38 -0700 (PDT)
Message-ID: <076ea49874345a74ebe103d30ff6a169e341c20b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [mickledore][PATCH 2/2] rootfs-postcommands.bbclass:
 add post func remove_unused_dnf_log_lock
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, Changqing Li
	 <changqing.li@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Date: Fri, 30 Jun 2023 15:57:37 +0100
In-Reply-To: <CAOSpxdbsXPB6KSUtSiz7Kxvebz7cnZekhLwdT2WfvgcdoYcSPg@mail.gmail.com>
References: <20230630083221.3927027-1-changqing.li@windriver.com>
	 <20230630083221.3927027-2-changqing.li@windriver.com>
	 <CAOSpxdbsXPB6KSUtSiz7Kxvebz7cnZekhLwdT2WfvgcdoYcSPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 14:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183699

On Fri, 2023-06-30 at 04:21 -1000, Steve Sakoman wrote:
> Is this also a problem in master, or is it mickledore specific?

The same patches have been proposed for master with an "instant"
backport requested. I really don't like this model of development as I
have my doubts about how extensively they've been tested in one or the
other.

I'm also not convinced the patches explain the issue properly or why
things should be fixed as proposed. I think at the very least the
commit messages need to better explain the issues.

Cheers,

Richard

