Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945CBC3DA41
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 15:30:39 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web11.61422.1688484632057194575
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 08:30:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=msUdfCSk;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1b8033987baso34788735ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 08:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688484631; x=1691076631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ZEskjxZEWz+9NjJT891NltNwB4YYMSpK/s/QQrCIQs=;
        b=msUdfCSkqzHvWLKzFnQM0y/M8ot8Q8vPqYxJHAJeVloTK9KNDikUAQUeTjT3R4c0v7
         31qSsaTY3sfISypX4QChj42kOPtnk8aMSTu9VIRsGL71Uj/6eBEuE2KoHGn3SYPZGVUJ
         OFdST2ale4gvkeOx8beg5CERI8cwisNPFU1HZ3tlYuXrY94fW5MC7sJ8VRabHfOuYX0g
         CF4PL6+qJQC+psHfuXNWV2BuMzMfQop/HZA/hDFUlp2kNBUlW2k+9kLEj1TnwZAcxXlf
         X/XQDnBvP0vC8imDCjbszELBI07mKjcvFlMsnTCuuBdMbMN9C/Vt/vo0/61RMWE87GSZ
         Gc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688484631; x=1691076631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZEskjxZEWz+9NjJT891NltNwB4YYMSpK/s/QQrCIQs=;
        b=MkU02h0fkmYQHZTBJQeM+RksjPyYFGUlwee6D8Aa5qLr7jDhZoRvSrZjOD5ntq8Ci+
         K2r7Q1AeO5zi2zob1CsmygtI5MFSiV8euaMyMIzeKa523rkcJdm8ykc5hsk8mc2u7Y7C
         oLu7l9ajZT/R0kPPV2dDxdgV8hcDhOIBL4MvypGVTdKiNbVm26CNZFtCJrFhJKa5/FGU
         fGY4H77wFDWdy7G2uwTx/32cpwkRKr96gN0oyjAyybFB+Ho62ESkb+N73iHyK2MfpkbM
         P+jUJwBFEhj+ssa6hE1ePJxC73F4JfMp/7zHyNh1rDqOYovOkvBFPCz4q9ytukBo4FrF
         8zDA==
X-Gm-Message-State: AC+VfDzSdWXYqVFGVK7cz/zwnZNd+95dObNU1PJEi53Ur2ChvOIp3cvw
	hYLLkldju/vLYwZ2OPAjT0KHSM8x/Jp1akkEcgYoAQ==
X-Google-Smtp-Source: ACHHUZ7+r3I4pDsKeo4aiZtL4DFY44GSOrGLn1rgg46Tc61Ip0uED+Rmx0ac32nE7I8pv39frNXI6g==
X-Received: by 2002:a17:902:e748:b0:1b6:6b03:10e7 with SMTP id p8-20020a170902e74800b001b66b0310e7mr27839639plf.5.1688484631213;
        Tue, 04 Jul 2023 08:30:31 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id y22-20020a1709029b9600b001ac40488620sm17332041plp.92.2023.07.04.08.30.30
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jul 2023 08:30:30 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 26/30] ptest-runner: Pull in sync fix to improve log warnings
Date: Tue,  4 Jul 2023 05:29:28 -1000
Message-Id: <0c484c5aa054f4a8f7794bba18b1d0d168dbb941.1688484463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1688484463.git.steve@sakoman.com>
References: <cover.1688484463.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 15:30:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183861

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Pulls in:

    utils: Ensure buffers are flushed after child exits

    We currently wait for the child to exit but we don't flush the buffers.
    This can mean the output ends up out of sync and the END: line isn't at
    the end of the logs.

    We've recently seen a lot of issues related to this on the autobuilder.
    Add in a flush call for all fds to ensure buffers are in sync. This
    does appear to improve warnings on the autobuilder now we started detecting
    the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit f051de5d5da7e9a2f4137013e24589b594ff6d35)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index ff5629c6f9..67dd887c24 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
+SRCREV = "ea2a9cc159ad5f64ee75781d55101d7c340e0303"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2;branch=master;protocol=https \
-- 
2.34.1


