Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A88B0C6FD18
	for <webhook@archiver.kernel.org>; Sat, 22 Apr 2023 15:58:19 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web11.10376.1682179098180738074
 for <openembedded-core@lists.openembedded.org>;
 Sat, 22 Apr 2023 08:58:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=c7f4NmWn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-63d4595d60fso19807299b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 08:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1682179097; x=1684771097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KwvygMQtYojz70XEy46RD+T1l5cgJUMV4jSsIs/IXMY=;
        b=c7f4NmWnVuFQOYVoUmbjKwT6U4E2VnhzfYu8P4NgVIpwh9odqKpKH4B/YPFvAlVtZ7
         qmrsZBkeZtF4HL+FkOUTAAPxOubImHxDwdiYMLdRgWj+szfy6E95jFnZaL97V8j43c9x
         rM236BSYf+fJP3NaZ0bo0WXX04dFIyC8etW/irOBeGDXXWF0wkHLrhJOCTZotFwJyuCA
         m2HrT+W5S3lBNkVNr5QTiQKDus5Fpn5rN6nQKmbokrxhhX+s4qfat3tsve8SPZO6y3hn
         uMWQgQSzVj1bj6+C4XAuOvEpaIQssrXjFsYAI77I0h7B9qVoX4cTj1GitCbEy93TG4Qv
         bSzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682179097; x=1684771097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KwvygMQtYojz70XEy46RD+T1l5cgJUMV4jSsIs/IXMY=;
        b=NME8TCAQRAvstEEP/DVgKJKyq7KrzKoCyYNdUG7CU7clH1NTvx3PhxAp45LD50c7cC
         EvlIb2RCvt4Iw4T6B2eOGlwl5c70KVI/Ns0TA2tizPP63sxQUHrn+s3EdIam8E8EQ9aQ
         h5w0FO/2y/f/jQRRurrUOmESX5451NE7/wIWCcyHJoDrABTRb85t5L4v/4WXII+G1fiI
         hFgRu+97Iv68CG2yANIWw/n9mBNloSS0ylx2iFEl3IBRd5RLEH2jMl2aslxEuh87kZov
         cZAFxK43fI/X1wotBXS9en6swrQXR46Jb071mWmhkh76iIVnrt7qX1EI7W6YEHn4x9Mo
         gZJg==
X-Gm-Message-State: AAQBX9dPJJ1N6aPNuHAWHbdiT5pieqJ1RVOlW0EnZNgH47XdtWJzB706
	ws+72kO416Dir33+U6a0acjdkpAmeCyVCD3/5VE=
X-Google-Smtp-Source: AKy350aQiJCKg7HHjqjAZoOAobcpcKeGpuda6D3T7y3iRNgV6rvDH7hDXa1jP7WIHyDoU21frtbi7A==
X-Received: by 2002:a17:902:d4d1:b0:1a1:e308:a82e with SMTP id o17-20020a170902d4d100b001a1e308a82emr11109288plg.12.1682179097237;
        Sat, 22 Apr 2023 08:58:17 -0700 (PDT)
Received: from hexa.lan (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id t13-20020a1709028c8d00b001a4fe00a8d4sm4189412plo.90.2023.04.22.08.58.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Apr 2023 08:58:16 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] go: ignore CVE-2022-41716
Date: Sat, 22 Apr 2023 05:58:01 -1000
Message-Id: <4263f3fda59aacb4f159d2dffb52e5f66249b5e4.1682178944.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682178944.git.steve@sakoman.com>
References: <cover.1682178944.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 22 Apr 2023 15:58:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180315

From: Peter Marko <peter.marko@siemens.com>

This CVE is specific to Microsoft Windows, ignore it.

Patch fixing it (https://go-review.googlesource.com/c/go/+/446916)
also adds a redundant check to generic os/exec which
could be backported but it should not be necessary as
backport always takes a small risk to break old code.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/go/go-1.14.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 74017f4d90..8df9d62612 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -82,3 +82,6 @@ CVE_CHECK_WHITELIST += "CVE-2021-41772"
 
 # Fixes code that was added in go1.16, does not exist in 1.14
 CVE_CHECK_WHITELIST += "CVE-2022-30630"
+
+# This is specific to Microsoft Windows
+CVE_CHECK_WHITELIST += "CVE-2022-41716"
-- 
2.34.1


