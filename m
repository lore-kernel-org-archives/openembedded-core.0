Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152B7C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 17:17:48 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.527.1742404667272096210
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 10:17:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hbfh9eml;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6e91d323346so10072126d6.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 10:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742404666; x=1743009466; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=M2MBNi64uY4s8tw7H+IkexwI3jwbbEcyXdbiRsBEvgE=;
        b=hbfh9emlhMSe8WZki7bm18RocyoakGm78rw2yEEn8QF4Uy6SLUd2Jmb+l8fkKQdLlY
         HyZg8crjXNvScNYpjnjldK2xMtWWeoKMsjSQek3kb3AREtBg3U9YbkHjAyR40OgpOwyf
         HU2ADd35Dqy0XakU2/S2bTqokfJZZ4mFTXNtEPVEmCbY8xk/8TDvGNZn3uOL0K9FSSeO
         6J+yjd+mhFZBBnNucgOEusmWx8ihKRSdw0dEF9T5t3WisCSLl61xLcdy4wmpUXCgIz0X
         prbMeqf+3s9zFKHgLz/z8uucXc7yLDuF3cfUMRGCZlfkJrZBaRxqa/Q2+noiRnO3PG0b
         mGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742404666; x=1743009466;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M2MBNi64uY4s8tw7H+IkexwI3jwbbEcyXdbiRsBEvgE=;
        b=kMBW7zdmcBjSbzNq1DNBaiNAz5ihqtDHuSmhpt+sG5txROVnnQOlLE0Oa2Df/KDIqa
         qLTrFCX8xBpXTGBBrEfPLx5piGFnHEke4I0ooS2aecu2yjpFXHsWpBFU+n7zzajTOREr
         dzbQQAmJOKTFKK6kJAhya0fRoKAxMuxHW67IyAo/KRjZr9kuE4fVjO/LkxXp1uqpufMT
         3xfLCIr0ugHXVQF/Ii/GAdXrN11H2mkYDvoYKkVWPdU3uQD/HCszbZCuAHNC8McIO2N+
         SLKBdv2LUj3MeNYoojbV3kXMthycBuqAxqz18XibWF7+UzSh8exCd4SlWGrtlSFQiVzY
         83og==
X-Gm-Message-State: AOJu0YwS+LsTwm1PHnyx/yHNNoL4CU595OYZPzleKJ29WKtjb5oxViCG
	trG25pm7wpcWQnYEAzbRUpkC9Icyn2nc56UaYA/7RgfpJ6MpuYtqXX9yxa8zu+VpzSjhF5mhmwP
	6PbyVXrFPhAZQPlS3CwfGg+K2aq1HKw==
X-Gm-Gg: ASbGncsyVIzy4YxhYMlhkjnCNDIST+MssfGBcK1oqPRWLEH+NPf3MZleENPxeaodxNe
	bFVc0611zzpOhWYBTFZQqrOj851aVK3deAA2kAFG0mepCQ3Is7k8CCY+T28ylzr3NISvxgYhVsM
	QrzJ98PJ9MgSVdQl/EAFEl6VE4CemSCUFveW5dq6wFISdZXJqJmQffTIByyVen
X-Google-Smtp-Source: AGHT+IGnxd2MlxxBgt7qwBxyn8GgGb8jAJ/cJYSIGVxTtFhZ+79fzoO6gjcOr8fb+8oSzXOcwtFaWFlAM/XCExslMCY=
X-Received: by 2002:a05:6214:2408:b0:6e2:49eb:fb7 with SMTP id
 6a1803df08f44-6eb348dfa3fmr3806926d6.3.1742404666338; Wed, 19 Mar 2025
 10:17:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250319161327.2701095-1-peter@berginkonsult.se>
In-Reply-To: <20250319161327.2701095-1-peter@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Mar 2025 18:17:34 +0100
X-Gm-Features: AQ5f1JqX8FkuLi6y_BuuX2pu6GMNtA2Upv15UpR8e6lDFzsc1AjBfDZrVZ9SzM4
Message-ID: <CANNYZj-mrdUaG0SVu9CWjFF9edGESPNH=9jtJx8gbzuA1NJ-Xg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] pkg-config-native,librsvg-native: fix EXTRA_NATIVE_PKGCONFIG_PATH
To: peter@berginkonsult.se
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 17:17:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213347

On Wed, 19 Mar 2025 at 17:14, Peter Bergin via lists.openembedded.org
<peter=berginkonsult.se@lists.openembedded.org> wrote:
> This commit will try to resolve this to always append the
> EXTRA_NATIVE_PKGCONFIG_PATH. It is tested by building
> librsvg-native and also checking bitbake environment
> before and after.

Changes like this make me a bit nervous. Querying pkg-config is *very*
sensitive to the correct order of paths in variables, and things can
easily break when rearranging that.

Does target librsvg build ok as well? If so, this can perhaps go on
the autobuilder.

Alex

