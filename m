Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 179DBC5AD49
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 09:00:59 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.29325.1749200457898357891
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 02:00:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nAho6eMk;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6f0ad74483fso18268206d6.1
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 02:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749200457; x=1749805257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8sWStpPlvplDM57TEGRf4z8C1t+th8ngeDklBkeFdEk=;
        b=nAho6eMkQZ7O+wkywoX5On+TG6p0YbjpAC2nml6nEMLlqnCkxlfO4wAaz4OlQsppJY
         pYEAqMVhKHbKK5k2pZZa8CH4cWslVvvGYuqxxkH7NqcVmIeXDBtVzFLZ14DULofwic+l
         57ZjwNls+Q6a6tHfxx7PIQL+FAuJr3xYulKcZH8HKl59ANT2uliyZBlDxLucspa91BQd
         Qww/FOzLsg59lba6IUmS4YS+mNGBSdhaE85ZpS39OR79MxWrDoSbKWESuArOW5iVlSUY
         6f2vyIbGy6Q04CqxGH/HHRgUdfFcc1mMpT/1Pjjzb7cz2Ry62yB8enroYVfeByvfRXHE
         OR5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200457; x=1749805257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sWStpPlvplDM57TEGRf4z8C1t+th8ngeDklBkeFdEk=;
        b=usujeCooOPPg33ni8uIAFPkkmKgcpEln/Fhlq8iXFVk1yCCT/QymE1G6APrjciA1nS
         il0/9xOC2SnDWfqYpeeNBhOYUPfWMtaK7Q6Lyi1xv8hpDNDtpn1KA/ATyZd70bcZb+Es
         L7MORLtEyWsMoG0ePp4PDb4E09yfmQRqDdAFM1aiD2AJJV48Vy5nTXR0QIUll2FYQQKr
         5RCwh2vAHo/jEo+HGsEwMYqmsch5tbnpzq/eSk7WhBdLsSPUdhyqCsVme/kQnhgW53J6
         p2majSXrxCcS+sCizDgR6YrKSwtwypz9KOs7VKJnC5X5Os5sCroo+LrpEW5A6c3lyGYB
         lTsw==
X-Gm-Message-State: AOJu0YxLaQ4mIJQoSxFoSMj0A1ewggDCRgfuk+qpS9Km4Ilal9Bx3n52
	jmqYPdXHlTJrhMZqQnQE4AH+q+6dCH1bHqSXzQP4btzh1VN0p2jjsFAdGTOKjBWWhNPoTgfHXyn
	FkWyhkLBJ2BXJpQ6Y37MEVGhDuaDgIA+2bA==
X-Gm-Gg: ASbGncu4wcFCRp4JyyIBHL1dG0TemKtrW0wZXr7CsQdx7bbZ/UXyUJD28hzFcW20VLS
	YhVm24dcGLvqPcmgh/TzlPnfEulP5rzoleFx8KazJOzL39p2hkNeb4aWFdlSkhDGv6OxDslYa9o
	VQI7KMr8AAkmse5GwmApKIjBl27oIW1oO1yI4V9H8VaadKaPltZf1RDFb4QLPNZ/+74Yc=
X-Google-Smtp-Source: AGHT+IHan6mKGaUm4v8k+BBGXEdZ6If++ZeK2A2gYxnx4TzMvIJQ75X3guXLFsWQjw6PV9fAI2XCuGwDDBN1WC77aAk=
X-Received: by 2002:ad4:5ae4:0:b0:6fa:faca:2c40 with SMTP id
 6a1803df08f44-6fb08f6e934mr45164496d6.25.1749200456852; Fri, 06 Jun 2025
 02:00:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250125113326.2475346-1-richard.purdie@linuxfoundation.org> <1846407BE2F847FF.10724@lists.openembedded.org>
In-Reply-To: <1846407BE2F847FF.10724@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 6 Jun 2025 11:00:45 +0200
X-Gm-Features: AX0GCFsd6B8vHnd6zdqCDqolwXimrtqLqsbu1nwnpAbpUXbvNFidXB-T6QjE_oE
Message-ID: <CANNYZj_DTmUJtee2rVJosgvhy0B0Z6QZ3kp2_WXajryWq76Q8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/sshcontrol: Handle empty reads
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 09:00:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218123

On Thu, 5 Jun 2025 at 22:46, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
> This badly regresses selftest execution times when a a selftest is
> issuing many commands over ssh on a target image. I've been wondering
> why e.g. devtool.DevtoolIdeSdkTests.test_devtool_ide_sdk_none_qemu
> takes almost an hour to complete (on fully populated sstate), and
> noticed that every qemu.run() call takes 300 seconds to return from
> (which means the loop exits on timeout, and not on the intended
> poll()-based code path added above), even if the target command itself
> instantly finishes. Reverting the commit confirms this, the test time
> goes down to 12 minutes :-(

I sent a patch for this. It's not a revert :)

Alex

