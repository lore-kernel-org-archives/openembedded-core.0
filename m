Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD95EB7EB7
	for <webhook@archiver.kernel.org>; Wed,  4 Mar 2026 10:11:53 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14682.1772619108945417469
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Mar 2026 02:11:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EPyDhgWl;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-506c00df428so60129061cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 02:11:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772619108; cv=none;
        d=google.com; s=arc-20240605;
        b=Hf0i0sFnV/ySIT0TM1ElaeYVdxESldqWMBJaDWN0wCZJkhe3aFl6Udbp9my7U4Us0n
         B8UnBL7VrPaOUd0+rjOTwEUHyZZL4EhL3pz8WO4jC8llbYlaWU+MYwTSjYE3+GxJpEUA
         9ejzDfXWbr7jxKo6zhiUiDCs7uVNH945vfnlXrfK+uxK+6FIWSUu0oGMgkSae7Yc+fvi
         lD5eCzPaUYK6n58//ickS8/jeT1dXBgdloUCUT5X8A0SSnbNTcmrEvzJ+lfkHYvGSmmF
         g/ietW/CI7bVahxSxYfX8Z8xgFTlU9uin5b0QJ2KB5y10X5UF/kkp5oHDCMOqPvcdXuV
         XL4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TVSXQiFWJYMMD4MKSOLiHVRQ9TjCyPKcnNkKfhcq0LI=;
        fh=5j+5uZorKYMInVZFVPRixheCyqTSefXCb8hsVqZjYuc=;
        b=c+SanrMxskAAY7Xc0L+b3ipxxC/iWmbqEumyZm/6t+yL8PmOMfvdgktWERj5ktXEuK
         2EPSGmXRaCEp/ueryCnnt2FRbfCtae+r6kAJUZZNLV7uCF2RBtWk9actnJXbIBcPbM8X
         8YqcFJMdu9GGQKPV+Gakl6pYIFsO7yGv5JODJCLwq/UDUs7jYOf2Ot/5GhLTzHeC/IIu
         qPe9EoWyMs6jjaKCQroaeUe6wBL/twxhDhRm6MOKAPyzFGmz78LnoIgcbAdaHy1gwmEa
         RUESta/HuyBoBQIAxJiUsNIVnX14LX1yVsU01zWCyMYymTSIh+1Y8snsLlrkFlOCsxCy
         /aLg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772619108; x=1773223908; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TVSXQiFWJYMMD4MKSOLiHVRQ9TjCyPKcnNkKfhcq0LI=;
        b=EPyDhgWl3NyLa1VfMTkbdYOY6hB3WPgegNGoBaLX6v2fG+LQD+MVOST4epmtaEuNH+
         2YVJUhlxuNtaFlc0CpKF04nYeKWCfTYOoS0DCGXGCcEcK7MXebdRkBZPanglR3HOLM28
         yw7ZnzwIQYXfxryGOxEyxrsFTPBrzqE8xUzVniCQdbP+BlItIAYqPUdEdD/uZOY8/Z15
         O37bifzQkf9riCJuo4kdQN0vrsnFdBc6vGZ+aYXQ8aUZMSWX2dzxfGR8ucEKCl6qgOAC
         jYBcyRvuZI06a4UnJGL+JMFTyH6a+saL2bnKaPF4dGqig5plip3VOTN4bpUCRXwsh/jb
         8doQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772619108; x=1773223908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVSXQiFWJYMMD4MKSOLiHVRQ9TjCyPKcnNkKfhcq0LI=;
        b=GGPy9WzxI7zahcuT83QZUW2sqngJDS/A8kpJ10O3MXKx6VYL23yJoThOyc9ZVPuZI0
         ew2iApG4j15OoZ+KCf1qJvlU324wTGH7BXtGbTBbJiEC5sACn3uCJQKw7yOfi82Ma9dd
         cwTYlGI7ENZw/23DQDvQlrYST/9b9Uq5mmTy/bo9tCu/kUmjuw8jz7NVZaJ7PV8kxvlI
         7j0CcbqXQm2fMHJyHIS7IDr2RG9emDqJCMZMH3mueTebEHjL/ApP5aKJkrMLCjA8sDIC
         4L/JLJcuT8Bm+PVKy9+wKYa1KNe7wTeW4isG6vmiFlBIHxUrzaNRBAplZJvjbjUCPWt3
         eSNw==
