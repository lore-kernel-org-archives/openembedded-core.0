Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D31C43217
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 17:28:09 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web08.13648.1664904480806659039
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:28:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oAGItWww;
 spf=pass (domain: gmail.com, ip: 209.85.222.169,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id v17so472192qkv.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 10:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=AaMchuC+4eyna+96qXf4W46qjQn+2/Dgd87F95HnRc4=;
        b=oAGItWwwd4jXxGy7BFUVGrAY0EJXXRMT3mtMAuU4+cLaGmTakrTq6b/spRmvYLtExe
         enlsXUmf5HlgHsThldOXwygTOcB7rZ19+pd5JDgghHpDUDPVAI8EjGmFNCubCWR8EMU5
         JnKX8yVRd0Vmy77LnNBnvQyCCrKDN9gqLLEPJNDbEqLrVIhjBpfyExTybxwL126YH0AO
         bRoyMZ8AIIEwyTDu4Zg2/mc9/JfWojHfoSEXgISCPiACjsPAqjN6N2u80WRz3GmTfz7B
         DODnd91Vq/H9EOEs+BnfvSU/xi5BoZnE5DoY3jf5c+OxIqxudUcRdtoLLMWWQcu2XHx2
         99vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AaMchuC+4eyna+96qXf4W46qjQn+2/Dgd87F95HnRc4=;
        b=UKhX+7dzS1vcGDBhRV/By64rXlV/qMHUgP+O+c24ddx6OEleUJrp98lnYPrRGj9JQQ
         WA8YgUN1PmWBWXOg2jgx5LpPFpPv4mDCYkMyV+/BIHiRwGOZTiST/VuEiBrEp95xA1iW
         US1vC788dl5a5nBvZf8HbHWfZr3dRIimNuJGCWbWbDzgdHcGwhKXSkfj8C/Ck40iuflv
         mKR2E+qJ9lf7ktV1nluuvERNOfkMwZMOyBZOxoWMkcfFtbvpYDiAmd5gehoOT+oaK9bX
         J1cN6ql6swZe48mZSIQPCvUneXfBMHihsCVJiZnDFYZMgRKgYTLQMEedro//Y8r5HBbB
         JbgQ==
X-Gm-Message-State: ACrzQf0in0VDwcy/ZFWk3Bgc6sRXNKm6vbOvPav7tNmhlNdtsuPBdhFQ
	WTx6yqrUIKPZPpuMSzlIH412fvni94bzGQ==
X-Google-Smtp-Source: 
 AMsMyM4iSzRHY815EbFJQ5HyXp+T3yAiurwH0yNLkxU+2gGIdBnC/fMMe7ghN2Cri23CiCSVZSdi2w==
X-Received: by 2002:a05:620a:45a1:b0:6e0:3d9a:160b with SMTP id
 bp33-20020a05620a45a100b006e03d9a160bmr1937328qkb.688.1664904479812;
        Tue, 04 Oct 2022 10:27:59 -0700 (PDT)
Received: from build.lan
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 y3-20020ac81283000000b0035a6b89412bsm12037878qti.46.2022.10.04.10.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Oct 2022 10:27:59 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] perf: make scripting depend on setuptools3
Date: Tue,  4 Oct 2022 13:27:54 -0400
Message-Id: 
 <ce66ad3692d01831e5f41f27702c01744a8708c5.1664904217.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1664904217.git.bruce.ashfield@gmail.com>
References: <cover.1664904217.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 17:28:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171429

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It looks like this should have been an error for a while, but it
only started showing up in my 6.x linux-yocto-dev testing.

Without the inherit of setuptool3, we get a module missing error
during configure and the build obviously fails.

Tested against 5.x and 6.x kernels.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 31bc04635d..2591171eca 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
 inherit linux-kernel-base kernel-arch manpages
 
 # needed for building the tools/perf Python bindings
-inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig', '', d)}
+inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3targetconfig setuptools3', '', d)}
 inherit python3-dir
 export PYTHON_SITEPACKAGES_DIR
 
-- 
2.19.1


