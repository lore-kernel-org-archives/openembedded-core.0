Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B9DC6FA82
	for <webhook@archiver.kernel.org>; Tue, 20 Sep 2022 22:13:07 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web09.3352.1663711974334825276
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:12:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bNZQxr2L;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id t7so6798164wrm.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Sep 2022 15:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=xz8lBulANP5h3m9eUQug9A2v63ZvJhRUu9cva9ZMdM0=;
        b=bNZQxr2LMXnfsMSlNRP+jXmXPHzaUHyIgwK0QTiaxftFxJTjaAY67Kpa1sDJCv+v5x
         2RcbRigfA5cMhszp3lxvP86UPqwx0273dq9SEBbZ/fZMmmG2KLKm3NHiQev5rcrhudCV
         3N9eCDkkWBzlTq4RT5FrZc/x6Hd0IUiqr6FcI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=xz8lBulANP5h3m9eUQug9A2v63ZvJhRUu9cva9ZMdM0=;
        b=n9QD1kbMg6onD9aCzIXOm08UZdTkLbhipX2INbCajq+VBh2wbCf9pJc/rKIaeJ7Yjj
         1nuGH2y1OK28u8mnDCPmmqA+IANcjJFOFQ0M4tNwKeuYqQCo1VKiJHHZMkZAjzeNewQ4
         x3guPLiZMNZNmaOPIPwGy2nyLyaUzM0/xGsxUUOuXbAWiEwgYFMxpP8Y6CNLOnHzQdFw
         5noqYqqPjvUk/bWSc21TfKzKQPUI7sLCMLXizWSF/dgSBSzAh2THrySwYxnusXoNRu4J
         wGJNdMx/5CD51u7vkgoSDWDL0wbhKRUQHzLG6lT92/MGueSPQ6cLUE574GAk00+Y9YtX
         7zMA==
X-Gm-Message-State: ACrzQf2DvOW6sgvn+0akiVcCw9bmlj7SyA1NFMaXHD4TWaY3R9NzXlkS
	MvOXmshgjaFzUjw9K8L48tSJFtJ/eMNf2Q==
X-Google-Smtp-Source: 
 AMsMyM7Q5f1osJCa38KP9JNcwf7Y5ZJ95WizmZQL7pd1M9IaP+sI0THovhO78XzF6XKbu8mszlO8MQ==
X-Received: by 2002:a5d:504c:0:b0:228:db0e:a4c9 with SMTP id
 h12-20020a5d504c000000b00228db0ea4c9mr15687478wrt.272.1663711972437;
        Tue, 20 Sep 2022 15:12:52 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b663:b06:b4c5:e314])
        by smtp.gmail.com with ESMTPSA id
 z18-20020adff752000000b0022860e8ae7csm829685wrp.77.2022.09.20.15.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 15:12:52 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Subject: [PATCH 2/2] perf: Fix for recent kernel upgrades
Date: Tue, 20 Sep 2022 23:12:50 +0100
Message-Id: <20220920221250.1544461-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
References: <20220920221250.1544461-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Sep 2022 22:13:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170911

With recent kernel changes in stable, the full path to python was being
encoded into binaries and python install files. Add some workarounds
for both issues to fix build reproducibility issues.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 9f7c300a40e..31bc04635d8 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -145,6 +145,9 @@ do_install() {
 	# we are checking for this make target to be compatible with older perf versions
 	if ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'true', 'false', d)} && grep -q install-python_ext ${S}/tools/perf/Makefile*; then
 	    oe_runmake DESTDIR=${D} install-python_ext
+	    if [ -e ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt ]; then
+		sed -i -e 's#${WORKDIR}##g' ${D}${libdir}/python*/site-packages/perf-*/SOURCES.txt
+	    fi
 	fi
 }
 
@@ -245,6 +248,9 @@ do_configure:prepend () {
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
2.34.1


