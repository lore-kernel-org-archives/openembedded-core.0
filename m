Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59647C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 02:31:47 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web08.2154.1654137103030425986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=yodj5UqJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id j7so3673303pjn.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 19:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=8I9Bm9xGFY7HJYcAhs3pP9V49RHQJ6NNXyuz9Kd8+GI=;
        b=yodj5UqJPhTmH1nhR97mOXT1JCCFGLTIf9uFeSEMMgm032m5RjN/Ia2h+cl2L15ATF
         mA6DWmE42elTW23dT1+6WJQvVYH3gSTh73Jjx3Zzvy1i5mvbrkZhVtd/AMUphuWNuyku
         O/6rgqUhu5ltjozkFM6weh/dKJcO3YNKRxIxe8f1Ks1NdiopXIwCnS6/jBk6okSy2ayp
         vO5xmSymepXBjuuJRaQL7ujCqvjCq98S8/boQ4hLdEOnOD+XJgJITTO8dReWDObfKbMd
         C6KCXVsdcgXSqUy1aMT/qsdWld6oLWKxYuEU475ym9FG1k+KB+t6/jZMDCt9qCdHVZat
         1NYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8I9Bm9xGFY7HJYcAhs3pP9V49RHQJ6NNXyuz9Kd8+GI=;
        b=Q7pSnf+8Oj8UwTNm+1qPrVjie8nxpNcY1HP1RNx/oLh51Wv5/u6uGGnwWmtCoYB1gk
         EqaPjafLpHhQb4V2BWQkziZ8jmY4GnvF13K4b6ErrdfQtsyt3BAE1zs8Oy30+d8xawPp
         yV3JjOZThfQflK2unKjDpHw585iWNhw7sIpKyfJBXMXng2aIpNgZWzwWE5Kyp0feA4sv
         QQa7dkFXgYm4Flw+Uu/IxM1d+SkTvsMVEqe0OXHxfrUiEaytbMt1inb1MaBwPs8b6LmS
         F7I/B6Bxj+qwZyCZvX89IM4GlGY3jpeLaM5XYVNP7WP26xlqiWvaxs2BiyX9xoVxC6iX
         AywA==
X-Gm-Message-State: AOAM532UzNsTZF+EtWUakPIVJZRSDL7B7WIaBFHTZH1Dl4YC1TQGP9+B
	/GOrRD9am1HwrC3RCaeJ5k2SaanVLuae6Ri6
X-Google-Smtp-Source: 
 ABdhPJzRgemRaJMkMI0Bu2Suf7FGS7gIMndSllgmgS7eMgLZedukIhf7xSmjVxMD3BZulfDWs+AaYA==
X-Received: by 2002:a17:90b:1192:b0:1e2:da25:4095 with SMTP id
 gk18-20020a17090b119200b001e2da254095mr22815831pjb.240.1654137101956;
        Wed, 01 Jun 2022 19:31:41 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 j23-20020a63ec17000000b003fc37053c82sm1990447pgh.12.2022.06.01.19.31.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 19:31:41 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/11] cve-check: Allow warnings to be disabled
Date: Wed,  1 Jun 2022 16:30:51 -1000
Message-Id: 
 <d009233f36fb866f6bdaa12fb6deedf5e253e9c9.1654136888.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654136888.git.steve@sakoman.com>
References: <cover.1654136888.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jun 2022 02:31:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166459

From: Richard Purdie <richard.purdie@linuxfoundation.org>

When running CVE checks in CI we're usually not interested in warnings on the
console for any CVEs present. Add a configuration option CVE_CHECK_SHOW_WARNINGS
to allow this to be disabled (it is left enabled by default).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1054d3366ba528f2ad52585cf951e508958c5c68)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
(cherry picked from commit 8fd6a9f521ea6b1e10c80fe33968943db30991ba)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 29b276e491..0111ec6ba8 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -48,6 +48,7 @@ CVE_CHECK_COPY_FILES ??= "1"
 CVE_CHECK_CREATE_MANIFEST ??= "1"
 
 CVE_CHECK_REPORT_PATCHED ??= "1"
+CVE_CHECK_SHOW_WARNINGS ??= "1"
 
 # Provide text output
 CVE_CHECK_FORMAT_TEXT ??= "1"
@@ -472,7 +473,7 @@ def cve_write_data_text(d, patched, unpatched, whitelisted, cve_data):
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
-    if unpatched_cves:
+    if unpatched_cves and d.getVar("CVE_CHECK_SHOW_WARNINGS") == "1":
         bb.warn("Found unpatched CVE (%s), for more information check %s" % (" ".join(unpatched_cves),cve_file))
 
     if write_string:
-- 
2.25.1


