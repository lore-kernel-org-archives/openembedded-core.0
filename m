Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE60CC4167D
	for <webhook@archiver.kernel.org>; Wed,  2 Nov 2022 02:42:51 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.2026.1667356965085316886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Nov 2022 19:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=tMHj43iV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id o7so11760705pjj.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Nov 2022 19:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YbVhGprp3khcAl8xOfjZy6Nq/4dGS+7fASFCF1ggR0Y=;
        b=tMHj43iVyVfgh5EHHzjqe8Z3iXxn78KCLhPzAE4HVfzxNYSdyQi4Sm+d8FKJNwCV/7
         FnxGb/AuzUylYdC+d0ayy5Wv8wnWI0fWlgUuUIzZbKBfVmwkf9nJyZyy2vVYf60Vgmni
         YCSlvglMXXJJzb21+FEmEpCJY6n/OXufepm63oVVYlG/p5TWbeuuk5Ae34WE7DZwhWyO
         6DounOtC8eLHuMtv+xEjDyH1i6CdMr/jQiecJGkO5OFv4gCzvK5rgZsWlO6dD3XMh2so
         W36cK+xWJEZ643v1WVFb+gW4Hpyzyj+fvtXCKwwUnrnk1cWVlQFIlO7Nw5hMcO1kVVoN
         cLIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YbVhGprp3khcAl8xOfjZy6Nq/4dGS+7fASFCF1ggR0Y=;
        b=PZnFL8HfUgGZTIkKp487Dw/XNqaeI08xzU93UWjSGaYEaFK3uBLVB6sA2/3QePIMtG
         R7ZhxpU/phAVGgyXUJUR1BtZ9ajB61jTJSl2Usy+7iDhoi/ClzzN2GizMhhc6mAI7ees
         9vctlhyk7kOuo9HulVX/Std60V7kDiZFTO6Z0uSrk9RLfIcJ07a8mSZTvQVuXI1JIQvX
         Hh49tah4409SA+IFTzafQ5lIcaWJxjlAW/r3jgJSXTYRMsO/35LDFXItbGbH0tUVq+CZ
         Ky0W0LoqoXO4hMjwdEINvHodgPJNUPxGBOZqbQ/NXk+JN2xSZjIpP0xYkEmAxgpM+bc+
         b6MQ==
X-Gm-Message-State: ACrzQf2XsaQ8CBjU/coXWGAjlIFCIUDcwikW+s5mmj17Mx1SzZ8k+B+o
	Ml4hcJJR0IBkqAF4JJQIbfNjzVnxy2oSQGPN
X-Google-Smtp-Source: AMsMyM4kqaxTJ3s4Ut9T23FAG1yaG4Egfhx/h28QBjAi8CJ6DXz1eYeQDVI8iOQbe+h0Lans5wUXFA==
X-Received: by 2002:a17:90b:384a:b0:213:2907:a528 with SMTP id nl10-20020a17090b384a00b002132907a528mr22863445pjb.183.1667356964198;
        Tue, 01 Nov 2022 19:42:44 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id d18-20020a170902e15200b00186da904da0sm1462846pla.154.2022.11.01.19.42.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 19:42:43 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 10/20] vim: Upgrade 9.0.0598 -> 9.0.0614
Date: Tue,  1 Nov 2022 16:42:00 -1000
Message-Id: <9067e3a24bc5558af6a41f2c5e6f16c37116e3ed.1667356805.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1667356805.git.steve@sakoman.com>
References: <cover.1667356805.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Nov 2022 02:42:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172550

From: Teoh Jay Shen <jay.shen.teoh@intel.com>

Include fixes for CVE-2022-3352.

Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
(cherry picked from commit 8aa707f80ae1cfe89d5e20ec1f1632a65149aed4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/vim/vim.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
index cbc370100b..0710f6afbf 100644
--- a/meta/recipes-support/vim/vim.inc
+++ b/meta/recipes-support/vim/vim.inc
@@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
            file://no-path-adjust.patch \
            "
 
-PV .= ".0598"
-SRCREV = "8279af514ca7e5fd3c31cf13b0864163d1a0bfeb"
+PV .= ".0614"
+SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
 
 # Remove when 8.3 is out
 UPSTREAM_VERSION_UNKNOWN = "1"
-- 
2.25.1


