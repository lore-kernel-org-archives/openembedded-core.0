Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A60C433F5
	for <webhook@archiver.kernel.org>; Fri,  4 Mar 2022 15:05:18 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.7915.1646406310097232995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=wQvd7/uc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 15-20020a17090a098f00b001bef0376d5cso8182371pjo.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Mar 2022 07:05:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=HpWW+fO3ujAkPkbxBeH39dkcrn2i5p8JIQ0vlxvXazE=;
        b=wQvd7/ucjABHwYoCjOFAhHMCKxzptWYWYlVMXKV27q3O/YGqIKjwnQp7+Sx7vVj9dz
         no1cH2sKmm+Mb7Tp+q4A2W2+QUr3Ztq0F6yEJIKAfQRCwHWwHVnq1kSugXjJKWUeQQVM
         cFHvWyxdZmB0gPDhTyViHpxohQuvZGmKy+Kja9i34vJ3GKweMm8M9igBqvk6+lmrXth8
         cAAE/RdZuKtTsIHsxGDfwLmN0OeUlyBlAkX6fpdJce06/MNCxJfLOePyHnmUao9ubW1Z
         m01Tgvi/eYkqQVSLg0th0zhR1BQu5o+FHZlTMkqsehnUtUmNLLgeqwxPmCqYt8AQ0+MP
         VtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HpWW+fO3ujAkPkbxBeH39dkcrn2i5p8JIQ0vlxvXazE=;
        b=eAtmHjxaM7E0x+CiR4kUbaLT/08EOQshZ2W4gKZeWcRZtShWkctOvQGfyej4JvNvq/
         NcvMQxqbY97b/9IgsJsg6ta22lDF3DBRolI5/3Dg8KRa/jkvniFL8hX96SxQAeU0k2CS
         5jFOqxlUhC1mAYUdW6/L6JTSc+qbTlElhv9SqvH4lkmLF5kBW1aIlIG5kRLlTUMbeEHd
         Hj1BcJ9668Z3xRAeFI+W9apigtPCtRa1FBLPtx7MjL72H2l9LhhUE90YGEH0Qn+Rbrm/
         HSTBgy23Ev5KNRczL77UaHgjXe/bW/4mrov4Jwc9dT75RJpFzANfOLFtuW2B89xyrZro
         0EOQ==
X-Gm-Message-State: AOAM5305Gio6G2H6LtR+nwZ8Ep1yN/aovmBrfyN3ztvGe7dEsGIKu+Gb
	Q6V4DAKqUzSnIxKedTiYOwHDs08mrqfpaHPvdsM=
X-Google-Smtp-Source: 
 ABdhPJzZaTwXqPJjoKidYimYvNHGoGNJJweyiYGLCRytBhP26Pv3hl4tPkm7Nr2k5wop6ldUQgf03Q==
X-Received: by 2002:a17:90a:d0c4:b0:1bc:b02e:ed75 with SMTP id
 y4-20020a17090ad0c400b001bcb02eed75mr11099632pjw.104.1646406309134;
        Fri, 04 Mar 2022 07:05:09 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f194-20020a6238cb000000b004f6ce898c61sm80400pfa.77.2022.03.04.07.05.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 07:05:08 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/18] Revert "cve-check: add lockfile to task"
Date: Fri,  4 Mar 2022 05:04:19 -1000
Message-Id: 
 <1a30a8513ca47890470ee9d19a5ea36437e664bf.1646406001.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1646406001.git.steve@sakoman.com>
References: <cover.1646406001.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Mar 2022 15:05:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162730

From: Ross Burton <ross@burtonini.com>

Now that all of the functions in cve-check open the database read-only,
we can remove this lockfile.

This means cve-check can run in parallal again, improving runtimes
massively.

This reverts commit d55fbf4779483d2cfd71df78d0f733b599fef739.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e60d149b41d14d177df20dbecaef943696df1586)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/cve-check.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 5369b7074c..75c5b92b96 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -110,7 +110,6 @@ python do_cve_check () {
 }
 
 addtask cve_check before do_build after do_fetch
-do_cve_check[lockfiles] += "${CVE_CHECK_DB_FILE_LOCK}"
 do_cve_check[depends] = "cve-update-db-native:do_fetch"
 do_cve_check[nostamp] = "1"
 
-- 
2.25.1


