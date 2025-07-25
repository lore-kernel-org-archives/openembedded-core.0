Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E86C87FD3
	for <webhook@archiver.kernel.org>; Fri, 25 Jul 2025 18:44:47 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.26741.1753469085791934976
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Jul 2025 11:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=lvhAZohU;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so2392605a12.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 11:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753469085; x=1754073885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=lvhAZohU1p0xia0LcGYvQbfv223FMC7Y8nFhdehzMPm0+TJ2/REBeSDFFJkfpwpBPS
         KPjgF4gBTrxKD+UHBiIhdiE9R7mEpid+eR4yNqqMx1EB9rCOWI3cAIRujEdQS7fASjO4
         SD8XlioYNKQuEdtr8y/ZR0wZdFO00XnGbOO3PtGG60qyA4iIXfzxVpMDQe/NupA4kViz
         MpkzaXER0vBoWi+PEF+p2A8dxCJn7St/6Xjv+Yz5FDexj9Fc8PinFQkyD7u1EDjbcxOX
         bMlCaK8ZsXU5a1d8tjJIwGC1tzZDaFyHxE2908bMt/HzDyuEee7PQyEalht2ph4kzNbT
         zrYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753469085; x=1754073885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaVCZw7rVH9WBQNClAI9WhIhDm7oaqb72sS5HDzbtkU=;
        b=ptKpGZ2nvag3YEN+d1hMVa0ZqoiG6DbROHlrMqHXzh+tz3gd0EU7Ngs+83p4lQ+EtP
         5e6oUaTS78imQwPZglmCsjzjZ8K7hjjdQjp/+HVwt6wwQQ8roQXiTldr3zhc2ZMc66zM
         i5oUdwwWJ7O/4vukmB+xgK9K3eSBv73Bl7B2Ub+G1X4ZsS86U34jD+jqLlG1fN7p2msy
         EdaBK1QTStXtslSC+XVUtPSHTkZsGwmpKfzXalyzOZ+hsle5bmjyalNDfWojdmNrzB+I
         y63JkGZVmL2rYSyTly1gisW8bWedBdwERSwqP8zSzuAfcx2JD88scEOrfGZbHHfUbB7F
         VUtA==
X-Gm-Message-State: AOJu0YyBNuyekn02QEYHoIEGAKiwhHySQUCJxDSWtvnhF0+2tE9ykuVB
	c5ApqRp2b5wpWugAPa3AmFizJxhL4Ndh6UKfD7hnEkL2sJdR0lRTReMsSFm3pOuUloM9j4ZkMJU
	jZONr
X-Gm-Gg: ASbGnctqs8DwXhrrX8f2MS33PlEJqoI4DU7sI7ofns7BaKntUWiwgYivXGlO00f5pkm
	5rmPT08ymXwbZDuEJK3Uf+R5RytZ5M3v3GQv6COsGtYVZXYWuCGw57xtajSmb3ixPoDln2ai4KB
	oTO0zBd0/zZlFnffHhALsKYUiLaSymf1tjk8t6n4r1YfkNTGO/OiF3biYlI8qvhiXRdrRkIyESt
	R9gO45qRSrFhH33ONAjGRTDVcaRKXlaYV1hE/TTmeSCuwj49cxhUtXDaXGWHJA8/Vd2/YupB35t
	x6vNvZFuHcDQpMuEfp4SqnPL//5voyGxVFI5DPRxs5dv8fbeHesAJhoWxIzpYnRyw+KWMnNKW10
	t5m8QbnsVdS4hdQ==
X-Google-Smtp-Source: AGHT+IGV5jdqK8elObk9rJWyH28MWQmd6y/LksnbcYZMhPFNYlxuRTEPCJG4asPIV5fqPgUamT+MsQ==
X-Received: by 2002:a17:902:da8d:b0:234:d10d:9f9f with SMTP id d9443c01a7336-23fb315da00mr40449275ad.40.1753469084972;
        Fri, 25 Jul 2025 11:44:44 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:b695:a542:567c:1988])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fbe537f8asm2451225ad.167.2025.07.25.11.44.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 11:44:44 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap V2 05/16] orc: set CVE_PRODUCT
Date: Fri, 25 Jul 2025 11:44:19 -0700
Message-ID: <f5e320c0ea57ce1813ed09da703fe2b33f4976e6.1753468892.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753468892.git.steve@sakoman.com>
References: <cover.1753468892.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Jul 2025 18:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220921

From: Peter Marko <peter.marko@siemens.com>

There are new CVEs reported for this recipe which are not for this
componene, but for a component with same name from apache.

sqlite> select vendor, product, id, count(*) from products where product like 'orc' group by vendor, product, id;
apache|orc|CVE-2018-8015|1
apache|orc|CVE-2025-47436|4
gstreamer|orc|CVE-2024-40897|1

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/orc/orc_0.4.40.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/orc/orc_0.4.40.bb b/meta/recipes-devtools/orc/orc_0.4.40.bb
index e437831cd7..ee96ca0a4c 100644
--- a/meta/recipes-devtools/orc/orc_0.4.40.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.40.bb
@@ -9,6 +9,9 @@ SRC_URI[sha256sum] = "3fc2bee78dfb7c41fd9605061fc69138db7df007eae2f669a1f56e8bac
 
 inherit meson pkgconfig gtk-doc
 
+# distinguish from apache:orc
+CVE_PRODUCT = "gstreamer:orc"
+
 GTKDOC_MESON_OPTION = "gtk_doc"
 GTKDOC_MESON_ENABLE_FLAG = "enabled"
 GTKDOC_MESON_DISABLE_FLAG = "disabled"
-- 
2.43.0


