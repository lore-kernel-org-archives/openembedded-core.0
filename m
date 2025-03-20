Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78EE1C36001
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 07:37:06 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.2246.1742456224391486062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Mar 2025 00:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ib5nsWyc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso2145035e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 00:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1742456222; x=1743061022; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sdobyLB+2dRo5XTIa5auZVSiF0SHa1kZ0l1WqXOMWo=;
        b=ib5nsWycew5mVlkbhFoYWWLDqVR1K9DU2ib4i8XbIIN4R1N1U91NvYy/ZN7ZjNbwZA
         ++vMUFyZnkfKolFI01V9aIhA6n4KcyxSyCamGWzT9VDmE+mKGS9MzFTp4N3Z9Ch0jHSC
         1g7S5jHHT1611IpnuQcjBYfMZFWQZPbIAhY24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742456222; x=1743061022;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6sdobyLB+2dRo5XTIa5auZVSiF0SHa1kZ0l1WqXOMWo=;
        b=H/LgC6h/CKev+QWI5yQ8BBrfhcAdTTyFWh5JIAtI2Du4vhQWmRNmEedD9wqxLE9pyW
         XFPXCUBRz9DPVYcTReyW3l3XOEdEzmManOQyxPEz26PMruxPeHl+AZY5hT9bwBHRSh2z
         OmPoTVNBCFHjel4d/w/CeRre2B1QQtqUy5YAr++ZxMM4rpzUggMaRvM7efMvUQeQg/ZL
         rjmHGNZZynwO/1658Ih6hBhVxlN7pdMrS3ipc2DF+6xudhhCsUkg99SZ3lsuqATaNi4B
         5nmE/8je9F7GHCIXmcvHr3LIbUSei12uNF/80y8prtbQNV6QJ5e9HU0dMbtIaXSN0J8/
         6SJA==
X-Forwarded-Encrypted: i=1; AJvYcCU3iYaII0XVaul/w91qiPgPONGIqFg34iPeUt+SW+zRX3JWMO0/uaviMnSI6KVieHRO+fwOVuLq7lDetKRxfowk5Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVaQODjfdqAbYpX+SPFtr9KIg+L+wiOwtv38ps3djicpzyJrcc
	/q1xW/iWvG9d8dBHv4pVlapxpQG/k96mtM27tRAzPCADrTQuuQbRuSgKc7Us6jFf5zEtmWMrlaP
	n
X-Gm-Gg: ASbGnctN7ekNu+Qkh/EBv2Vk3H1zII1NNRduwbgaxTABz4BcdzPFJybkFrjjRt66kO9
	C8+cH1ZAUm1dxlBRWb1B67XsLPBk6OpmHuWAJmo0D4ioGyNODpO5WLDgINhCMOmXQyzW7oSidNV
	+wIEpRXRc34vuCIRPapdVDKJN2qU9FXSQkMICLMEHEGPwfhP1h8y/usfqVmlUAiRhizvQoo9VjV
	hJPl7EizuomkDwE2SMS4JSieKBCA7dDS5k77ctBE/690bytQhgl6OOsMjFP7leIQLUB+CbiV4sh
	+YGi+w7Cf0GUYv55LuceJUUaW4upbjWl0IdXmf7JEGid8DAoJXwsatwZR3p6zHV+LVLgVAk+jIa
	rQmKhURqzvVr4laySNoUjbZJLSTt+XPqXOg==
X-Google-Smtp-Source: AGHT+IG+zrMc2mpJym9bImGCrFjpVZ6S/VwrGHJbxxF/2XpdnT7ZVbOZautbNCF0mvKNbDxTHdKcDw==
X-Received: by 2002:a05:600c:4503:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43d437c3354mr57518885e9.16.1742456222475;
        Thu, 20 Mar 2025 00:37:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ede9:63ed:996d:ca84? ([2001:8b0:aba:5f3c:ede9:63ed:996d:ca84])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6a5esm22633043f8f.27.2025.03.20.00.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 00:37:01 -0700 (PDT)
Message-ID: <4890e4e46e07e1473da235daf0c489585d6b01cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v4 2/9] dbus-glib: Fix build with GCC 15
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Date: Thu, 20 Mar 2025 07:37:00 +0000
In-Reply-To: <20250319214213.2505249-2-raj.khem@gmail.com>
References: <20250319214213.2505249-1-raj.khem@gmail.com>
	 <20250319214213.2505249-2-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Mar 2025 07:37:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213371

On Wed, 2025-03-19 at 14:42 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> GCC 15 defaults to C23, it can not handle it
> latest release is from 2021, and this seems to be
> deprecated upstream and no longer actively
> developed.

This isn't true with 0.114 which was recently released.

Was it confirmed we still need this with 0.114?

Cheers,

Richard


