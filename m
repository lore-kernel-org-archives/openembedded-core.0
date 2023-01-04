Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3816CC54EBD
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 11:06:42 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.9374.1672830397768050219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jan 2023 03:06:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZuW8tERz;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id bk16so19362393wrb.11
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 03:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SMdMPs/FhsJmd2g+Ve7LLOzes4121E2PPScTTvLthtc=;
        b=ZuW8tERzpjyo2tBP4noVxbbxdQZQHYbvKQ/JK4XlPxpUQ5L0JcZD5XzJfURAbWXdVx
         k696LqL+clEVnUwBlWDPK+XCJ4fJl795lwk7nUU+P3E2L5WsyEJ2xFVsqO+N6IJbfh5B
         45WpCQGGGYfvhZ4eV1Mpy/rbyr6qGFka8PzFuw2R82DXOyeMNp6AWl5hU+5GU6w4wxlC
         fO+Ew53tIXaEJdthP0SRT2aU5DpOG5AWBWxsUEPwe0cM+bZabdYa+f5tptJ4mR6MdI4z
         FG4vuP/GnKr8cFuTaDE+taaL0+UggIL3wycqrVW3aaiMcldEB7CmL4punPPH6kEAnsU1
         6owg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMdMPs/FhsJmd2g+Ve7LLOzes4121E2PPScTTvLthtc=;
        b=0ZqT55Y08mQrP79ZFUWbgbQssZWpUOH0Cet36wPPyEdbVVek8WoDUM/ooIczZrkBmS
         5Dz2K5GCRbSWNo13UeAPVHU2+vNMgpfFhGHf5SGjB4zOSGWHVDCc/uhwnYnqcrHw4emZ
         IMdsg+hGn1kVxaT5PY0DX9iA3TthyUv6vuUwSSFA2sbQNTTMuAPzt481wAk6DLpC+6TW
         plohnbuVWg+nUVdpDD+8m0uSXYZA3txjGQSFt4hSmPseIVls6spccckEOdOSSoF9UFvN
         xMs7JNbmnF+pbnexX9leKweNEudx1ZN+T+LYREj+Y0YgpincOUY96LRPOiSkDEew/Bpu
         BqKA==
X-Gm-Message-State: AFqh2kqGgK4aQ8A5qQaJr9pAUA2RHa0Zsr297yZWF/WRY/DGCXpQvksi
	vumsh4CX9HkBt4WbU/0l/UJRAx0Cnys=
X-Google-Smtp-Source: AMrXdXv3/zOhWhGx5IqA8LxVuXvvE+5bROZS4PQoQx3VGCsowYkUdivcSO8VNJkQ1plQF8fFUcA0rw==
X-Received: by 2002:a5d:40c2:0:b0:272:ab11:29d0 with SMTP id b2-20020a5d40c2000000b00272ab1129d0mr32568902wrq.52.1672830397730;
        Wed, 04 Jan 2023 03:06:37 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id h15-20020adfaa8f000000b002421888a011sm34102161wrc.69.2023.01.04.03.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 03:06:37 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 59/77] python3-hatch-vcs: upgrade 0.2.0 -> 0.3.0
Date: Wed,  4 Jan 2023 12:05:30 +0100
Message-Id: <20230104110548.2537259-59-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230104110548.2537259-1-alex@linutronix.de>
References: <20230104110548.2537259-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jan 2023 11:06:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175444

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../{python3-hatch-vcs_0.2.0.bb => python3-hatch-vcs_0.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-hatch-vcs_0.2.0.bb => python3-hatch-vcs_0.3.0.bb} (80%)

diff --git a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb b/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
similarity index 80%
rename from meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
rename to meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
index cca2c49d2b..b4db10e767 100644
--- a/meta/recipes-devtools/python/python3-hatch-vcs_0.2.0.bb
+++ b/meta/recipes-devtools/python/python3-hatch-vcs_0.3.0.bb
@@ -7,7 +7,7 @@ inherit pypi python_hatchling
 
 PYPI_PACKAGE = "hatch_vcs"
 
-SRC_URI[sha256sum] = "9913d733b34eec9bb0345d0626ca32165a4ad2de15d1ce643c36d09ca908abff"
+SRC_URI[sha256sum] = "cec5107cfce482c67f8bc96f18bbc320c9aa0d068180e14ad317bbee5a153fee"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.30.2


