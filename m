Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E559C5DF86
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 20:30:23 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3036.1787257815958498863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Aug 2026 13:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=LQJMSabF;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-90a80860d35so3308496d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 13:30:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257815; cv=none;
        d=google.com; s=arc-20260327;
        b=Q5M0VZAksZAWOpY1Ro8tfpYNSB7EE4M+ZQ6/nr2kEG41nuUv0ygkCg8uZNGSDgK+1C
         72H0Jwl/OVHcGArJKkZdP545BolHTOa5Ucd4JGfRZilR3KVzLnW4OdZbHVkPj2ey/HSc
         ZBw4sUTXinuynZEKd86GptzW0JaxabUZ6a1bQIyHuCQqWdLHBcpQR+rO1Ow7LC35l8Vq
         ms+GJk9CDrywZBuZ/YZ+eBSkJy+iAM9XgCVFQFjSpA98bJiNg8aAbZOEr308mv8+qH5Q
         WfikchsF5qpkWKsmYEQz5+vAE3n8rZZmAhRfIJ8xvZo7OGYNlB/oUkfAuR7Opzea8TvI
         8EYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1OQ85SEguDx5puE0gNPmJp80XFVMDX5ZzoFAb7XV8yI=;
        fh=rTGO84j1pvKsikBSy1Na5n6uZ5dZD4CdQXWin5J5O/0=;
        b=MWYmQ8wxpQXK/Eco4NGL5XlzYXeffJvBfFlOOioYxc2IWSu5K+TkxuDbcsX5yq7U/Z
         5Ydb4PBsRHHbeto4QBq10Ef4Kg5X7qowKXMIMVbIo7XIgBhoAy665HvtMCQ/Jm+uC5p3
         jy4leOFmcNmvOd6uwM8/bzZgIRxXKwn3uTANHly6JyUk40+RqhZhNc67gMCR4AP2rRpb
         X0gPwbRP7+8ZbaYjgjE2lp8/lq+HzVT8F5nyvjcvAbMsU4WKlN4IBG0BR5gyWoIBb2bC
         Ek3iLVcafYZOZiyymHqQzJTEJMO3lkREHazUgLcMcv8ZuXff3DZQd3GCGK514YoWl7md
         Apjw==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257815; x=1787862615; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1OQ85SEguDx5puE0gNPmJp80XFVMDX5ZzoFAb7XV8yI=;
        b=LQJMSabF302JT4dnI+J5wcNvFqVReb6nGGgSJpMRYIZNu/7mq8Ii9lfytw5HG0ah1Q
         vhMgzAaFZNTIz99bRq0mEZ5DeleeKIx0AzNfdVxJJP38lYJ9JBA+lrYodVmOWOxZGreL
         4DVo4xFKM9rLNIioas9mD0jCckUa73iwk9BX67VQkhqIVM6scUBobVyW1hzTaTy5SYTz
         NjtHh0T/Kjc+0WDpwuibB8zuCwUhQkaFNx3sE4C0i14fg2CSdyHdy3U9WRrHKolWFqrh
         Q8sTYx3NVQYwBg2kYMvnmyOYRLjh7Hx+gH/zJbCN4q7ze3Po7kJmeO8A8JE9zcUah1eP
         kVLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257815; x=1787862615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1OQ85SEguDx5puE0gNPmJp80XFVMDX5ZzoFAb7XV8yI=;
        b=bL1MzIzeWrTZTHBN/cq4IybB9NCmnUbsX2mLYEPPJveu0PveusbUSOf+LjPasYYB49
         SEdp5bjuA6HX1muLnckTPU9R+om8Ox6DZYnHO5bwHHFl8vfbuuymLbs1DP2hUpYar2GU
         r6rrjZuGbN+pyJQiSOHWfA8GjEJnBLIlZ1CLHb11AnqGYer8Kwy7Ojd/OeCkK+zZjMzg
         sVzv6ULJ0kK7QrLp2Yk2r2EpJvFmD8E1pIcAEZQ5JiAFndL/DmSwFot7iidpoi1m9P4d
         1ygkaxsGijZZ+iwLE2X8AEtdNAxRnmh4vdDODwaHgOcGRT0zkPKOi0LrKTPfX7SLW5SF
         dSkw==
X-Gm-Message-State: AFuF++k4+5OEJBabqJEPZ/yamRYN1fE/d0MY98ul90TzLl1V8cd6AmEf
	dFI2SU5vlCgDYU3Hz3lpHqhu/AZsOgOuA4SoCJckvrKGQxBz2tEGLfml5N9q8YBU+fn4KUiThQ0
	kaVM97lFp9rL1RAI/LLMfkls9dOhUkmA=
X-Gm-Gg: AR+sD12XGNa1of9T+BZa1DQLYUGEc3G0/lh8Qa7egRae/ry85TEqNuZthw2sLBuwT81
	hk93NiJ4WuSODDNlLIbE7MHOenJTPv/DKPvLMty1eEK/ii4/+vUUXhwrtDPNsZT58B4Xq9pRdky
	Cs1w3Gl236Wb7Qh44T7RArqFHfnXobS1/xzcy+IJCJivzmAs8DpvWEpF0VNOSYEJ0PNzrbCg+U/
	4Ru198HOeqh5VtVHku3wysLfe5mNaQyymQTsYNVDVNBA6q87qtsDP34bub8TKRFPZ1i2uW5ogbD
	+Jd3Mh3/QfsUEoC+OejqQd1huwAVpo3UA1wCZA4DHRtPqdXG1dyjVYZH4kQ+UUdNPVTLN0THGO/
	NTBQ=
X-Received: by 2002:a05:6214:3283:b0:8f3:e0ce:611e with SMTP id
 6a1803df08f44-90c80cb3f5bmr9632596d6.19.1787257814577; Thu, 20 Aug 2026
 13:30:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260820002213.2272711-1-dmitry.baryshkov@oss.qualcomm.com>
 <CANNYZj98f769T2und7rXmwOwjtegdLL5=PkyOwy-OnC-RGVGrQ@mail.gmail.com> <CAO9ioeW9YMpex+q7NS5RM7iOU8gF7888hTzTX+5ebh+M=TkPWw@mail.gmail.com>
In-Reply-To: <CAO9ioeW9YMpex+q7NS5RM7iOU8gF7888hTzTX+5ebh+M=TkPWw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 20 Aug 2026 22:29:59 +0200
X-Gm-Features: AcwNN1U9xZARNKXMg-LoM5BLgZGH3LjWVItSQzMQp13Rf0EJ9f_rC8qzPyXjiRM
Message-ID: <CANNYZj8WS-YFwVXWkHwoGh-dMaa3RROX=a7bbkMGR0WdtP+UPg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] recipe_sanity: accept new renameVar() arguments
 in the monkey-patch
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Aug 2026 20:30:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243884

On Thu, 20 Aug 2026 at 15:08, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> We have it enabled in qcom-distro. If you say it's deprecated, we will
> consider checking possible alternatives.

It's not explicitly deprecated, it's just one of those things that
isn't tested, and generally forgotten about. I'd say a better way is
to review what it does and move useful bits to insane.bbclass or
similar actually used QA code.

Alex

