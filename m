Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E562C6FA8E
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:42 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
 [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web09.20394.1664133514458546690
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=LbZ1gwru;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id
 d64-20020a17090a6f4600b00202ce056566so10495517pjk.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=AlFJb1GvfJDWIj9Rn50YUTbCoFS+i3OD2hqk3DtwiAw=;
        b=LbZ1gwruFKpqFJT30MBgYzgAz8Sstry3Fa8MD+byWV7tk6WrbejRtjDwqvcZOPLsGZ
         M1iBd40cHSr9OweJZxhNpZFnILvJ8zA0BQJ0vYtjXFCVThrOeeRGicR4A9cxjzsx7p/v
         n5I7chvjceACmsFF/nPhLePOP6U76uUqrrmLA/xqX4e2HOeUDOTIcDtQc26E4xFJbVxn
         +y48+UB0uCLsr9qcOOW+HwPJnlfIX2EZuci0yHpitHj/0zy4lCEc4apGsc2L4sbw7Yds
         FaTbQIuRSx9yTVhjpUYU4GekhSVrj6F57DojCaVg49hzfdl4BjzfibhUVBMHWr7hqZyq
         52QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AlFJb1GvfJDWIj9Rn50YUTbCoFS+i3OD2hqk3DtwiAw=;
        b=TaY4aLMmqWwKy7X0xu1L3/5WIb9dbTIUKW2GJgJyQYAraQEAg3wmasQhFq8jODdQcu
         /as2mmXf8XS8nONBMbcY55mVoKVKtrher9zUBhLY/EIueXU6/NWEiZnAkfcuYtEpEXuF
         5M4e+1iSVId9oKn5B05SH8kTFQoFEvyzOoTMgSeFygIZq+tnkqRAQ/6WLPJ9c4HxtnDd
         KCoHUdO0XJ+lbYTMr6sIn5EVz5+vaNHd8uOXS9SqRc8YvteP+E0pZZQ9gRPFdqrRI3po
         W42ChlzxvS9I8lcqh+tOtYs+IQVxEA2QokirPZd4zHAC3rmokecAsn5cYfZs49n8l1ZY
         My8g==
X-Gm-Message-State: ACrzQf15fepDIQhW+GI4MInxMP/CalryCJoxUOO6ojyG0Hb0kqATHsQU
	6wc3ifdWareOJ4NnMrdML3CMkNF1D5sV0uKd
X-Google-Smtp-Source: 
 AMsMyM64qPfwFRIznFNCZH2rE0MTCiQYICkmAty0P/rM8UlbCrATMHc3/bDKiQr6TqEE1mZHbgcpCQ==
X-Received: by 2002:a17:90b:224d:b0:203:a209:f4d5 with SMTP id
 hk13-20020a17090b224d00b00203a209f4d5mr33127196pjb.135.1664133513440;
        Sun, 25 Sep 2022 12:18:33 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:32 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/33] perf: Fix for recent kernel upgrades
Date: Sun, 25 Sep 2022 09:17:29 -1000
Message-Id: 
 <35dbd02b73a586db9e09c6a6d36252244ea5e91f.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171032

From: Richard Purdie <richard.purdie@linuxfoundation.org>

With recent kernel changes in stable, the full path to python was being
encoded into binaries and python install files. Add some workarounds
for both issues to fix build reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit cf33e2ab2693eafaf0e5fc45666355d60e084281)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 95b4362958..772bc2dea1 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -144,6 +144,9 @@ do_install() {
 	# we are checking for this make target to be compatible with older perf versions
 	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 	    oe_runmake DESTDIR=${D} install-python_ext
+	    if [ -e ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt ]; then
+		sed -i -e 's#${WORKDIR}##g' ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt
+	    fi
 	fi
 }
 
@@ -244,6 +247,9 @@ do_configure:prepend () {
         # change the Makefile line to remove everything before 'tools/perf'
         sed -i -e "s%srcdir_SQ = \$(subst ','\\\'',\$(srcdir))%srcdir_SQ = \$(patsubst \%tools/perf,tools/perf,\$(subst ','\\\'',\$(srcdir)))%g" \
             ${S}/tools/perf/Makefile.config
+        # Avoid hardcoded path to python-native
+        sed -i -e 's#\(PYTHON_WORD := \)$(call shell-wordify,$(PYTHON))#\1 python3#g' \
+            ${S}/tools/perf/Makefile.config
     fi
     if [ -e "${S}/tools/perf/tests/Build" ]; then
         # OUTPUT is the full path, we have python on the path so we remove it from the
-- 
2.25.1


