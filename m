Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65971C433EF
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 07:42:02 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web09.4404.1642146121463553442
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 23:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PYZoy+xG;
 spf=pass (domain: gmail.com, ip: 209.85.167.52,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id m1so27605734lfq.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 23:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGBltVsSwGVCMx0S0oNZIjuRyDIw/ldF6jq1McHzWqI=;
        b=PYZoy+xGue5Hu5e5n3u4Ml8SGp/sHwZTQIfXIxxMGRTESjJHfCAyLaqfiMH7UfMfS8
         s1OnFt6wm3XgwDKswlEx4IQFTi8OehI8ZINe1nnzAAomxN/S8ZTUs4J0eg1eVsE+Yl2y
         l0G3ZgND/wOguqA0gHU3uNzMkyIg3qEGLhE7GQbA8F5sMfRvILzxTPd2JOB8G2+7XdOX
         lutp8+7cCBLff3Etl7uYh7s60+2+pru/6cyrhGfrvLtE9vc/zFGTrQs7wl9flDctKRiz
         BHGNTN2Nm4P9iLo2JoLfhMTxWIQHqhUgZaJHBpMmZQp89njIbNtf6U8DJkDfLmOR4R9C
         RtZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=GGBltVsSwGVCMx0S0oNZIjuRyDIw/ldF6jq1McHzWqI=;
        b=tgJM7i1qFVHvWfimjBOt9nXXXm9luuBbTOf0RGx3Bk8zHyaA8f8uZibBlw+OSiZSRm
         wNn9eaCH18RqB/KO9Cg64nEBM1wx11o83TdWCXPaK34Jf2xBq0yUY/jYeRBArW3ZHawO
         Sd9AXuRw8Uu3e0xBdgmsJGQqGr2gQH+3OB6DEBuVY16my72xanTLORTFMcO2zTMj1Qjg
         LwFdcFZFHKwbCohx1T1Rp+oUJcXzqtqkqWkDwguwfvM0pIBkROi/IyAG/1x4j9Hydgeb
         osj9gPIStq8sLxxX1vJ+ElEbDMKtYMJo4a4KwhABu0bhDHLBtgnu+yuUhzUprXvmk+K1
         bzvw==
X-Gm-Message-State: AOAM532OxOX0Aj4yJZW0J84/+yBUZNwqx5lKYnqIL8XleADQaQMDIvE5
	TLn3hzUi95k7T0qhTGY5nMi5MPwpIWQ=
X-Google-Smtp-Source: 
 ABdhPJxspIHs1OC6W7W1tO7SikK37p+8f9+4Ufj8JJk1gtzlF6Ih+PB/tLdPeSJE33NVQbwKK9rcEQ==
X-Received: by 2002:a2e:a545:: with SMTP id e5mr5758953ljn.5.1642146119198;
        Thu, 13 Jan 2022 23:41:59 -0800 (PST)
Received: from localhost.localdomain (37-247-29-68.customers.ownit.se.
 [37.247.29.68])
        by smtp.gmail.com with ESMTPSA id
 z7sm506813lfq.267.2022.01.13.23.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jan 2022 23:41:58 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH] sstate: Preserve permissions when extracting tar archive
Date: Fri, 14 Jan 2022 08:41:38 +0100
Message-Id: <20220114074138.51861-1-jacob.kroon@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Jan 2022 07:42:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160559

This is done by default when tar is run by the superuser, but for native
recipes the corresponding task is not run as root under pseudo, so pass
the flag explicitly.

Suggested-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
---
 meta/classes/sstate.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 645377fdd8..8ee32dba2d 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -901,7 +901,7 @@ sstate_unpack_package () {
 		ZSTD="pzstd -p ${ZSTD_THREADS}"
 	fi
 
-	tar -I "$ZSTD" -xvf ${SSTATE_PKG}
+	tar -I "$ZSTD" -xvpf ${SSTATE_PKG}
 	# update .siginfo atime on local/NFS mirror if it is a symbolic link
 	[ ! -h ${SSTATE_PKG}.siginfo ] || touch -a ${SSTATE_PKG}.siginfo 2>/dev/null || true
 	# update each symbolic link instead of any referenced file

