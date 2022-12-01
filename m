Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18846C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 19:08:06 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.53775.1669921684917712440
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 11:08:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f0cSMnN2;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id r12so3984451lfp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 11:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gupeq95eJwzu1zJjTiRW372yLPlrkrssX85xw3TqJu4=;
        b=f0cSMnN2oGWLeAoQ0O7KsVvAVOakb2zaFEb04UbbgbJCLTroBzJkQfS/HfVZOC95l1
         3s9zo20ddAxjj8bKgs4q2f3iaJNeRrnaerOxGlRK8hwma4FKhhbgxj0V0UJKs73AILLI
         I+GYzIa3PdnrwSwXQXsMpQE7X1/Lv6o1W6fd2mcZZRYsUjUE8N/rO6WDGXbod80n/tUf
         G8j1KW9oKFJcdeu4Yn+zFbfq/b8D4yiddpLdz8d9Uasw1VnP1DWJ14i58XluwnZkcVrD
         emeixEuhWcjyn6MCbeqr5/FlYYZWo6c066JGcVHtMvT1KurgMglLsQXRL50wfpu9E9iy
         zS5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gupeq95eJwzu1zJjTiRW372yLPlrkrssX85xw3TqJu4=;
        b=1LFGSRIeQSf9oaqx86mNsDepmgPmBwf3tuTv/nfvknxuPr6RZ4/6OUUlWzFT97cbb/
         DGFaMw9+Ki2hlVChO+GQO4fZbEZBJQmas1g+QFOdz+6gXfjIKgR+6K2XL6IEa9DOVHpx
         gDfwUYeZZjW8f9jAcyvBUM75FJZ+41aTZe8o8MbJDXDRftjFr1srOzhlpu33EAxN3f9m
         kTY5l4uMcIroIpHUtITFko62hCAYQXqpBACswMPTQM5WIVI7HQFJnbskqtU+JT18nt29
         8p3ksET8GgoQc1wY/F4CLDfiZ/yMghxcZxnDN4uBeOemDlqXVszXzYzlptZww0835+V3
         z7Nw==
X-Gm-Message-State: ANoB5pmsgkh1wfrTXDxOaj2+NauklkToS6eUwYefA+zOskfl9sx5awoa
	eOXOmWn3Xgc487H6y643TXPeSpDLyzkL06BiFTQ=
X-Google-Smtp-Source: AA0mqf5vRvtp/E1IHJtkn53eyfq6jyMD7IrvvSYVUHsShTw/wgpWCJWi6eIVlv6VUfSym+tpJEd5Ec6Cp2S69RLkcxU=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr21970096lfs.367.1669921682622; Thu, 01
 Dec 2022 11:08:02 -0800 (PST)
MIME-Version: 1.0
References: <20221201190248.175753-1-raj.khem@gmail.com> <20221201190248.175753-3-raj.khem@gmail.com>
In-Reply-To: <20221201190248.175753-3-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 20:07:50 +0100
Message-ID: <CANNYZj8dGH3_jgjC9+cJoqEQJyzhKYCDsv2KRMPqTSx5iOFjcA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/6] btrfs-tools: Do not use 64bit functions for
 largefile support
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 19:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174208

On Thu, 1 Dec 2022 at 20:02, Khem Raj <raj.khem@gmail.com> wrote:
> +Upstream-Status: Pending

Please submit this and all other patches in this set upstream first.

Come on Khem, you should expect this response, and I should not have
to tell you.

Alex

