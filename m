Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74AA2E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 08:30:49 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.15486.1733992246056076171
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 00:30:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=NTyJhC5e;
 spf=pass (domain: linaro.org, ip: 209.85.167.42, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-540218726d5so345592e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 00:30:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733992244; x=1734597044; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zbl+61awgpx3ns0PRlvC3i0jzxpZpz+kIgiuCaip28Y=;
        b=NTyJhC5eS19c4IQycWPxG7BUjWox713V7RrPCArFZTpRq4ejp8gE9CIuzhf42NaVNt
         BS+zwomnd/P47Ory+Xpt3j3qnUFMRYN475WDmckWmVBwJgJYa21PKKBJS2+w+GcKSzT8
         DqZhXgcodyevZ/UdnMpME7y0hRdsssBUzP0w84pv42BGAoj/qyK7eltxyYymQiehivMg
         cJn0pyoNDQx6xITlvKDY4Vs3ILRht7kZBHejMk4OC3hllxZKYNPLdQFWEujQ4SSZq4GZ
         EMrYmd8Pl+wbyi+aN0nbtVGP2663vx8reqpiI5b6vZ1m8w6iVUsGc/Q71NDh0KCMSunL
         VgGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733992244; x=1734597044;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zbl+61awgpx3ns0PRlvC3i0jzxpZpz+kIgiuCaip28Y=;
        b=qrFnQWFUeB0Ji+ophOkF9u4STC27L7r0wuF99xJHomPB+pJPZWatrqBQwtyrxitsc6
         WT8NiaEmnZ+TkUrIqymmgBVCzC9a+wdfEky2HHCynrfBpuFu60A/HWpsRFBMCnjqIN9+
         upiljbrFHuIZpt9xKs6u9ltQffYDas7waQIbc/Cy03oKPLgO7jPEV5c5lqAjCjy20saL
         sNQUMcfjrcMVFiftveM1TepxkLQ+lhfi8gJXPrW+VSWbaHc/77+wuxl8wsk0dlda8U7r
         2qNmgo6CxCczMJQkBgBYlMjlpVAe9sm0q9ukICs7LQhSR8WWxLBGeUx2/IdLMUy3NEgV
         eYJw==
X-Forwarded-Encrypted: i=1; AJvYcCXfg0vABrr29qzlIW38UTtJPFeQSmHb2ef8jKW9FKt6HL6FNUPaF7E9MzW5BbL1mMLyFus5H6ydM4NaraKRf8cTUw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Ywsm1rq5zANXxtKwm/5aEBtTO/bdp7UQ0INjuD14VPS6BAImM65
	adkBeqUQChrGka2Zf4mKVcSBb8hbuBl2Rk0Bm49vPQmild39CE53+nrENrGP/XQ=
X-Gm-Gg: ASbGncvsJHYIeMDYf6g6/7G9jwUNbqeD7nKrYy86/jHkApjn1VmneuMWZI68+DckDB0
	EpzK80bHDxYAePG9W9qvxJR2HOLkj/jW//C8VzZ8JYIA7c6cVLsZmNV2KbhrKYAQXr028wdXz89
	vASGzPNC+BlbMmL3KQV5aoRqSb887z455BX4RMroeCzpg2WRZS1kfFDE6ujezoEhuAX37DjeEpc
	3IkIlB2vSFzh0uQHk4+psMb4yCT4qww91uMj2Ykgoof1btSfGu4XtnlzJuxuI9LU0oGfe0RfKJp
	Jgu1fg==
X-Google-Smtp-Source: AGHT+IEreX2HYo+8ku5dEau/BFiU5zx6SGh8DdWDxjM33PBMu9r5v662savfUQ2ePF97ZCdO4baRzg==
X-Received: by 2002:a05:6512:1310:b0:540:1b7e:c900 with SMTP id 2adb3069b0e04-54032d3475fmr190382e87.14.1733992243900;
        Thu, 12 Dec 2024 00:30:43 -0800 (PST)
Received: from nuoska (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402960b0absm575271e87.102.2024.12.12.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 00:30:42 -0800 (PST)
Date: Thu, 12 Dec 2024 10:30:38 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: wangmy@fujitsu.com, openembedded-core@lists.openembedded.org,
	Wang Mingyu <wangmy@cn.fujitsu.com>
Subject: Re: [OE-core] [PATCH v2] systemd-boot: upgrade 256.8 -> 256.9
Message-ID: <Z1qfLjJ7OnXIFAK2@nuoska>
References: <1733964540-5537-1-git-send-email-wangmy@fujitsu.com>
 <1733964540-5537-2-git-send-email-wangmy@fujitsu.com>
 <Z1qT2DQ_jGIstNcY@nuoska>
 <CANNYZj86YOBLurL4n774DPS-GQeqSPv8Zzw4DOoGVi_a57pS+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANNYZj86YOBLurL4n774DPS-GQeqSPv8Zzw4DOoGVi_a57pS+Q@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 08:30:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208628

Hi,

On Thu, Dec 12, 2024 at 08:58:51AM +0100, Alexander Kanavin wrote:
> On Thu, 12 Dec 2024 at 08:42, Mikko Rapeli via lists.openembedded.org
> <mikko.rapeli=linaro.org@lists.openembedded.org> wrote:
> > >  ...ystemd-boot-native_256.8.bb => systemd-boot-native_256.9.bb} | 0
> > >  .../systemd/{systemd-boot_256.8.bb => systemd-boot_256.9.bb}    | 0
> > >  meta/recipes-core/systemd/systemd.inc                           | 2 +-
> > >  .../recipes-core/systemd/{systemd_256.8.bb => systemd_256.9.bb} | 0
> 
> 
> > NACK: must also update systemd and systemd-boot-native recipe versions since
> > systemd, systemd-boot and systemd-boot-native all use systemd.inc.
> 
> The patch actually does this. Is something still missing?

You're right and I was wrong, sorry. I guess v1 of the patch was in current
master-next which was missing systemd recipe update. Would be nice to
change patch title prefix from systemd-boot to systemd though.

Cheers,

-Mikko

