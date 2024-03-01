Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90699C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 09:35:53 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.19014.1709285751069335234
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Mar 2024 01:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BF78Fnlv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.179, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d29aad15a5so21490281fa.3
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 01:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709285749; x=1709890549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uniud2XqgXUIwxuRgf+uW1NMrY2PL2rfcPi/PAdst94=;
        b=BF78FnlvSAH7a4OxxKq0UP8Wnu3APrAfUeOqP2omn6zr1XRU46Qqft1GliMWBZBmvR
         p9W3l7seTD9jR0vWd6Nk0IHGZ9wMfb9DKNAaG331+SVVixgqScUvSXpYxaWUqR3WHBUM
         +fVKCIOqPmp03F4Tt5yz8noc11UGt6Sz4dVso=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709285749; x=1709890549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uniud2XqgXUIwxuRgf+uW1NMrY2PL2rfcPi/PAdst94=;
        b=haF6dpYg3+LRvUu3dmUaTOGmm0PgwcfXgGjEdotgOjaUPamVTBrnuAnG7sW5QQ4b+M
         Yt+NOUtn6+2FjPY8BFz7HX+YxFha01ONEsh3LzfaBmp2lXp6nAH4dh/2+1DWkGEqcRXb
         0S/JKgdqTgEP8hT7wnw25+lV/Z415A1/DSrx9p4dHufKVwHYoS1UNasbCeoi1ON8dyQ5
         zy3cHwXVNJXp2yIzBdbeVkPldTHaNcL7XvcVklzxLrIMmoWtmodC98vhSkIsxE7/aeOd
         KhkyCmNs67EAiIPC+Wzz1RQR8K5WT1/MrdEZznYOGTGeI/5DsTovJ0WKKHsAEpGbbhGZ
         Q4kA==
X-Gm-Message-State: AOJu0YzdDIcrKHQy6eZ4dQOO3stqOVVn3Jzni7NZLK134miAteplb6jI
	nTId9y0yfmLvN0phI/apRKCrqPbO87UEMPqSosaIvCxMr0gk8bmUknN+EY5c4l5CvtlvK6LuahI
	K
X-Google-Smtp-Source: AGHT+IGlbx1ZyUcvRdKygla/zuwbJ9Y49BSYtVFsXZALP3ty20RBRTZvEbXAwsbM2mFoFHBYS7LDKg==
X-Received: by 2002:a2e:8017:0:b0:2d2:db6e:775 with SMTP id j23-20020a2e8017000000b002d2db6e0775mr743480ljg.13.1709285748925;
        Fri, 01 Mar 2024 01:35:48 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ef7:29f4:cff2:85e4])
        by smtp.gmail.com with ESMTPSA id je1-20020a05600c1f8100b004127ead18aasm4902549wmb.22.2024.03.01.01.35.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Mar 2024 01:35:48 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/2] no-gplv3: Tweak for packagemangement in core-image-full-cmdline
Date: Fri,  1 Mar 2024 09:35:47 +0000
Message-Id: <20240301093547.1810401-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240301093547.1810401-1-richard.purdie@linuxfoundation.org>
References: <20240301093547.1810401-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Mar 2024 09:35:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196457

If we enable package-management for core-image-full-cmdline we need the workarounds
used for core-image-weston to ensure the oe-selftest license QA tests keep working.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/distro/include/no-gplv3.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/no-gplv3.inc b/meta/conf/distro/include/no-gplv3.inc
index bb2e836f982..d515fd4ad6b 100644
--- a/meta/conf/distro/include/no-gplv3.inc
+++ b/meta/conf/distro/include/no-gplv3.inc
@@ -19,6 +19,8 @@ PACKAGECONFIG:remove:pn-bluez5 = "readline"
 # so install rpm but not dnf
 IMAGE_FEATURES:remove:pn-core-image-weston = "package-management"
 CORE_IMAGE_EXTRA_INSTALL:pn-core-image-weston += "rpm"
+IMAGE_FEATURES:remove:pn-core-image-full-cmdline = "package-management"
+CORE_IMAGE_EXTRA_INSTALL:pn-core-image-full-cmdline += "rpm"
 
 # matchbox-terminal depends on vte, which is gpl3
 CORE_IMAGE_BASE_INSTALL:remove:pn-core-image-weston = "matchbox-terminal"
-- 
2.40.1


