Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D74FF5121
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:25 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85273.1775578580721876143
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=azzcMerp;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4888375f735so48312015e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578579; x=1776183379; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=azzcMerp7D3+xZGpPoFT0jVOd1lYGEG5FykRi6gy4C5neVo5t7Og20n8oton1WD2iO
         9fG75/EKCTno8etGC1eSkoYULOts9Za9QWGs1tAatfP7DEwe6sid2y0QMb6y9GcjKZCS
         8KEeZVFo6s0+0R+u4OAYfMxun3WXfTlBcupNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578579; x=1776183379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CT90VZFAvpsWISE0hnXnwKX8/4gqB+DBOKG5HEgjKQY=;
        b=H9kGk5wrZx7sKNmfx4fU0n6DIStm1hF4120V4ntokKRQFGF5ynvDdp1e/Jkbxo8/Oy
         uO5tFmdojzURATetG82SlqiAxAsivjpRngYYW64irXuT26XbjZw8eOzlkZ37oXX8SbuN
         s0EwpPl8scfEig7VdBCveeiCYePSGXMU7NbFE+YgGY4fWNPql4Nvd4YrDWPeA9INJ2ZA
         QL8aPNDO0QdaHUF0+UOyDCipj1FY2GLulMbkSLc2tvXXyEhwcVtp/r4oI28vyhr9IEik
         QlYcnUERpUYwZmaCSJK/wChk9izYVHQfjfQKLE7B1WCuB/GyyL6lqoISIM8N8T8P5sLr
         YQMA==
X-Gm-Message-State: AOJu0YyBOyaHVtgxCR0amBH9xEEQZXhoMLv9anwScre4HB01N9DN7p0z
	Jib/0Ug566RxCgREE9d+kNKPU7RbTUz3kSZiv2x74cDr35XTxnM5zHYlKZV72iGwbzRDzqQbXOn
	5GNe3gS0=
X-Gm-Gg: AeBDies4+rlMqoHY3JI9sqTUWSOHaIqL6b2b2MZz/h6muffd8XnRJ9NK02rlITw0vSM
	3HErJNQd4nAktQjsOU5zgomzwV8WJYKFoChfFmJPgRs/+YWBPu6958YLFTSJn3WiYAiH8rtWrym
	rB5PSvLsyaS2KvXLYxq/RqVtS1m7RWHvqDBsUdy/8bvEyf2tjjqbiiiq20rqnkHqQKV432XmZI4
	amm8xnqAapJJ1aIt4iTGtch8otno0+i+oIdQPZxsT+HwHPI5Wv+tWzMS2+MOxm2ZBxYqi++s6Yz
	C1f6QJ5qce5ajMKbiOvJ/ek99JMrPrBaBkT9+PJK7t4JYL9JUdrg3z77TGqBwuaFaspJ+JKFrWl
	+LIrfSiWnRSz3WyqtBeTf6ZQYYYAc8zOjVACua/mp2x9P0R0LTK/v5zgZoBdJlQUs6fbiYG7kWJ
	TF76SO+v/wB5a8CaKN4yKHEbEGL8C6JrAQXY6MWgMRHIL+DiG5nSy5sN2s6J1Qqq2R0G98AgT0B
	h+bJtrpJ6dFDlJwe8BUTrd/NLRl
X-Received: by 2002:a05:600c:a413:b0:485:6bcc:87dc with SMTP id 5b1f17b1804b1-488997b3a9amr186320345e9.14.1775578578635;
        Tue, 07 Apr 2026 09:16:18 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:17 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 05/19] libtheora: mark CVE-2024-56431 as not vulnerable yet
Date: Tue,  7 Apr 2026 18:15:42 +0200
Message-ID: <b9d75be7bc2eaa88a280d52ee0fff322e56d52e2.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234758

From: Peter Marko <peter.marko@siemens.com>

CVE patch [1] aplies only on main branch which is base for 1.2.x.
Branch 1.1 has a different initial commit and does not contain
vulnerable code where the CVE patch applies.

Also Debian [2] marked 1.1 as not vulnerable.

[1] https://gitlab.xiph.org/xiph/theora/-/commit/5665f86b8fd8345bb09469990e79221562ac204b
[2] https://security-tracker.debian.org/tracker/CVE-2024-56431

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>

Picked from scarthgap commit 07f35d022b88ab4d297d0252f9909e252b7e4cfe
Reworked from CVE_STATUS to CVE_CHECK_IGNORE

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
index ad0be85559b..4066bb1513b 100644
--- a/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
+++ b/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb
@@ -22,3 +22,6 @@ CVE_PRODUCT = "theora"
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--disable-examples"
+
+# fixed-version:branch 1.1 is not affected, vulnerable code is not present yet
+CVE_CHECK_IGNORE += "CVE-2024-56431"

