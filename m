Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46562C369AB
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 16:28:06 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.2296.1745512083542243026
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Apr 2025 09:28:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=Cwt8I1Iu;
 spf=pass (domain: baylibre.com, ip: 209.85.222.182, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c542ffec37so136683385a.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 09:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745512082; x=1746116882; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=3qo8y6A/nRPwWXozvDsqNmr1B3oSq2rHAZqIZMFyawc=;
        b=Cwt8I1IuwyFG/D8IWyBaD4pl7/Fdkq0eq0IY0y+gJW5KfJywN//mizYY/Z0qFXETek
         N9VW+i2A9jKUCiaXBjZemRY/6OP2E3kVfBhU6z0HHmnhDrZukSoyEo1VhKpYtDMba3pk
         xOEyy+/x7OWBX06TPPrdPoQmgOzqcfhzeNmpek3OSc9B+D88bcbrNfJFApACShuhZyNe
         f+hleoL0OXk0rU9x/ni2Fxe26CkoPHhkWeHCe/7FNC/ZrrNZ9U5ci277rQvBBNAf+TB+
         UQaifV7h5zBiVVZr/dQOTugZPBugH8Sd8Amhfj0hhiuJLBuG7lvIBKer4rxAlQOM6l4V
         D+WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745512082; x=1746116882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qo8y6A/nRPwWXozvDsqNmr1B3oSq2rHAZqIZMFyawc=;
        b=nDd/j27/tVOsqHtdaxasPyi9CV0fgBg13QMod0wdS/fmQNPcxSy1O4V7O0iegXsFHL
         aEKMtndaf9gG+L+uct3tn31fMRlGhgbneiVdD0Se8ZoI8yz4URlkO+xfCxZqxbdxq6B2
         ggCb8rkPqrXvqUgNTFBv0ENa6WekwzFAqDNa95KtYrZWQ9HgUBIIkZhnAKbgqYwknPdS
         /FYky90OfhmO2U9HbXBH6pBKKBz17DrdLr8mKscogYKzbYiiVqmV2Afcqa78pEyvJIaO
         0uTQeOWAnp8U01C1INapFoV63SHUAJbcIBf0D8iXpFEI2tsPbonDquBJvDR9JvX05LBj
         3ffA==
X-Gm-Message-State: AOJu0YzdLp4v4hfYCE7zBPuzaUdFPx0GbWCTbi3IFHaKgYsBp6wUfwKO
	zdCfrQLAV+gEeaYNpxA2+yULo8WuxwCcv4tIHVz2vjK1XbwDiTs105VSEb5jgAujv6zlJDbK158
	TMqQ=
X-Gm-Gg: ASbGnctEW8aJGWfG4zx7n0xBwy6Znf92yc+/GprOw+W/kMLa7d7W3XUE58Ts6Ql/Vy/
	WANoUaQ8fKq2qWFGFJT8Wu/8NFkMAvTtSALIQXARksjAl8mku9TdAvS/zryPfPEQkRJHmra+aU0
	PvIK/P6+ib6EILKK81kBcvBYxl1ANgatO5a//G28ROv2xoIcExJcPvRhgxGDRmxuyHJRfts8mgM
	QtUWKzG6B4dUd7xvgRDoM0e23dksjegAeNxiHvSJl3Dr2+D4WmluPFVGWdPmVBV+/BP1ucIquEi
	CWrfi/ljJqOuud87qlHIE+5of1YYgIl6+qZt0HQWm/rPERXBLilQ0a/al4Q8J7j6CePjBksUChQ
	E
X-Google-Smtp-Source: AGHT+IGcX4hAHzbLjgz+lXFI+2FKfMMVwYeepPjHUkEy2njoohbBYk2fzwdawQPx/R1/Kj0XDmmMqQ==
X-Received: by 2002:a05:620a:2586:b0:7c7:747f:89d0 with SMTP id af79cd13be357-7c956ee6961mr522899385a.18.1745512081692;
        Thu, 24 Apr 2025 09:28:01 -0700 (PDT)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c958ce38e9sm104721685a.62.2025.04.24.09.28.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 09:28:01 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH 0/2 v2] python3-numpy: upgrade and ptest fix
Date: Thu, 24 Apr 2025 12:27:57 -0400
Message-Id: <20250424162759.3892597-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Apr 2025 16:28:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215390

This v2 is re-sent with a few cleanups compared to the previous version (which
didn't have a cover letter).

With the introduction of patch 2/2, numpy ptests should work (they're listed in
PTESTS_SLOW instead of PTESTS_PROBLEMS, so the recipe-specific ptest image can
also be built). gcc is required for ~10 of the ptests to pass, which is a
relatively small number overall but seems to be enough to justify adding it to
RDEPENDS. Further detail on the changes to make this possible are found in that
commit log.

Trevor Gamblin (2):
  python3-numpy: upgrade 2.2.4 -> 2.2.5
  python3-numpy: fix ptests

 .../distro/include/ptest-packagelists.inc     |  2 +-
 meta/recipes-core/images/core-image-ptest.bb  |  4 +++
 .../python/python3-numpy/run-ptest            | 15 +++++---
 ...-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} | 35 +++++++++++--------
 4 files changed, 36 insertions(+), 20 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_2.2.4.bb => python3-numpy_2.2.5.bb} (87%)

-- 
2.39.5


