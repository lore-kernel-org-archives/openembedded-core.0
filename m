Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3D31C001DD
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 17:11:18 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.17417.1687453871466071600
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 10:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ki67jac2;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-9891c73e0fbso159527766b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 10:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687453869; x=1690045869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zCHcwbTHpEDk8vvLryH4uSgxgPnEpbqiIKbHRhE6TTk=;
        b=Ki67jac2UD9WvxTwQjAD6H9JDzAfdOkhLMo3VJAm+AlWdCPi0VcLFmrXon7xpWSejD
         2aspfYg2VJ+ZvW9aqI4yyi5GaX94+Bn/qHo4uU1m97Fh5im9GPNAZUMeJDjtT/vh0g4e
         xSBQ+6InyL1vqPnaTr9V8YnkI2dtqqHjGaRjdFd51Vmlij0GXEBoNW5/2D6I4+LIbfi8
         NNUjD/C20D4Bwzy4ejyExGxDL9a2FNN2xI1NLVFp7Rd9mJ6vjGMoTrpkhFobNWBISpa2
         eKFnXlS9NxGK/thCJpcMG0OKobjO+7U3cl7LWeonTzdu9b7Zd0VO+AYtRwW+lk2QXmk1
         38TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453869; x=1690045869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zCHcwbTHpEDk8vvLryH4uSgxgPnEpbqiIKbHRhE6TTk=;
        b=H3eZNNXNb2LRvSWS3f9UODUPG2jEZtH2gdw+4Hy6Pyn+cQNmS+9x2ZRAkwdg3TQ7xt
         M5508zT+PmS6BNbT1FTfwLRsoi/kdMZLltSYz8v1VYY4iZEH9msyEsUu784Rs8e1EauA
         8R5uz0lXEaEYqUqHQ6z6WI0yvVFeLzEV9N66p5JghOdEby8nk5+8x+nFhq2pczDLMtIF
         Z9iMkeGVishNPGu3yur4hKoX0rw2XJ/TQCde7iqsnJcoW3xJDy/6oieZ1sfKZvALYwAz
         uxBI/y5f9MIIvex/9jgIS/nDvXwNM0haVzJcwC1g4SJZgJXLJTBQQRVljtnT8rtmPUVf
         S31g==
X-Gm-Message-State: AC+VfDzrRS3X5hu9Jf5KKQLhCNAEChBxSpIhMx+RP22VDky0mymTzE6+
	H5tJHKuIVB3QEoirLDYNvQk+aMyacYQ=
X-Google-Smtp-Source: ACHHUZ6nAwnbEayB2tHjq3kcH1G/BCLsGb2B+Pz4pOhKs8oRP37ymGFKj+YEc8+L5VZJjrsKAKDlOw==
X-Received: by 2002:a17:907:a428:b0:98d:470d:9341 with SMTP id sg40-20020a170907a42800b0098d470d9341mr1413786ejc.27.1687453869606;
        Thu, 22 Jun 2023 10:11:09 -0700 (PDT)
Received: from t14s-af.fritz.box ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709062acc00b00982b8cd7a44sm4917053eje.139.2023.06.22.10.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 10:11:09 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/9] runqemu-ifup: fix tap index
Date: Thu, 22 Jun 2023 19:01:23 +0200
Message-ID: <20230622170946.10082-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230622170946.10082-1-adrian.freihofer@siemens.com>
References: <20230622170946.10082-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 17:11:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183280

Recent patches changed the index of the tap interfaces. They start now
with tap1 instead of tap0. Also the IP address starts with 192.168.7.3
instead of 192.168.7.1. This gets reverted to the previous behavior.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 scripts/runqemu-ifup | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index 9820dc535c9..fe4492e78b7 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -45,8 +45,13 @@ if [ -z "$OE_TAP_NAME" ]; then
 fi
 
 if taps=$(ip tuntap list 2>/dev/null); then
-	tap_no=$(( $(echo "$taps" |cut -f 1 -d ":" | sed "s/$OE_TAP_NAME//g" | sort -rn | head -n 1) + 1 ))
-	ip tuntap add "$OE_TAP_NAME$tap_no" mode tap group "$GROUP" && TAP="$OE_TAP_NAME$tap_no"
+	tap_no_last=$(echo "$taps" |cut -f 1 -d ":" |sed "s/$OE_TAP_NAME//g" | sort -rn | head -n 1)
+	if [ -z "$tap_no_last" ]; then
+		tap_no=0
+	else
+		tap_no=$(("$tap_no_last" + 1))
+	fi
+	ip tuntap add "$OE_TAP_NAME$tap_no" mode tap group "$GROUP" && TAP=$OE_TAP_NAME$tap_no
 fi
 
 if [ -z "$TAP" ]; then
-- 
2.41.0


