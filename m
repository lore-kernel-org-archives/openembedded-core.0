Return-Path: <danismostlikely@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C61A6CFA45B
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 17:39:26 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.3854.1729705164591835393
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 10:39:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CEZJ4pQ5;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: danismostlikely@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-83aad99d6bfso218039f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 10:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729705163; x=1730309963; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lzaOBZAkjoAe16Tj1IJcMsojovB0d962tYnkF+upamY=;
        b=CEZJ4pQ53AXd4vEZwrr79uW5lnbaY9YASKWmdSQmKXwLPylRIl3u0XLfV+0CQ0SpCI
         kp+jSiE6hjWYLYduslECAMExAsp7OTG+GaYptDwWcYtwQ/05jq9cwzvK+iWVaiMYQu+N
         UIZghdWRj3oizfPetx/SqFfOUzumLAvXa6bkW0s2GhBs8d/I5iYfPS1FnsAYDi7HiFuh
         R+CU+08zrRAItP6a2x7Ltv0Vx/ruEEjyrf/89p7WbFDWv78z+WyaM2I0/LvYRIGR44iB
         LWCJbI0hHNnlkXKQzt9EGo2apcdG43uXH8RgaU+E/W3qJN2+V/jcYywturxF13sov57b
         cSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729705163; x=1730309963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzaOBZAkjoAe16Tj1IJcMsojovB0d962tYnkF+upamY=;
        b=KVpxjPZo8zry9+ywc0NR0Mad2e3PV+NB6wQRU4pMx4fJ+4CjwqkTTHe7X/q+FnehZQ
         bkidvhJzY5XUG+4Pq+Accm74Rrf10CXo6T5MaQErc7OabH187957yDazMicVrjsLVRmh
         /OxXv6JVAKhGJLVyva9gZPC+pxfLVTyhDquobw340FLcGGbKfXTHlwQuaENk0NphwHRh
         2V8nemO2s4rZBmSe5hpxkPAevHKhdtdd+OMUtAS5tXxLp7GznzeSa8RrKfoDf/P6HxpT
         nCogcjIZqPD/FpjM6s78N9lDSPMCERZ2gfKZT0TSDq64AZNPNX/yO/IPSbo3EVrQ6UDt
         2/Iw==
X-Gm-Message-State: AOJu0Yw1zzTMXI9fyTHauWlPexXJXQ3NCE+AwyyKLNnkmE53vnLQB4JS
	dcE0SRrfgP4CfmS58teAQojrYIrqeOxstWKvUBxmNYZ4Rk/IYaSo/jBaMw==
X-Google-Smtp-Source: AGHT+IFKyEDCFMAoHqDnun+qC5Af9ILHgu6U4GWW761KvkS+qW7h7vwTg/DzDS0Wmq4JGxz7i9I4ow==
X-Received: by 2002:a05:6602:60c8:b0:83a:9488:154c with SMTP id ca18e2360f4ac-83af6146af1mr315973239f.3.1729705163401;
        Wed, 23 Oct 2024 10:39:23 -0700 (PDT)
Received: from nebuchadnezzar.home.arpa ([204.83.204.143])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc2a661dffsm2175013173.173.2024.10.23.10.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 10:39:23 -0700 (PDT)
From: Dan McGregor <danismostlikely@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dan McGregor <dan.mcgregor@usask.ca>
Subject: [PATCH] ppp: make pam optional to avoid host contamination
Date: Wed, 23 Oct 2024 11:39:11 -0600
Message-ID: <20241023173911.1411724-1-danismostlikely@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 17:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206260

From: Dan McGregor <dan.mcgregor@usask.ca>

Without explicitly disabling pam in ppp, it will check the host for
pam headers. This leads to this QA error:

ERROR: ppp-2.5.1-r0 do_configure: QA Issue: This autoconf log
indicates errors, it looked at host include and/or library paths
while determining system capabilities.
Rerun configure task after fixing this. [configure-unsafe]

This is a somewhat difficult to hit, only my test machines that have
the pam dev package installed show it.

Fix this by adding a packageconfig for pam, with its default value
off, since enabling PAM is completely untested.

Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
---
 meta/recipes-connectivity/ppp/ppp_2.5.1.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
index 5b8c49ca850..19e89b18383 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.5.1.bb
@@ -27,7 +27,10 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
 
 SRC_URI[sha256sum] = "733b7f5840b613da4eab0429a5081293275f06ba8b528e1b8eea6964faf0243a"
 
-inherit autotools systemd
+inherit autotools systemd pkgconfig
+
+PACKAGECONFIG ??= ""
+PACKAGECONFIG[pam] = "--with-pam=yes,--with-pam=no,libpam"
 
 EXTRA_OECONF += "--with-openssl=${STAGING_EXECPREFIXDIR}"
 
-- 
2.47.0


