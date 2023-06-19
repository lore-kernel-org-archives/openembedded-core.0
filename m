Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C7BBEB64D9
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 14:47:54 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.9478.1687186071414725498
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jun 2023 07:47:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=YnBVlCcE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3f90a7325f6so22162885e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 07:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687186069; x=1689778069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsqKyp9l28GaQJ9kPPhIRchc6lsKFTV1taOobSZQ9Uo=;
        b=YnBVlCcECiXPaH/4tYLgpTsCM/9n1I6cQwQcJzI782p4ZnBwfAT0p/Wey3kju5d+6M
         8/qj7AbkVuWIVUOf79zNt8W8a+Oxi04ZU1PxeE8968KDOVje2WTKmYNVfevPrz0NlmDY
         v1I6QgCvZbfaNj1i62e7+L9e2i7OdC9uoHz9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687186069; x=1689778069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TsqKyp9l28GaQJ9kPPhIRchc6lsKFTV1taOobSZQ9Uo=;
        b=CiyqIa2TorqPiZZLOKVOabU16F45giSJTeQD7qMPjZ5TAvO7E4QKVuxHGhPk5v4opu
         k+cBkUGaL3g64ifZcT8sNuUFMhN647SlS/PjvZt/oKXwIj+QRt1f+BcaAHMbh/PZ/XRA
         ayC/WyXHPj7jKDWUkZo7ZSGXJ+SZKnkXGKNMTWQn9RzsxCJuAA16Ox+oMhGXgTPibrEV
         eljTL+/fGvgfZD69VCRdvU1nmsayz1N0icwwN7//0rb9aaNCs4PzQ9QZBw/vVRHpu5z4
         bVUnD8X/Wne80qGDIlnBeB53MmQdyiriuffdXSO7R5mrgJEXRaU+sMULpjEJlSCYc2kZ
         fZKQ==
X-Gm-Message-State: AC+VfDwJM0c0Wapk4GlHnCncKZmtkCwxJQhAH0ELcCqm4xksdXZyvy+F
	mxvtlpWYkrw0yCxmAh4whavsDP5krpUPWHlRSZk=
X-Google-Smtp-Source: ACHHUZ4vjNCMcqpdWB4qiz4OYfKNpEfAR7BcMRNeTJ0FbWyTQelWGLPn9LVYQm9SMw5szunrA7Y7jg==
X-Received: by 2002:a1c:7708:0:b0:3f9:ba2:5d1c with SMTP id t8-20020a1c7708000000b003f90ba25d1cmr4567050wmi.9.1687186069383;
        Mon, 19 Jun 2023 07:47:49 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f105:ba55:87cc:dc34])
        by smtp.gmail.com with ESMTPSA id i1-20020adfefc1000000b0030647449730sm32061035wrp.74.2023.06.19.07.47.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 07:47:49 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] scripts/runqemu-ifup: Fix 10 or more tap devices
Date: Mon, 19 Jun 2023 15:47:46 +0100
Message-Id: <20230619144746.2672706-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619144746.2672706-1-richard.purdie@linuxfoundation.org>
References: <20230619144746.2672706-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jun 2023 14:47:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183118

The use of sort means that tap10 and tap1 don't sort correctly. Tweak
the shell expression to correctly handle numbers of tap devices of 10
or more.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/runqemu-ifup | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/runqemu-ifup b/scripts/runqemu-ifup
index e3aa16c97df..5dc765dee82 100755
--- a/scripts/runqemu-ifup
+++ b/scripts/runqemu-ifup
@@ -38,7 +38,7 @@ USERID="-u $1"
 GROUP="-g $2"
 
 if taps=$(ip tuntap list 2>/dev/null); then
-	tap_no=$(( $(echo "$taps" |sort -r |sed 's/^tap//; s/:.*//; q') + 1 ))
+	tap_no=$(( $(echo "$taps" |cut -f 1 -d ":" | sed 's/tap//g' | sort -rn | head -n 1) + 1 ))
 	ip tuntap add tap$tap_no mode tap group $2 && TAP=tap$tap_no
 fi
 
-- 
2.39.2


