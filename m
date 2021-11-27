Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63121C433FE
	for <webhook@archiver.kernel.org>; Sat, 27 Nov 2021 09:54:14 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.34224.1638006850127963872
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RiRAEuX7;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id u1so23990495wru.13
        for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Nov 2021 01:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=RiRAEuX799fxCvzhOcNvD1Kd3ENLzoCnilkeMieiX24ATgHdfWTb4EpvySrFn49fqI
         kxh4ngeq+I8isDzeQ6VknsbPShos4OKdwZ+5V2wEdfWDLGbMzeeGhcCwVHRDbwBoGd+v
         oJv2qaccem6A8vWuO5TQX67A5s2O5Upr4F1hQUGmXPw+bqj+8mAg47lDNq2qvQS44BKN
         lzjWXlHx4TjoQdEdg/v1kfPMU+SDrYwqVMRTXcSSYREQ+LdwAjzSgMtrRWj+DD6a9VHz
         aiGvd+nbJvsIZUcVga88Qg9wbAqz2JDMsNacbXpgg3apyPwA/fEJOBHCFkgirk8QbTQV
         CP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=677i5uxuFFktxmLb96torf8LG7lqAHz70CrpJrpMBX8=;
        b=BnrcRsmkIhEg2533YBsRT4z5XnwQUXRvGNFAWA95T/NpgS4eSdALgRVpj4mqRroPFp
         QOjzEYgiF+A5E1M+mV9AJQuxqQcjaLl/fi/lfsvrtqCdKksrbJ611ti0XdW6sI3RDLqR
         4s0VC530it9vuCCZU2najDKa5YI732h3vd/gucmUnH3hteNXPu2vrIIaXEmie2ZDzS0J
         TPWJpq3ftJMDtM2sgiue7Ht8PJTiRsE98SdITpFpuGgqSzN0FaRs/B5SXhSBxO43Bt6e
         TM0sG0sAr9gF77KYz72mKT/xt9c+p84aMTmspII3oBRIjLaCjxWYiz681mQ1ahiknFTv
         onqQ==
X-Gm-Message-State: AOAM532P2tjvAsIDV7EKbX24zOGTvVPbCCALyMPD1rF6V4rG4WAGonEG
	2ggkI8T3kK2GyIONrpPn7jCSeeouqVt1iQ==
X-Google-Smtp-Source: 
 ABdhPJwLz+zbVEijSspZy7qn/xo3zoTKZS36I0N4uXKCY3ehS6YFfPSxfiAuhU3xJum6RkiApOhHMA==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr19898978wri.134.1638006848708;
        Sat, 27 Nov 2021 01:54:08 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 w4sm8484302wrs.88.2021.11.27.01.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 01:54:08 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/13] insane.bbclass: do not hardcode oe-core path in
 upstream-status check
Date: Sat, 27 Nov 2021 10:53:46 +0100
Message-Id: <20211127095357.1748429-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211127095357.1748429-1-alex@linutronix.de>
References: <20211127095357.1748429-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Nov 2021 09:54:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158851

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/classes/insane.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 240f3aad62..8a47da5a09 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1176,7 +1176,9 @@ python do_qa_patch() {
        (_, _, fullpath, _, _, _) = bb.fetch.decodeurl(url)
 
        # skip patches not in oe-core
-       if '/meta/' not in fullpath:
+       oecore_re = re.compile(d.getVar('BBFILE_PATTERN_core'))
+       match_oecore = oecore_re.search(fullpath)
+       if not match_oecore:
            continue
 
        content = open(fullpath, encoding='utf-8', errors='ignore').read()
-- 
2.20.1


