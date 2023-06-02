Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42626C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 13:07:28 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.12189.1685711240349169495
 for <Openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 06:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linaro.org header.s=google header.b=xS8DlUBr;
 spf=pass (domain: linaro.org, ip: 209.85.167.53, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f3ba703b67so2668428e87.1
        for <Openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685711238; x=1688303238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oNsGDG+B95vnPlWuzcFwS0YzTxaYOHFAG5LcodL7gn8=;
        b=xS8DlUBrI/Ski06oKbqfrvF3RlRTLtp3c0dITQqMiZbfr7ABj29cnBpXYRXSxtlJ2+
         c6UddiYoJLkkO0uq9STUsdr6ed4ZIvufHAsTGdCvYmc3K0PcSXX1oBHymjx6gf0FDFsz
         qZTFEDFP2AUR3AJ9Ps4m2NC8NXfMZxu+2vWVpY9q9G6io7YKj4WIyB/49lCU9zox6lNg
         nerH19/+jHm1JgRaBJwm7MmfLVEacpxSsMCeCxN9lyjYLjBLPoCsONWSAVzE3PEKKGoC
         TyFJI/mq9OFuYnIeuD79YI2Bg4vOQrR58xA69OTefZtQWraKN7XscWyIkcO0blMpcXFj
         qxKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711238; x=1688303238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oNsGDG+B95vnPlWuzcFwS0YzTxaYOHFAG5LcodL7gn8=;
        b=bFmyiL/M3GlxMdN2okuYiHqQUk6LmvHdQPaSmd9WYvR3NWfCCT0Ecg2bx+YNbF1q4s
         xEcpdFQZu7HMJYW/6pkLow3uC5VL02gJaEbjXR4HoB7g8cEKUxnZpJyJG2KfxrqVwLd0
         NMbQ1SXWMu97Jn9tb9k3hEybiCvIxYbrtzx3mDxUpdlTLcRcCbK9v1osaFrRxx+ycam1
         Niu2rtAFEQ0ZyRn3VM2d0zzjL45ohtVlRVgR6I2t14+B830t/SboAUaWwnm4OvH2yD9i
         ijP3+BDf0M7gUPYHOez6NV4w3xAH/vbLnK8Qo6QGPlnhgUJVyyYOPMF59bmCFfQYNE6z
         HePg==
X-Gm-Message-State: AC+VfDxdMtCEpchTc45J7/Wukal1SfnJ4sn4dO00jbLJ4v0Op8f/pFB5
	kjCneNnWaSm4lIZuLPib+PFS8Q==
X-Google-Smtp-Source: ACHHUZ5YouUnigBvTxOtM9zIwwtyLFxCEezz6oo3HvZjIokvhV6AU/nDqdMgVoaX2XqNb7LEmMeHVA==
X-Received: by 2002:ac2:5eca:0:b0:4f3:a0f5:92e5 with SMTP id d10-20020ac25eca000000b004f3a0f592e5mr1718354lfq.31.1685711238382;
        Fri, 02 Jun 2023 06:07:18 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id z22-20020ac25df6000000b004f1430ee142sm160465lfq.17.2023.06.02.06.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:07:17 -0700 (PDT)
Date: Fri, 2 Jun 2023 16:07:16 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Openembedded-core@lists.openembedded.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [OE-Core][RFC][PATCH 3/3] testimage: implement test artifacts
 retriever for failing tests
Message-ID: <ZHnphEHQR7tx1D7w@nuoska>
References: <20230602095037.97981-1-alexis.lothore@bootlin.com>
 <20230602095037.97981-4-alexis.lothore@bootlin.com>
 <CANNYZj8vV1=GOacn_vHpfeJ1h29AdLNJsO6X-wXPrW9vahc_5Q@mail.gmail.com>
 <ZHnYGjE3ahdytp+g@nuoska>
 <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <228e247a-2121-d1c6-95bf-51f18ec95e03@bootlin.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 13:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182316

Hi,

These changes are an improvement, but based on my experience in product test automation,
instead of collecting logs after testing is completed, it is better to capture logs
from the target device while tests are being executed. Serial console, systemd journal
etc logs can be captured as streams from the device under test (DUT), and time stamps added
from the test controller so that aligning events like test command execution and log messages
is possible. It is also a good idea to capture core dumps via this kind of stream(s).
Problems with HW and BSP SW may not be visible after testing completes (device has
rebooted, reset) or capturing data is not possible at all (due to system, kernel, userspace hang,
oom or too much load).

This capturing of logs could be implemented by adding some configurable variables to execute
commands on the test controller and inside oeqa environment at certain stages of testing, for example
after serial console login prompt has been detected. Command to execute could be a simple
"ssh -c 'journalctl -b -a'" to capture boot logs and "ssh 'journalctl -a -f'" and log the output data with
additional time stamps to bitbake task output or a separate file.

Just thinking out loud here, these changes are an improvement over current situation already.
Thanks for sending these patches!

Cheers,

-Mikko