X-Forwarded-Encrypted: i=1; AJvYcCXoBam75zCO8R+XIT6yZgX81H/FKdY/1lbvXXZYgI6B/RLk8vJGrn3V4DyYVqb280apr4Auuz6AYJWdwUiPGH3Z9w==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyOZfkm6PBjQhlGqoSyIN1r8RcvBjSdXZaFK8Rn8s7pEWWffFKz
	jpqNBqWmg0kXhbxvIrP/wQ1vU4jP9Lju82tr+b3x+tsvBqLORGbmfRaCBqAIgbKJKdpabmqsq7X
	an0XIbqIzoGidgV9z4U/11q/RM9qdSnc=
X-Gm-Gg: ATEYQzy7VMQctDWX/9NGciCqChh0qA2m2iJl3gr4KCb8BMs8CehSpua2sj9bGzgcDfC
	Z5D8N5XmpHMXen+YugT57gZCNWoERb3bZKCiVs5fzcDGF5KhlL7B+Ylu/wcOWI+ARhDd/s2AYMI
	IXdPj4IHPTuSMLiJVspE+rxeXPWqwH4bWrUXfI0SxeFz4beaddneBg2VYDYJdq4ofFXiwMquw3c
	jXbcoLqS5n/quQ+EaRAUrsP4l4/NA7L4XCMscaIh4apxhNf47BlyIr6Gpb6Nkjg7SRbKJ/kiDfD
	ANrPaCSZMN3GPF2P55an7w/KGqXt72L5lVJ2OGDRQQ==
X-Received: by 2002:ac8:5846:0:b0:506:a5f1:e5e5 with SMTP id
 d75a77b69052e-508db45bb1amr16613881cf.76.1772619108005; Wed, 04 Mar 2026
 02:11:48 -0800 (PST)
MIME-Version: 1.0
References: <0101019c720ee382-b27e2993-68bf-4034-a5b8-1bc9fd0d4663-000000@us-west-2.amazonses.com>
 <6733c658-47d6-488b-8f0a-ea19bf20df47@windriver.com> <TYWPR01MB118611CAA2AAC1BEC4086414ADC72A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <afd3d79d-4201-4fa7-ae3e-174702e692a3@windriver.com> <TYWPR01MB118617E05B1321306A4EBAE85DC73A@TYWPR01MB11861.jpnprd01.prod.outlook.com>
 <bf03027d-1e5e-491e-8f01-6ba833ea00ec@windriver.com> <4976379c-144e-4863-8922-3962c4daeb21@windriver.com>
 <TYWPR01MB11861C1210F5A249BE0721E51DC7FA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB11861C1210F5A249BE0721E51DC7FA@TYWPR01MB11861.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 Mar 2026 11:11:37 +0100
X-Gm-Features: AaiRm53u6-8MefQx9bl_8wSHUU2w1otbhYpQ-2v5BDlrS84gTq5sy4Wc4cU7lJM
Message-ID: <CANNYZj8N=aJLtrWx4dTJoRP4hjC44hZHqPWKQG-ijuOXkFtLZA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] python3-rdflib: upgrading to 7.6.0 SUCCEEDED
To: "Mingyu Wang (Fujitsu)" <wangmy@fujitsu.com>
Cc: Hongxu Jia <hongxu.jia@windriver.com>, Randy MacLeod <randy.macleod@windriver.com>, 
	"Li, Changqing" <changqing.li@windriver.com>, "Chen, Qi" <qi.chen@windriver.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Mar 2026 10:11:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232355

On Tue, 3 Mar 2026 at 10:42, Mingyu Wang (Fujitsu) <wangmy@fujitsu.com> wrote:
> The following two are temporarily held back from upgrading because they need to be upgraded together, and the upstream of gstreamer1.0-vaapi has not yet been updated to the latest version.:
>
> gstreamer1.0-vaapi
>
> gstreamer1.0

Gstreamer vaapi has been removed in 1.28:
https://gstreamer.freedesktop.org/releases/1.28/

So please do not wait for something that will never happen, it would
be good to get gstreamer 1.28 into upcoming LTS, but timing is getting
very tight.

Alex

