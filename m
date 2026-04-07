Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4103FF511F
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:24 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85271.1775578578595024420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=W9Ixl3/z;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488a29e6110so33954065e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578577; x=1776183377; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=W9Ixl3/zZNCajrYCPChckaeuX1PhFd41dHKgtnTJDc60pI68K9KU4OTZY567JkvqHR
         s7ygSf2eQZDM74I8A78xLj4Md/B/6VHaDj78Y7Wq6SlPaXeS/iG2V4JSLdKA0i6Wr9gO
         3vvOTc/ziJ1ePHvhaDWIoVrDqFA7runZYRzxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578577; x=1776183377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=WcFGgbLdxfU3CZc7LALkjT5EvZGoy/NugUDxX4tkHe4nZ7+ACDg/Z8/JapHLOeZbh2
         bprhtLFBbzmEqAUByyVjkW1jcWsiR/s2O6nG+TzHxqrZGdkZSxA92Dy49gx71maIVBoX
         Jx0FdKk/79jI61j3COlpqSIFtc3QA8Bg2TrqDjxsyIUT8L77GE6lDmVHZb7RzdyWckFn
         XWN7eLA59WUHcrmhKYrAKsQtzuZRZVtF4NDvnvoVTPUwJzm5cldletxpZuuX/XGueew8
         GD9/zN8oUEJjG2TVvOtHMmjRRN3DO9HtyDh686E8L9Mslc0Z+aeIU53uOvB3ccGgGHrC
         5t6w==
X-Gm-Message-State: AOJu0YzqxKuVLFszDAtCsPzHqWUujlDKercg4ZdtXV8zQ2vyB9QK7Pnw
	oKmXAZTSDBVk5GAxyTeJWttgTc2KmHU9aZCjJ/iDJJba/VXu1RCK2K2yUWwfgpEollFava4PDxj
	LYAQA0aw=
X-Gm-Gg: AeBDieuzZTn4fBf8GYt91yDnwUMVnlSPCtn/KB1VQJxWx0OaboXp7FVvf2nARyYeQgr
	LZ7pKqqkQn87NJRar7DxiwGhZT9cxkTayFzNBPrZ4oEyvsa7fIGtK5VkdGfzB3JJYs2lFV/yGIc
	pLxJLbOHHaYEb1wBHrikbTG/c8mX6DfvsrwaFldW7p9bIBrlLg2pw6w6PjykuHMReW1AfR8LICZ
	pSWC1ev7g4xG16qbxoaXV86dtfFI3dWUUQpzBQLY5lspSu1jNPxqh22qBH/hYQSHuK/5QUUa0Pq
	XCTA5Apbohfv4FJR5BuKKQTNeHxmfeSH5RV0O1fStDNiEbjJ/zjYh1vXc+GoLl47Hwew/iYPQ/g
	emMTH4NrWy/xjEG3kelf+JAo9f47zHOBelKklYAeG4Y9k3+fX49rOUC/M8sCcQZf5e6u5I1gN1t
	8bhfSt65BiKN1J/g5GJC21AbATFwR3anzSxzvT73Iv+umP2PhN/P1m9euSCNIccl2eDS2ksZqIj
	lOCNOKXqipViTph2sadNYxoAIPH
X-Received: by 2002:a05:600c:8216:b0:488:ba19:da25 with SMTP id 5b1f17b1804b1-488ba19dbc2mr68776565e9.12.1775578576618;
        Tue, 07 Apr 2026 09:16:16 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:15 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 03/19] create-pull-request: Keep commit hash to be pulled in cover email
Date: Tue,  7 Apr 2026 18:15:40 +0200
Message-ID: <58138d386f1c221e87d2217bddc7e31d02cab58c.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234756

From: Paul Barker <paul@pbarker.dev>

The cover email mangling in create-pull-request was cutting off the
actual commit hash to be pulled, making it difficult to verify that the
changes a maintainer merges exactly match those intended by the pull
request author.

The extra lines we want to include are, for example from a recent
whinlatter stable branch PR:

    for you to fetch changes up to 6c4c6d39ea3202d756acc13f8ce81b114a468541:

      cups: upgrade from 2.4.14 to 2.4.15 (2025-12-29 09:49:31 -0800)

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c78f5ae4a5ba3675b78cc226feb7b9fbbfd8da19)
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 885105fab3d..5c4414ecd5f 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -219,7 +219,7 @@ fi
 
 # The cover letter already has a diffstat, remove it from the pull-msg
 # before inserting it.
-sed -n "0,\#$REMOTE_URL# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
+sed -n "0,\#^----------------------------------------------------------------# p" "$PM" | sed -i "/BLURB HERE/ r /dev/stdin" "$CL"
 rm "$PM"
 
 # If this is an RFC, make that clear in the cover letter

