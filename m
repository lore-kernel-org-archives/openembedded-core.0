Return-Path: <fantom.jac@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F197E10F287B
	for <webhook@archiver.kernel.org>; Fri, 27 Mar 2026 23:17:31 +0000 (UTC)
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1414.1774653449831567486
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2026 16:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R6eMkCni;
 spf=pass (domain: gmail.com, ip: 74.125.82.180, mailfrom: fantom.jac@gmail.com)
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so4988866eec.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 16:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774653449; x=1775258249; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5rnnpjVra+QbhpQAq3KEpZQjXUp+ymME8yKk0hFqRck=;
        b=R6eMkCnigSPP671PcnYybeOdezb4wDbl5oa9C2DdB6ufTXEtQMv3VB+e+xy4JTqwvL
         fIdJLQ8jStsmhABDY7T4PO5kWCNxQl8tAA8rB/kfHGqy4T/Na2QPi3S+ouRKWz5J74Wc
         6izIspxnRQ9SnHTSrG8tDi/Z7uI1PHZM6JACWGNdfT3/PrxzqWhNC5D4GNm7gigXqpRX
         yLNY6SK8Jbk8v4mKvwsuiHw7g5sX//KZvJUpRR5mWfKrRriAR0BpRB+Ae0qTRnnf+wM5
         hNBzspfQU9lz1YmQ4DyrsU4lqyAqzV68FPBD7rg7TnJ0Jmdidr9HRMCfBkSF3rA5gaK4
         vR1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774653449; x=1775258249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5rnnpjVra+QbhpQAq3KEpZQjXUp+ymME8yKk0hFqRck=;
        b=JMsVV+AXGArXNDkqtDNeufyYNtB3mXI8CN7gBoblirkgYoplNM9LYc1DTntdRSTZLG
         OPtT3pkTB9wt7+6DN/7plirJWkSep6oBgsXXDK9iNHDpkPHysBZFXWxYSGUijOT74V+R
         KYpypNl5T7iJcYlGJxXnuBngcDHj4TUpPJVA/hJqLgO3boSu3RlTul5u0ikFAeSoFUYL
         HSVgW5rNT4YRyJ73p0MhYy1n4Ptgt8PJcT0mJ7LFbOXhQcfkp0Z+9Y/jQ82afkCe19bs
         QQ5O79lgPPkMJpGyPu2XtQT3OJK/+G3Fz1h3TmAYJcOQvw8pQ4DOo7kLScdxBw4YbEm2
         3JGQ==
X-Gm-Message-State: AOJu0YyGI22aVpTnlSQu3oHfKexm3uP39sECVnlvVYIeKAYmccWjYHAA
	+KnhR001ebqLes5VAmdEPw0yPGD0bXnELcdmZfQq/9nh8t+7DqVZ2Fp6yvYdrA==
X-Gm-Gg: ATEYQzzxroQTFW4SmW2LQvHaLKgeSkVOeIOoeQvVuyoz/2dBSjUNfs+k/uI2ItwOzTW
	yodbng8Kgamr74MGb0R4zjEvSzO6lCnnKKttteCWJgkhpiG5FJG28Y7OKA4vcs8oRZFFN9uZIL6
	TVvTj/aPxqCuPiTd3Vov/IhRTBLiwvLkOHRo3avrk6hg8lNzQtCtW1+ZEtueG4eEFLABlKtY35K
	98244W8BiExjEKWsWFl8O8nvuY/+Kd4zBejoNjCVzwb0T0qCV6fbErvUso5HnGBq9N6A1QbWuIu
	NjYmpaH9sY3BRnFXFgel2iBOH/uhWLzgq//8WsLqh6vQB8h4ru/EbGFLrxm65YouCpkZw1XkDgU
	ZPH22dPVdn+a1i+UU6LZngejg2tIVP5aJWbQp9D1C5ftMh7z0+PW9JISO5kQ8ZKxJvPLYKMmqZ0
	QX+AMPOsaTDS/DJs2fA15oaJaHx7AnJMfVfN/Y4sPmzGZxFkwlKw==
X-Received: by 2002:a05:6a00:2d01:b0:82a:79b8:2049 with SMTP id d2e1a72fcca58-82c95c21e4fmr4170119b3a.25.1774652954549;
        Fri, 27 Mar 2026 16:09:14 -0700 (PDT)
Received: from suchida-mbpt.uaudio.com ([45.62.187.73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm293579b3a.50.2026.03.27.16.09.14
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Mar 2026 16:09:14 -0700 (PDT)
From: Shotaro Uchida <fantom.jac@gmail.com>
X-Google-Original-From: Shotaro Uchida <suchida@uaudio.com>
To: openembedded-core@lists.openembedded.org
Cc: Shotaro Uchida <suchida@uaudio.com>
Subject: [PATCH] insane: appendVarFlags must be preceded by a whitespace
Date: Fri, 27 Mar 2026 16:09:12 -0700
Message-ID: <20260327230912.18385-1-suchida@uaudio.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2026 23:17:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234110

appendVarFlags is not automatically adding a whitespace, user must add a
white space before the value to be added. Current usage may break
INSANE_SKIP:${PN} vardeps flag value by adding QAPATHTEST functions
immediately without a whitespace. e.g. It will become something like
INSANE_SKIP:${PN}package_qa_check_shebang_size

Signed-off-by: Shotaro Uchida <suchida@uaudio.com>
---
 meta/classes-global/insane.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/insane.bbclass
index 8bbe5bb19a..4ccc532282 100644
--- a/meta/classes-global/insane.bbclass
+++ b/meta/classes-global/insane.bbclass
@@ -1207,7 +1207,7 @@ python() {
     funcs = d.getVarFlags("QAPATHTEST")
     funcs.update(d.getVarFlags("QAPKGTEST"))
     funcs.update(d.getVarFlags("QARECIPETEST"))
-    d.appendVarFlag("do_package_qa", "vardeps", " ".join(funcs.values()))
+    d.appendVarFlag("do_package_qa", "vardeps", " {}".format(" ".join(funcs.values())))
 }
 
 SSTATETASKS += "do_package_qa"
-- 
2.51.0


