Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B023C7EE23
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 22:33:15 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.3069.1683671594268274779
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 May 2023 15:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=ZjQuz05R;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-643ac91c51fso3713340b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 15:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683671593; x=1686263593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ejfJhB5UAiMkmWtC3VZ7peMDb6dCdHWxMK3LojUTNAM=;
        b=ZjQuz05RZDOfFyickzWFc2Hot2kolP+qrzHmQYi7S9h/1Zr3X8aJ6Ts3Kq1B972iFM
         d33wm0NdPq9sUSfAZXDxoEu+Tyk7zbgd7t17Yi/3jCqzMNWyGTYdC1xmaDj8xxDdb/++
         CX/sQobN6s38atJ10mGNm438dkk1CL4esLO4pD7Tv9BFAV3cX+4EiJtndTox2PVurwJv
         XGBfYlcDQvr4xHX2bCerKI8OmojItwc6emaT4onQfjnalZRgCDZxPLXF9FaaCrMwqO1n
         lSVcJkMXQVnitFxVGqRreQIPDYjIQ2F2ENNDkduIlGllZfRPj4URGIKFcS0qZvaStawN
         N/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683671593; x=1686263593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejfJhB5UAiMkmWtC3VZ7peMDb6dCdHWxMK3LojUTNAM=;
        b=Cc0AfSuLFSwFoqSyCrMFFRqQMkheCU2aEzcBRVlv1me+hV163IGtX3tVNpyQsMcTzw
         puS2OZ2BJXV7QDonbAV2gE15P+1G2XG558e/cC1nFnl36CpAHDN6o5HSMYlCs6+ynp2w
         nWvx59vvU5pnUTJUqRQvVX9Bu8IKWgq2YPCQkQo1NZzebR8y4M1K7HY+FR2yC5v6lPJK
         KkaryDK6IktaAMVcCkUMGXJc5xkwHcadCbabsFJiYcls8xPJvgl4ymw0v4IwTCQLrFT+
         jBF2M8SSk/G7kfl4IAwdKyfeaF/Zk3n5I1B7raP6Y/NMbcfOvpDEuvRjeowShZyeDuU+
         WW9A==
X-Gm-Message-State: AC+VfDye9R5JuRFvrbOmHGmq/21q9n23U2PrJFyD5JWjbNSEOCcf2LXk
	j0/O7jRTZEZR+mNupY+hM78Cq5ed0ReqYRNNG44=
X-Google-Smtp-Source: ACHHUZ5IvHz2U6vbYrepzP+N2up+jYYVAwPhsZHhlfpEPuyZ0NtYTbVaG/m8u68IsoeivpJnDIeGyg==
X-Received: by 2002:a05:6a00:17a5:b0:63b:1708:10aa with SMTP id s37-20020a056a0017a500b0063b170810aamr23060125pfg.34.1683671593383;
        Tue, 09 May 2023 15:33:13 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u17-20020aa78491000000b0063d2dae6247sm2263125pfn.77.2023.05.09.15.33.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 15:33:13 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/15] update-alternatives.bbclass: fix old override syntax
Date: Tue,  9 May 2023 12:32:41 -1000
Message-Id: <5697ec9ebd8a94f9ec3d370fcfead332dcbe5afc.1683671424.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683671423.git.steve@sakoman.com>
References: <cover.1683671423.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 May 2023 22:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181100

From: Peter Bergin <peter.bergin@windriver.com>

Function 'gen_updatealternativesvardeps' still used old override
syntax when fetching variable flags. Update to use ':' instead to match
recipe meta data. This was found by review and no real issue encountered
but it is a bug that affects variable dependencies and can affect rebuilds
as task hashes might not be accurate.

Signed-off-by: Peter Bergin <peter.bergin@windriver.com>
Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5691f554b2cd50f256a8cbb1d96781e9eb6b930e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 7581a70439..2804299fc4 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -80,10 +80,10 @@ def gen_updatealternativesvardeps(d):
 
     for p in pkgs:
         for v in vars:
-            for flag in sorted((d.getVarFlags("%s_%s" % (v,p)) or {}).keys()):
+            for flag in sorted((d.getVarFlags("%s:%s" % (v,p)) or {}).keys()):
                 if flag == "doc" or flag == "vardeps" or flag == "vardepsexp":
                     continue
-                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s_%s' % (v,p), flag, False)))
+                d.appendVar('%s_VARDEPS_%s' % (v,p), ' %s:%s' % (flag, d.getVarFlag('%s:%s' % (v,p), flag, False)))
 
 def ua_extend_depends(d):
     if not 'virtual/update-alternatives' in d.getVar('PROVIDES'):
-- 
2.34.1


