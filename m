Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.25057.1598550853162019564
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2020 10:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=QCO0TfSo;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id x12so5239561qtp.1
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Aug 2020 10:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oSuMNXRXqw8Z4FOa0XTR9d42840rpF1Fw4HcQy0fZg0=;
        b=QCO0TfSodZOGs2fQWrQTqn9zfKBeWxeAq5YUauTzSvzrmf0kQZY0NEGT/+4J+mupy6
         suH88B6LdPPR0AqinQN+ddUjuC24Zv4TZRpWC3b/sXWEDbVIAd8Q7wWdiKxDzZ27GyRT
         PptqY2myx4wwjKXxq6Ki/mJYajOAbhY8cnbRgDUQt804lwOc7Q6aKOGTd2FYwNJLXLYq
         8L39u6nAxid7nPtl1cHRHtljltSGfcW2TgUiOIfuIvVjoy/6ntgB+Rmw+xizOHHLAS1L
         F8NFHWo8IjNkJdpniykI8UlNhb0bO6FChZjYTsEQVCAbf4Xq5x54fbpgrB6t+ZFt5JPC
         KK1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oSuMNXRXqw8Z4FOa0XTR9d42840rpF1Fw4HcQy0fZg0=;
        b=U91XXeiOMY+pQGd6k4j4ROecVUjDgdyN/uI7nOJTyJI18223tnsqx/J7rcwB0VAFDc
         rsfi5ve8/iLMpKmH3BUTRIS7p6Cg83qoKDgNB4NyBmCIwQRgQxjHwfEDElu1oPy8b9z4
         A0N8d5AiEuAheRsatkztR+tqyxG3QGD8T1AEGHCUwkPt05Ch1eR1Wa9EZOCL9A/LOxEU
         p0xbq6aq0fZprNI4eT9BoliNQWKBY5YM7xttiSlNZEUBYrSWe+WZ8F6Qx/JWKRopQ8tj
         3TfyLRH7Ja3v3UTA6q50nw8nuHhjj4wjYoIK8QY9kFrwGB9PsQtZmk6OFHN8bv+NvcuV
         TsqQ==
X-Gm-Message-State: AOAM533nsI74hF/GuaLSjpVKfzKzFuSJR3LB5ZqX+raEcUS4a+ImN2Vc
	CObalI9F8RF/p+552ngSay4=
X-Google-Smtp-Source: ABdhPJw7o5eNVg6nbZAxFA/rmcXnSbmUYLHglF8EW1ypiqDu5CXntoZ4XfeAj3Ryxo/N7KjzCLUXrA==
X-Received: by 2002:ac8:3876:: with SMTP id r51mr9214064qtb.181.1598550852262;
        Thu, 27 Aug 2020 10:54:12 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id f4sm2339963qtp.38.2020.08.27.10.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2020 10:54:11 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] kernel-yocto: allow promotion of configuration warnings to errors
Date: Thu, 27 Aug 2020 13:54:03 -0400
Message-Id: <871d8aa098f82e7319b7d54df32a1623f72fbe74.1598550535.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1598550535.git.bruce.ashfield@gmail.com>
References: <cover.1598550535.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

It was requested to add the ability to upgrade configuration warnings
to errors, so that they can't be missed in a build.

Add a flag KMETA_AUDIT_WERROR, that when set, triggers a bb.fatal at
the end of configuration checking if any warnings are found.

This is off by default, but is available for those that want to enable
it in their kernel recipe or bbappend.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes/kernel-yocto.bbclass | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 34a0ff8f84..4f6698135b 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -18,6 +18,7 @@ SRCREV_FORMAT ?= "meta_machine"
 KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
+KMETA_AUDIT_WERROR ?= ""
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
@@ -546,6 +547,8 @@ python do_kernel_configcheck() {
 
     config_check_visibility = int(d.getVar("KCONF_AUDIT_LEVEL") or 0)
     bsp_check_visibility = int(d.getVar("KCONF_BSP_AUDIT_LEVEL") or 0)
+    kmeta_audit_werror = d.getVar("KMETA_AUDIT_WERROR") or ""
+    warnings_detected = False
 
     # if config check visibility is "1", that's the lowest level of audit. So
     # we add the --classify option to the run, since classification will
@@ -572,6 +575,7 @@ python do_kernel_configcheck() {
             with open (outfile, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: specified values did not make it into the kernel's final configuration:\n\n%s" % results)
+                warnings_detected = True
 
     # category #2: invalid fragment elements
     extra_params = ""
@@ -591,8 +595,9 @@ python do_kernel_configcheck() {
 
         if bsp_check_visibility and os.stat(outfile).st_size > 0:
             with open (outfile, "r") as myfile:
-               results = myfile.read()
-               bb.warn( "[kernel config]: This BSP contains fragments with warnings:\n\n%s" % results)
+                results = myfile.read()
+                bb.warn( "[kernel config]: This BSP contains fragments with warnings:\n\n%s" % results)
+                warnings_detected = True
 
     # category #3: redefined options (this is pretty verbose and is debug only)
     try:
@@ -613,6 +618,10 @@ python do_kernel_configcheck() {
             with open (outfile, "r") as myfile:
                 results = myfile.read()
                 bb.warn( "[kernel config]: This BSP has configuration options defined in more than one config, with differing values:\n\n%s" % results)
+                warnings_detected = True
+
+    if warnings_detected and kmeta_audit_werror:
+        bb.fatal( "configuration warnings detected, werror is set, promoting to fatal" )
 }
 
 # Ensure that the branches (BSP and meta) are on the locations specified by
-- 
2.19.1

