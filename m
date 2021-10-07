Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF86EC4332F
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 14:28:57 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.12779.1633616936378881579
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KVz+3EYQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id e12so19717515wra.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9iEh6W0M4/JZ+7R+M2YOZW20lxPL0WQMYMR6064cqY=;
        b=KVz+3EYQsohKW0s8cnEkXCKWjn83rEJBj+lkya8kqZMK98bt4VbHH5CChblmW8sDAZ
         52Q5S7Eqf3cvGmfHb+sgLs3/6eULVZRTA9QoHTFhYIT9KIOlt3/tr0cJ9Yz/zLsX1XHL
         tWSBRwnKc/D6YIq+gr6NJAOTaSjGdq5AfdaoQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c9iEh6W0M4/JZ+7R+M2YOZW20lxPL0WQMYMR6064cqY=;
        b=fJsb/zHrr3DSCQWLMJLAkyAyf5lmE+Ap+shcKXL/UWiWx5tO27d3srhM5613IjtXu2
         tmKi8yScB+4Ve3mCWGIztU1c1skEtZz3d6lf2l1sUjmQ8VYIVEzHUs27sl0WZ58qoEsf
         jHsuPwWEp7sbX3XPvLDBC7q5alxHlmzeBmAck7uszGaiaqyJ4LP74TRrtOJQctCMBBaa
         T1N6kn+SfU4leBlOjdtoBN/67rMC+Vz0OUey1tuIY+ytFR4edGHQ5MCc1CB80bBx3YaT
         ST2cYTUQI7O2uts/2pHDZifXecm75U4q13JchhBGv7qOKVitidVWG0CEozLPsoVSllRm
         HMlg==
X-Gm-Message-State: AOAM530/a7mBjrYFv+vZyWtQGrpymnobP+PC1qHjepk3PLxUcI3JiufV
	GulO/PHqwDpUZeFBIj8fQTWZvwRXw4bfQQ==
X-Google-Smtp-Source: 
 ABdhPJzXfabSc4jPpAqYp0Tz4F4mfpfqReFUqflOzec3pJVCUGJ82h21AWE7pY+kZhB6hX/mrfVI+g==
X-Received: by 2002:a7b:c938:: with SMTP id h24mr1015043wml.41.1633616933821;
        Thu, 07 Oct 2021 07:28:53 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a])
        by smtp.gmail.com with ESMTPSA id
 w11sm5339443wmc.44.2021.10.07.07.28.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:28:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] multilib: Avoid sysroot race issues when multilib enabled
Date: Thu,  7 Oct 2021 15:28:53 +0100
Message-Id: <20211007142853.2422005-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 14:28:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156727

Multilib changes RECIPE_SYSROOT which can make the value in PSEUDO_IGNORE_PATHS
incorrect. Add the correct value, which fixes races over files in the sysroot.

[YOCTO #14581]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/multilib.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 8a8db582df4..7f3b9463efa 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -11,6 +11,8 @@ STAGING_DIR_TARGET = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT = "${WORKDIR}/${MLPREFIX}recipe-sysroot"
 RECIPE_SYSROOT:class-native = "${WORKDIR}/recipe-sysroot"
 
+PSEUDO_IGNORE_PATHS .= ",${WORKDIR}/${MLPREFIX}recipe-sysroot"
+
 INHERIT += "multilib_global"
 
 BBCLASSEXTEND:append = " ${MULTILIBS}"
-- 
2.32.0


