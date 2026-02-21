Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 211A8C61DE2
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:42:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16642.1771663358246264021
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:42:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BSKHrKCv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4834826e555so27007895e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771663356; x=1772268156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gXUKO0s9CMA/LjlZOTpNuR7Khe5QNZ6jXgqJwSqM+Y=;
        b=BSKHrKCvindfv/pCI6OWgiq9PjTIfWDunTcCTTF8x7PycS+4zTzUfYHd+akF+Ab+9U
         QN81fKHfx8K6ho4mVNwLaV5hmNMkLuEsgvN7BZzLO3QwzTSYLIqLFHILoQTEMwS8PkL2
         jMW4W4KiUj0zLR9v6mJF5KiAE8462yq4FzUzQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771663356; x=1772268156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+gXUKO0s9CMA/LjlZOTpNuR7Khe5QNZ6jXgqJwSqM+Y=;
        b=By4TGYPTGfP7mArmQiphMgzm5RrwMOH0/s/uddRNqO+lFbpvMXOW5LChpW/TyqXPvT
         7oR2S0wSjvjg8LkcZFhA4rhsL0EpGZTS/Q1X1NE+4VF2XqsGgi7fd/XvSa+kiKrqHmje
         kDwAyJpholbz81snREFJK9xWccsDoxeg102zsAtGExtE+1dRdjQuSmeymzqzmAAOHdqQ
         qt9vH9kBYOlV8Ca95Q1M3ZZ7P6hs88D3nzJARdjsrqvXmuKnemYd0kjq5W6g2O9OVG/c
         itURzfewW+qrLKPd1VeLpognfHKN3a0ykEhi7LGbKtnMYC2jKIvJAyrmHWyKvuUsE4Qw
         hoXg==
X-Gm-Message-State: AOJu0YwtRWJpxXi6r+KT2c9l6b2G2/x7e9JkGr2G8+Feic5/P/nYH2dK
	Gvt6lkE6vDQht/E496bWp4YjtxQ4MRfOPcfDwQeKJu1iEjHzHX7+Uevdsi4Ig9me2ga2SmdqqrA
	rcNuMuwY=
X-Gm-Gg: AZuq6aKOLnCJ+2kleQfDntC1GgZnQAYNJf2s2viGtv+/asARZFC537n0pNDsng0qvH5
	axSpKT3TATfwIGcD5jdE98uaMVodW8OoKQ8OV/6jpGGTiKdHlAoQkW1EpRhhn3/ThqOZYb+lqYJ
	2nrjB4uMFe4UIaq8Am+kzk7HIbspNmNNJ9NqLUUHLA3GGKcVNlvQVMfxkZOp5IpV1jmPYvwFGMJ
	Bzr5bcgt/q9kXzZ5+LOo4G7HpyPtoUb4oZLsujwBG6wM5CdPPOat75IRaADxQkZGSsrshtGJyKP
	lC4blBOJOEDqE5bFsG28B+ixieti4qLUQeQYm0kQITyqKKB10O3H5Ew+ywAMpgO7epPq+mp6LC9
	uapzdCG2juVkjsBbA6w5spMahV24i9Jj3ksjAhVGdUK8GjIhwSbmKA4DuKllG5h7lupNXbNPUns
	BMXrcStijor30jefGu9F02oWHhhXNwSsYKFGFiA4odAusz7qGuXlY=
X-Received: by 2002:a05:600c:3b10:b0:46e:4b79:551 with SMTP id 5b1f17b1804b1-483a963d233mr37629895e9.31.1771663356310;
        Sat, 21 Feb 2026 00:42:36 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3e0dsm205898295e9.1.2026.02.21.00.42.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:42:35 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/6] distro/defaultsetup: Enable security flags by default
Date: Sat, 21 Feb 2026 08:42:29 +0000
Message-ID: <20260221084230.3219379-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
References: <20260221084230.3219379-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:42:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231612

This defaults to including our security flags which use stack-protector-strong
and D_FORTIFY_SOURCE=2 by default, as aids to improve detection of security issues.

This change has been tested in poky for a long time and allows us to align
our default compilation flags and environment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/defaultsetup.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index e8f5439a8d9..871fe7b4e88 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -6,6 +6,7 @@ require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
 require conf/distro/include/no-static-libs.inc
+require conf/distro/include/security_flags.inc
 
 require conf/distro/include/uninative-flags.inc
 require conf/distro/include/yocto-uninative.inc

