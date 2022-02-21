Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA06C433FE
	for <webhook@archiver.kernel.org>; Mon, 21 Feb 2022 21:24:10 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web11.4760.1645478649649425311
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Guv/IGG6;
 spf=pass (domain: gmail.com, ip: 209.85.214.181,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id 4so5273516pll.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Feb 2022 13:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=Guv/IGG6Lznm87drg0DgZ4kTVGTVZJGDzcJ36XC2AxCV+v9GIesurH/NDLXT7V8vaY
         HGpdCycXvGzZ2Wd3lRDqBUJ+kbaICxckn9jgIVm5gk4Sa8i3kw8TSff2ncpDx4aDmvEQ
         JRkbAcBqZy83Fllf4LOfqrYJ/pDoF1eq2T8UPBnf0nfvknLX8t7m+c6rvQm3GRlV81z1
         OmSUs6pOg3JqWI3ofBcQia9Fq00xrwv7PzBJAoW2GNoSbW/q8ESIr8nD0MFqA9z3XCGO
         BGcGdAXP53NCiN0ASyUxn5qXDrox4VLtQyll/Co9w6rFxusJsXr12KIfOC1wg3ZBsm7G
         6XWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=m3gEm37hQFtUD3Ua9/H4cKIM7eBOc/uatVaNihsgMRE=;
        b=YHByVtnWsmydR5jvzVqXEgqbvGdrSgF4yHW0e//sQixLYvHXayd64/BfgwnWpCDDyE
         WuQ1Y48CkK7tLCPNpe60tnp1V5+5bxHuTFzRzJ5hJFLJctOvL7I8//0fwdqVWVpRJUlZ
         i+sm59aRoxwAB0N49OIJvOUnGJrqCFLnUywfTRTHnPd0ZVq/Yve3lPNs4kKksbEn2O3H
         nENmnbzKqmiWzrw9Fkl9v9iP9K4QzU+VSEsZViLj9QyLa3rLwYpangvBdQLVnxsgOkaY
         NC5ySGYU7KX4TEE/M1u4YZ3/TYBeQQ2AxGIth1eyIMkCVoamKtcz1qej+kQPArd4g3L6
         V5Mg==
X-Gm-Message-State: AOAM530ZpNkfLHQNgIApxAZ0KhQ2I9soN/kpDATXqAsQNrTtgwzlAlye
	NKNZuLPTgEEf3JB6DFrVj3sTiFn5EJk4dg==
X-Google-Smtp-Source: 
 ABdhPJytm5dicDY70d89RxQbU+p8Q49JhGfBK4yjrvgSmqugTyI1FBg71tSAR34Pf2vLosCGcZ8ytA==
X-Received: by 2002:a17:90a:b00d:b0:1bc:5d68:e7a8 with SMTP id
 x13-20020a17090ab00d00b001bc5d68e7a8mr809196pjq.59.1645478648772;
        Mon, 21 Feb 2022 13:24:08 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:d01c:96b7:6393:8c56])
        by smtp.gmail.com with ESMTPSA id
 n85sm14081529pfd.142.2022.02.21.13.24.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Feb 2022 13:24:08 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 06/32] setuptools_build_meta.bbclass: add helper class
Date: Mon, 21 Feb 2022 13:23:21 -0800
Message-Id: 
 <af615c07a21d19a99fcc6605518d1edb1141ec0f.1645478020.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1645478020.git.tim.orling@konsulko.com>
References: <cover.1645478020.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Feb 2022 21:24:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162082

This class uses the PEP 517 compliant setuptools.buil_meta to build
wheels.

[YOCTO #14638]

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/classes/setuptools_build_meta.bbclass | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/classes/setuptools_build_meta.bbclass

diff --git a/meta/classes/setuptools_build_meta.bbclass b/meta/classes/setuptools_build_meta.bbclass
new file mode 100644
index 00000000000..b1441e65dd5
--- /dev/null
+++ b/meta/classes/setuptools_build_meta.bbclass
@@ -0,0 +1,18 @@
+inherit pip_install_wheel setuptools3-base
+
+DEPENDS += "python3 python3-setuptools-native python3-wheel-native"
+
+setuptools_build_meta_do_configure () {
+    mkdir -p ${S}/dist
+    cat > ${S}/build-it.py << EOF
+from setuptools import build_meta
+wheel = build_meta.build_wheel('./dist')
+print(wheel)
+EOF
+}
+
+setuptools_build_meta_do_compile () {
+    nativepython3 ${S}/build-it.py
+}
+
+EXPORT_FUNCTIONS do_configure do_compile
-- 
2.30.2


