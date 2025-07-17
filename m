Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07579C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 12:55:45 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web11.48449.1752756943801746792
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 05:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dk5SXXwQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.43, mailfrom: hiagofranco@gmail.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-72c172f1de1so567175a34.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 05:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752756943; x=1753361743; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YX1cZIQdodR2ekjpn2yUQiuJ4EdyTGOp5LbA4Zhv5Jw=;
        b=Dk5SXXwQs0bZYxTtcrkOnIFX5PXc2zcT/FgJtER/NMZZv7mBhkKU0bGAGL0gANGhfz
         6DS+GTaPIFc9Wn6EDUUBU2DOnaXtNQaPYahvqQhbpLJo/RrK6O+qHgCjEwRFCRoJ5lbY
         ZFHjWas+dhagbeEtvyqSK6RcGe/7QN66BWxOh9G/0OSWkZHhzRtUBE/RkTKAVo8gJUQc
         IaOhiQl3+5JJUbilngVqMJiFKTRreHhiVGXG8cf46+nTzZI5AaBpgO14x6DVBK+pYP+q
         DTqHWZKGcnIFeq9W3N9PmUywcjnKo5kKQlfs3MinpMt+d4OxkBPVS5fleqjtCfFIzA0Y
         21eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752756943; x=1753361743;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YX1cZIQdodR2ekjpn2yUQiuJ4EdyTGOp5LbA4Zhv5Jw=;
        b=dDifWv2MzMKY93oMdE8Jv5ebKWaLaXeDTbKsEip/1GQbn2ZbNWGqacXRnEcypAdR/o
         ZFM6JUC7k28FMjeoDLv/RWx3Na+sFFDNoOW+HK38GLZYeWAuxxuoWqX3luo+eGBohbch
         j6i/x3jGGyk04CwDb/DnDXIRAIdR1ZB87/p7XtYTFw9hr6KesKRmZ79R5sfZioYBoaHe
         4Lnayl0ME+iymChQ6CZTZZwFvTkrEj9Y8hAQQONOUhqCSRxC023sEb5K42COrxv4nI8i
         A8ymIBCPnmMdoWm3A1LCc2xlTYLJtvM08kgMuxSp4LmhqM86MSeMcy/8edy3gWez61lH
         zKtQ==
X-Gm-Message-State: AOJu0Yw0DPPR68fJ6JUKZgQk5Mv+FY08GF9IzxLARK7dVEQIArn27h7J
	B5M343cZlrbxBg0NJliqsoo1xP8u7dy8cKDxnDIguLilw7V82FvvmR80
X-Gm-Gg: ASbGncuZLqPhCjgFJEUBsP97F8jM49R84mHUq4KV2fY09QmDo9mftg/EPLQINvPJTWm
	srsViX4YHCRKLiiq/S8/JqZOJb2X93TbFAAjiG2ux2CWl1I5ZMByCv/afIiMyZkl9dypFq6KeJS
	r9HIxnbAABr87QiDS+22MLxWO2VHu6D90ox6XUt2k6KGSMb+fyjB16G6lUddx9oBHvcX9EbRxtX
	dGFOYYL/falkfOnDs0r6WNzt0f/5SBXkY5jAzRhED1VZzC0YS+5opTdIETvstCHg/6HUt0K7JkS
	KTOHVHvQkpYYyl5NOsBlMtpbm+SBDMSPNW8vd02nJUj4XoEJeabznUgQvmEJlmwwSND2OB5b/kz
	VLvAvnONLfBAfu8K6LR4=
X-Google-Smtp-Source: AGHT+IH8t/HYdYaLn4A6BPQCmjLIuGTipSY02NdGjOH+B1sJX4jmRDbvYZbTjMacSyby6WRpApDvXg==
X-Received: by 2002:a05:6830:4109:b0:73e:7fca:96bd with SMTP id 46e09a7af769-73e7fca9847mr138761a34.15.1752756942905;
        Thu, 17 Jul 2025 05:55:42 -0700 (PDT)
Received: from hiagonb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73cf10648ccsm3765795a34.13.2025.07.17.05.55.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 05:55:42 -0700 (PDT)
Date: Thu, 17 Jul 2025 09:55:39 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Chen Qi <Qi.Chen@windriver.com>,
	Hiago De Franco <hiago.franco@toradex.com>
Subject: Re: [OE-core] [PATCH 1/2] systemd: drop build dependency on
 util-linux
Message-ID: <20250717125539.7qte254o6do5yd5o@hiagonb>
References: <20250716232931.127811-1-hiagofranco@gmail.com>
 <20250716232931.127811-2-hiagofranco@gmail.com>
 <1853013D626CB3EF.8991@lists.openembedded.org>
 <CANNYZj8ea7jCLUjeu9oUz6itjS2M3fvxPHf6J_ZJTs2CpEjRFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj8ea7jCLUjeu9oUz6itjS2M3fvxPHf6J_ZJTs2CpEjRFA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 12:55:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220539

Hi Alex,

On Thu, Jul 17, 2025 at 11:56:10AM +0200, Alexander Kanavin wrote:
> Ah nevermind. The dependency was already there, it's just converted
> from floating to explicit?

Yes it was already there, but now we can set the option to build without
it, so we can remove it from DEPENDS and convert it into a
PACKAGECONFIG.

Thanks!

Hiago.

> 
> Alex
>

