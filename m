Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE84C76186
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 22:48:35 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.8620.1678229307929155656
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 14:48:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=q9VEK8Ho;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id s17so8573690pgv.4
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 14:48:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678229307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6IL1pJvvtT5Vp+CVQZuKxas/jJGT/dMGkX8Z4SBnoUE=;
        b=q9VEK8HoAwCBSQgQ2adlVCkminF6sZXBbPkcOWERIjeRIcb0RlnQ1y6DVYzsTzsbnU
         svldYjpQHm7uomrGIBWOoYQm38FAIyRoP+lHIlB4lXsWrtZ0HzqXTUgX6Hf7Vai4OQ2J
         DSwKE9c5mke1t2BHl79qXMudc2cQQCmtDj6phxV71erKFPGlDZe12aptydVpKtpIqKuw
         sXmqzCaOnogvNoNkbepbUWQFKHpZzEZCdjR9iOWFLPdIrwxcijS981WJbRDV4C24APug
         ydEDWXNIz5hTDL6VMbPYENt+Me0jcil2L5+eQEm/wHxHDlD7q1X1+fOgrrW11QceGVk/
         M4CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678229307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6IL1pJvvtT5Vp+CVQZuKxas/jJGT/dMGkX8Z4SBnoUE=;
        b=J6q+CYLWGDw1CBKp+qaH3D/dGRaI1C06YqP3wWWf76QLP0tS2ZYPCjc2NhAuL93+SI
         IYJOP5Gk38IswCpw+328HtTyQdSHLxSYyCOjhBDcqaqIDztZaong9H7KLXMSaZXhYACV
         dpiuZSa72M0KnIl+p5+ZPkQkQ4SDqM+9HyzE/+HXJtpvZl+HE2wrbufn13HKix/nNcQm
         sIoikUcvqfsbFTjkVwBMYwD9JS10grMlRIgKXtnTapvSDg/C6WxqY6P5yLypZ4/ZD8e8
         +qE1XsyIBOZI6vHRhZOOTILl04WV79F2SX4lj4xskxEkVOCrV9Q0Q4lvP6rt0dPUIclr
         QcSw==
X-Gm-Message-State: AO0yUKVfIVxMfomizWMAlUuY2S54mHnFNJudojb8Btk0mMuDIr+uZd6q
	PEmRuvfIEUHcaOrSiKOHID+i+TiBJvpIM0pnO0c=
X-Google-Smtp-Source: AK7set8RYQzuvGuYVhq5PxgQAs6dQHxVTGnF78+ZraUckUwvYXrbjZ3x/kpzDULMT3tMpcn/GmJtJg==
X-Received: by 2002:a62:1bc3:0:b0:5a8:a751:d22 with SMTP id b186-20020a621bc3000000b005a8a7510d22mr15711322pfb.12.1678229304938;
        Tue, 07 Mar 2023 14:48:24 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id k1-20020aa78201000000b005cdbd9c8825sm8388958pfi.195.2023.03.07.14.48.23
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 14:48:24 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/23] bluez5: Exclude CVE-2022-39177 from cve-check
Date: Tue,  7 Mar 2023 12:47:38 -1000
Message-Id: <27c59788ce8b97666429981104d9e5d38634230e.1678228988.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1678228988.git.steve@sakoman.com>
References: <cover.1678228988.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 22:48:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178126

From: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>

CVE already fixed in CVE-2022-39176.patch

Signed-off-by: Hugo SIMELIERE <hsimeliere.opensource@witekio.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/bluez5/bluez5_5.55.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
index e5353bd815..be74a35e0a 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.55.bb
@@ -6,6 +6,13 @@ SRC_URI[sha256sum] = "8863717113c4897e2ad3271fc808ea245319e6fd95eed2e934fae8e089
 # These issues have kernel fixes rather than bluez fixes so exclude here
 CVE_CHECK_WHITELIST += "CVE-2020-12352 CVE-2020-24490"
 
+# Commit 7a80d2096f1b7125085e21448112aa02f49f5e9a, e2b0f0d8d63e1223bb714a9efb37e2257818268b 
+# and 0388794dc5fdb73a4ea88bcf148de0a12b4364d4 to fix CVE-2022-39177 
+# already backport in CVE-2022-39176.patch
+# https://bugs.launchpad.net/ubuntu/+source/bluez/+bug/1977968
+
+CVE_CHECK_WHITELIST += "CVE-2022-39177"
+
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
 NOINST_TOOLS_READLINE ?= " \
-- 
2.34.1


