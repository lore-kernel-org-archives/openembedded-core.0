Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACF1C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Nov 2022 22:58:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.3138.1668207512694471717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Nov 2022 14:58:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B/3MY7US;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id l14so8180852wrw.2
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8XhFoweoZTnMBG/BfvuRYFYHWPP6AQ8CNdCn1gpKOuk=;
        b=B/3MY7USoavEV8yxlRdLGjBuBH9dUloVPQdLMSISk71c67k9CKCbrf/jO66E3aYX1D
         UlyBVXCllOcwIP58BSQS7U21uKPwEKmEgeybM81X3ulxwnfjv0XfBT138zP35YQnY2nf
         jS7VGGg+PurBAuk0d1RaxqLOI6MJrF9/FnfUM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8XhFoweoZTnMBG/BfvuRYFYHWPP6AQ8CNdCn1gpKOuk=;
        b=IkTWEnZruDGdyBSK77D/q/yhJ+e0PE4+/AUmFeeLoPrjgulORqrRNOAc28Zlic0qxm
         C6vZ5PLdkGVN6kZs1/Sqfjvpaq6GtkxKtynm+PvDoby/OK6Du3EhTXFQoJjPpnJOazbW
         QYoSOAowdMv15eKCXLjgvRcLVnprTGMMdz6ayctOJXzj0DwYB8QW4tNEKlxa9pX9ruka
         uRiQVmv1v2yOqCsd2+sxlIoRJf5IBaWyoS3HAYfDhV5vzxFbRmVdBSjPWhKohUaO5a2e
         Dj6yY/uidVz6FRDWmx9zQKyOg4OaCkucntocoLQ2xWlQJMvg86qlLzt5CjIZvY43AijJ
         rv9A==
X-Gm-Message-State: ANoB5pl+phGN95JL7R4iMyoHQe6yRpSG6lnV+lOGWmdTBmMHJ1DpQdjg
	z78geimgcjGKKLUc1tvIiVmrDwukcgJelA==
X-Google-Smtp-Source: AA0mqf45G8QSyWQT/KvCXzZetf7rQsk/tDwmfKPnniWAhmHhwh2HAVLOSulkS339ZX7EJTkckYARmQ==
X-Received: by 2002:a5d:4cd0:0:b0:236:757c:54a1 with SMTP id c16-20020a5d4cd0000000b00236757c54a1mr2363339wrt.106.1668207510362;
        Fri, 11 Nov 2022 14:58:30 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ab23:323b:7deb:e214])
        by smtp.gmail.com with ESMTPSA id v21-20020a05600c215500b003c6c3fb3cf6sm4093236wml.18.2022.11.11.14.58.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 14:58:29 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Drop data finalize call
Date: Fri, 11 Nov 2022 22:58:27 +0000
Message-Id: <20221111225827.2412062-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Nov 2022 22:58:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173146

This call was effectively like update_data and no longer did anything
in bitbake. Drop it as it is obsolete.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-global/sanity.bbclass | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 8c7d4d08809..6cb0d6cf882 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -1003,13 +1003,6 @@ def check_sanity(sanity_data):
     if status.messages != "":
         raise_sanity_error(sanity_data.expand(status.messages), sanity_data, status.network_error)
 
-# Create a copy of the datastore and finalise it to ensure appends and 
-# overrides are set - the datastore has yet to be finalised at ConfigParsed
-def copy_data(e):
-    sanity_data = bb.data.createCopy(e.data)
-    sanity_data.finalize()
-    return sanity_data
-
 addhandler config_reparse_eventhandler
 config_reparse_eventhandler[eventmask] = "bb.event.ConfigParsed"
 python config_reparse_eventhandler() {
@@ -1020,13 +1013,13 @@ addhandler check_sanity_eventhandler
 check_sanity_eventhandler[eventmask] = "bb.event.SanityCheck bb.event.NetworkTest"
 python check_sanity_eventhandler() {
     if bb.event.getName(e) == "SanityCheck":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         check_sanity(sanity_data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.SanityCheckPassed(), e.data)
     elif bb.event.getName(e) == "NetworkTest":
-        sanity_data = copy_data(e)
+        sanity_data = bb.data.createCopy(e.data)
         if e.generateevents:
             sanity_data.setVar("SANITY_USE_EVENTS", "1")
         bb.event.fire(bb.event.NetworkTestFailed() if check_connectivity(sanity_data) else bb.event.NetworkTestPassed(), e.data)
-- 
2.34.1


