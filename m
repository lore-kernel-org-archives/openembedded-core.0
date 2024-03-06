Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59F3BC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:23:52 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.16116.1709742224549159144
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:23:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LnJPgFxa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-412e6ba32easo23785585e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 08:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709742223; x=1710347023; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p85baMXjHFcsCfThdr8kOXX8kapBV7Q/QWze9izZ1/M=;
        b=LnJPgFxauk0dVu68EAlmLDmroxiMR5rnORqR1wKbFGpecbKP2gvJht2P19BAUuJQYS
         nToyf8QBLZ/DRt+9yNoy9etecE9xhPWFz1m6+NsqoZ+9mkQAzNyWhJOBUUMOUcwHN0Pw
         uJdmhPnPTm9tyAV+ZCu7mgP7D8OFfntH8ctAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709742223; x=1710347023;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p85baMXjHFcsCfThdr8kOXX8kapBV7Q/QWze9izZ1/M=;
        b=b38oWLQOeqLp/LUBOJQJG8i43hInF+muZFBosX1Jctm6OUsD6VWYJx6F7Oc8ZiLPCV
         5O6A4o6z0X470tGORIgkMZ+AopdtW57iSBYpoU3cc5qW+KmV4lJYDf+n2Ci5PN+XFDB9
         lBBfqNPPzUX1WkSBa+vWF4A58gZSkxpgGd5DNRf/rm303u0Q0LC5o0KMk2/+wEoqw1MO
         TBdFwxjwSLz1asF2+cd/t2BkY0NABZ0ELsHrbrRIWF+J27ExvPbtXQ+tKMLV15Lqa4Tm
         83+Rexj9tEfi0bNpYt+5gos985+vYMcetmSWWwAB/3SGBsddPl/4AmY+iOn+PTZEGzuV
         S7gQ==
X-Gm-Message-State: AOJu0Yxqx1ROrIjMEnw9yRIuvAlBIdkIvOCSs2gm66otf7/pnSt1wCfg
	zrhsCPApW4bJb31Nt5mAwr64SECsg+1cVSc0t0THw3m4edM9qASEFqpp6UhpOiSABipdflIwovG
	G
X-Google-Smtp-Source: AGHT+IEC8rnGl0qCNTkvnWj9lNr0ffsSZ9U9bJ601iciEDM3fnfqfyF6AHiEC6RmAwdO960ErvUAYg==
X-Received: by 2002:a05:600c:45ce:b0:412:fe95:b6c3 with SMTP id s14-20020a05600c45ce00b00412fe95b6c3mr703389wmo.35.1709742222630;
        Wed, 06 Mar 2024 08:23:42 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id k34-20020a05600c1ca200b00412f81ba413sm1929791wms.11.2024.03.06.08.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 08:23:42 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Eil=C3=ADs=20=27pidge=27=20N=C3=AD=20Fhlannag=C3=A1in?= <pidge@baylibre.com>
Subject: [PATCH 1/9] qemurunner.py: Fix error on calls to run_monitor
Date: Wed,  6 Mar 2024 16:23:33 +0000
Message-Id: <20240306162341.2267587-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 16:23:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196736

From: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>

A change in QEMUMonitorProtocol.cmd() requires that we either pass in
kwargs instead of an argument dict or move to cmd_raw()

cmd() was renamed to cmd_raw() (and command() was renamed to cmd())
See:
https://github.com/qemu/qemu/commit/37274707f6f3868fae7e0055d9a703006fc142d0
https://github.com/qemu/qemu/commit/684750ab4f8a3ad69512b71532408be3ac2547d4

My concern with this patch is that I haven't seen this come up with
utils/dump.py which also uses QemuMonitor's run_monitor. If it is
occuring, this should fix issues there as well

Signed-off-by: Eilís 'pidge' Ní Fhlannagáin <pidge@baylibre.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 277cd328484..cda43aad8c5 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -650,9 +650,9 @@ class QemuRunner:
         if hasattr(self, 'qmp') and self.qmp:
             self.qmp.settimeout(timeout)
             if args is not None:
-                return self.qmp.cmd(command, args)
+                return self.qmp.cmd_raw(command, args)
             else:
-                return self.qmp.cmd(command)
+                return self.qmp.cmd_raw(command)
 
     def run_serial(self, command, raw=False, timeout=60):
         # Returns (status, output) where status is 1 on success and 0 on error
-- 
2.40.1


