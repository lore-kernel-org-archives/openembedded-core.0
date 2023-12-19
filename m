Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD32C41535
	for <webhook@archiver.kernel.org>; Tue, 19 Dec 2023 14:35:40 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.15004.1702996534802274192
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Dec 2023 06:35:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LSpgQ+wh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40d12ade25dso32614715e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 06:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702996533; x=1703601333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=5eTLlPe0lWzbN9ISuG25z9byrRgwYPd9KUOukWx5hT4=;
        b=LSpgQ+whm30Ml2JQUe1UPG5CfkjmYMJZzRPjngMw0ZuKQ5XETfC9t6XJFxfQlcp7S6
         sdHnWpcgJ9o1tTOFWikQd/XcXvBn3LQrY82odBnB+ftRiWwe4PF2DyCU2FqlBUmN4yz9
         VO+mh5gCoalOfTL+Hn32qU0/JCQ4Ppc7YMxL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702996533; x=1703601333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eTLlPe0lWzbN9ISuG25z9byrRgwYPd9KUOukWx5hT4=;
        b=wiqJP5qnFCOg+IBSGZegDZEDgaIpiGURo8FLSNB0pDLddAn5GlgortfUlcUo73zrQM
         pG6eVUpNM4PG00IGc9dnfHi3QlTrdkcGTNS8PE8MbYSW/uLsPbH8EGI57fRCNnENCAZT
         h+PSqm83EsI/nBYfgrGADxs+6p1AwFedRYGNgewt4kq0VbdrjoFDtfZlM+K/zklYn+Pn
         jfP+HJSi3y8I8N6s5Hi0M/ibGM01X8Qw+dYwPJTZrjEISJ+aNG7f/VKJpFYstYpPfmnp
         f2tCmj3f7iawhgl8gx/RZ2fxMjJwK9wndWUAcvPlXFPz1UYzJPhE42C3ai9KP09ojOym
         BTmw==
X-Gm-Message-State: AOJu0YzS6B4UokNXU//qxYuj8ZwkP9Gu8oTyFUBvNtw9eD7sTZbygX8W
	ZrRBu6vEcQUETSzI+Fr/gxjbZAfF+diJq/FxvN0=
X-Google-Smtp-Source: AGHT+IGHkQbv9UHOwjDArq1QIzwL1oqluBWwdO0EslM7EKT/pOqT64h4WmoIqAPNMpbwPO5qEWtLYw==
X-Received: by 2002:a05:600c:198f:b0:40c:707d:16f0 with SMTP id t15-20020a05600c198f00b0040c707d16f0mr2971049wmq.23.1702996532893;
        Tue, 19 Dec 2023 06:35:32 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b87d:537f:7c6:e419])
        by smtp.gmail.com with ESMTPSA id m5-20020a05600c4f4500b0040c57e4ea28sm3168889wmq.17.2023.12.19.06.35.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:35:32 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/5] testimage: Exclude wtmp from target-dumper commands
Date: Tue, 19 Dec 2023 14:35:27 +0000
Message-Id: <20231219143531.3514266-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Dec 2023 14:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192740

wtmp is filled with binary data which the run_serial command can't cope with.
Catting this results in confusion of the serial interface and potentially large
backlogs of data in the buffers which can hang qemu.

Exclude the problematic files from the command.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes-recipe/testimage.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/testimage.bbclass
index 7c56fe9674c..c6b7a1e142f 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -121,7 +121,7 @@ testimage_dump_target () {
     netstat -an
     ip address
     # Next command will dump logs from /var/log/
-    find /var/log/ -type f 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
+    find /var/log/ -type f -name !wtmp* 2>/dev/null -exec echo "====================" \; -exec echo {} \; -exec echo "====================" \; -exec cat {} \; -exec echo "" \;
 }
 
 testimage_dump_monitor () {
-- 
2.39.2


