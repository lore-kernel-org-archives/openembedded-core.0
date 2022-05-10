Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBDEC433FE
	for <webhook@archiver.kernel.org>; Tue, 10 May 2022 14:40:15 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.10897.1652193606092735859
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=nOwRJi6e;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d25so15118233pfo.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 10 May 2022 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=D10qD8aXkBjyDd9QJ8H2gJzF6RezAtlxuLHbodWBwjk=;
        b=nOwRJi6eDoHqSGcAB4urAknqtZRZN5I5T5TcdCznvPkiF5CHS4h7y012zN9cp5POjk
         EqfwjkW/gN8Emu+Ow2FLA62b6jWRboReMKck06BxQX0UHxW8pYBFRDvpzfVW+jvLzkS4
         XD1+NlMOXMhp7H+8G51inQSba+TT0GVSYpfKj0PT2ykoEc4e9zH1wjbnlHmrnE3oPIWi
         aecBqt9Z+LTp+Ld8VvEpHE1aX0hGs2nt5ZqQ/JXiPZexc+QODY+Od/CHo/c/PA4CRrk4
         hA9Wsrp0ykVDyRA5ZB+aL0zUB8GrKT69bJ5QZV48L2BSQkXcNZ0tLRbgHeKTN9vjx2Tx
         ne5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D10qD8aXkBjyDd9QJ8H2gJzF6RezAtlxuLHbodWBwjk=;
        b=xcd5LOy1ElM+sRT1QMQKtTIr6NqshpIvwVDHjrjK7vmRueoFB6aaZY+3eVOk58j5M2
         FQi/lSDlJrVR0q2eOgYgR+aI3WItVDxvHxmGRuQ2q8g47Yt12JrMqxlNeuDNvlo2Adm9
         fLNd+9a/MvnyX5SrOLXNdcl05NPnIbvN0Ytp+W5tMtwCW4CkyjtjG9Lhkd6PcI03C6Y7
         Xl3g13U2QqydAls+AwFAbpMr9qA9CP3xSVu8riLUmuWb45DoQ3duNWJhIQyDZzX54ymw
         746FymkLjVnHb7o81aNIA4hwsZessIH2NLpPbylW7s43J29/nfozzMqvtYrKd3LqM3K4
         k7jg==
X-Gm-Message-State: AOAM5332DOEQqJlQ+qB+NdFdRYBiwHJ96Y1P6ygaar/uSIbjZHChI3w4
	Np4Klj5Q3iXeEZAdvtD/+1sjsA7v7HQPUdD0
X-Google-Smtp-Source: 
 ABdhPJzkXg0qJoLwzPcqCkacr/8Bw+375vmVwQC0JSiM1MXe9R9eLEuJFIGVq6RyqpAp2fBByMmDeQ==
X-Received: by 2002:a65:63d1:0:b0:3c6:25b2:22ba with SMTP id
 n17-20020a6563d1000000b003c625b222bamr17134860pgv.360.1652193604860;
        Tue, 10 May 2022 07:40:04 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 fv18-20020a17090b0e9200b001cd4989feb7sm1973161pjb.3.2022.05.10.07.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 May 2022 07:40:04 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 35/40] base: Avoid circular references to our own
 scripts
Date: Tue, 10 May 2022 04:37:14 -1000
Message-Id: 
 <9f4acb8d8b47349e7a4adbb25842a94c0947469a.1652192957.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652192957.git.steve@sakoman.com>
References: <cover.1652192957.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 May 2022 14:40:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165452

From: Richard Purdie <richard.purdie@linuxfoundation.org>

We'd like to intercept git calls but we don't want circular references
and HOSTTOOLS currently sets them up. Tweak to avoid them.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 52c37e133fa55846aca2248ffcf3a10648dbb8d7)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/base.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 3515720bf9..bdb3ac33c6 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -115,6 +115,10 @@ def setup_hosttools_dir(dest, toolsvar, d, fatal=True):
     tools = d.getVar(toolsvar).split()
     origbbenv = d.getVar("BB_ORIGENV", False)
     path = origbbenv.getVar("PATH")
+    # Need to ignore our own scripts directories to avoid circular links
+    for p in path.split(":"):
+        if p.endswith("/scripts"):
+            path = path.replace(p, "/ignoreme")
     bb.utils.mkdirhier(dest)
     notfound = []
     for tool in tools:
-- 
2.25.1


