Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72DAC4167B
	for <webhook@archiver.kernel.org>; Mon, 21 Mar 2022 13:59:46 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.30957.1647871185909367341
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LBS2Zllg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id r10so20851896wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Mar 2022 06:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2knfTwRwwJ+OQORm7DH+BDlXIYUYzqif3jGceAmy4gI=;
        b=LBS2ZllgBh3TLwP3MzwQM8YHUta/aeGSRLJFzXltH+i3CU7BxNFz17H/uHV6QahGHx
         tDghpHAiS7Ig87UVJGRK7U9FGLUQQHKa+6V6zgodxzq6Xl2Ct2eT+8idiYEx5rkp6mqx
         8hC4YdyLo/Vf2zy5OOEVYjXksqy4qc5hm5HW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2knfTwRwwJ+OQORm7DH+BDlXIYUYzqif3jGceAmy4gI=;
        b=j19d/Aw1WW4JFEYbnPZB4wfkUXxSUjvbk7CairPPbgi5izcE0nw6ZLTqYhSW4GX9gk
         F7JApCLDIICSqTwTTFexwlZvH7qr/OrMxnxNGzXb86Le6U3nMbIp+oDakx7vIRBgAsAt
         KnjScxQ5+GCNvkZXCh71o/0dwr7a3+85bGQp9oOHhnA+7Fr6DWrLNQnMivVSb7Jql1Oa
         GGBm/zhI7G9XAmnpXe0j52U7Gl0lHynXxwC/WW2YNkrD11CFrT+aMXbvroAuk8WIc0iX
         9VDKxvp3eBOF/R2eknltMMqDexIfgM5l1xwNAXGbcol3HZixyF1CDR/9U8DvaYKKNBsL
         MDow==
X-Gm-Message-State: AOAM532woZvH9Jh4FUTw9vBxyWIVzqdSGNHj7zbfDUsfUioltQ5B9B0F
	JsaWlyIBXbCGhuDaWumVqh9qmvE4eC6gU4L+
X-Google-Smtp-Source: 
 ABdhPJxQoR1N7yWpJH0D8nurb6OdqnN0cyC8oyRvWS58pTYwXKanTaplz/+y20qiksPBmlOBkBjKTw==
X-Received: by 2002:a5d:5507:0:b0:203:e0a3:7016 with SMTP id
 b7-20020a5d5507000000b00203e0a37016mr17723419wrv.575.1647871183780;
        Mon, 21 Mar 2022 06:59:43 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:7422:13d5:6a39:d39])
        by smtp.gmail.com with ESMTPSA id
 c124-20020a1c3582000000b00384d42a9638sm14045094wma.2.2022.03.21.06.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 06:59:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] pseudo_util: Improve handling of crazy length paths
Date: Mon, 21 Mar 2022 13:59:42 +0000
Message-Id: <20220321135942.1176431-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Mar 2022 13:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163508

Crazy shell code (e.g. libtool) can pass in a command pipeline as a
path which exceeds the max path length the system can support (6000+
chars). This will fail in libc or the syscall but if we don't do
something here, we'd segfault before it can do that. Leave path
unchanged and let libc deal with it.

This was observed with segfaults in libfm:do_install after the libtool
upgrade. It does depend on the length of the local build path too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 pseudo_util.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/pseudo_util.c b/pseudo_util.c
index b9de81e..0a89535 100644
--- a/pseudo_util.c
+++ b/pseudo_util.c
@@ -827,12 +827,21 @@ pseudo_fix_path(const char *base, const char *path, size_t rootlen, size_t basel
 		return 0;
 	}
 	newpathlen = pseudo_path_max();
+	pathlen = strlen(path);
+	/* Crazy shell code (e.g. libtool) can pass in a command pipeline as a path which exceeds the max path
+	 * length the system can support (6000+ chars). This will fail in libc or the syscall but if we don't
+	 * do something here, we'd segfault before it can do that. Leave path unchanged and let libc deal 
+	 * with it. 
+	 */
+	if ((pathlen + baselen) >= newpathlen) {
+		return path;
+	}
 	if (!pathbufs[pathbuf]) {
 		pathbufs[pathbuf] = malloc(newpathlen);
 	}
 	newpath = pathbufs[pathbuf];
 	pathbuf = (pathbuf + 1) % PATHBUFS;
-	pathlen = strlen(path);
+
 	/* a trailing slash has special meaning, but processing
 	 * trailing slashes is expensive.
 	 */
-- 
2.32.0


