Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BE64CF9C6C
	for <webhook@archiver.kernel.org>; Sun, 22 Sep 2024 11:18:25 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web11.13336.1727003902841726107
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Sep 2024 04:18:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=vp1Ym8SG;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.54, mailfrom: steve@sakoman.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6c354415c19so26281316d6.2
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 04:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727003902; x=1727608702; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=vp1Ym8SGBf9JFn5PhWgEv1JZxg0f9O21BgPWtb1qMvS0GUfxrVv5pLrTbqtfqfp7Gc
         3SBfw/+mxHwhT+5SeCTR2WH58wohIGkrcGMQdlzu5DKZCu8WHDd9Wndh1p/KJfP5pn2o
         OZEPC6HPQhBmvXIpf1/VlppleVd/VHL9Ps7eI7vHE+G/wSLv1qCuBrX+s1M80eKO5OlT
         +IgYqydGHGwXw460aYZO7cC1kDA5qdwCfEithMp5CqPERRaHQemcDU099OvfjJwb9t7J
         3IocBKqHV4CH+aBcyvPqujo7bNBaPgTB2k7/KetAihz5DuHSJQ5YvBrJaeQ6fYYIDZCy
         rPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727003902; x=1727608702;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=INVF7z5yonWHw+ZJreEFKtZ6SKW5J5jtFrS5DcTAChoIBe1c1p16W+LhD9jVAexIOA
         gw0Wg7JJC1GcDo8ijh8s48BE7m4YBammZnWdPpNxF1hyL+r3Rw6WNoPESCDkPM68T9jg
         TbePJh+gBaMmmi5D9MEPJX2ONkZhomk9PysZE9McvkgOAm3PDRgqK8z2xUJmk9CSWH34
         Mu28jCCsowbiPgD1qeXkf2oT32VaLItmA7u4sY3Z23NMmkVCZI4Fk34bkpuwEDuW5WMI
         QumcgRT8mdPUjsb3jo6FRHTJUd2GO1uiq6t0Y2O5+MuUS//WiWfY+dettxVtKzR8JWFn
         ZdPg==
X-Gm-Message-State: AOJu0YzDCkyuPau/B+0Q0X7v7zwwDqODcZDSZYcJYuWv3N788AU6LE1M
	aSifzdMVCHkXvUh95UOfl9pbJq+37cxOQ002mR/FjtxRvQaNhwbYA+DJUkI9Ah9cNfXAdpXG9+M
	T
X-Google-Smtp-Source: AGHT+IFy7KUjbR1gHiCuxM+6Q2td7+SqNT60dPPcqD+zPVoU905gnL0jz/gaoEx9qHcDkG7q/i61Og==
X-Received: by 2002:a05:6214:588e:b0:6c5:51ee:4c79 with SMTP id 6a1803df08f44-6c7bc7318c5mr116259506d6.21.1727003901579;
        Sun, 22 Sep 2024 04:18:21 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6c75e44bf15sm36754256d6.11.2024.09.22.04.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 04:18:21 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id B5EB01003AA; Sun, 22 Sep 2024 01:18:19 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 22 Sep 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 22 Sep 2024 01:18:19 -1000
Message-Id: <20240922111819.B5EB01003AA@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 22 Sep 2024 11:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204785

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 0 unpatched CVEs

Summary of CVE counts by recipe:

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

