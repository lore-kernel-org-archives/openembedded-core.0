Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB1EDC28B2C
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web09.22276.1659940975209834636
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p3ZCG1Yk;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id gb36so14772873ejc.10
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yXfrIldROsYRX0idSrJ6WhOlalMQk8HZt3SBT0bPLqM=;
        b=p3ZCG1YkH+EM+5b+LWM7KC76P0EBqLya+f0JuIhxxDIQLPwVWUfVQEmFhohpAkwrPN
         s8C+kklanJ+Ug/80iUvZZlCmwT4z+zXeDpE1qskfm8cIzJ5lchmVfUzVGyO0kahrOACQ
         nCSoC0xQeqtg69stNOKcBnqKOTE+aHlXkD6v5YwmpEhEOMkO9I+RjD4FB0YHcYD1RVW3
         3a0wyNb5hUFUxVm5jH0vfEP2uuPqvgL+h/8a3oBcV9WwXky0epvQY4sNdDBy+1wzGZXs
         qkDXa2v8EbogkprHyqiBCRWFhk4ONwMHASC4uZFhDMa5laJyu34fFQH5LvhHkhmDDV1X
         9WuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yXfrIldROsYRX0idSrJ6WhOlalMQk8HZt3SBT0bPLqM=;
        b=YSTRjpIzehefzCaYdzOAxMgbd4VVn61dNMHLvDeLOhd321sr46sdSay2Qt4ozcp+Km
         Tb9Py9tzh/v3vx40bxgWbqWuMJO7uZt4oht7f77yCa3xTWXeU5VPwfX8oka8HkQ5wZ1m
         z3AL+Wd4mrAWZYjfFDGHP/FwS6JGf1oNfUR/Tr0NYfaBpmMrUaZEi5MS3MXprv7xJ+mH
         2ZIF5Gl50gK9Ao8sxKO76xewr0vSedMyTdcBm8c9z4iO2kUfH1IE3VipgfkdmF4TwpAf
         /QLk2Fku1va5ox/NYcGP9LbW84eyt9oepEWCtdRzFmLfLNbtPDpG8o99nzJmltmgUtRe
         WpnA==
X-Gm-Message-State: ACgBeo0nRnpe6CsW0Ic2yH86zY3n9ybKFP4/ruAvpft6M7FcMb9baHcd
	jKpIkYqfFxHtVMKr48KdNqGWQDDE5XY=
X-Google-Smtp-Source: 
 AA6agR6NG8mTw8+2FIT9kl7r+qF54QQqXK7Azi5xw7x8d32taKooRlZIgQeFRWz+jeLOd1KqvuBQMQ==
X-Received: by 2002:a17:907:a047:b0:730:e4e7:5127 with SMTP id
 gz7-20020a170907a04700b00730e4e75127mr11184082ejc.707.1659940986643;
        Sun, 07 Aug 2022 23:43:06 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:06 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 29/44] nettle: upgrade 3.8 -> 3.8.1
Date: Mon,  8 Aug 2022 08:42:22 +0200
Message-Id: <20220808064237.3975347-29-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169052

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/nettle/{nettle_3.8.bb => nettle_3.8.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nettle/{nettle_3.8.bb => nettle_3.8.1.bb} (96%)

diff --git a/meta/recipes-support/nettle/nettle_3.8.bb b/meta/recipes-support/nettle/nettle_3.8.1.bb
similarity index 96%
rename from meta/recipes-support/nettle/nettle_3.8.bb
rename to meta/recipes-support/nettle/nettle_3.8.1.bb
index 0d6562dbce..bf49132235 100644
--- a/meta/recipes-support/nettle/nettle_3.8.bb
+++ b/meta/recipes-support/nettle/nettle_3.8.1.bb
@@ -24,7 +24,7 @@ SRC_URI:append:class-target = "\
             file://dlopen-test.patch \
             "
 
-SRC_URI[sha256sum] = "7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6"
+SRC_URI[sha256sum] = "364f3e2b77cd7dcde83fd7c45219c834e54b0c75e428b6f894a23d12dd41cbfe"
 
 UPSTREAM_CHECK_REGEX = "nettle-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.30.2


