Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BBA5C433FE
	for <webhook@archiver.kernel.org>; Mon,  4 Oct 2021 12:58:35 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.8907.1633352300565110152
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=L8D+6ySV;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id u18so30650092wrg.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Oct 2021 05:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UOjnvoS4UnRMVXd6p/3RHsZPHH1tk0Hnw8i6wCMkvCU=;
        b=L8D+6ySVSkgbsUtA7OFmMtHRGWNHNZ3ZRM1klqLuWx3o2akb6B/j/4FGbgKbhqinJ/
         d+AOVOw2g9Za+zPXvrHAygyVii4f47En7Ucv+RAaQ0hug0Ei1sFYuois+FmT0/Cu+dhB
         psppNf0QeaGply6RKNABz4J5Y+5gXaamMX2wc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UOjnvoS4UnRMVXd6p/3RHsZPHH1tk0Hnw8i6wCMkvCU=;
        b=ioZV7LFJxlc14vlVtkIMwPsAvPAvXlkIJmgcdDUqeuXuKItb8VmIgqVVga7n1xHQJp
         tPfLsrysIRIkR5YeLvo3/c98Gbj740bndCjxub3w3U+Hq1ApBHA4xm5Q/rEFEJa4mY6Q
         4vS/V2jH3BbSYPgzYWJL2auN2ChfuW9G4S5di6LV4TgWhhGzxXTAcRuRB5E5CQJsWOVe
         oIiCIxBPwmrx8AlCpn3Y/4yLTUT+gMT27lbWhe+4WKdUAWLgHB/ark/fReFC2c+BF1tm
         EnX0eTe5pYSbrH+ppn/CarAQ7U8zFuwR2pS41GMaO0NtPoaKahKl31AdvGbyKlMIleKu
         zgQg==
X-Gm-Message-State: AOAM531Qkb94USAkxMcnOsp/wPRvxCSf0LPB/5qT41zzHiKuM8NRQCX/
	zX7pZeIGYmePkU0Duy/LkL2G06H9obI8MQyH
X-Google-Smtp-Source: 
 ABdhPJyhwmQmy6vufGe7qY5HeRWBhL5wfDaOci359eZu4B+HHscZrPvdp4coZ4zWw7ySN77XaVcReQ==
X-Received: by 2002:adf:aa96:: with SMTP id
 h22mr14710035wrc.405.1633352298845;
        Mon, 04 Oct 2021 05:58:18 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:dd7:3f6:3509:4eb9])
        by smtp.gmail.com with ESMTPSA id
 h18sm14091712wrs.75.2021.10.04.05.58.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 05:58:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/3] reproducible_build: Work around caching issues
Date: Mon,  4 Oct 2021 13:58:17 +0100
Message-Id: <20211004125817.2323818-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211004125817.2323818-1-richard.purdie@linuxfoundation.org>
References: <20211004125817.2323818-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Oct 2021 12:58:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156585

SOURCE_DATE_EPOCH can be expanded early in the parsing process before
the class extensions are applied. This can mean the directory pointed
to for the SDE can be incorrect until later in parsing. Cache the file
name in the cached value and allow it to dynamically update.

This isn't ideal but avoding expansion of the variable likely isn't
possible and I'm not sure how else to handle this. This works around
the issue until a better solution can be found.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/reproducible_build.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/reproducible_build.bbclass b/meta/classes/reproducible_build.bbclass
index 89f645b8584..7571c116c82 100644
--- a/meta/classes/reproducible_build.bbclass
+++ b/meta/classes/reproducible_build.bbclass
@@ -115,11 +115,14 @@ EPOCHTASK = "do_deploy_source_date_epoch"
 do_unpack[postfuncs] += "create_source_date_epoch_stamp"
 
 def get_source_date_epoch_value(d):
-    cached = d.getVar('__CACHED_SOURCE_DATE_EPOCH')
-    if cached:
+    epochfile = d.getVar('SDE_FILE')
+    cached, efile = d.getVar('__CACHED_SOURCE_DATE_EPOCH') or (None, None)
+    if cached and efile == epochfile:
         return cached
 
-    epochfile = d.getVar('SDE_FILE')
+    if cached and epochfile != efile:
+        bb.debug(1, "Epoch file changed from %s to %s" % (efile, epochfile))
+
     source_date_epoch = int(d.getVar('SOURCE_DATE_EPOCH_FALLBACK'))
     try:
         with open(epochfile, 'r') as f:
@@ -137,7 +140,7 @@ def get_source_date_epoch_value(d):
     except FileNotFoundError:
         bb.debug(1, "Cannot find %s. SOURCE_DATE_EPOCH will default to %d" % (epochfile, source_date_epoch))
 
-    d.setVar('__CACHED_SOURCE_DATE_EPOCH', str(source_date_epoch))
+    d.setVar('__CACHED_SOURCE_DATE_EPOCH', (str(source_date_epoch), epochfile))
     return str(source_date_epoch)
 
 export SOURCE_DATE_EPOCH ?= "${@get_source_date_epoch_value(d)}"
-- 
2.32.0


