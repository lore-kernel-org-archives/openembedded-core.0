Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36341CA0EED
	for <webhook@archiver.kernel.org>; Fri, 22 Aug 2025 14:49:15 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.11989.1755874150618251751
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Aug 2025 07:49:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=I7N9Djxr;
 spf=pass (domain: konsulko.com, ip: 209.85.214.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-24616482efeso9460805ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1755874149; x=1756478949; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=drUiNxfFK3UOVDUCzUYUk7xvVKupj6Bk7ppRCZcZDlQ=;
        b=I7N9Djxribekvw3pPd3xVcyBYj9MV0eF+ZD8uRAvXqPenSPNgpg8Hx/bqQJEBKBQNu
         Rsgs+XAKd/PkycMUrTn0ZI7lsum67+4wtozASsLi4TmnmXP6pRj+hSNQMOTCzuEvgNuS
         1dq+AXv4pYrYOY4qxkXL/gDJtYZT+CeTtCN3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755874149; x=1756478949;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=drUiNxfFK3UOVDUCzUYUk7xvVKupj6Bk7ppRCZcZDlQ=;
        b=N47iIEjEIGMGScCa9EoL0vDq7URiiDTyCmjlEuK2VA+LJMD+mqaSVm/CF91RYtTY+A
         Yidhfvz+cxvv/HLtkO2aoRBuPX6cDDG+AjQ+51NpNYv9DhLvVN6TNoArfeDLigaafVDN
         d+yM9G/168oQiZtyrJVPNofDqbvpAnQuVCadWyXzC1zpZ8KsyGsd6MmOnTwFwJ/6ZWtT
         VsE4AjvRxk16DexBmhXd2AFWPp1uTgXLIhbsDsMyDc8F9MM7Lxk2S06y8uawu2t5QZtu
         PG7rcvbfIDredFjrWoBkGj0FInqOJLQ6Ua0/xLwmvkL2cWrVh21cTyQNAJ0+sLNpUfEp
         Tvww==
X-Gm-Message-State: AOJu0YwwhlxEx4jEDj5glGFOc3mjz2yN6QQRmARMVQtWpMBE7r2D0oHF
	zsJzD7C9NUaNj10AuXN429H+6n4v4H/gV/icoe2QsQMMM+D4WMMH7Nkmn1/BGy0oKwxZ3qCBSxd
	/miWT5zU=
X-Gm-Gg: ASbGncsMlMs0awwl48oOejqSBjL1OMx61HORoY5q4u3jZitp/Y3MRfZTN/UCqOXuReR
	7toxopXzOzPTk3tCUY+GQsuExeC+DGROqGz0TpQDJVd7b3ILSzPuSYZ9CCOVWesLASeLdEK6jwG
	zNtBMUdtuyc2JxmxMXSSrcFbmobzW17WvrbN44pC+3x77yR9hdvLfE+Vk+kKTCVsLoQBdF2Sd13
	HwBaQuD/xEWE2MOFsIC1ATXhStgjMdE3U2SYhmnIYLMPcVeNLGl4R6X1Exalp0MFHicHQ08V+dJ
	MweQ4bapn1U9z4xKb5JkksRiAZgOocoA3AMXs5kfNy0eLbsXEd2e6l57FwFQfIzyDH+3ch0CXL+
	l1FIJoG+jTpJBiBqIgIPmYJgwI/bSBHs0KK62pmfg71m/g6LUr7BS0ZzjCYvkWQ==
X-Google-Smtp-Source: AGHT+IFn1uEZqr6JF8YbrAj9xNAy6FHa6RQe00tzEPicSFucqTxeoZuIBVn8xPAJl9FVctycF81+6A==
X-Received: by 2002:a17:903:38c4:b0:240:5bde:532d with SMTP id d9443c01a7336-2462ef4c8eemr42853315ad.38.1755874149588;
        Fri, 22 Aug 2025 07:49:09 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2465a276b07sm6563795ad.140.2025.08.22.07.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 07:49:09 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-rpds-py: upgrade 0.26.0 -> 0.27.0
Date: Fri, 22 Aug 2025 07:48:24 -0700
Message-ID: <20250822144905.3501927-1-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Aug 2025 14:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222334

From: Tim Orling <tim.orling@konsulko.com>

What's Changed

* Allow packaging of wheels for riscv64 architecture by @ffgan in #150

Comparing changes:
https://github.com/crate-py/rpds/compare/v0.26.0...v0.27.0

Reference:
https://github.com/crate-py/rpds/pull/150

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass for core-image-ptest-python3-rpds-py on qemux86-64

 .../{python3-rpds-py_0.26.0.bb => python3-rpds-py_0.27.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-rpds-py_0.26.0.bb => python3-rpds-py_0.27.0.bb} (85%)

diff --git a/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb b/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
similarity index 85%
rename from meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
rename to meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
index 3fd7701f8d3..ca2122f8df5 100644
--- a/meta/recipes-devtools/python/python3-rpds-py_0.26.0.bb
+++ b/meta/recipes-devtools/python/python3-rpds-py_0.27.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pypi.org/project/rpds-py/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7767fa537c4596c54141f32882c4a984"
 
-SRC_URI[sha256sum] = "20dae58a859b0906f0685642e591056f1e787f3a8b39c8e8749a45dc7d26bdb0"
+SRC_URI[sha256sum] = "8b23cf252f180cda89220b378d917180f29d313cd6a07b2431c0d3b776aae86f"
 
 require ${BPN}-crates.inc
 
-- 
2.43.0


