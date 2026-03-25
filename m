Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BAD6106B523
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 12:35:03 +0000 (UTC)
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21457.1774442095131559076
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 05:34:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Q7hUeRdq;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-899fbf92bdbso75940786d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 05:34:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774442094; cv=none;
        d=google.com; s=arc-20240605;
        b=GAbKu4bt5KRAH2BK5NWPzX+egRmhexKeKy6CW/UjjyX8nDpNFjod91Toye4ikF6A0Y
         6QkVjHm97nsPhdbDsql7KS1O59h9a3vCQs20cJ6QqxfF3E6qWPy54XOyBQXbvVFa4kRa
         U+8TtOghU5nvRKTMyIhW+4l/iE3d3ObdEFyOZODkkvnh7nLm25pNbrGkiMt1a/ozdlns
         2NG/LhjpqiJq02gQGeOMXBu8dBYOtbOU3zaelnFM4PL84k94pBK8WZOpibJFga7l0QUf
         SaHnfTHY0a5qYll1jMOCxJ1sAV7kjiYTGBPGSo+dKSQw8fxJy/SmatN++ho4YX1VT5Mi
         77dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1IYvwIMot6ag0O87AIMSnsoC6t9oTDaDdZUqr/+KOtI=;
        fh=yg9HFI/65n1Nxbxfc79cW9kOSWF6ummo0d6ZzmDjQ68=;
        b=DG8sCyFpvWYExe5RbFn7SfYoqFtOQCVzH649Z6mNJ2pPhj1lz7vOMq7bQqjywJVlNk
         6cBjdBJsvRj30mPueqkRfss/s8TryXFQ8DVsi+SH8ohNF6WiY9sUG9+nEdByXjCSnMJK
         MHddisI8I1UraEAyefTETqmZkYuuAYltbLjrwalJwA4Gx6JUhdvSNodcyJsAhqG8XV+5
         a2m9Nw4yphXO39Xdsovk6HiJTNwti96ooujufnADdP7cYYM0XjTz8KDFUrZiwh52WTyb
         tMIA8A6G+VyEP33MXsdxCklxNpWIq0BM4zteflqDSiyQFAzDjAmEgPP56LgVWxyd89g4
         dHvg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774442094; x=1775046894; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1IYvwIMot6ag0O87AIMSnsoC6t9oTDaDdZUqr/+KOtI=;
        b=Q7hUeRdqyPWxeXDLmTZdPpGc6Ll/3jbuTCsLkV2xetvvrkrfYiiBRnlrAJZ8xLfzBd
         F2sgDFbsEVt5aORO8aSvrN2zWFFFg2vZ9B72U7UX5kUzUKrhGwWaXTgI5DkyNydMzR0r
         QMzGICaRzHVPFWfJcR7azNjqc1+aELGhg1X+dBLLGPg1EqNcXcIbfQHZzEW3uXbK+Sj2
         HRMFcePbZlbW/dj5vWRi2oEl9VuJ4YJIrUgwVG+JF78LoRiVEXVrLLspOfnkNTSADowM
         g7PhYgzLKoPc7IYejJLqTGZHI0PMWqHmgyWgW+J94uHaXYVVT6axusIs1UM3z6A+H5IK
         J3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774442094; x=1775046894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IYvwIMot6ag0O87AIMSnsoC6t9oTDaDdZUqr/+KOtI=;
        b=UjR6o43vlGhV3C1MQgtQlUpYXx4RR0S+ITRtrXeENjrZkOAk5/mObvBtFsTCjIu4eJ
         76sUPhzAV3ZrUoQ86B1YKKbCrHC2vimYnfpG2eBSIJKapeq8+5/06XuQ2ULU/iH8o/RL
         na9gAbVvqYqswpVFv4ptP1ZkDp26q7uy4c5QSeh/b0fLGAVgCDrTehnsNpXy/T3Jju6E
         RVBCe7g71VC9J85a0F0RILvEEBIyzdRUGlgucg4XLGIRu1xU2WH9CRU3R9PReomtmjzO
         /PW3S+OrwNeDxPpM6KPNHmyJGUbJeAY9g2XCm6KTC4J5M5ru2gzxLD44Rc5FBVuJ5dTz
         9TAQ==
X-Gm-Message-State: AOJu0YzfViEeQrpRUfHxQNPLISasd968su57FHTk7WBcWl4DpcFEDcd3
	2bQ0st5nDK/sAPzNoR4a+mrtNjARY0YnL56C81rEgXMqaQNb1AkDpdGMldpDFHQ20xkoWmPHNs9
	yxv+rOnN0RYJeMJokeM5RT0gDsc47EsA=
X-Gm-Gg: ATEYQzw6btTyT6HKeP03YVY7hTQZI0H6Jtx4nOewW1swA/OWBaKsng/dmhb7aZ678Em
	y+PUtIeble3cOoQDgII/ET06GSOm5JfzNCy5WImqphW3xm2EhIS0lZxPJumslFStQ43XN7BTsYC
	sKYPeL3lU8QVumhVN6Ff5Yt4tCopA5MxcoiWRHWpPQO62eangx7WT+UsgmbP2S+7FGMoGjxDVH1
	1g0Lr7NS4QMxlOO0ym6iouwRF8ec8cPSQ/lZj+m3ynPd1HJp3jK4AnHAx+PLuF7GSIH1obguuc5
	Rtyaqu+DsRLR5vh2m9PokruCEN5MztJKaKc+93KHpA==
X-Received: by 2002:a0c:e08b:0:10b0:89c:5319:cfe7 with SMTP id
 6a1803df08f44-89cc49c2ef5mr38506296d6.21.1774442094067; Wed, 25 Mar 2026
 05:34:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260325084021.3915804-1-daniel.turull@ericsson.com>
In-Reply-To: <20260325084021.3915804-1-daniel.turull@ericsson.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 25 Mar 2026 13:34:41 +0100
X-Gm-Features: AQROBzDNzH4BWr_drfkuL9hZOQojs9_13IUkV6p-Q6D4-5d9VrKIs_huI_aky8o
Message-ID: <CANNYZj8MsmLxQwwZCFMoH1Jfre_-UTFVZjP011AiaQk-x-pWQw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-kirk: Add version 4.0.0
To: daniel.turull@ericsson.com
Cc: openembedded-core@lists.openembedded.org, pratik.farkase@est.tech, 
	richard.purdie@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 12:35:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233896

On Wed, 25 Mar 2026 at 13:10, Daniel Turull via lists.openembedded.org
<daniel.turull=ericsson.com@lists.openembedded.org> wrote:
> +SRC_URI = "git://github.com/linux-test-project/kirk;protocol=https;branch=master"

We probably should take kirk from pypi via pypi.bbclass?

https://pypi.org/project/kirk/

Alex

