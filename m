Return-Path: <gael.portay@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 244CFD637D1
	for <webhook@archiver.kernel.org>; Wed, 13 Nov 2024 22:48:05 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.24669.1731538076639042205
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Nov 2024 14:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h2XjfGOn;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: gael.portay@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-37d4ddd7ac1so3077f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 14:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731538075; x=1732142875; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlihDmWVpU7tvSRDp++U2HN0RQrogWLG1pE+w8gPo8o=;
        b=h2XjfGOnanqcyxl6Xr8nTaUBAL5LL5ckO2QezleqFrapjFqjonWRqXMDl3Ypti+cFw
         7T9xj7CTGPAIrLbx1ESP/kMkaG8hllVr9PVhHqkLHy2mva22Rh9CN3T/aU7bkjdpe6qt
         A8J3i695AJpDbbhJtq5zAwMe9X8jYUx4ZvfOdraZ+I2Bonu/muI/n/EfAyh0r6+Reg+J
         hrsEQI4DK12HINurjcxpVkVWVmpzsWXmS6sE40E80J/YQi97Jjcbf0YIGeW4Tv2HZcDj
         JZYNOsxxE2LbIW5PZ2WFk8gCnaPgw8y70NynXsQB+VbL/9uAH+GhDuejxwfoaHYdd8z+
         nDfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731538075; x=1732142875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wlihDmWVpU7tvSRDp++U2HN0RQrogWLG1pE+w8gPo8o=;
        b=TjR538pmiraK+9fBnvdzm1iY2xuEyK7FGumx14YhUL16Ye3TfdFHUwHcr48bBpnezq
         EJOD0wONn5X7AdFxZSQ8bSAXrqJJganmLZxl7DpHPIK0ml8wQQ/e6YoN8NatVesrDhRy
         fVhUNWeSzU1dnhwQdpn4N9xzxmSk+64ulTdCGfhEQWGnWYPwfLV9Wis+9W/9WPBXVWT9
         tm2iZxS/4O9mAQqwR9pRMg3jvAMFCh9ki+UkOTo6WbnH3ulYKoUZc44RStF6/vFu2oWA
         245vBsh5iVoUO6Pq23/RBOYxNyLQFmGB2Yr33mvU1fwRGkj5v/v8DUI/oOsYJWj48vQZ
         LxcA==
X-Gm-Message-State: AOJu0YzIfIZ1qQvBAjVT6a6wuNYHgbcr5uJLqG+9+XcodAWe2lW9vlPS
	DaXXWrCwZYvpOC8a2CIYDNT/vjBBLtQHJdzc6QOLJd+cdtBNhSw3
X-Google-Smtp-Source: AGHT+IFueBwHMQuhT3c6Y9N110aGgmclayCPZde4dcd5OnwAXXwjNh0Nk9sEmiuZ1PHQOZWcqDwQ/A==
X-Received: by 2002:a05:600c:154c:b0:42c:ba83:3efa with SMTP id 5b1f17b1804b1-432b74a1214mr77856575e9.0.1731538074593;
        Wed, 13 Nov 2024 14:47:54 -0800 (PST)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d9d116fdsm3852725e9.32.2024.11.13.14.47.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 14:47:53 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 13 Nov 2024 23:47:53 +0100
Message-Id: <D5LF0PDI4CHU.2UIPB51BV8TJI@gmail.com>
Cc: <openembedded-core@lists.openembedded.org>, "Peter Kjellerstedt"
 <peter.kjellerstedt@axis.com>, "ChenQi" <Qi.Chen@windriver.com>
Subject: Re: [OE-core][PATCH v2] systemd: set better sane time at startup
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>,
 =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay+rtone@gmail.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241112192214.1644312-1-gael.portay+rtone@gmail.com>
 <CANNYZj-TUJahfs4GLfjtcLVJRBOxx4Mf93X8b_9GAu_iToUdgA@mail.gmail.com>
In-Reply-To: <CANNYZj-TUJahfs4GLfjtcLVJRBOxx4Mf93X8b_9GAu_iToUdgA@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Nov 2024 22:48:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207136

Alex,

On Tue Nov 12, 2024 at 9:22 PM CET, Alexander Kanavin wrote:
> I'm sorry, this was probably already covered and I'm just forgetful,
> but why not do this in do_install?
>

It was initially performed by a rootfs post-command to mimic what does
rootfs_update_timestamp() but for systemd. And you argued it is recipe
specific and should not be a rootfs post-command.

The idea was to create the file at image creation time in order to set a
better date than the one hardcoded in the systemd binary (taken from the
date of the tag IIRC).

Also, playing with the variable $REPRODUCIBLE_TIMESTAMP_ROOTFS for the
reproducible-builds (kirkstone, scarthgap).

Note: Obviously, it is now the variable $SOURCE_DATE_EPOCH_FALLBACK to
play with on the master branch.

Peter suggested to move it to pkg_postinst:${PN} so the file is created
at image creation time.

> Alex
>

Regards,
Ga=C3=ABl

