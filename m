Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10363C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 08:08:02 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.3655.1657094848544225873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cTnPDNMV;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id x10so10872379edd.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Jul 2022 01:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yCQxowPhDjSQk0UWl+4basxRcuxPuzNpmH50yOrUnxM=;
        b=cTnPDNMVt7N4hIul0gquRojBm9hmXhtOgUMW8WW7HwKfzLZzkYgzeXmZ3DkpHqSbk1
         6/3rPNvMuDrXvrePcJ+jMwQSIyRbjeYdogZOJigl+NuDPEUXkBGbSGpujzlTKci3aX4m
         2rYliG53/GbroW11whoVydLItds3+lqE+c/hsX2smW7rumWJ5Ie5EZXtpxsMyAsBO6kF
         1zFzrXFaCrlXYAH/lzSgfZWojCOKGTujKlLVFkO2zIEVWACGqWxuRl8vOg4XNm2kXkc3
         xy07bwOcv42dh1ReMkk6nRT1gdYKMCgO5qZxDsNQ8xroxMC88Om8NO0KeOjVJsTW895u
         ZZsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yCQxowPhDjSQk0UWl+4basxRcuxPuzNpmH50yOrUnxM=;
        b=eb19PEYgyNswYHfF8YaFTbKiutALTOBr7Om1PqqrcGwm94hx6TvAok8Bn1U6RSqHMY
         Fv/na+tLUKbBseYcNl36FoMty+LaAtcpyjIfJzxjh4BS4J7o43qxyaLEw/e10RL2f2HF
         E/BtKIpM3xNW6hJAHu+NvLosCZU33VrHoKh66ee/oiAvmvQzHQIKb1lwqrM2aeC0X6cm
         muLgf8H+R8P8r206BOSPqRjKspS6+wn0n1zxsAyvpuDBQj+1TlS49iluO+aJMiaFH8qS
         o9SecGOkIIt/M9enYMUCIwmGNpH1KzAsH4I20Ytjh7ABUIks993Iow5cHrdMsZ6tku9D
         e2ng==
X-Gm-Message-State: AJIora9YqOyfchEX/Yper2AFyfc2oBOttCIPxd6j/ci8HJPbkrTDIs0h
	bqU7te9mvcVzHGkxtBQV87mIOJGuuxNq+A==
X-Google-Smtp-Source: 
 AGRyM1vUvhZvP6jJWs5byvXQymyOb0U0VkwyivGhIP9e//wIAdS0VJRIa15FRYecADdm9h5KFlu09A==
X-Received: by 2002:a05:6402:3690:b0:43a:83f8:93bf with SMTP id
 ej16-20020a056402369000b0043a83f893bfmr5044290edb.49.1657094871708;
        Wed, 06 Jul 2022 01:07:51 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 v19-20020a170906381300b00721d8e5bf0bsm17001344ejc.6.2022.07.06.01.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:07:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 26/27] procps: restrict version check to 3.x
Date: Wed,  6 Jul 2022 10:07:20 +0200
Message-Id: <20220706080721.3072553-26-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220706080721.3072553-1-alex@linutronix.de>
References: <20220706080721.3072553-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Jul 2022 08:08:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167713

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/procps/procps_3.3.17.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/procps/procps_3.3.17.bb b/meta/recipes-extended/procps/procps_3.3.17.bb
index 0f5575c9ab..59ad89d326 100644
--- a/meta/recipes-extended/procps/procps_3.3.17.bb
+++ b/meta/recipes-extended/procps/procps_3.3.17.bb
@@ -18,6 +18,10 @@ SRC_URI = "git://gitlab.com/procps-ng/procps.git;protocol=https;branch=master \
            file://0002-proc-escape.c-add-missing-include.patch \
            "
 SRCREV = "19a508ea121c0c4ac6d0224575a036de745eaaf8"
+# 4.x version is an API incompatible rewrite
+# until procps consumers are transitioned to it we need to stick with 3.x
+# https://gitlab.com/procps-ng/procps/-/issues/239
+UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>3(\.\d+)+)"
 
 S = "${WORKDIR}/git"
 
@@ -100,4 +104,4 @@ ALTERNATIVE_LINK_NAME[ps] = "${base_bindir}/ps"
 
 ALTERNATIVE:${PN}-sysctl = "sysctl"
 ALTERNATIVE_TARGET[sysctl] = "${base_sbindir}/sysctl"
-ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
\ No newline at end of file
+ALTERNATIVE_LINK_NAME[sysctl] = "${base_sbindir}/sysctl"
-- 
2.30.2


