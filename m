Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web12.14529.1615317825599963785
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 11:23:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eA0ZhaD5;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d11so11101377qtx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Mar 2021 11:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ebhNMEkpX0rLAU6GqxeX126R37fzt5QK0+2pP23zwZY=;
        b=eA0ZhaD5FXbMFMoizvA4vysIikbSyN4JL65oCF2hXhOnRPSRmAdLjqWXYLCo7uu0kj
         tVHc6L/QlWCIq4lYsliIY3Da7SiRwu7B9k8XsqeMGQrnxIUo4yXPoROsnjydhFfBFwte
         EcbA4R/g+7e1hRSrqi5wutaEzGp1buKz2xNgVHX6CbEdUJBPfPR+MMl1JBKZY1VqK0wD
         NBHnEFfPt6tQ1HToXckxRb8rjVXXy4iCVDjIcRXV8HMQX1JHxh5R1HLFLIddLjAHGLiP
         ICKDAyHIRDeFj0Bzk2Ygxlc56EiNBa4WM0GErihnX6fxyXHtR246/TnbZeUxLdoUoz+Q
         hAgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ebhNMEkpX0rLAU6GqxeX126R37fzt5QK0+2pP23zwZY=;
        b=OuMWhLBrsk9YNlB/QyhPC8INgxmT8jeaI/+04FW1GtrwcCyEd8xfEWd32xYvPz4gRW
         OTKt4jApaPD9TJrf/IudOhXJXmRHN+g9DQ7A565Rp9iehqYOS1WqV721ejnbL1lBqDbg
         4zvCg3boHZ3tjxmfnDBy7U6TFbTc6L5byCDcwMzb65umsQGTZHmq3Dm7FAzRoaDK9M67
         ao9AmdzT27ohI97ZDaMmgfED7vi47SwvcUop+KdRwE4fQKYaSu7hcWbgckbQUSCPQods
         5sMEcjh9bWxA3yoiBwVIstLge4c97KPXvKUpyxxanIhdQE9qgNRT6cGZ17JfuX09VuKS
         XvcA==
X-Gm-Message-State: AOAM532LebmpQa4zUH17yQ58QDI7bPXm978B1aj44/dLBbVcC1H+MPdk
	g3Rn4nkwURkgC9IuiXZi43Y=
X-Google-Smtp-Source: ABdhPJzMhkf9vPWj+j8ff3XyUKcZQXNIudQ26dX3KociR61iGgMf0Es4mcvZMzbGjqv/e/PYwISuow==
X-Received: by 2002:ac8:519a:: with SMTP id c26mr19538840qtn.342.1615317824677;
        Tue, 09 Mar 2021 11:23:44 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id f13sm5713377qtf.57.2021.03.09.11.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 11:23:44 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] perf: fix reproducibility issues
Date: Tue,  9 Mar 2021 14:23:36 -0500
Message-Id: <0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1615317549.git.bruce.ashfield@gmail.com>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

perf has been failing our reproducible testing due to multiple symbols
containg build paths.

With this commit, we fix the issues:

 1) The following line in the Makefle:

     override PYTHON := $(call get-executable-or-default,PYTHON,$(PYTHON_AUTO))

 "PYTHON" / "PYTHON_AUTO" have the full path as part of the variable. We've
 ensure that the environment is setup and we do not need the full path to be
 captured, since the symbol gets built into the executable, making it not
 reproducible.

 2) The following line:

    srcdir_SQ = $(patsubst %tools/perf,tools/perf,$(subst ','\'',$(srcdir))),

 Captures the full src path of perf, which of course makes it not
 reproducible. We really only need the relative location 'tools/perf', so we
 change the Makefile line to remove everything before 'tools/perf'

 3) OUTPUT is the full path, we have python on the path so we remove it from the
 definition. This is captured in the perf binary, so breaks reproducibility

     PYTHONPATH="BUILD_STR(python)

 4) To avoid bison generating #ifdefs that have captured paths, we make sure
 all the calls have YFLAGS, which contains prefix mapping information.

Upstream-status: OE specific to our cross/build environments. Variants
                 will be developed for upstream

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/perf/perf.bb | 38 ++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 868cde7353..2beb404c03 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -81,6 +81,7 @@ EXTRA_OEMAKE = '\
     AR="${AR}" \
     LD="${LD}" \
     EXTRA_CFLAGS="-ldw" \
+    YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
     NO_GTK2=1 \
@@ -214,6 +215,43 @@ do_configure_prepend () {
             ${S}/tools/build/Makefile.build
     fi
 
+    # start reproducibility substitutions
+    if [ -e "${S}/tools/perf/Makefile.config" ]; then
+        # The following line in the Makefle:
+        #     override PYTHON := $(call get-executable-or-default,PYTHON,$(PYTHON_AUTO))
+        # "PYTHON" / "PYTHON_AUTO" have the full path as part of the variable. We've
+        # ensure that the environment is setup and we do not need the full path to be
+        # captured, since the symbol gets built into the executable, making it not
+        # reproducible.
+        sed -i -e 's,$(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO)),$(notdir $(call get-executable-or-default\,PYTHON\,$(PYTHON_AUTO))),g' \
+            ${S}/tools/perf/Makefile.config
+
+        # The following line:
+        #     srcdir_SQ = $(patsubst %tools/perf,tools/perf,$(subst ','\'',$(srcdir))),
+        # Captures the full src path of perf, which of course makes it not
+        # reproducible. We really only need the relative location 'tools/perf', so we
+        # change the Makefile line to remove everything before 'tools/perf'
+        sed -i -e "s%srcdir_SQ = \$(subst ','\\\'',\$(srcdir))%srcdir_SQ = \$(patsubst \%tools/perf,tools/perf,\$(subst ','\\\'',\$(srcdir)))%g" \
+            ${S}/tools/perf/Makefile.config
+    fi
+    if [ -e "${S}/tools/perf/tests/Build" ]; then
+        # OUTPUT is the full path, we have python on the path so we remove it from the
+        # definition. This is captured in the perf binary, so breaks reproducibility
+        sed -i -e 's,PYTHONPATH="BUILD_STR($(OUTPUT)python)",PYTHONPATH="BUILD_STR(python)",g' \
+            ${S}/tools/perf/tests/Build
+    fi
+    if [ -e "${S}/tools/perf/util/Build" ]; then
+        # To avoid bison generating #ifdefs that have captured paths, we make sure
+        # all the calls have YFLAGS, which contains prefix mapping information.
+        sed -i -e 's,$(BISON),$(BISON) $(YFLAGS),g' ${S}/tools/perf/util/Build
+    fi
+    if [ -e "${S}/scripts/Makefile.host" ]; then
+        # To avoid yacc (bison) generating #ifdefs that have captured paths, we make sure
+        # all the calls have YFLAGS, which contains prefix mapping information.
+        sed -i -e 's,$(YACC),$(YACC) $(YFLAGS),g' ${S}/scripts/Makefile.host
+    fi
+    # end reproducibility substitutions
+
     # We need to ensure the --sysroot option in CC is preserved
     if [ -e "${S}/tools/perf/Makefile.perf" ]; then
         sed -i 's,CC = $(CROSS_COMPILE)gcc,#CC,' ${S}/tools/perf/Makefile.perf
-- 
2.19.1

