Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A567EC77B73
	for <webhook@archiver.kernel.org>; Sun, 30 Apr 2023 16:26:22 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.72575.1682871982008271818
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Apr 2023 09:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=rUqBVT1M;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-64115e652eeso22478896b3a.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 09:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682871981; x=1685463981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dUzi/sx64nhcuNkrxgz1rTvmtGOQFUFi5ZlnC+r5hmU=;
        b=rUqBVT1MZZ30SEVGXEusPrMOiWLpQbwb0qy6f/MsUxZQiV5RlcRHVf4F1VKR8K17CW
         WTacIRnetSNkEsCovqOCgrt2nOvwkW0vz22BWVK0LHyl6pynS1DhCstpe/cnL/DBwLpB
         vHNDnN0FmtdKsvpReOHDW3nphK2KtDbqJQhDASQAhANd2FGh+B9qO2UBcIVpRn/kmpS3
         RbegL921evmzoEnoz5tKFja3YbAqwiK5BM5fh69HGqEHwlDbHsbPiB7X6JkCob8uahT2
         MD7+qt5pMrB3DELYaR3y61tZo77S2DBnqGW8wk3WMJB9eQeXS7RcL9QJ5U7WWEw/kN9W
         Nzbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682871981; x=1685463981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUzi/sx64nhcuNkrxgz1rTvmtGOQFUFi5ZlnC+r5hmU=;
        b=UbciWa12OXNtKKIC5cftZLE1zuD/ZvXM2tMQ1wCiqDUYJZw/+6QmJ7DJW1YccEiP7A
         McfwuCIV2Di5f+OFLX8aMomdl7mTTd9R5byPeGa22EmDhUjBO7ev7c9GUCAw6LBk4nOM
         T/aK/buY3NWggAcqrqw05H+npLy4tLl+XHwyhzngk9xFoi430NAl/ESJqqP6VndKjVIz
         di5XxY1cJkHqOhcupIWFhd4DmoMrwSiidzw1jD/7jwziqsP3Fqq6qnrZhtGmicsQQq7W
         GdDyK47+ubUIJuHCA8gPBY2U9XabtYASrrZL1qpWVXzoxgB2yj+zAQNOfPP6NvYUiaT7
         iLTg==
X-Gm-Message-State: AC+VfDwXxeZhv40UzMJvD1GNosVFR19P9DhQxkDvSXBCN6SXh1SidT3p
	+0x9QWZ3QQ2ethdbc4wEannDN/2hb/xi9HqLUuo=
X-Google-Smtp-Source: ACHHUZ7CFMtBofe7kBcLurv60lpG4lLR0jD/zbqQlXJV2kTPKyQf7G6ZZY3nT7p+/bxWv+2qr5dwug==
X-Received: by 2002:a05:6a21:32a2:b0:f0:5d68:e977 with SMTP id yt34-20020a056a2132a200b000f05d68e977mr19705198pzb.9.1682871980722;
        Sun, 30 Apr 2023 09:26:20 -0700 (PDT)
Received: from hexa.lan (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w8-20020a17090abc0800b0024b9e62c1d9sm4443811pjr.41.2023.04.30.09.26.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 09:26:20 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/9] qemu: Whitelist CVE-2023-0664
Date: Sun, 30 Apr 2023 06:25:57 -1000
Message-Id: <8efb0fc7e7db4bad3dbc40d8f890a6c2e7be38fa.1682871869.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682871868.git.steve@sakoman.com>
References: <cover.1682871868.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Apr 2023 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180578

From: Virendra Thakur <virendrak@kpit.com>

This CVE is related to Windows.

Link: https://nvd.nist.gov/vuln/detail/CVE-2023-0664

Signed-off-by: Virendra Thakur <virendrak@kpit.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3b1bd3b656..8d6c4050f7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -157,6 +157,11 @@ CVE_CHECK_WHITELIST += "CVE-2018-18438"
 # the issue introduced in v5.1.0-rc0
 CVE_CHECK_WHITELIST += "CVE-2020-27661"
 
+# As per https://nvd.nist.gov/vuln/detail/CVE-2023-0664
+# https://bugzilla.redhat.com/show_bug.cgi?id=2167423
+# this bug related to windows specific.
+CVE_CHECK_WHITELIST += "CVE-2023-0664"
+
 COMPATIBLE_HOST_mipsarchn32 = "null"
 COMPATIBLE_HOST_mipsarchn64 = "null"
 
-- 
2.34.1


