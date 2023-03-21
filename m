Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED00C6FD1D
	for <webhook@archiver.kernel.org>; Tue, 21 Mar 2023 19:02:58 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.23083.1679425376670498329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Mar 2023 12:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WJV4+iqi;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 20so9450478lju.0
        for <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 12:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679425375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HDQJSqkeHfuB1pA+c1jP7EXqYntRRlc6L+BjL/JX508=;
        b=WJV4+iqizFLGiHOkpRNlCmiTGEFMCNjh7L1kIChZ5B4rqLdMO+yWvF6I+GE9C3AKm9
         WJ60TyqNYpJGFKj8wKTephqKOaUeNFUDt5lnkJhrjKwFWuV1TEZv3B9IMwdPG4lt4mGf
         npowl3tCiMJA2vlav0KUEmJDS/4uwQpE1YxzxES9ZChWGFxwtjY0KdT8DzNZXfo/NF1j
         XzPHw8lQU8nt4AtdHunW17xPw2FtqAZWvrFHF2a2NAnkstCa/jdGe9Edv4JLu2vXehjf
         MzptzT0c8zTse25az9emIJVqSnaB1b8ptPNeBYd6xoL7l8bN83Zslb50e3hiqzekr/fQ
         T4uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425375;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDQJSqkeHfuB1pA+c1jP7EXqYntRRlc6L+BjL/JX508=;
        b=O8be8uAhjraGZO8lRof4VO/aGFoSV8i+KepgGoAtfLgrCIj6U6G0ias+rLmZJr1OwO
         YzHlckorDblymEV57siD8EaMZ1q1dXty/uHAmmZzVUX4iBkyqO7urqhsX8YfTI2eQ97U
         XLdPeah8t/nB1tZFUAlawsLbwcXtzof43IE6bIvm1tbyglxQdLNDONTlKC2BYK99md5m
         VXjd644ltJMFxyT0CBjAZ2Ve0hrjKeqRrTBtXqL1vXVGqZ2EUX6N54XmQ2xtV4N1+vDi
         gzIKxUaHaaoDVVDZecI9wT6nOwS00GSshbtaxcwdMcvt45lYuO2w2WIy3K8eQlMJXj1T
         FeYw==
X-Gm-Message-State: AO0yUKU9nOtnTLaRq6GzDtWW/3L6EGG212qIbbxNPzFCn3qDpPrIEglS
	iskkslJnFdPK9ePxwrcj/0nfEfR4ZvPZX5t64Ck=
X-Google-Smtp-Source: AK7set8L8rMgc4742zTyLfF4oFa4sgp/gjtczMaBhzW5Wsfyydvy5hpuZaFGvTRYhCtc74sTvifTL5ZOFDfPpMMuQB0=
X-Received: by 2002:a2e:9e97:0:b0:29a:9053:ed22 with SMTP id
 f23-20020a2e9e97000000b0029a9053ed22mr1230574ljk.7.1679425374761; Tue, 21 Mar
 2023 12:02:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230321190032.908584-1-jdmason@kudzu.us>
In-Reply-To: <20230321190032.908584-1-jdmason@kudzu.us>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 21 Mar 2023 20:02:43 +0100
Message-ID: <CANNYZj_5pESUoccm6VgD32B5j+MTOD91_MBaY+Ru1E+Heh7OOA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libunwind: work around arm printf issue
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org, raj.khem@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Mar 2023 19:02:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178898

On Tue, 21 Mar 2023 at 20:00, Jon Mason <jdmason@kudzu.us> wrote:
> +Upstream-Status: Pending

Please submit upstream first.

Alex

