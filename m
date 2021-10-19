Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D24C433FE
	for <webhook@archiver.kernel.org>; Tue, 19 Oct 2021 04:43:42 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.5367.1634618621745171251
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:43:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=g7fkSKSc;
 spf=pass (domain: gmail.com, ip: 209.85.222.42,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id i15so9458000uap.0
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 21:43:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M0rJd8kA1nPkb9ZykIticJOnuaMUDwA3n/Z9iFlFhjI=;
        b=g7fkSKScfJF+93V4mse2t3bJalqloVIzC6zdAYsrHPel0A2mqvcS1eyr29aYrLtf46
         YeTdpRa7WNv3fMCCLZjOyjFyDN3+eyEiPUDo9ETUYLD45WQwuhLmEgVkFgqDj234K7Io
         mlP3Txn3StOitzqT3YoOcdukkvPQQC1VDqkzOCadHvSCgDIDHMYWnq029xoSgtaMfPuA
         S5fBpw6HYAqicBw83HhR8xUjYw9rqNMRKTm8W8mKs2p8mFYPJR0mCTT4N1AKNzvPGxwn
         XgvSvkVuB6Tf221Xb0Y2AmLEcv6Qiy2ybDOuj6AUM7qBnHm5bcka+GPVLrmIzCZfSjhw
         iG1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M0rJd8kA1nPkb9ZykIticJOnuaMUDwA3n/Z9iFlFhjI=;
        b=tbTOdkJNDPHCZJhFBsJh0woZ9LcfUB9jsEqC/LWQcv00tQJ2rr4eX4qoZ8m5FTj52e
         CS5xvxBTFWw3HrzfcL5IGGWeDqg9rRBnljh30RNmWwjFzhuTX8xxjQmuvgGiXhS5lUui
         YI+vQSFHUoPMdaLBQocQnsnAknDEQPpMYnBV+Q1xTMAZwgTi4MnjJoFQ0P45BSvP0jfq
         EXdKqj7Xen8rIHZX2S8fgZPdWoX9+4elDUWB49TbRGwqyx/hZGSL9rUcC995ga0Vs1d9
         B4FJL3D611v3TiwHFMOsXIm7wqndRVNUWifiElePgU/4dTIO5NGXmTEr185yoEfMOvmU
         x4Mw==
X-Gm-Message-State: AOAM531cXhVzZoQcXyCxAQ4vIqSCmZGf7w8wc5j1xRAjjaRsqC9CxdiK
	a+8JsOPyuL6S1JILzKfOJsuLLijVhRos66fGfRo=
X-Google-Smtp-Source: 
 ABdhPJw7d8NuSG6cVBFVJ/XQ15tAgZ/cvyh6cK5B7yPoAxMw4KNd0u9Pu7Yq779g1GYVXCwWlccfP2hXlVS0HmYjN2s=
X-Received: by 2002:ab0:812:: with SMTP id a18mr30211863uaf.33.1634618620898;
 Mon, 18 Oct 2021 21:43:40 -0700 (PDT)
MIME-Version: 1.0
References: 
 <6473ab6832d9e7647a8921bd8a7735394379f12a.camel@linuxfoundation.org>
 <20211001072440.18158-1-pgowda.cve@gmail.com>
 <76aaa9e236f1d4519d84f770da9a6e101bf13f4f.camel@linuxfoundation.org>
 <CALY4985dAovpwtKHUTOAcAVW7TJr+cjTzJcssk8xr7MYTcm9pA@mail.gmail.com>
 <6149502653526ba43975b86936e6aa74415c9ac0.camel@linuxfoundation.org>
In-Reply-To: 
 <6149502653526ba43975b86936e6aa74415c9ac0.camel@linuxfoundation.org>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 19 Oct 2021 10:13:30 +0530
Message-ID: 
 <CALY49870-f=DUMMaO4aEJ_7qx=413+vR46kgbrqzvPbwuUJe3A@mail.gmail.com>
Subject: Re: [PATCH v2] state/staging: Fix directory not deleted for race
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org,
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Oct 2021 04:43:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157104

Hi Richard,

Thanks for the confirmation.

>> Let's try that please.

Please find the patch posted at the following link as per your suggestion.
https://lists.openembedded.org/g/openembedded-core/message/157103

>> There is a related issue Martin reported where the recipe is really TUNE_ARCH
>> specific and not really TARGET_ARCH specific.

I will check this issue.


Thanks,
pgowda

