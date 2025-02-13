Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBD4BC021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 14:26:41 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web11.12083.1739456796947435892
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 06:26:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ump8aVqP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-220c4159f87so12534975ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 06:26:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739456796; x=1740061596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a6kqyZ6+UA9PdBnDh2VY1knT89TeNlxPJOkDoB9e2lo=;
        b=ump8aVqPfKiF0PgB9JKscyNspdDUSj/hABXbUItyFoV6DG8wIJOgt+HAByu2LB757B
         JwV26C44YrE7wG4C8EMKLl9NwxFrsiNRxt4ceK4rQ51JLbgqP+a9Mn+v1dJAgvnIX6eQ
         jH+rOo44Jl0Xb7enypeklALd8sYuaq6q6OSyIHPpBlCV7c9mDhe95JsPds8BrnFdwNxn
         2lRoaUr4WQFdayOOS3n1KLCRfAUmbrElkgP1fjEmkvX28PcJzUZgSOycwajKbAfpxC7O
         tOFIbJSZmE0gO/PldG303baqAZZ6FmZzFnxn1bmHwvpDtPdadwivLn6frNUu506WsMYa
         QhBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456796; x=1740061596;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a6kqyZ6+UA9PdBnDh2VY1knT89TeNlxPJOkDoB9e2lo=;
        b=WoXlgnDJxyBOkg9Fbs6B7yhSUdyVwUz82Urj+Lp/31d7CSRCgJ0aWkkZklM/XTS/rR
         bXNgG6wFWonWW8scHsIcRlsLfqD8ot3bXvfDn1dan3GD0Y5LUSD/OfOE8dVx60mXwEEF
         LLMwRONpueWY1DLmH7LchN7T07YtFsmHbRF2+gYLfxKHZuFdiSunbNmbOC6slm4SfnC3
         mDqRLMNWM+2cZCOoZcsZbdvk5yhDIUYuK2ebNo6TnEDmNC4nBc85ETAIkhbabQ/mxJhO
         A8DF2We1rXz63GDFiUKwvgeGF0z2l3//UJQ+EC8fzwTv/+cyNSe7vXGGPUpsKQQH55kf
         dn7Q==
X-Gm-Message-State: AOJu0YwI9b6Kr77xF4Yy90NPcV50ycnBb7JR6Z5Fgh6AF4uLm1LQZmak
	/aVlQwUq7UvDH426BczcxrQonwgJKt//Bp7nKbv+f2/gb/q7Dj5E1g0smauBg9mRJT0lRVny0eV
	C
X-Gm-Gg: ASbGnctMiFG/ne0XAW2OxPuR1pSdnhzz6aHh88hp4P7vpgXZ2U7LqhE6U6Xdqu5mgJe
	UEGBoAwgo7vyGieo3Ln0TRDF/pDLzGiCvjCVB11OLSpb0IhQeI3CyIwuALm39bew/OBCjiwtkxT
	VItHY6CbOObuoTD2/tIbp7v3QT6eDkXmBP77SFGOyGfOWfpdl0iA5ws6HGOMxOueYloAfTneuYm
	Gmto/zPATTAKPm+So9NdaApml9uCYquRBblD3YawlRdtzkdJurNvMvI+E9GZiQTIqo3C7ng9mOB
	IsIC
X-Google-Smtp-Source: AGHT+IGXCvZnGz74pKwYSR7NmhBX3bxy2sJqrImXJsN84aX2kG6t0kNH6dWh7iKtk2/RYkSJL1mh7g==
X-Received: by 2002:a05:6a00:1a93:b0:730:8526:5db4 with SMTP id d2e1a72fcca58-7323c1444dbmr4994385b3a.13.1739456796164;
        Thu, 13 Feb 2025 06:26:36 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-732425467b9sm1342377b3a.30.2025.02.13.06.26.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:26:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/3] Patch review
Date: Thu, 13 Feb 2025 06:26:28 -0800
Message-ID: <cover.1739455358.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 14:26:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211337

Please review this set of changes for kirkstone and have comments back by
end of day Friday, February 14

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1003

The following changes since commit bd12abeff6ee14385fba63fa5ba15d9fadec4d0e:

  cmake: apply parallel build settings to ptest tasks (2025-02-11 05:34:41 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Joshua Watt (2):
  lib/packagedata.py: Add API to iterate over rprovides
  classes-global/insane: Look up all runtime providers for file-rdeps

Peter Marko (1):
  openssl: upgrade 3.0.15 -> 3.0.16

 meta/classes/insane.bbclass                   |  30 ++-
 meta/lib/oe/packagedata.py                    |  15 ++
 .../openssl/openssl/CVE-2024-13176.patch      | 125 -----------
 .../openssl/openssl/CVE-2024-9143.patch       | 202 ------------------
 .../{openssl_3.0.15.bb => openssl_3.0.16.bb}  |   4 +-
 5 files changed, 28 insertions(+), 348 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2024-13176.patch
 delete mode 100755 meta/recipes-connectivity/openssl/openssl/CVE-2024-9143.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.0.15.bb => openssl_3.0.16.bb} (98%)

-- 
2.43.0


