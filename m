Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184C7C77B61
	for <webhook@archiver.kernel.org>; Wed, 22 Mar 2023 14:22:14 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web11.44016.1679494927340982201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Mar 2023 07:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=BIyWSHk4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id p13-20020a17090a284d00b0023d2e945aebso1403136pjf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679494926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/01RA1TdHULJvLny8cqnehIxgdl3uZdgh1fPJ70Rdzc=;
        b=BIyWSHk4GCqrGwaPqTPjOBzfXFx0JAszsjxeleOKQgxYUiz6XlTa5YDnZTnmccWew2
         fzjmWlk77Z3k0mVHJHWYPDq1fTKhFf819HyAmqa/AHE/HdD/VnUX4iWT4PwOTXxl42r3
         EWSG7XmVc/TUiuwWoghTjjFFV52IeRCcqzcUjYQ7EP1sP0MSfXcxtVH92W/4aFYwtPvp
         pFlcItuLe/CQwYe66/DuvdT05lIT3ri3/jW1vkXLH3BzcQdd+EH54tzWeNqnPjls2JYG
         /ukB4EH8rmex4jUalnRHZ426rqMiTSX2af2QM11wSiKBrJ6T4UAS8EsBLLm9bHrZY3EC
         sX2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679494926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/01RA1TdHULJvLny8cqnehIxgdl3uZdgh1fPJ70Rdzc=;
        b=37QdRJ4ts2gbqhcFyHLesnEn51xwONrJKaIu+o9kecYchzvreJy2GVWlrcVR7jBIkX
         NNoXx9wuuHmvfriWJ+y9+MAD0ZnJVDfa1w1DOQHq9kHcVbfVUQzcZKjNyjCKwMxqL9EQ
         VMDLR6sHvuIf6Qxc1nM2xbQglmdoLWMHWs27l7arPMWvM7TGk/KuunVdMr+jLHNV6TEe
         u88s+AKvW1qV/pP3ncIUNkLJwbXJtWFBJq/bsnzHxRgZQ6hSZH+DRtp1Lq0CIaZKHqHm
         0rGISY5M442xN/Q7QnPrQiDHcpHI0hYrC6QwczSeIi6qpVnrEc3CX5ryKCS33O3hx7Ln
         lUmg==
X-Gm-Message-State: AO0yUKXh72jdfGkRToxXlOu/DWQwZMH5PjxJSKq1dSFtNezRR3ycj32o
	LZIjLpUr/u2VSaBLKGEGXS/pt6dQUiNEXWYlti4=
X-Google-Smtp-Source: AK7set8Ivk0d+vW0V+CMfk+xTcFlyMXKRm2GB67J2HqPUFngM3RsaBFHpmsIu5AQpCcaFSQ/RpdGlQ==
X-Received: by 2002:a05:6a20:6714:b0:d9:dd69:47e3 with SMTP id q20-20020a056a20671400b000d9dd6947e3mr5330054pzh.23.1679494926468;
        Wed, 22 Mar 2023 07:22:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id e25-20020a62aa19000000b00627ed3e9c10sm6893524pff.137.2023.03.22.07.22.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 07:22:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/21] lib/resulttool: fix typo breaking resulttool log --ptest
Date: Wed, 22 Mar 2023 04:21:29 -1000
Message-Id: <dc5097e6692ff123a48d9af749f4e66b58056b04.1679494378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679494378.git.steve@sakoman.com>
References: <cover.1679494378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Mar 2023 14:22:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178935

From: Ross Burton <ross.burton@arm.com>

ptestresult_get_log() looked for a key called 'ptestresuls.sections',
which should be 'ptestresult.sections'

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7c8c9f7283e54bf8b1521fbaad7dceb66a8fcdbb)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/resulttool/resultutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/resulttool/resultutils.py b/scripts/lib/resulttool/resultutils.py
index 8917022d36..7666331ba2 100644
--- a/scripts/lib/resulttool/resultutils.py
+++ b/scripts/lib/resulttool/resultutils.py
@@ -142,7 +142,7 @@ def generic_get_log(sectionname, results, section):
     return decode_log(ptest['log'])
 
 def ptestresult_get_log(results, section):
-    return generic_get_log('ptestresuls.sections', results, section)
+    return generic_get_log('ptestresult.sections', results, section)
 
 def generic_get_rawlogs(sectname, results):
     if sectname not in results:
-- 
2.34.1


