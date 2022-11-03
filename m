Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D240C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Nov 2022 12:41:32 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.18780.1667479288369931525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Nov 2022 05:41:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=F6/Z5oSA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id h9so2644167wrt.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 05:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssmygaRpEhNOCpCCngjnhBJQ8NAX7ukR5XY3WI6Cwrw=;
        b=F6/Z5oSAWdSdJQy0HAj8+oE6mYPGSLZPfwOf3dZxDvpnq4I+9XMpRGdNKX1QgdPOf7
         VHEG6Z5vHkI+mgc7n1V3baTFcJO80iHFZVRwSJ/2Ay186mhKsKO1E2IdV3kt6FK6oPJX
         n3xnmiea3gULZIClrIT6lydBpp/yVj7lBD/8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ssmygaRpEhNOCpCCngjnhBJQ8NAX7ukR5XY3WI6Cwrw=;
        b=1ia2sGnmpdp3gByQ64RHmugMj4FxOEazLyMsvCmRz1bWHUi2iGSDlmaQnDi7VIL6vn
         8dZPME3Y7OnySvfgUX7p+7RKbQ3piT+J0jnpdfGV00xl5Rc0+vNQVe3fX0Ivmu8jrkE0
         8FKcYrazWtjbfuRqUwL3UCuFyB7yygmjyrm/JS/bbZnz/n2aZcZz/OFONzLkTju4UhiQ
         qM1qHaIfOoO8QKhPjmUxrzHy9KoU073mUL+NivnOfWRhugslbvyuVYlPJkF71mrDQWig
         qZ/De01F4kRFKA2lYYZimjI/GepjgTSXGlGtW1cu9myvlRUvDyQvSv4H8Yh2gQP7WNTs
         cjNA==
X-Gm-Message-State: ACrzQf2lqAxr12FdSOL1I6kU/ciwHoF9dotThmUoxizCVGBe+hgpgXn7
	LRpcsORhgPXXAQwCKwbuYM2MJZcM1gfixw==
X-Google-Smtp-Source: AMsMyM7P2pLDuolSoYaXf0vaxO4x4eQ6hvbkI3nW3ZcSKRVTGE96UvXIRmXZRCr9ORAyBiT8PkAtLw==
X-Received: by 2002:a5d:524d:0:b0:236:6086:af4b with SMTP id k13-20020a5d524d000000b002366086af4bmr18476828wrc.164.1667479286314;
        Thu, 03 Nov 2022 05:41:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:fec4:d12e:21c:2d17])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b003c6f8d30e40sm5661651wmq.31.2022.11.03.05.41.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:41:25 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] gcc-source: Drop gengtype manipulation
Date: Thu,  3 Nov 2022 12:41:23 +0000
Message-Id: <20221103124123.842602-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221103124123.842602-1-richard.purdie@linuxfoundation.org>
References: <20221103124123.842602-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Nov 2022 12:41:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172627

Whilst we patch gengtype.cc, we don't patch gengtype-lex.cc which would
be the file which would trigger regeneration of files.

The real bug that was likely the cause for this fix is probably SDE issues
with gcc shared workdir so this code can now be dropped.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/gcc/gcc-source.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-source.inc b/meta/recipes-devtools/gcc/gcc-source.inc
index 03837f43811..bf33a4b31ff 100644
--- a/meta/recipes-devtools/gcc/gcc-source.inc
+++ b/meta/recipes-devtools/gcc/gcc-source.inc
@@ -25,8 +25,6 @@ python do_preconfigure () {
     import subprocess
     cmd = d.expand('cd ${S} && PATH=${PATH} gnu-configize')
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
-    # See 0044-gengtypes.patch, we need to regenerate this file
-    bb.utils.remove(d.expand("${S}/gcc/gengtype-lex.cc"))
     cmd = d.expand("sed -i 's/BUILD_INFO=info/BUILD_INFO=/' ${S}/gcc/configure")
     subprocess.check_output(cmd, stderr=subprocess.STDOUT, shell=True)
 
-- 
2.34.1


