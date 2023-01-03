Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C90BC5479D
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 20:06:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.4142.1672776360904525451
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 12:06:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nYh4uMKP;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id h7-20020a17090aa88700b00225f3e4c992so24281772pjq.1
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 12:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMZiuPXjuW++UQIDANwmZZ689MwrNtV8/UOCD28H/Ws=;
        b=nYh4uMKPRcuCCiAv99ZPibxJKB3H/bGL4SyMkJWLl/3codm/c9Ih60wBJ4rCLuhreg
         5VDm0XhvU0POZiCTYZrWIgfkhqBD8h2AuZ243SMuz0wnI1oSzRtYbLE02hIqwt7Lhsn1
         G1u6Cz9GCvnwuoWK/4MiJhtJbKZ1iSDLp2p4iinXlLlkgiF3/os2RgtJEmAA8NahEUmS
         tF808eqLpd9qhUCeGkClAmjx9YuEH0CLcGfxVpaTy4SUrprNB1sosQOJfsdgMt/MEfkM
         kf5LPSTZxO4rotVEQ3FKx784bcY7WSrbV91UYxdQidy2BJzUZk+KD8BM5LfwFPnsF7X+
         2cvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMZiuPXjuW++UQIDANwmZZ689MwrNtV8/UOCD28H/Ws=;
        b=1RQ3Sxplv1Kr6RB12eBYWt4coAsYNel2Xn/QpSHtW4/FEbdd2cuKM07n9FblzvZWvs
         3F0D+XeQUUUMeKiVIHV1XvcXg75RlVhJuqZRuli58jkxysyhPzUmhfGfNfDMYU/m70YL
         9/4BJN7AqlrPbQOEtvsptvFGAfJaLbanl8H8fc4Ax88xjNdnVcF9pNrREzAIdUJWfnsP
         W0MUpC2O2QNdVQk+1DU041wGyrj38KsyN/ydwE4UK6zAVs/0Pqp0vmqiJYgwUhXRE5/F
         kZ99XMtH7K+kCItm4cNV9Zcc0g5QBL5DMR6J8+WhUGliEsVqPTEI67cA5YqLzsUKlCyQ
         it5A==
X-Gm-Message-State: AFqh2koBJNReV0PeXBottPtYpeOhs9BMhOmqECgTsbOZ4HHJ1XTdlleR
	L1W1jn9emNwt4EHxT1aSrHmnkuE3xEw=
X-Google-Smtp-Source: AMrXdXt/f57I0bRy7Wlo3qaW4wEOX5CP2AgPfIC+ZXAr3Ko0YA0/8WQkYI3cJW52d2KguBwbtRfEsw==
X-Received: by 2002:a17:903:2283:b0:192:8b51:a9f5 with SMTP id b3-20020a170903228300b001928b51a9f5mr43202265plh.68.1672776360106;
        Tue, 03 Jan 2023 12:06:00 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::bccc])
        by smtp.gmail.com with ESMTPSA id c18-20020a170902b69200b001929212b478sm13779227pls.118.2023.01.03.12.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 12:05:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 5/5] defaultsetup: Enable largefile and 64bit time_t support systemwide
Date: Tue,  3 Jan 2023 12:05:53 -0800
Message-Id: <20230103200553.52973-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230103200553.52973-1-raj.khem@gmail.com>
References: <20230103200553.52973-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 20:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175370

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/defaultsetup.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/defaultsetup.conf b/meta/conf/distro/defaultsetup.conf
index f6894f3ab5..1abb509629 100644
--- a/meta/conf/distro/defaultsetup.conf
+++ b/meta/conf/distro/defaultsetup.conf
@@ -2,7 +2,7 @@ include conf/distro/include/default-providers.inc
 include conf/distro/include/default-versions.inc
 include conf/distro/include/default-distrovars.inc
 include conf/distro/include/maintainers.inc
-
+include conf/distro/include/time64.inc
 require conf/distro/include/tcmode-${TCMODE}.inc
 require conf/distro/include/tclibc-${TCLIBC}.inc
 
-- 
2.39.0


