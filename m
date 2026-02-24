Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33AC5E9B249
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 09:58:59 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17067.1771927132201642450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Feb 2026 01:58:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LTbVJZqd;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8954c181830so63345136d6.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 01:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771927131; cv=none;
        d=google.com; s=arc-20240605;
        b=hE8J+LZC+N2GqsiAtDGN9drobcBmscuMEKyBmOvMq9wKvbMeBvBuTQS2h9VKd7Xo8i
         JsAc8sNU0H4x3yHsK1pCTM6SWduhH9v0gYKpxbce4uCNYbR9BPLa6UWUz9vKv8hWHdPi
         B0uiS2bmNcjytlgHnO9bUGgJp+J7kotlNDlR5IaElc2kOC/3gXoKAADRW+aO4YN2R0B0
         d0xe6TVu/k9Bgnp9oqtLWhDUJQbDW2rNcXFhQzd2g9y4+zqZAZNiz1RusNg9mgLD94F8
         GoV/AJL69opJmSdhEy95JMtWI7sYInAJvIye+1O3aYaWXj/eJf0vaD802m4b5d8pfcvZ
         XSog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wVxXAZX+owV90uf++dG8tXxFZcu09Zc8q6vqG+hWu8Y=;
        fh=yRup0gQd4Qk9N6eUNj8kXkuKvdCTwWcKSeXZ5+LSHis=;
        b=BTQIHtIg8aENv3qtaVgHGcLIBwACdmwasCbg/d21MnQ8D0NnyIkazD0Ou38/3x4juN
         JVq91k3Lp/1NrKcZUK65Wq/Gy6yjd7ZF4xCz3w4eGe1uD79McuJ8ne9i4/EwGqt8NKFj
         9AOBIvxP5eOrbyLWWNRJD9lOTp7EOGR2+4aeumlI2xcCYIHJeaDGY4q2eNEqih6GgdDO
         ykDhwFfiFZbaBSCooDbQdaLObXmqJg2th9F8KRsu9NqGPyTSlATGGp9r4/sI4Ec6y31o
         oDLMoS+z+0hhj/R4Kinn/qpMMPP9coeCtIGQSQ7RBaJWCzKA1DdDvpoS/2TfzUyjGfpV
         wR0w==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771927131; x=1772531931; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wVxXAZX+owV90uf++dG8tXxFZcu09Zc8q6vqG+hWu8Y=;
        b=LTbVJZqdDWs8p7lpvmz392U8ancI7I0jmSiln7J9XKxPwI6PEEbf15o+/w40s1NG7r
         dlp62VYsGC7CCivPTH8qH1qTVQjGcgcMnUEjcWCwad/szfUorvVLLV0N+GBl5z5uuGnC
         yie0aQwlDVNGqisFKnKknqQOf6+qHLdWavZwPNcn7O5996uteBQFDU5z9sl9AWCtd+hs
         XqVPyenT2RZkD+dduW+gXenDcTyw/iPneU3pEg4Gqn0jaYbs0UQVQCcjq5s8k3Zk1a4b
         BUvvibN7JQ2dBKXXBi9YMw3rM4qY4LilfEbouw8XZ0IX8G1IB0a7vf928rglCUlzkboO
         PPdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771927131; x=1772531931;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVxXAZX+owV90uf++dG8tXxFZcu09Zc8q6vqG+hWu8Y=;
        b=FI/hTHWZ5CDT9keUdy1cVLncawp0DIO4ZS23WUdxhbhJQvKIgUuaOI5Jm8HRyysIZi
         2vm//fgWgQLF3L3boIRM/qwvSmKYlq4N8cgkCdiJjRinhgbgsFf1ECSQT9o32vACTUXP
         lICiw/yVh6UU+XniFhYcGTi+D6EzXcHKLW3evfBP38h+2MXidNvRf3UB0YvBdnFmFylw
         F4ymQ/IjVRfuDy0JtZwIWXo3A6/laO7aRruMO7/SiC2p5qEsTQDgJQdsPhEvHhSTJSPD
         u2TsA7m2freQSogE8Xy8KQIrRWAB+uLYulWhYd1WUidNlZzUYCER6vZBMFO4WXWjKsev
         pgVw==
X-Gm-Message-State: AOJu0YychyO6eeIJtxvMsNt/UWDIyTZ6Fg8a6XnJgzXlZI+Z4zcWEEA/
	RIaQq1JxkXcAhGE6siSzAsXjGqcb++OfBGab6i/whUxtOQfIcuKetQoirsza4br4oTmx6gekr+i
	JCLmdVkhY4ca5c2dQund9PI9VdaMeUmtaqQ==
X-Gm-Gg: ATEYQzxHYbtdQSRCPzcM/yjeJx448UjqHOzOXdmDD4vogk3sU/1YRlVdsQKkq3WdC/n
	OYTnH+3B7nm140nwBRjTZFKW8s9RBPCnsmgX9JFhMlbkiibkjtZEPZwjkmK6FKsPzY70OhCvP7h
	Fhi0uadkNd3XEstObqzRGswp1WGfJeLr1bxFZUW3S9NILKAYNDs7uQgXY6lUBdDCfWEo744D+NF
	rUzgP5aYWC5qTURr8kNUsubDuq4E+1v9IutHbkBHHERNk5XsWp68e5K6+UP8CltgdMCenRWx3gm
	rx5glXLKohiK5EQRtFueHYEU96r8xhq8WmaJeYe9IQ==
X-Received: by 2002:ad4:5961:0:b0:895:4852:ef4f with SMTP id
 6a1803df08f44-89979d4cedemr182781446d6.35.1771927130967; Tue, 24 Feb 2026
 01:58:50 -0800 (PST)
MIME-Version: 1.0
References: <20260224014148.3328393-1-changqing.li@windriver.com> <20260224014148.3328393-2-changqing.li@windriver.com>
In-Reply-To: <20260224014148.3328393-2-changqing.li@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Feb 2026 10:58:38 +0100
X-Gm-Features: AaiRm506P1hzR02b7rXXehdGmJCoYLw2xGA1DDiDNggz2ApumqVrPejHXUkOJjg
Message-ID: <CANNYZj9RjdkAp326jT1RmeQFEUYyaE_wG6RROeWvtX7xdgMGFw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] appstream: upgrade from 1.0.6 to 1.1.2
To: changqing.li@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Feb 2026 09:58:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231757

On Tue, 24 Feb 2026 at 02:42, Changqing Li via lists.openembedded.org
<changqing.li=windriver.com@lists.openembedded.org> wrote:

> +PACKAGECONFIG:class-target += "bash-completion"
>
>  PACKAGECONFIG[systemd] = "-Dsystemd=true,-Dsystemd=false,systemd"
>  PACKAGECONFIG[stemming] = "-Dstemming=true,-Dstemming=false,libstemmer"
>  PACKAGECONFIG[qt6] = "-Dqt=true,-Dqt=false,qtbase"
> +PACKAGECONFIG[bash-completion] = "-Dbash-completion=true,-Dbash-completion=false,bash-completion"

bash-completion can perhaps stay disabled for both native and target?

Alex

