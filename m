Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 539D1C5B572
	for <webhook@archiver.kernel.org>; Fri, 14 Aug 2026 11:12:36 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10591.1786705948078713778
 for <openembedded-core@lists.openembedded.org>;
 Fri, 14 Aug 2026 04:12:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QLMt8E0j;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8f23e851626so4944046d6.3
        for <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 04:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786705947; cv=none;
        d=google.com; s=arc-20260327;
        b=L9+c6CRfnQNLbu8hufTuUhzd0WoZC+j+fw8afalsEAJRJaeUAqrlRC+yJZwUlFdruX
         56jE5iVuWz4tJRgtvkKKjWRobUojNGrK5cU0sHzXHhJ1q7W+N/ddaVjrKVjo4oGufk/b
         6lV8v2eqBcVTzFz9TyISI6X4JlNpABA2B5ltCaQ+23yWVWEWUNjheym1V7C2x8ao2KWI
         SmiwAwxFQx0CkmqxUEJgRDbbbyh0oD+SEZSCcHB3ApPioVQoXZxmJujh6nuSKBc3RWYp
         17nAn7Wda7+39NKS5cl3yXOB35nPAqR00HwYHrKbei0wFGrSCn8XV2fvypHVzyxt/UXV
         YZiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6618YHb5QHuAquwvIZF5eC/HPBJ6sAOLrSWUj3C84p8=;
        fh=6Z4xUuTqkcxNv6cvnn0HdSGcZYvnhz2BRm++iEwx924=;
        b=pthouqbsSK9fnQMR4DtoFbh7hlAyww8fSAWX37FRTSHB8Hl6VSAA6wte30ya5sc9CQ
         wKM786cSsB0Cq7F3UnY4ZrLvIzTMRet2Y8VZONber0e25b/Uab9OxG52KQtgYplUa3ZC
         RAT2OeGUUQKREfv/Sq2a3wsmgW+5rbZERL8dhmQlNrCkHpkczK7ikje4xtNBFCKbJhS6
         c6DfzfAVLdRhArYDGqSXcnEmhY/BI/kT27ueiN2Dfa86mCAk8haQ470lznfoAVZwpztP
         Zc37b1NVqUGMkLy0y9bsMYFj3653DEPPs8ayOBpkW4NrbBo6fvwKSZqOwcMiyTGbUSns
         DB8Q==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786705947; x=1787310747; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6618YHb5QHuAquwvIZF5eC/HPBJ6sAOLrSWUj3C84p8=;
        b=QLMt8E0jxbI6xgpXAhxenosKGsuMqHnxyvh3BnHletFAdgwhMnRuSVaBILv1iPUHkV
         26CZ5oVOLD7FnscyiGkgI6ZKsW5UaIwpvY814QVPCvFsH6WLHwKkSEjH+gqIbAlU0zSw
         EeGm9p8bjOBuSO1+u2c0n0x+1XG6MpJbQh0Iuv6dr5fbAnJybqmNTiAKs2RyLpUFyKO7
         fWIt2g8lTioT+FBxvfZdhP7MpsLDZM4nXwWvucwjzKVfvM6LmgbMyUv8oLUKsVLBPCL6
         oZYpAwstgES+ssdS3S2uv2yNSBqFrPJ7mxdyqprSTOhT9R+bY7KQZly54TzPjOqFRQ3L
         4UrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786705947; x=1787310747;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6618YHb5QHuAquwvIZF5eC/HPBJ6sAOLrSWUj3C84p8=;
        b=mYCcqO8R4VJP8/l1fVdZ9zVqOR96pWsVQEbMvzA0ATxlRaTrxYW5BT8O2zeeZW3dPQ
         SxYvliZG398colicW51kE98awZM4kkNYy/zX5YtnXckIw6BpRAGtt4GN1Hx5TZPlLOcM
         bEeymnVdLjlP7mM15sSjQl9mBOtzn+hqkQ8jFpc7QcHJ8f/zsSaKsv6PWfNzlkCu2+8W
         U0SeFlgPXzX0QqW1u4wN3aHN4a3Ky/02Z136Hj/hdyUIPD1FIgOJeO6xcuiOsRAi361r
         xcSy4A5fh7KALPa0Yeb8MeYjvLdLC9aNIQipW/d+qVSX6/Iv1b7NPwUDvUGEzNx6uri7
         NvzQ==
X-Gm-Message-State: AOJu0YycMKFUGwQuu3e/3RCJMOaafnUw6fnZEtjVFweqO1njxEUFH68p
	D2c4ve1DCycSflRmmeF9fX1N1NPFmZj2GFO1+U9MimAHxe6P+kIuSp6j3A4zKFHPSDhf7nDPae7
	ojD/OCZI812g2oAAySZIZRziQfEeDuBA=
X-Gm-Gg: AR+sD13UBGXdCHLBH9oUxH4GPUCmsEHCVdsw1FjtZ+ODcoOA5bLL3njW6b08ce4Sii8
	lmboxE4pDhNQJg865IMk+Ilc1+CYcODUn7xlGi1qOySEM8QJvhbmijipJmC8axkE5zSPcIAUMUR
	2DP3a3P1V4mvHuAO7k3dXYiI7MIklOVoUzgU97fq92xrGpK7cl1lDLAIbh0h3g7rD9Yk555TDRS
	CJ6fCjoUotgmAjOxVE+PT2R0gALihzqFr/QzE4+jSKSl7pYbYnrCWLSRz+lbRVDTd+vn2Yc0qPd
	AUOpwp7fpefVrZcljHH6ewmAiazl5EU4lMEKLYTVkEUqcC29CFpoaG6vJI5xys0buX9k6tb4Zm3
	bEps=
X-Received: by 2002:ad4:5dc8:0:b0:8de:9230:7c77 with SMTP id
 6a1803df08f44-90a91e0804emr52720236d6.25.1786705946976; Fri, 14 Aug 2026
 04:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260814051829.35088-1-jaipaul.cheernam@est.tech> <20260814051829.35088-7-jaipaul.cheernam@est.tech>
In-Reply-To: <20260814051829.35088-7-jaipaul.cheernam@est.tech>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 14 Aug 2026 13:12:17 +0200
X-Gm-Features: AUfX_mz3AR8R-FO4Zzb3CZH9xetrMX-SeGgBjZKw-Gj9m_4YaXkaTWRiUkzvvqY
Message-ID: <CANNYZj8GmNHAYqpZi58UFtC4wOVcgqz8veCwUNfR_sNoNAu_FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 6/7] u-boot-tools: fix build with OpenSSL 4.0
To: jaipaul.cheernam@est.tech
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Aug 2026 11:12:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243443

On Fri, 14 Aug 2026 at 07:18, Jaipaul Cheernam via
lists.openembedded.org
<jaipaul.cheernam=est.tech@lists.openembedded.org> wrote:
> +Upstream-Status: Backport [https://github.com/u-boot/u-boot/pull/918]

The pull request is still open and nothing has landed in master, so
this is Submitted, not a Backport.

Alex

