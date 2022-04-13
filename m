Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23EFBC48BCF
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.7014.1649860137941977371
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:28:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mH1ktC0Z;
 spf=pass (domain: gmail.com, ip: 209.85.208.42,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id g20so2585320edw.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=pryWcwcdIGzBzASBY4G8E8nGXvUZCAqeMaTOY5gLdxU=;
        b=mH1ktC0ZYdFEgvdhAghuwuSPek2TW80tVFDzWxNxVeskHVmzsmnSgHxx0uoqiwOhB8
         A3fXMReooH9cJxX6PT6F0x2sNgHOuiwnJwJ/hRgKNUHqAi29B+0jBVkkSBxcDmyqnZIc
         zNdZH1hAPhXkTfg1eKfZc4Valib0SrEFFZET33sDWR65tesscAdmnvTO6wyna9/lOAvS
         ijVMJ8ebEOo0igummN4o9CJIdbkEui3O55NTwnsxENkPzflHjJU5paez6gQ5HzhdMCO6
         ecowaZPK5l/0faiGsU+M5Urd0avp3ZK0XRRRxEf0aAquheIFNKbndPDDPFoIgLa+ygp+
         gHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=pryWcwcdIGzBzASBY4G8E8nGXvUZCAqeMaTOY5gLdxU=;
        b=mj/ytnS5CkOQex7+JMf+0ns8u4+6pz6zQ1RExIAWPk2vXOBLRWrRWBz3hSP3uqo0p6
         wdlnyynhx2UHf/cj83Ehi5MhwKS42Efk/kkyHo30qjRvSXJfu8fi7myKv+SmSznDCcf4
         gV2JErFfA9AFxYtsHXx525B6WeFTEKMl9r24/NlkD/hEhY4JndxpmB2g8S0TlpBmZreF
         Q/vWU1V1ursfE1dg6jy/F5ZanUAWZ1fxNfpIt59ukAHGfkJ0ptqEKkRPooYCjatRUQvj
         a3NXczWTas06eb6h6qcLjFETlfsMe+N46Ws0lIlS2M53Aa4c6b0ho2TnsEzFsJYVOtEi
         eO7w==
X-Gm-Message-State: AOAM533IMxxRpZMwMlFM+bTVA8W1ldgmGwsAL7ohKXdmRBW3QnKuWSAi
	NRf+3r2IAM1XXk3cXcO+9J4TJG8JJqnWXEIJ3DhibtfS
X-Google-Smtp-Source: 
 ABdhPJwwKLp0L6NdE1mec5Mnp2rMySVJLmOfVVdDJzgqMUf77nHfPNc6EHjoydpoS0juy4npbO48Od8g9SwuTVVz0EA=
X-Received: by 2002:aa7:cd87:0:b0:41d:90a8:2670 with SMTP id
 x7-20020aa7cd87000000b0041d90a82670mr8997226edv.404.1649860135867; Wed, 13
 Apr 2022 07:28:55 -0700 (PDT)
MIME-Version: 1.0
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 13 Apr 2022 15:28:44 +0100
Message-ID: 
 <CAO5Uq5Qxv92x+_uccyj25hR3NM7PEtUgEQw1gYQZzowEAFkTFA@mail.gmail.com>
Subject: CVE-2022-24765 (Uncontrolled search for the Git directory in Git)
To: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164325

In the hope that it spares someone else a wasted day of figuring out
why parts of your build are randomly failing... I suspect it's this
change which is backported to (at least) Ubuntu 18.04 and causes git
operations from inside a fakeroot context (i.e. you're running as
"root") to fail as the check for crossing uid boundaries is triggered
and your .git directory isn't found.

--
Alex Kiernan

