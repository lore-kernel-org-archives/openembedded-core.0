Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65F10C433EF
	for <webhook@archiver.kernel.org>; Fri, 25 Feb 2022 04:04:44 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web09.3256.1645761883812751990
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:04:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KtBGA5k7;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id l9so3298663pls.6
        for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Feb 2022 20:04:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qG04nIg6J63aKeBJ76h2FtaMlt5RgWmHjYeeRb6mZXA=;
        b=KtBGA5k7WC6n4MP9km92C18xDWsRKfG2uk90RsjlM0oCClJzbqdC1LytnBnmRBXVI0
         hVVVpkWHtw1eITPCLpst6rIF7qiytg4dBNlBPZiBvmlWhtNlhgROh7VSw5zpybAmjk3n
         CCxmOlp2eHVtEbGDQ+cjlizNzeXCubwoq05qTENs0aScw8BwoG4IQPnFZM/vu5pu0Ryr
         En8Z8REpmAIA2FQMq+3j3xyDInc4/om3Q8bjGWudI7VstCXidLKpiNfPB1q+XzT2NJdI
         PtgZsl9ApUXPpFZZ0Rc8hTwwBzkDHOkzl6yGR2fBfxyC9DCOXkCNGRZZW2JunXW9uI5l
         foHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qG04nIg6J63aKeBJ76h2FtaMlt5RgWmHjYeeRb6mZXA=;
        b=cx0mnmIoL6zEUsQqLID5yxifJOcBK4wG9hnUuzLVm714UEZxyWxJyU2u5Zbji3fJe8
         63esbhkoOUMtF6Y0EthhZW7d36im0z0UhRIi8JnRNnMyZVdNxMqPQ7Xovauw76JXkLfP
         a+zQnHHuJZYgO1g8SOETABrl+P2Hydm7wb8LC8o2aRwXHS2CXbttvl4aVNMQ2R0AhPMu
         42mGxfxNvgwnSdJvqQCL5ABKec4UNEoDkfYu1rJahnIwAddrd9OSx2MJX/9WlDG8Grkg
         QMF8jixpTLP3/xr1mKp/JNd2Sskk1juSAn/fq+A9mgLtRqZWVySF546nTb0Yi2jk9bf3
         b2Sg==
X-Gm-Message-State: AOAM532SDTexPS7IB47U52bRMYwysKTFRnHN2Oo3A/OzftMUGQ6jsXzK
	VaXmoYz/PMPEd/a4yv3tkBCTUBeQWENL/w==
X-Google-Smtp-Source: 
 ABdhPJyMOEn1Ph49PGlh5sR7TTom8mJrgPf+TVY4icD55jY0X6QATn+P+eQfGpKaLiM83ojKt5Io/g==
X-Received: by 2002:a17:90a:3f09:b0:1b8:e615:a261 with SMTP id
 l9-20020a17090a3f0900b001b8e615a261mr1342047pjc.196.1645761882960;
        Thu, 24 Feb 2022 20:04:42 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:263d:523e:139c:a040])
        by smtp.gmail.com with ESMTPSA id
 y5-20020a056a00190500b004f104b5350fsm1066512pfi.93.2022.02.24.20.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 20:04:42 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <ticotimo@gmail.com>,
	Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 2/2] pip_install_wheel: improved wheel filename guess
Date: Thu, 24 Feb 2022 20:03:31 -0800
Message-Id: <20220225040329.813595-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220225040329.813595-1-tim.orling@konsulko.com>
References: <20220225040329.813595-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Feb 2022 04:04:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162335

From: Tim Orling <ticotimo@gmail.com>

Rather than only use PYPI_PACKAGE as a guess, fall back on PN for cases
where a recipe does not inherit pypi.

Wheels can only have alphanumeric characters in the 'distribution'
name [1]. Any other characters are replaced with an underscore. Provide a
function to replace dash with underscore.

[1] https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
Changes in v2:
   address review comments

 meta/classes/pip_install_wheel.bbclass | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/pip_install_wheel.bbclass b/meta/classes/pip_install_wheel.bbclass
index 8a848c0ebab..9f9feda6ee0 100644
--- a/meta/classes/pip_install_wheel.bbclass
+++ b/meta/classes/pip_install_wheel.bbclass
@@ -1,6 +1,10 @@
 DEPENDS:append = " python3-pip-native"
 
-PIP_INSTALL_PACKAGE ?= "${PYPI_PACKAGE}"
+def guess_pip_install_package_name(d):
+    '''https://www.python.org/dev/peps/pep-0491/#escaping-and-unicode'''
+    return (d.getVar('PYPI_PACKAGE') or d.getVar('PN')).replace('-', '_')
+
+PIP_INSTALL_PACKAGE ?= "${@guess_pip_install_package_name(d)}"
 PIP_INSTALL_DIST_PATH ?= "${B}/dist"
 PYPA_WHEEL ??= "${PIP_INSTALL_DIST_PATH}/${PIP_INSTALL_PACKAGE}-${PV}-*.whl"
 
-- 
2.30.2


