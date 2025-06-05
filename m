Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8C1C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 14:51:10 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
 by mx.groups.io with SMTP id smtpd.web11.9786.1749135063699828152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 07:51:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Gvq1sL2U;
 spf=pass (domain: gmail.com, ip: 209.85.208.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so1649439a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 07:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749135062; x=1749739862; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GfDEKKfKIELiJWq2J6bTlNg1pZSPp/7Px0CVeRMHwqM=;
        b=Gvq1sL2Ua54bnxud8htAPtcyGaLACtVR1VV79zatvHVXEH5m2NsbHe94yfDcS8XRPU
         DlvvKjk17TpBIQFPZYwtdqunkh6qFPbuipnJ+K63aJxlmaS9pZ4h+xNF196WFogIDBjH
         1hs3xZ9fUGEs1TWPZqBECYqiK3eLvGnWS2zJm3XL+p7g7cae32lhvHqIdmsPRzg1qE1X
         8xmE86UminPaaiAM21DQVFJ+ciWjfKUEhFxLeJKOn5qBeojdghzwBElCaEBOHSvik576
         dp24wQLY4ZcfN9mbK6fX23E2E7Un0fEo2JDWGdBw9YMxlPOUm59OqWOP1/ytaoUW5aKS
         DpNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749135062; x=1749739862;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GfDEKKfKIELiJWq2J6bTlNg1pZSPp/7Px0CVeRMHwqM=;
        b=XgkowVn4GGw0rtMSsJeqxBndPUFPs25IhAfnulwRsdoG5sfz6SjvgjHWlawMnBz1IJ
         vUJz+T7GdCcYamMOXnQHC17BXNMeYTgmZAHiUJ3vcyYiEvd7vJ9VdtWA9hJiEQahNijy
         sM7NS4maMOqWyktN1vQXlNaMCcfeHaGClNSf9I5syaC2WYuc/Y6PEjbBJLSKDGvxQufo
         kZysQN0tDM/Y1lEQ2Uxg9YYJksejdAS5o2ctORxyqGEQjUm1cF5dMEm2qOYWaWGHdojK
         hyLXwVtDiQ3M0XukkohHS2Op6PJNtFfi7kr1npO0Zkyuy3Mrk6cffPvKiU3UgMtfkhwF
         mfhg==
X-Forwarded-Encrypted: i=1; AJvYcCVOzBA7cL+LJW69ImGijqqQg9AiJMFWkdqLGr9E7qscv5AqjqB7KOF2xIaEEl/KzNL3Y/qD1RP5HvqYcz91lV+adQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVwunjp4VI8+fTNYn8fBZxaz19zULBC5q62x0GWtjqpE6L0m4A
	FnR5oIX1GjqJ6CFRtUgW2ZaEoZVO/lqrWRoxuWqwIK5tVoY6SrJzxFakkRmf3Vad
X-Gm-Gg: ASbGncuXa7yVDn3ChgCKGnIRoKdMKVVdnoK+j/NiR0mrx8UtvlYm0NFKc3vLjIZXxbw
	CNu1wMSMjMkEEESOOkW3vrX8cpBptjk3WPX3lYQ/KdWVrKqfik1wVvnpFl3rg4SZBUdPE45ziF6
	EXsuH0QW26HvVXdpFBSNy/XJhkkP0XpiSoCvMuDYdKKh55hXObfqUhGudNLIF5Oo+wrhHevbWtE
	fqCGmo7j/P/hfiWLLvQr3ibkoV6DVx+FXYmOMssLGZdR3IT2c3M+nIdJX+qjV9HK3583xPNEW9Z
	DGbPdhwysKCjh2A4Sn5x2M5WT8IIn5s3i2RwgJugZskYzSqO47hZNrOKBig=
X-Google-Smtp-Source: AGHT+IHhjgswY0mEFJX5A2OEb77T1sAe8G/NFshgoLlZSeYFFLiuporLLOjIlzEq1c5aTvNBab+diw==
X-Received: by 2002:a17:906:cae7:b0:ade:8a6:b877 with SMTP id a640c23a62f3a-ade08a6c353mr327977866b.5.1749135061529;
        Thu, 05 Jun 2025 07:51:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad394b9sm1286216266b.132.2025.06.05.07.51.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 07:51:01 -0700 (PDT)
Message-ID: <ef04783f-b3b2-432f-acf3-d3c826395264@gmail.com>
Date: Thu, 5 Jun 2025 16:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] image-live.bbclass: support to enable/disable
 isohybrid
To: hongxu.jia@eng.windriver.com, openembedded-core@lists.openembedded.org
References: <20250605143728.4000790-1-hongxu.jia@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250605143728.4000790-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 14:51:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218030

On 6/5/25 16:37, hongxu via lists.openembedded.org wrote:
> Add var-NO_ISOHYBRID to disable or enable isohybrid, but still enable
> isohybrid by default as usual. User could set NO_ISOHYBRID = "1" in
> local.conf to disable it

Could this be please reversed? Like call it ISOHYBRID (or
ENABLE_ISOHYBRID, USE_ISOHYBRID...) instead of NO_ISOHYBRID and reverse
the current logic also accordingly? Possibly I'm dense, but I always
have to think 3 times when I face double-negation-enablements (and I
still set it incorrectly half of the time).

