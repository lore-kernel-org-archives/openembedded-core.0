Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA544C7EE23
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 15:55:43 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.12477.1685980539232715400
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Jun 2023 08:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=sPsgQpaM;
 spf=pass (domain: baylibre.com, ip: 209.85.221.51, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-30c4775d05bso3691323f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 08:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1685980537; x=1688572537;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8Sc+TIg8O4asB5bEh463FvdfxKxd5nC3Z9gBO09jf8=;
        b=sPsgQpaMIqqHjXuxUf1OM2pgGjhPg9MElMkNnK+bULHW5l97/quSviyim/O9UB8j5E
         ia/Nj5i6jEKdU6TBp2/hpJDUPTcISlz6DS8bCODDXNysJd218CgGTpla2aHoKqn5VmZ1
         Ws9LIzuj/r/8c8MCW1rDBGU4mpaq3qrmSmCEPqI55tO76HotKkpLKLj+FhKdx3Qr2YH7
         KyrmYbR3MtkfwgrbjalKAEo+zNKdnPJR94UGQZvWkKi30ok2JgYX0ynPK6SaiSQU38X5
         bGr3avqKuEk1KF8ao8JwyHwgK0LWG89IsepaLoAa8w2nQnRFQINJgs2m5/lbsagQV3Bv
         myEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685980537; x=1688572537;
        h=content-transfer-encoding:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8Sc+TIg8O4asB5bEh463FvdfxKxd5nC3Z9gBO09jf8=;
        b=MmCxspVpRojLgJw5BKGYLFgaWo7ZCWASvBmDuUI0p6XBXIbdIrURyqdwdIvtEKooDV
         cb6VTCt6aKFte1/Q09t866T2K0b++fe17W18ylLO/d41fNzzD3XHB49AeZ7C6fipwyk1
         pew1pAAA3xLiD7uslAhVEH+2+5Lqh+PQJdNQwjrriHQE8hJSM2W107ApQ38tWZsUu5fo
         0QAFFENtabyUAOyDaEglixSDrFc5uXdomz83P5v4KPuVBMFFNvM5YvhULHVG1tZQE/fS
         9DFt8wKQk0CpNsyok/RMHTGqDmZB3Lj/l+hd/TLLT7WfrIUMarF1nuBmSy1qFrnIux9N
         Drvw==
X-Gm-Message-State: AC+VfDwE8cYNNrya9cvtX8mUZoJ9nY/0JzFEHaY0SlaqXSB/9f5CnB3X
	HprpgsebbYl6MimOjtUw4LOyqQ==
X-Google-Smtp-Source: ACHHUZ6ReIqEDAWX40GfM40G46EPCouk1SrndrJDKWRLXhE3R06BuKjcOR85Ozh8YOzLhWo7wA+tIA==
X-Received: by 2002:adf:f946:0:b0:306:2aa0:ce81 with SMTP id q6-20020adff946000000b003062aa0ce81mr5073681wrr.30.1685980537327;
        Mon, 05 Jun 2023 08:55:37 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id d8-20020adff848000000b0030ae849c70csm10167696wrq.37.2023.06.05.08.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 08:55:36 -0700 (PDT)
Message-ID: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
Date: Mon, 5 Jun 2023 17:55:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
Subject: [RFC] incorrect parsing of sysusers.d in rootfs generation
To: tgamblin@baylibre.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Jun 2023 15:55:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182392

Hello,

I have found an issue in the rootfs routine. The 
rootfs-postcommands.bbclass has a funtion systemd_create_users that 
reads /etc/sysusers.d/*.conf files and parses lines as 'type name id 
comment'.

However, the sysusers.d manual says, those lines can be 'type name id 
comment home_dir shell'. If a home directory of shell is defined, they 
are considered as part of the comment, and we run incorrect commands 
such as the one below :

useradd --shell /sbin/nologin --uid 0 --comment "Super User" /root 
--system root

To fix that, we require a stronger parsing. Several options look 
possible to me, but I am not sure which one is preferred.

1. sed with a regular expression that returns something that still needs 
parsing
2. awk with a step by step script that returns something that still 
needs to be parsed
3. use python and regexp module

Also I don't know if the parsing should completely check the sysusers 
syntax as said in the manual (first field is [urgm], second is 
alphanum_-, etc.). In my opinion it should not as this will be made by 
the useradd command.

Do you think it worth to add some testing about that ? I am not sure how 
to do that.

Regards,
Louis Rannou

