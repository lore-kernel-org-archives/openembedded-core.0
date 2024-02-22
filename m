Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1B0C5478C
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 09:41:06 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.9387.1708594864516828657
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Feb 2024 01:41:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UIPn60YG;
 spf=pass (domain: gmail.com, ip: 209.85.167.42, mailfrom: michalwsieron@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5101cd91017so9970105e87.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 01:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708594862; x=1709199662; darn=lists.openembedded.org;
        h=content-transfer-encoding:message-id:references:in-reply-to:subject
         :cc:to:from:date:mime-version:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RhISdCU7O10iP2K4ttZKuRQoWiITxV6eVuR+gPneo10=;
        b=UIPn60YGHnUgZPa2/WqOeQwFDzPtMPIxHqSAe5ddhGVYWmpNbvLTuZx5lHKQPC4LBz
         W5uFuHLTYpwu9kj+M1mBDx0sV7iBL2jBSdWShO7Y9Me0AJoFZoECOR88eb91j+HmwoM9
         66ezBp4Dl+eXOL135EVc7+z/DnQYK29ZHmvP1xfFlWHtM1TNgnwHRmcB+pTbv6CkxIlu
         ByNGCwgXZt7JQ6mAkxWpVWfM75Frfr4KzCqjHUJ231bB7hY6WxEnbJucQhbaLNFlmeEC
         NAxpeXQr4/TJQNFMOzy5en64oP6KoIORF+0G5LLlXzknphmo9eO1Wm0Q4ZiuCzCgze4s
         JdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708594862; x=1709199662;
        h=content-transfer-encoding:message-id:references:in-reply-to:subject
         :cc:to:from:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=RhISdCU7O10iP2K4ttZKuRQoWiITxV6eVuR+gPneo10=;
        b=jdQv7sCxkMczceOd//+dXjNZHI8SUX9nrDlifzbr15KzhhyiVZnarf3psv0XNSp4Rg
         WNXGlZeASyLfFu0mLd/dKOOGex9K9RxeyOG5x9TQ3vkbdxpTJrxaDzaD+dObA3YBENWq
         hRY9Z2GYzuVpob3r+i2j7KSuvB5qBJXtQohgsDf34L51Ght2TuRt5Y2D64uJrp6LMN7/
         prsvkts/6q2+llSafaus0o1ZwNatbF/BDaDasYY5xeRtvjcQMAYr5mKNJIZWCZoRbTJj
         lcmSJ+W/6FSfrEkI0iySjC5+I6jt+Qo5jv8jC4v0LnReCtLQbi5IlxUJ6a5SonK7nZaq
         0YBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2Mfv65yTk0cNtTeszVGnblFXatl/RTfYEZmxLg+xo5pZNkMdNu9lm3DQ905gwqznp/RBKQm1FDaS1EwKRJKJZigVbnW+mj9pIDfP4flhsifFTq4yb5hHy
X-Gm-Message-State: AOJu0YzUG1VDbTHAk3GrvD0lsRZU/QRbRhE0TNtm0p4bpWKeN/wwBfF3
	/6Rwy/eS+2rQF1RfhZYIDV+apoqXzQSCaCI8C7/1zIvowK4e44ry
X-Google-Smtp-Source: AGHT+IEc39uQ0SQWcXNBqTaeHDCayxzV2wffoK22b21cWtIFCkegaiNnAejaaKJhU+kZ+NkVUDRm3w==
X-Received: by 2002:a05:6512:3fc:b0:512:ceae:93d9 with SMTP id n28-20020a05651203fc00b00512ceae93d9mr2630271lfq.28.1708594862163;
        Thu, 22 Feb 2024 01:41:02 -0800 (PST)
Received: from roundcube.local (host10911.telnetropczyce.pl. [45.158.109.11])
        by smtp.gmail.com with ESMTPSA id z15-20020a056512308f00b00511a7f26413sm1989693lfd.293.2024.02.22.01.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 01:41:01 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 22 Feb 2024 09:41:00 +0000
From: michalwsieron@gmail.com
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: alex.kanavin@gmail.com, Ross Burton <ross.burton@arm.com>, ChenQi
 <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] sanity.bbclass: raise_sanity_error if /tmp is
 noexec
In-Reply-To: <b83edeb7-62c3-43af-80cf-c22f2e4041e4@windriver.com>
References: <20240209140939.186588-1-michalwsieron@gmail.com>
 <94AE8BC1-9AA9-4DFB-B7B6-80CC83897ACD@arm.com>
 <b128ef22-03b4-ebd7-1b2d-40b2d8ab2201@windriver.com>
 <461776CF-3A33-4053-9FCA-009B4BA98246@arm.com>
 <CANNYZj9N5SyTPoJas+Zb5rJ9ztQRke_roNZ2cBafXo-5zhDsDQ@mail.gmail.com>
 <b83edeb7-62c3-43af-80cf-c22f2e4041e4@windriver.com>
Message-ID: <19fa9384f52fb2bc0bd11a32548d8bad@gmail.com>
X-Sender: michalwsieron@gmail.com
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 09:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196007

> Michal, what problem are you seeing?

So originally I encountered this issue when building sbsigntool. Now I 
see that I was simply using a modified version of an older recipe 
revision.
If I were to use a somewhat recent one, I would have this change in 
place 
https://github.com/Wind-River/meta-secure-core/commit/f341b8653c65460d03a652a4af39fc876ea8a992

Anyway, when I talked about this on IRC, I suggested making this a 
warning, but Ross and Richard wanted to hard error on this instead. I 
guess we could make it a warning after all if that would break your 
setup.

Michał

