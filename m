Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D03D5AE53
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 10:00:09 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2864.1765620008718579667
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 02:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BuDHbO8r;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29844c68068so24624875ad.2
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 02:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765620008; x=1766224808; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w0rdNBfTDG170LTr78GDbDRcmnmYwb1aV1TnlY+nGDg=;
        b=BuDHbO8rdDgMUxHW+csWVWbkAS2Jj3lkEVvsIhZFKy0K9Y3QwtOGTrAB7/tIWlYRx0
         qIe5ZLiGkTNDxWOAZKX2htDPd9yQLW9HCwZRZfmIfMo7YlbdVglzcFi4BytXnKz2JqQa
         rrucUOFOq4n4raKZC14akP5/EeivOMnES6Fiing0MxokKCCVYbDps08FbqxuB0DEyiaW
         3JSAP2MFsdj1MK0gttuOUl7SREYuHuB+AWYpwkiT/Qoh86OHMChzEHs/us47YaaIVhnv
         BCnhJqgytT+GmYGG9kW8ldu7hk2OfO+XXwWWYF8K4CUVCqYJ5O07hxeKAU62bRZFIWdw
         KGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765620008; x=1766224808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w0rdNBfTDG170LTr78GDbDRcmnmYwb1aV1TnlY+nGDg=;
        b=NU632XrduxefDU5fLt3iAvKSUDyNXnAGWyeC4BGDuWIZKmZy88gVo0m0Z/aFePwLkp
         KdRUvtv6GFhw5yR5Jt/e704lDhamhbPC7hx7x/qcdWpwL6qkUZyOH+FWCds7Hf7jxTqk
         o1IYoSUZDCmQvB1vR49fdci9rNf12WIQ/aa9cSTqcqjz1zg1mgx+iek6s8OoFjlR4ufY
         f3XzSuuqQ9F3QGAWranZ4OsbrheG2ItNwHSoeok30bnjTqTHw9BfzC/fm4gSAh/BmJBm
         8KMum4LMa8dMTw3bQPQ4aWDVHJqI3IWL/Sac5kOAlEB4/SSJNWqL7w4BMFhqUvJeY7Zd
         1RUg==
X-Gm-Message-State: AOJu0YyJOgPK5SJC8bejLu6v8TXTLln8zmf7WZR7TmwP6JUnCiQmlZqC
	XULDzEuHCYclAYHeYrwzJGtZW9YJ/MqKxWnLMNhm5Qx3AQqocK32UR/l0tUXLmi+
X-Gm-Gg: AY/fxX5mKmYBfodaEzbDwpylI02iuce8SmH9wlEQf+Q/fdDDV2cEyknyIV3fxbDW2+R
	1Z8tg379HANNKqIxZJvkDurJ1nLwOnmjIxKdm6yQc03P+UVOQwmxvKJ9FDtJAozeNkxB1+lWi1w
	fcr9URkHqEJWqu4/40QKOvVXYiRLBuG7ZNmKbcMg+wI+bZo0Jb6qKFochzswn2T7czWy3V7ogIJ
	uUWG17jT56udjFjG3XPbPoKBZgRVimIAV5ilBkvyblFUvZUMrrP92SlBXOXe/ObY7O03MjoV3u1
	v494/BvdgSj0QshkipquwakcxOY267CiJZp8kepWtx1zvz87uNb9yIAX8bESiB3Hg6uv1cQdoyf
	3gzK7sknwW9wpemLH01Y1PUD8W0Zovi0TkNeITYpWbewftHbGCg6/DDi3qLsctYqyECgJAVPPCt
	JOoJB6AXxT45upR36UPI1xCp5g27c+hJZjEhI=
X-Google-Smtp-Source: AGHT+IH2jIKtw5ODVNY2su2trv3aCbvABOqJar/j4szJyz4DU7htZH/We/F3NHu+wUqeLS91kRps6Q==
X-Received: by 2002:a17:902:e5cb:b0:295:59ef:809e with SMTP id d9443c01a7336-29f23e6f5d1mr45852865ad.24.1765620007531;
        Sat, 13 Dec 2025 02:00:07 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.230.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a082b13b6bsm26173725ad.99.2025.12.13.02.00.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Dec 2025 02:00:07 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ming Liu <liu.ming50@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH 11/67] iproute2: use "+=" to set PACKAGE_BEFORE_PN
Date: Sat, 13 Dec 2025 15:28:35 +0530
Message-ID: <20251213095931.2571498-11-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 10:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227629

From: Ming Liu <liu.ming50@gmail.com>

This avoid overridding the original PACKAGE_BEFORE_PN value could be
set in bbclasses.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
(cherry picked from commit 4ff635cb1ee57cc20cf8453ef0206858c8d3f9a2)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
index dc7106902c..019f82a196 100644
--- a/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
+++ b/meta/recipes-connectivity/iproute2/iproute2_6.16.0.bb
@@ -80,7 +80,7 @@ IPROUTE2_PACKAGES =+ "\
     ${PN}-rdma \
 "
 
-PACKAGE_BEFORE_PN = "${IPROUTE2_PACKAGES}"
+PACKAGE_BEFORE_PN += "${IPROUTE2_PACKAGES}"
 RDEPENDS:${PN} += "${PN}-ip"
 
 FILES:${PN}-tc = "${base_sbindir}/tc* \

