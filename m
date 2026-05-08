Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DBBCD37B3
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:18 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8156.1778224336861802368
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=riB8R9/x;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-44a14580111so1250551f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224335; x=1778829135; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as2Kouifbb63+fwMkUqtlg6xxfEbd45CY9QHogSaXew=;
        b=riB8R9/x04RNpKx89qD74zbRz499hN9YuBDpyaWAUy0w8ZjUprI1wZcxnSzbQbSEA2
         77E4diRUe+xrHK6MVRotbKLXgjrYkrrBy1ptZ45XZHa45nio0JraOeLRTRU9QiMm31Yo
         4ibevHho8ZHoRtoQqo37TWFtsnuV/Og3naJ+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224335; x=1778829135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=as2Kouifbb63+fwMkUqtlg6xxfEbd45CY9QHogSaXew=;
        b=TU0FhpATaxJocfyZCxBudN0lFnm1rDHl4oU0WVC1iUg8t9gBL9L4Og0e6uAU9XIVPw
         cuQYLvSzFe9FWl4XyIAXAZkHUsp6f4oPmg7d91CJnHtMG4Jt4K6y0muFu74ywnz57+mp
         mB+PTaLG5KnG8mgmFTSJLUcforNvYOgCRmmghUasLouB1//1Et1QnXQt6m4wCuQ2l/HV
         sPSGyMwCY8RPPU3s33ed7iIpfvOA9sRxVZv85ErBTWvpIlMtbtSmY1qdX047px3PDeYm
         qYF9gIXKJiu+hU7Legm9rfNThOe6sSbhkFo+IyykntPYrpwJdaLseVW4Z90n3Mw6+vzu
         HNbQ==
X-Gm-Message-State: AOJu0Yxhsp3pjouOwgWemlNW+3ob8trWXTDjU74YsjdDSBYx+GTjw/bC
	JuzIfo6jge+pNn/9xT14mOZxbelO5f4qfdn6jO4ilq4pDwHoxchawNaH6TnyUh9yKlbDQ1JM6QF
	W1F0+vNI=
X-Gm-Gg: Acq92OHGEmGGoX9tWFohvtuXAPbvKhlXwDix7kdc5ZNvcLGCAnXo3T38ziN172Jcwzw
	JZ4LO3Ke9OYBR7T9RN3oHfKj5znRDiJp89Mm+hFJTewfQMfNO/5wtj7Qkl7PbgJJKDc5Krr+w3Y
	NuQJjC3B8Km3SZYvUyvEF/bm4ZMYuG9ZpKIgaKRlA1HUhpnR5a/1v9cLZLmuW+xI6TWMVT9BNFE
	8si9mWGrOAdAnjCDqUwiGabHWBERD81IRbW0UYsAURSIxTJFotKfYkVbd4XAd5Brybjz0Bexi1X
	Tg6H2GToTkTTy6IWxeDAdLsGAJOrHvCVwXu4oK+iDzIwTVLvutOS8VtD9yAzzml71/4Ii8LpMkM
	oCLO+YyvAFE0VUNa9yMZLL4JnQvnfQBarxQbT4TS+UT16PnAhOM2tqQ2eANX1BCnhsSapCHA0Hd
	lqzxhqtqPQKi7xBHvyYgmB8O0Ym1zJLxTylFT79MmJ4CnzYt4k2KfTevJRWdBM0Yi4fAmyWvd8P
	zTExAn2nJY5Znbk/eaqdeV4U5s=
X-Received: by 2002:a05:6000:2c01:b0:43d:7946:baee with SMTP id ffacd0b85a97d-4515cd279f7mr16840226f8f.23.1778224334865;
        Fri, 08 May 2026 00:12:14 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:14 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/52] cve-extra-exclusions: ignore CVE-2019-2708
Date: Fri,  8 May 2026 09:11:01 +0200
Message-ID: <5896b5efe4fae359a603b6886aef3bf08aeefddf.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236650

From: Peter Marko <peter.marko@siemens.com>

Yet another CVE for berkeley DB, ignore as all others.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit dc2aeaf5e18a02a8381585175e7d2046a8370faa)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/conf/distro/include/cve-extra-exclusions.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
index ffbbb7bef16..0685549e000 100644
--- a/meta/conf/distro/include/cve-extra-exclusions.inc
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -49,7 +49,7 @@ CVE_STATUS_DB = "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626 CVE-2015-2640 CVE-201
 CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775 CVE-2015-4776 CVE-2015-4777 \
 CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782 CVE-2015-4783 CVE-2015-4784 \
 CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789 CVE-2015-4790 CVE-2016-0682 \
-CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
+CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2019-2708 CVE-2020-2981"
 CVE_STATUS_DB[status] = "upstream-wontfix: cpe:*:berkeley_db: Since Oracle relicensed bdb, the open source community is slowly but surely \
 replacing bdb with supported and open source friendly alternatives. As a result this CVE is unlikely to ever be fixed."
 

