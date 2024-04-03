Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39312CD1288
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 15:27:38 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.14337.1712158054848278492
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Apr 2024 08:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=LaPJXpq+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.47, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6992cf43137so2250136d6.0
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 08:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1712158054; x=1712762854; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=20aB4rHjX4O1ED73SQSdAQQ2ehAcQGBQzwtab9N0BXY=;
        b=LaPJXpq+hbvOgqaQCmMm3nOIY5AbgJWwW0F0l4/FePi0UCe/oVvgtzttE8XMAL7PT5
         kH3HIiKOq8U+1lU4BllOuWIDMiFJdMeaKdS1lQUHqLcf8EdSDXCquluVBwhumEgud6dc
         /DzTnPa7TdTp4T2dEIW3xDX32hKJA/ooZ6q0USKps8lSXZOO9WIDSGM3noGGuDVWMje0
         NDICtTILts5FxElUoBxRGA8KyGOz655+cr4X9CeitJE49kP7fpWgDw4yGuwEEGKEXZcZ
         nqkk6xnu6Jv55aaYR+ADkDF7eqNVH3ZlUl1dhKsvJ8gaCJ69U+7hQJ1/ht/e9taQBlM7
         IMdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712158054; x=1712762854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=20aB4rHjX4O1ED73SQSdAQQ2ehAcQGBQzwtab9N0BXY=;
        b=RM3/Uuwz0p0dkXmB1yQ5KdV9gRhWaVPpRHwfHNnyE65Lxm1HRLZu8PYFhOnEP72754
         TVIu74JtYgkVwf8tZHD0y6qR0XwjcTj8jU6E23IcKtHTVJHTg1URYm23stcEDupZjNJ7
         nKODJ6b/MyZ9uJI0EUxPhhMnNav9nNocJgmhSX9uEtpS0CeZLnlBjsqcp9SrScQUGKiD
         uYxfjVuK5h8NEe+XBFJBJ2gvRCo4ahI5+EUOSHmd0aMznDwKCKQ2eleRyxfD9oY2m4zS
         HJWeezf+5sWuo3i7mld8ieDvK8zmEqy6vo7Fn19fLUmfTZpykabYT+WRWqPyxoMJAVV9
         +HGw==
X-Gm-Message-State: AOJu0YyHAo+OcSDNpTAaUY+kddL3BDBcasNdu66ramUZF3psl0SxgN3b
	PRKAYCMsFA7KEQo3zQq34RfrnpvROULCHfBlrvzXbI6R0BKFZs0q3r9INJ1RBnOkIeBHiAFti7Q
	=
X-Google-Smtp-Source: AGHT+IE2Nk4d6IltW4Km4rAa/FD1NMpdeU+xwL+zVi/8ctK3OwNuD19wurKEOkhIkSjcm49wXFHydw==
X-Received: by 2002:a05:6214:580c:b0:699:2b24:2a48 with SMTP id mk12-20020a056214580c00b006992b242a48mr1576404qvb.5.1712158053498;
        Wed, 03 Apr 2024 08:27:33 -0700 (PDT)
Received: from localhost ([2605:a601:a699:ba00:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id oh9-20020a056214438900b006990bbde0ddsm2815471qvb.101.2024.04.03.08.27.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 08:27:33 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] acpica: switch to github and update version
Date: Wed,  3 Apr 2024 11:27:25 -0400
Message-Id: <20240403152727.2247873-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 15:27:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197925

While going down the rabbit hole of UPSTREAM_CHECK, I came across this
package needing updates.  I found the switch to github on the webpage
and updated, etc.  With the first patch, I get:
acpica                    20230628        20240322        Ross Burton <ross.burton@arm.com> 170fc3076a86777077637f10b05c32ac21ac13aa

Please note, this is only "compile tested".  So, I did not verify it
works, just doesn't throw any compile errors/warnings.

Thanks,
Jon


Jon Mason (2):
  acpica: use github for SRC_URI
  acpica: update to 20240322 release

 .../{acpica_20230628.bb => acpica_20240322.bb}       | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20230628.bb => acpica_20240322.bb} (75%)

-- 
2.30.2


