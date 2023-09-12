Return-Path: <sweng5080@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A85FCA0ED3
	for <webhook@archiver.kernel.org>; Tue, 12 Sep 2023 13:44:48 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.25222.1694526281654710448
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Sep 2023 06:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=SWS4GZj1;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: sweng5080@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-3a9b41ffe11so4208901b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 06:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694526280; x=1695131080; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MOKXm6QetjTq5vKHpVI7WBFu38LBdE780NJCYz/txQM=;
        b=SWS4GZj1AoYGLuLB1B+CN4LfbDNmREU3LguDs/Uo2+WQr08oSKBKKDkwNZOxwEy8oc
         LcakBlDHzQoXOKxB/Ib0BUxYAa13AqYcY+adbjhzSDW9B3nLk0gb93qTwFesJqKRG5DV
         0En53+6nrVIi4sq5p9Uuf0JEuvEctJXTNVF6STU9p1BEQixc1/FAH2IqmqCUHtYpYpuj
         6/tpvBdb9vO/9DmGYR9P9J4mDG8v+VddASEmuSuHwaareQvkobR3G0o//h4TvrJaw75A
         0Qdy9yibMbJqIaO9GsSRoMIDM4cyF5TwXW0rXh6OdBYtKdPtV320S1TTDk/GOKHGqxNs
         hH7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694526280; x=1695131080;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MOKXm6QetjTq5vKHpVI7WBFu38LBdE780NJCYz/txQM=;
        b=MijtbuKnSwYdmeELJEbbtvu4mL2hTNkQLiA/IoIMdfdcDBcqAZgAL7DGamYqzUQOMz
         56fOG/h7zFkV7pQJj3X2MeRsd7+CXTEzJNZeZ5qnZw1Fgnv9CESY9evETEJE2v6o7anv
         7jJukaEsRUpfwULSwObE1yLKvY2zcri00Hrs62CXCpKYuymBKmaIgGOKVhkrtO583ten
         XUVXcKxgdGSDWCukhf50tkgqQoVZtwhAY294H0sCJzud2/t+AmKrX3I/CfWn+gJj0uJL
         ym6+/Z1ilRmX5PpL2VgIHqxKtUZ7MfUXu7HO1k1FkJkWNsYe0E/T4yGhsacu5K2Wq9aM
         3rPQ==
X-Gm-Message-State: AOJu0Yy/ba9D1DaFhDtpkt6AOaLJ9Nh2VycHlfA/m/qfV/ENBDnc4o80
	F7kEcmFvxchKBQSmI0AP9awhOywOhkI=
X-Google-Smtp-Source: AGHT+IH1OOID6k88uPAOOt9O6+MBINHp8wv/K5JvtanK3tV0p8Fgkbtc11Pfug3KxMyYN+ELR3FzRg==
X-Received: by 2002:aca:2114:0:b0:3a5:a78b:f773 with SMTP id 20-20020aca2114000000b003a5a78bf773mr14043351oiz.6.1694526280586;
        Tue, 12 Sep 2023 06:44:40 -0700 (PDT)
Received: from OLA-8C2DT13.ad.garmin.com ([204.77.163.55])
        by smtp.gmail.com with ESMTPSA id 22-20020aca1216000000b003aa191afcc3sm4181934ois.50.2023.09.12.06.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 06:44:40 -0700 (PDT)
From: JD Schroeder <sweng5080@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JD Schroeder <sweng5080@gmail.com>
Subject: [PATCH 2/3] distcc: Fix groupname gid change warning
Date: Tue, 12 Sep 2023 08:43:46 -0500
Message-Id: <20230912134347.3355-2-sweng5080@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20230912134347.3355-1-sweng5080@gmail.com>
References: <20230912134347.3355-1-sweng5080@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Sep 2023 13:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187513

This patch fixes warnings when useradd-staticids.bbclass is used and
USERADD_PARAM is used to add the user to a group that has not been
explicitly created yet. By adding the GROUPADD_PARAM for the new group
being used the warnings for changing the gid from GID-OLD to GID-NEW
is eliminated.

Warning fixed:
distcc: Changing groupname nogroup's gid from (WXYZ) to (JKLM), verify configuration files!

Signed-off-by: JD Schroeder <sweng5080@gmail.com>
---
 meta/recipes-devtools/distcc/distcc_3.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/distcc/distcc_3.4.bb b/meta/recipes-devtools/distcc/distcc_3.4.bb
index 45fc7cde53..0c20f74d68 100644
--- a/meta/recipes-devtools/distcc/distcc_3.4.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.4.bb
@@ -33,6 +33,7 @@ EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 PACKAGE_BEFORE_PN = "${PN}-distmon-gnome ${PN}-server"
 
 USERADD_PACKAGES = "${PN}-server"
+GROUPADD_PARAM:${PN}-server = "--system nogroup"
 USERADD_PARAM:${PN}-server = "--system \
                        --home /dev/null \
                        --no-create-home \
-- 
2.37.0


