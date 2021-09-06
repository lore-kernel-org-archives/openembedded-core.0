Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.22643.1630938493205442103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Sep 2021 07:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hmjY9tS+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id x6so10088557wrv.13
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Sep 2021 07:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufjcfdCAXmz/JdaYNUbNTIsqxHxRESU71Ke3UgLeZO0=;
        b=hmjY9tS+mpq8L/HDdBN+le9Ub9GHc7jdAW8ovMV4uc3nmGVQ3f7lLkfWiNCIjoTcSA
         AmEwAXgkxLIYWF30/5+aMGr3oMQ0b5m0/tDHTYNFVZC1ThfJPPrj9XxiyJHHzBkckreI
         0Bdh5dJ2IsClHQLEKiec+T50Wv7r0QYlKzxqE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ufjcfdCAXmz/JdaYNUbNTIsqxHxRESU71Ke3UgLeZO0=;
        b=p1qkzGGQx4DbI46mK2BexxHDHocf2KrGJ9MahW/pzy21Y1PuL3UC+ayC4sbuTXWkOS
         S4YpW4gcaD0hfWmoZFFc7Fpn0v06+tVPYDkyRXjxpvmscJ/Gf103BIeUjXB6NDQd1vQe
         smNbhBGgpykftiiC0Ubj/URW0xpyiuUzU8y6PKMfGdjRdu69LEC+yXX48eEaEl0L8Ma1
         qxJqE1NjzkPV+ygcByqcCGeH1rcHf3w5G9D7QIJdHMdrlhOaPoHjtRpZ2TuA0kdcw7SD
         yCf+BLqRG3Lrc0Pgop4qaRdwGAKqThBy/llhCc7hDQg1atqyb0lvnxH7/Mn7ivB7Dtox
         kZfw==
X-Gm-Message-State: AOAM530bdng8go4NtyofXNeVL78UHKWzXAdipv2Oq+Y6O3Q4D3lCQc1I
	GVcJvubgyRyEfP34aGCQgfuFVPlHYo4p5w==
X-Google-Smtp-Source: ABdhPJyNIrjMXsCTkQZCAs3vZGyYKgS6yEFProPMgQ1YIKt+IBOF+iqowei/UZ3nGg7k/tqdQa6ivg==
X-Received: by 2002:a05:6000:344:: with SMTP id e4mr14212199wre.423.1630938491275;
        Mon, 06 Sep 2021 07:28:11 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:612e:ab48:3553:3f2])
        by smtp.gmail.com with ESMTPSA id f3sm7309468wmj.28.2021.09.06.07.28.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Sep 2021 07:28:11 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Exclude CVE-2021-29923 from report list
Date: Mon,  6 Sep 2021 15:28:10 +0100
Message-Id: <20210906142810.1084860-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Upstream don't believe it is a signifiant real world issue and will only
fix in 1.17 onwards. Therefore exclude it from our reports.

https://github.com/golang/go/issues/30999#issuecomment-910470358

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.16.7.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.16.7.inc b/meta/recipes-devtools/go/go-1.16.7.inc
index bc1cd944496..02a92687790 100644
--- a/meta/recipes-devtools/go/go-1.16.7.inc
+++ b/meta/recipes-devtools/go/go-1.16.7.inc
@@ -18,3 +18,8 @@ SRC_URI += "\
     file://0009-Revert-cmd-go-make-sure-CC-and-CXX-are-absolute.patch \
 "
 SRC_URI[main.sha256sum] = "1a9f2894d3d878729f7045072f30becebe243524cf2fce4e0a7b248b1e0654ac"
+
+# Upstream don't believe it is a signifiant real world issue and will only
+# fix in 1.17 onwards where we can drop this.
+# https://github.com/golang/go/issues/30999#issuecomment-910470358
+CVE_CHECK_WHITELIST += "CVE-2021-29923"
-- 
2.32.0

