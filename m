Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6784F364D8
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144826.1775776275669199423
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=sjqtmIte;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so18316375e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776274; x=1776381074; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=sjqtmIteOPvXYBZwF5HuPEvoxGXT5PEX8mSn6qbgRjUoYK7wWRw23+BgoiOCFefDo9
         6beNtyUlZaRiKDy5HoQv2kLCC1jB+XngpJ10Vsc1Yc8FnyymCdmO38AHbgDhrx861YqP
         V5MmdvNmr+0L/vn0+QrjIsslAnr66klTFHsck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776274; x=1776381074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xFSjZKpY+ZOBlTnU1ZhWa2/FzL7hm+4wH1p530QQaSk=;
        b=k6CtzF/W4PvQ+lOpElmqoo8rJmAK75ca3vmssEm3D6N8v/YNk2iHnZgn+/pnsul3ke
         c5UXMJ6qBB1Lpc8lcRb5xk04F5bUUYhv3fLe4zSech2cyA3pVPCchjt4wqnbb97ODah7
         cInUtbIojtJmZLYFaK3twFZFyeDsVWdWvei6TMsnCW93+ZGwkt+urDLi5okHh4K4GpBH
         xT3joCYKXSs1DjLOpfEZCDXm/8+40QjNKfcI/Xc5GpHYmKVcqrOAn+6IEnHNR74vkDnH
         7lxpQjnezzAuBeWUgRR/Q7TITTWUEJ/wjiyY/opq8a4fwNkofbcOYFB9JBxZcRdPY/PW
         QWfw==
X-Gm-Message-State: AOJu0YxPMNtvFIAJ3bnD+OrRrpheByNYuxyqolGNrqBZOoarfhxepoMF
	ksALsHb8b/NFgKcnhs1Z5gTwSlqUUKNHJ9U1UDNFvYcfwUjYRi/27zuJ9RDzhIKtIeFTqfJ7jhC
	+zCzBfx3zeg==
X-Gm-Gg: AeBDieuRO4asnlhYJZAsFo+b2UQasK3poAfplzJgOCrwr7tfHs0BUUkFZcaw3XAZNYL
	KOZ1Ci2vYZ6o50fElyBU2SDfPWHw7k0c3/tOirhBQNUtJZDXljlCaiJ6K5Kx477t/B6m3+em/nP
	00bQb6OXshKNrA014OGbf7zgf91IhMRC6gm2AeLtSYefT4hKUrm6Bj2PMDDvPBVU1MsvFWNgn/3
	aeMk1Is8PjJILBdvfOT5dLLjlpIUcDqJzpFNY5Tu2ZusfU2RZiG44e7EDxEo9prhaZO9IeTwnWg
	ehvytV8zepb3OomwZ31Xpff0o+2TO/cUd30/mjIY3Togh5mBul+sY3MqHy6kQh+5pV6JqeTCJCn
	rg0al2D259lVPsCKra1jVN9BdMd09bTu6F0ZfTNVYw4urQZ+AGkIawKp4/mnSWT5RtCAFD8DVbM
	u60bpvqJq/XW80pjPMnBit8E4TJW31AVALIzn40xDD+Yb3wIC5uksQimD/kY5yUVwcqp5EWJxON
	qHhhPK2ZTnZZbLQbaC92f9nTpBC
X-Received: by 2002:a05:600c:c10f:b0:487:cd8:4c9 with SMTP id 5b1f17b1804b1-488d689ca8dmr5249005e9.27.1775776273827;
        Thu, 09 Apr 2026 16:11:13 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:13 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 03/30] create-pull-request: Keep commit hash to be pulled in cover email
Date: Fri, 10 Apr 2026 01:10:03 +0200
Message-ID: <58138d386f1c221e87d2217bddc7e31d02cab58c.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234962

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

