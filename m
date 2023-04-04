Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D88FEC76196
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:48 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.web11.92079.1680575981910220147
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=oNvUJ5z+;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.174, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f174.google.com with SMTP id d8so18770344pgm.3
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575981; x=1683167981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ytO7yxZ0jHpYZL/jysFjD/y6usHJrivq/LZ7F8UA8MA=;
        b=oNvUJ5z+hR6jvQW5uDgGRuYVf1W6h0QB76wSNyDMNwicnfcgkLOU/EGR224A7+0394
         K9r4R9tqKLFutE289dF9yeURZiURx3ylnjoCD0kzfE7k7bMFKAwmkbMdIZ77yxBdgOX5
         xY/1oOKQAlAql3pz7KQGPFZAFCvpJ1I1qlH+Z9oLNwyIIhWqj1r47k5yCIgClKkoVyTa
         R7HyuSixajPdCXbs8CTsXS3HLqZEnmaXTHKaA8d1cgNbjjxADj/0gahECg4AlTYnAiXk
         ivKYNCGUirtz1y7jdePll8CaFPacVYnb0HMGb1K9isRsoC2nE2eU4LGkJ92W9IauzWpn
         vX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575981; x=1683167981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytO7yxZ0jHpYZL/jysFjD/y6usHJrivq/LZ7F8UA8MA=;
        b=JD7JMD6UdmrVY66OVvVD3nuLbvGH7yqG5Q0AW3b0Gx8a77rd2Li7gWSwgZyTk6ug0+
         /mSHztR5z6/MxXulQfVEQITEEOGeJOmiFp/bDNpjNOIqoPACFQ/RTnG8opnTcCdIvbcF
         W6kzpK4w7Gb9R5SOaczJ968qKjKNFGGz7GO0+eqSIyk+kgyhAsOYNuEJhkUWuBgTrEvR
         Fe1fy6ioDpVjt6rqEey2zTywJ+bYUshdR0Ajky9kAqBFbwsjMD0JCtw1lEFTRscG2Hy7
         4PtDGgiBEFU/ArfkTT3GbQos2U0ftig7F8wFtUMN3faELP1QLngRZJW4Qd2No3J6OH+e
         MQ5Q==
X-Gm-Message-State: AAQBX9dR3NGWvWNs4HCoQnnjZXEi0FuBimrvSYZGqeHs8V0axsK9Otry
	uG1nq6m+7NbsOmxB2Oydq4mNaByF1qqS+1Kv7Nc=
X-Google-Smtp-Source: AKy350awAFN67oCIH+2Mw/8RsdEDwqiI4pZ0tvnfn9VFdLyoD/HqRCGN5345V+zVnxEnUPIITLVvHw==
X-Received: by 2002:a62:6204:0:b0:625:cb74:9e01 with SMTP id w4-20020a626204000000b00625cb749e01mr564172pfb.25.1680575980868;
        Mon, 03 Apr 2023 19:39:40 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 6/7] vim: upgrade 9.0.1403 -> 9.0.1429
Date: Mon,  3 Apr 2023 16:39:15 -1000
Message-Id: <821229f48f5b31aeb646f08c7e4656dc4ce8b0f4.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680575792.git.steve@sakoman.com>
References: <cover.1680575792.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179665

From: Randy MacLeod <randy.macleod@windriver.com>

Fixes: CVE-2023-1127, CVE-2023-1170, CVE-2023-1175,
       CVE-2023-1264, CVE-2023-1355

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 2415072c3800feb164dd4d1fa0b56bd141a5cbd8)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index 1225005b0c..94eabfa197 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -19,8 +19,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".1403"
-SRCREV = "e764d1b4219e6615a04df1c3a6a5c0210a0a7dac"
+PV .= ".1429"
+SRCREV = "1a08a3e2a584889f19b84a27672134649b73da58"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.34.1


