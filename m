Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7713C52CDC
	for <webhook@archiver.kernel.org>; Mon, 29 Jul 2024 13:13:47 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.55965.1722258823025839111
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 06:13:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hn9NsDCw;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so1976366a91.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 06:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1722258822; x=1722863622; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2l52NfHHjYHuRR6c/ozMj9QriAdMovt/xDOlEnGyWpA=;
        b=hn9NsDCwZW5S2eu6y5RY6BDzEUq4CcI8G9kG2JHlz72bGnMZ4YfDONPTSzc+x9r2kJ
         eM0agr93tklIWJBSTsSWljNQNhxNvqS70RDlJ7K2d2rmhhN4NcmDlOXLQpz+LKLKifNX
         sLepN3HU0KvJwpscCj5xOZJ5GQqt/nOva1bNRSoI0MBHATnD/IPw8TILnAmvvP8tr3iV
         ZgvcP7lDfr/zNDL3EZsHGnGsoGzWzP0/eAbKFqgXR9TW2cfyUqMyw78B3G/rkawZu2LN
         eQbeKMcIAt2G9iWTAi3MqVA93zp+j4ZcHG1D6GBiAN2I4wZtJBNmtB12H+iGWYR7I7iu
         l1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722258822; x=1722863622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2l52NfHHjYHuRR6c/ozMj9QriAdMovt/xDOlEnGyWpA=;
        b=KTogXXbwgQ7eQfIoPhBnEKELEC6AEXxOP39dXGTX0MY7yHXo9/uvWCDFTnolJx0jdL
         vmyiDug3UzPtMM97keFpqsijc5lDD30sf8ndV2+dAG2g1WXblqTXZN88R17hEMVYRjCk
         DA7SP0DQQIXDzNF9kE+PQG894c+aG1gruVjRFYEVqWTvaJuzo9p5qZLIgF5rHXpXrTBJ
         TOLM+T8Bk6vxet9SL27pwHEnp8Wil1IT+9ztSd6GBkpdFYy+i91assJkZsXpM9oAcR2g
         goF5eNRK9PBSPKQU3bk25Gn7ibsRANUcWndvnDMDJfTjPlKMf5JyoiYF3eSSbV/8MZ99
         0amg==
X-Gm-Message-State: AOJu0YzbeovjvuQ7p8DI0zQp6LYDTCp+WWWnSCpMf099BfBOP6jqWlvn
	6O9sZdhfmTO+jjD84+3yLALiFZ2KwMJcw+g5Wx3HvfP0ANUJLW0CdOYbiT3VsFYijcNMb9vShXj
	C+l8PyQ==
X-Google-Smtp-Source: AGHT+IEmjMHilcOc1nzf9AIH6LZ/ar/1etQ4Sd8T/w+nNHLNN45KGzvAp7s+lHRl5/o8WvAuxzq5zg==
X-Received: by 2002:a17:90a:c281:b0:2cd:55be:785a with SMTP id 98e67ed59e1d1-2cf7e1a102cmr5670077a91.1.1722258822288;
        Mon, 29 Jul 2024 06:13:42 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cdb73b32cbsm10493788a91.17.2024.07.29.06.13.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 06:13:42 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 33/37] python3-attrs: drop python3-ctypes from RDEPENDS
Date: Mon, 29 Jul 2024 06:12:43 -0700
Message-Id: <48c43d2ff467c067d1518dc55d8d6da39bea159a.1722258106.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1722258106.git.steve@sakoman.com>
References: <cover.1722258106.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jul 2024 13:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202647

From: Guðni Már Gilbert <gudni.m.g@gmail.com>

python3-ctypes was dropped as a dependency in v19.2.0

Signed-off-by: Guðni Már Gilbert <gudni.m.g@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8d06116caf2382ad4782b9b2da50534d076a736d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/python/python3-attrs_23.2.0.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
index a638097988..e39b64306c 100644
--- a/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_23.2.0.bb
@@ -20,7 +20,6 @@ DEPENDS += " \
 
 RDEPENDS:${PN}+= " \
     python3-compression \
-    python3-ctypes \
     python3-crypt \
 "
 
-- 
2.34.1


