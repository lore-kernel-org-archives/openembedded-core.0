Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9F74C88E6A
	for <webhook@archiver.kernel.org>; Sun, 13 Sep 2026 20:12:15 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6001.1789330325184074221
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 13:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f9FeuDZj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-486fa798933so732434f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 13:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1789330323; x=1789935123; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6yX+o7cApcZNFFplM4Ukd1OO9jBPtrIv5T09d0o+lXI=;
        b=f9FeuDZjkWqM9cuiMIjid2Fac0yeHYby9Omx2X1PJ5WOstm2in0T8+LtK+SmZuSLSb
         cJ99xrxYV6bgvKZotBEL7HQmoSAyDYHRP3GviJSpjyY9TwTtkWoxwWK+KE3uQmRDouDx
         GVLkBeNx5IqzvrW1W+tYP7/CtEk85w7SYn3k0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330323; x=1789935123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6yX+o7cApcZNFFplM4Ukd1OO9jBPtrIv5T09d0o+lXI=;
        b=MOYZnj7f2IoA0VYnyq+q6UfDzjn0KBQxUy1kcsK37kLjaIkIErxA7FfdI3T/o68cP/
         L0loOfSwlui2DWeeO3NXnEyEyOo4ff1uB3eJ6PI2YOF/IhA2fegjVOXTJMTqPt7aDQ0l
         xqj6IL9ABkf8MUA0KpDI6onR5C5d2NhMwVBpMgmt7ttPnsS21CGFaJndbNUmduwt46mo
         EhQjIsTLa95ekvCDovjSEtaJR393erSu0TBy6zx1BnyJYtDF9ekE1RfDukxqxER3pUxj
         FJrQo8bQX2CfDSMCyRuQKKiie3GwdqfJMSWXJfpeqyZPJNh5DdshvyJ6Y7GqoB2vYKj9
         gn8w==
X-Gm-Message-State: AFuF++ladLnkr45KaMx06l+Xh/OtE0niAiEGGzFTpzf/g9RbU4b9jakQ
	NGEOXz8dG8WI/yFXpmiy5jlhEsJ8Y5lH3aNZaUIrHow5ARbNg7bZreoQT33ltqfX1JROmidz+Nl
	Ar/6PPTk=
X-Gm-Gg: AYBFou0dFYn7418Dg2xMNlVj8OGjnkGwpFoehDS41cKLenuKlKjiOTgNvrtL8/wxugD
	ndRT7ChCS4LvLQxPjtZtu3jRdDtZa3JFAcBzoBvS/rymxMYvrvpacu1HHTWGw7SLKu5BWodkHc2
	25fLOw7am5gHCS0KbkyZcLs59DDg09ZiikpseWxHNauyiacA4ukgIsxfJIZrfvuNZx+t6byui5j
	FFUy40yyOR8MfCjvQEo8sDLlVu6wIr8zXo8FFWZrMw69MK+QYZsreWbpg6nmDtcgUdGgNaX48jw
	JabSFSFciLU8xJgg+R8YbSac27i/DLkgMi6f0+hq7EHwLU/WIIxo/CYLKCYn3lab6Clat3ys77M
	VxQv3jGbdxQS3J18LUgfKWixlxy939+So8b/biUpmv/79mSqQ5761VgNi+AanvawFFlKd/zI2ur
	WAO/+yp7LY6fyyoq8pgIpRZ68ZTLc3WMFnDKil0ZQplxYvax36AV508yVCLXwPblMVPa83epcK1
	tIDax/UsXyK+6zcy9hJmDJ4LIpb
X-Received: by 2002:a05:6000:981:b0:487:1fa:17f1 with SMTP id ffacd0b85a97d-48701fa190bmr113579f8f.16.1789330323349;
        Sun, 13 Sep 2026 13:12:03 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:16aa:3c0b:49da:7be3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33fd3bsm21613916f8f.19.2026.09.13.13.12.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:12:02 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 03/11] liburcu: upgrade 0.15.6 -> 0.15.7
Date: Sun, 13 Sep 2026 21:11:50 +0100
Message-ID: <20260913201158.687889-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
References: <20260913201158.687889-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 20:12:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245730

2026-09-11 Userspace RCU 0.15.7
	* call-rcu worker: set CPU affinity on first non-empty dequeue
	* Fix: leaky wfcq tests
	* Fix: test_build.c: Test output mismatch
	* Fix: workqueue leaks mutexes on FreeBSD
	* Fix: call-rcu leaks mutexes on FreeBSD
	* call_rcu: pin per-CPU worker at thread startup
	* urcu-pointer: Add rcu_dereference_sym2() taking the pointer address
	* urcu-pointer: Fix missing memory ordering in rcu_dereference_sym()

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../liburcu/{liburcu_0.15.6.bb => liburcu_0.15.7.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/liburcu/{liburcu_0.15.6.bb => liburcu_0.15.7.bb} (91%)

diff --git a/meta/recipes-support/liburcu/liburcu_0.15.6.bb b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
similarity index 91%
rename from meta/recipes-support/liburcu/liburcu_0.15.6.bb
rename to meta/recipes-support/liburcu/liburcu_0.15.7.bb
index 140488eaa3d..0aa51903bea 100644
--- a/meta/recipes-support/liburcu/liburcu_0.15.6.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.15.7.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c2a92498b6e88e276f986877995425b8 \
 
 SRC_URI = "http://lttng.org/files/urcu/userspace-rcu-${PV}.tar.bz2"
 
-SRC_URI[sha256sum] = "850b192096eb11ebf2c70e8f97bc7da7479ee41da1bebeb44e3986908bac414f"
+SRC_URI[sha256sum] = "2556b83adc0f9b3ac8024e613e17d014d04c4c49110604ce55fcb14eae32edd3"
 
 S = "${UNPACKDIR}/userspace-rcu-${PV}"
 inherit autotools multilib_header

