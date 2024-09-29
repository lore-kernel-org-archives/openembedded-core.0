Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7DFCF6495
	for <webhook@archiver.kernel.org>; Sun, 29 Sep 2024 11:18:41 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.30663.1727608713479515322
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Sep 2024 04:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G9NeHn+T;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.175, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-45812fdcd0aso40497881cf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 04:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1727608712; x=1728213512; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=G9NeHn+Tcrk/zeltOA6jpIw6SdC1gUTuHSbr0Kwe5lEa9nIRZ3+JMA7Dn8AXiM9lE0
         9scmDpTJ0VbRZiIyzowWP5htl3MPktJlzhCj1nPHwQE9SkJUpOI2ugtzZOv4S3jDqn/q
         87E5rcMHePIw3GDOys7GjIdvilmNMVjU3okh8F7clhJ41OEp9KI5F+4oC5kkj9vD4MCg
         HxxoUKu1TDDGfkzcoORnaXHoTOVv2j94QbR3/WjoeeckcHcb2Qyz4vD7rOTxNt0qx0uU
         Z0bhVk3gOeu1keJkjCLNieBrDiRdwUIJKQKIfxqa/SKsCuVX3e6M+JGojoaWktIoCck0
         wcDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727608712; x=1728213512;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7oUsG9aRyyP/ZrDysh3NWCxAzW4jylx3MjSVxp6ab+I=;
        b=j/v+OWNh2e6EmEl5j3lTgxHYZGoxp7aYssJZsex9itTOgyUdh0Kc65DjdcmjHbOU8b
         3r1gdCaZO35XPUZVt7CKIHa3PTRxHb6yfp9Nqacd9KolgAG6ik7bce6ACBK7aKuAQ20k
         fS6yVtgif1G0bxtaSDJueCHxSsCVhDQBxwODAy4vxgqQqoKicLCdWbPVSeq9+/f5iUKs
         UDYhDW1T2vsb85YVOgJLvY+oTwUf9ft8qTGneYddILZLxrzOT5ABBK42o69Jqi2ySC3V
         76vHI5OLzaV2iikef++GIm8Ih4Jy/tQR0YhCsyHPlsEmcR75HkK6grEtyx+asUAHb8ZU
         868w==
X-Gm-Message-State: AOJu0YyveFR9MLdqx24pVv4tl3pS6cr7jz8u4XQBs9Boix15WZISImeE
	fpg6MlKgouUjDnoxsekFKS4G2TfGGCM9uKLDnt9EM205H5OlaMoQWbVRullABnlsiZ2yek/Q9jV
	64Js=
X-Google-Smtp-Source: AGHT+IGKIf5uAhWr5c5jkm1I829WmH5vCc8T6ZK/i3crGAZ+7I7AeP6Ahvh4zE1DhyfLAL1pGnsLtw==
X-Received: by 2002:a05:622a:11c2:b0:458:2b63:ec41 with SMTP id d75a77b69052e-45c9ed4da27mr125244781cf.30.1727608712254;
        Sun, 29 Sep 2024 04:18:32 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45c9f2ea78fsm26518401cf.54.2024.09.29.04.18.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Sep 2024 04:18:31 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 86B021003B0; Sun, 29 Sep 2024 01:18:30 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Sep 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Sep 2024 01:18:30 -1000
Message-Id: <20240929111830.86B021003B0@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Sep 2024 11:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205050

Branch: master

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 0 unpatched CVEs

Summary of CVE counts by recipe:

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

