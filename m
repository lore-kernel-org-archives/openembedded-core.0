Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3024C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 20:07:31 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web09.770.1645646850993478646
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ftqrkxCo;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id c192so14438428wma.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 12:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OdQmKa5mPwd8h1sCTryUEI1r04NAj7VcV5ZzVBIdrpg=;
        b=ftqrkxCosUDH3UQ0xrKL4+oaL3pF6o3imHqq4ZM/y1Mp5V40urtPd/mtngxxcBGd5r
         bf3FKBBi+SQoCCpk4gAjAJ23M7WAX6S4W7dyTLduT5iqaxlZ9wxEJ53QH/9aoAVnCoFF
         TAOA7UgODnUhSlJj6xtZYZZDtR+jQkH/Nrqtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OdQmKa5mPwd8h1sCTryUEI1r04NAj7VcV5ZzVBIdrpg=;
        b=CyowqIKbbH09/A22LLewWs0qia5ZBlEdgYaRVIf192RCmqdIT15WG2hzXnhwCXtb8j
         Zbv/+JpZo/JhG4m/W2ukYXWhayMShSHfYvasFHdlt5tnR9F2IvakPNG8n3NsOZ/0zj01
         Ime3jk43Vhy/gATTX6AJ8vnkjHp0T2VjN3sJH1iBCrMgWSR+xoPChiDjLfxCW6cwWfsq
         4K1x83qv9u7uFjxxgMoXV0tVYMOvPyDoCi1N5WvwcCX/hk0F+r1dVbr+pLi/SsufuGEj
         9o8Wglopww5WurVE6LQOIPIQz4roYeRykxl0bcHqgyRiRHZHPufTK1pl0ZftUViEaHsM
         5u4g==
X-Gm-Message-State: AOAM532uWnGEO5zR2mgA9GLBlM7W3+ALUE8yHVCzqCHzOBapQTj5s8dC
	AXqpRgXc3U6lPj5Jf2l951uC1XI/cedw1frO
X-Google-Smtp-Source: 
 ABdhPJzoUS3i1lcUqNywqZRr96HK/KEDWr4aOYj626riUqyvu3xl2OsfofY+cof5HJqyGqmHk8eZ3A==
X-Received: by 2002:a7b:c853:0:b0:380:e16c:19e7 with SMTP id
 c19-20020a7bc853000000b00380e16c19e7mr6860457wml.172.1645646848928;
        Wed, 23 Feb 2022 12:07:28 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4709:85d1:7b5:8346])
        by smtp.gmail.com with ESMTPSA id
 w13sm532435wrv.21.2022.02.23.12.07.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 12:07:28 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3] pip_install_wheel: Use --ignore-installed for pip
Date: Wed, 23 Feb 2022 20:07:24 +0000
Message-Id: <20220223200726.3279678-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Feb 2022 20:07:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162274

Replace the use of --force-reinstall with --ignore-installed when running pip
install. It can detect currently installed modules in the wrong environment and
try to remove them currently which is not what is desired. Ignoring them is the
correct thing to do.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/pip_install_wheel.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
index 70f47d6f79c..f0312e0b1eb 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -6,7 +6,7 @@ PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
 
 PIP_INSTALL_ARGS ?= "\
     -vvvv \
-    --force-reinstall \
+    --ignore-installed \
     --no-cache \
     --no-deps \
     --no-index \
-- 
2.32.0


