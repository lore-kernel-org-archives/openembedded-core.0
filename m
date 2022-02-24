Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2BBBC433EF
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 04:12:14 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web09.6397.1645675934302495421
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:12:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CxcuPMgH;
 spf=pass (domain: gmail.com, ip: 209.85.214.175,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id bd1so616643plb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Feb 2022 20:12:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DzsGOPZktC2ZAquqw+bMF0kPqxmh4NblBwIrO1Bxz1k=;
        b=CxcuPMgHXT4hB9wimb6ViiGxZOlOy0wTU6/OLgPqK7RB/JHxMcReIT0ekSbyl9NMk9
         FDW0E121Px9qOyL2IP1e1cVMRRfvH6VsEG1Ra+Iqkh7OaSAqZWuGXqVs3G9GsBBMG1j2
         z3uktLz95YNA2ph8/eRUPCtCH5VxsnEekjWcFhwHnGhQAvAU3poVplX9DXdh5NJ4QPhV
         9nVBj5iklNDRGiTRtG69s6TCey/hgOwJyniRrxjLpQVLj3gHU4x/nN5WwWXYKOLPWlIW
         dCBRyUuBnEZTCnWnEgrOAtHGXTJ2A/vTIYwCN3vujUeOnsVGjP4TY7lTZpfJzyN03rsf
         zgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DzsGOPZktC2ZAquqw+bMF0kPqxmh4NblBwIrO1Bxz1k=;
        b=p2yIp9/bfMBt4ddRvKI3UsdFfY0nzG2EfdrJfNvYXonoWzWcdJ/6fybOP050BkyGCn
         luhrcluZeOjFjoB7xqiLvWEzHmnHW1+W18nbf/c28MYqBmUovxxSjBw/rurj6X9ihH2K
         n8SZzpvWol1W6MAUMYSKDmrxICAPNji23wPAK+IUSgKg/YV2FI140xeaJ9fiEAmHLlEF
         vCvOA7k3Whm/K+hwv/1DSvxWo05MotGWs8CpvnwM9IA2MLmAwayj6Z7sAS7wadwMCjw/
         uXgNAQca8koSyH5lXco1YQyU3rTEJp6lsWl94tG76E0DG2wWDZGPVZxveGMWJZvEAIY1
         AC/w==
X-Gm-Message-State: AOAM5333XWsbbwpqUAPXeQPQReybS+fU7KE6st/xMKMj/XAcE141E2G2
	QoiWWRqPysb4ORXwjQNcEHTAvzEJBBT5bA==
X-Google-Smtp-Source: 
 ABdhPJwuh6/Blu0Jb9jddmQa10c93DXRMTxWAcXADqqh1yajUtWbPAp7jT9jhKFWGC8xbYkj7fikxQ==
X-Received: by 2002:a17:902:e945:b0:14e:b8d9:aa07 with SMTP id
 b5-20020a170902e94500b0014eb8d9aa07mr881483pll.163.1645675933328;
        Wed, 23 Feb 2022 20:12:13 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:16be:5024:1d60:b2cd])
        by smtp.gmail.com with ESMTPSA id
 m19sm1086012pfk.215.2022.02.23.20.12.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 20:12:12 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] pip_install_wheel: improved wheel filename guess
Date: Wed, 23 Feb 2022 20:12:00 -0800
Message-Id: <20220224041200.2645054-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220224041200.2645054-1-tim.orling@konsulko.com>
References: <20220224041200.2645054-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Feb 2022 04:12:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162291

Rather than only use PYPI_PACKAGE as a guess, fall back on PN for cases
where a recipe does not inherit pypi.

Wheels can only have alphanumeric characters in the 'distribution'
name [1]. Any other characters are replaced with an underscore. Provide a
function to replace dash with underscore.

[1] https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/pip_install_wheel.bbclass | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
index f0312e0b1eb..e0f0b97ad13 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,6 +1,15 @@
 DEPENDS:append = " python3-pip-native"
 
-PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
+def guess_pip_install_package_name(d):
+    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
+    package = ""
+    if not d.getVar('PYPI_PACKAGE'):
+         package = (d.getVar('PN').replace('-', '_'))
+    else:
+         package = (d.getVar('PYPI_PACKAGE').replace('-', '_'))
+    return package
+
+PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
 PIP_INSTALL_DIST_PATH ?= "${B}/dist"
 PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
 
-- 
2.30.2


