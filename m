Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.43294.1600697794880366216
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2020 07:16:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=ZJ1oPV7E;
 spf=pass (domain: blade-group.com, ip: 209.85.221.46, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f46.google.com with SMTP id z4so12958130wrr.4
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2020 07:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G+AxQ3nt3/lgD2W9HL82kVz+cvPQ4a+njc9SIQxkO08=;
        b=ZJ1oPV7EEm22FvWkPElPkrUlzi0vII6Kft6/ELrQ/dTgXv/Z0OuvS8p8JbEF7u+SYB
         mZBPZ4/88VJhZY3LvmWAHFhwaXlKW/QXClkPv5odRuxIr4gr74wOfbO+/rM/9wRR8o3S
         X/oeR407sahekL+0bUezJNkK95psYHUQ4KxYG/XAxNqqCY7yRqcFLyce87zBEmYV7CvO
         e7Pbe6p/w+jVxEIZrBUHfZve0+O1ZFQBY+9PDFstSahH3C/C7/3op2RWvRZk5tZYj6l+
         WsjROa2XBFtuBIsce67rw1OHGwowWTtU+3VGX6kkPmICAJh2gGOXpbxL5wTM48RdvMin
         CdXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G+AxQ3nt3/lgD2W9HL82kVz+cvPQ4a+njc9SIQxkO08=;
        b=bebGMaxgM1/KPe1UuArvA5v99kY+CY8toCLIN3uPa7rs9IxLeXYugt5DbH8BB7Hg55
         BfrJDOqsxIRIJdo8z2XEZcGeN7ylhSCj/ZwyNvhj5kakNdT4/LUSuCaxaXwJ/06yESA6
         98tuZNWSF25NMhqJ/vdrNX5H7ZqcJgFYEbJM6O7ocRqgiLTkTcyOizDDjY3CVQj9ICZ3
         4MQcgxh8lRluwhepzBxje1WOKuHZyraRAnVhVHs7eX/iXY6Yrnp8weQ5tj8Mu1aaVU7u
         T9Rd60VSSq1rmXG0NX16HcEMen66P3c8AJ9LY1mCSVIp55JK6TjVItW0A7ovn1v3TUjV
         QyMA==
X-Gm-Message-State: AOAM531MUMM5ZsI02ywKc8n4F3hn3DZsFSIZHdnH+U7/hQjNMjkYE58Z
	VzLD0lASiZad08Icx26l6F5AFEEKBAAi2biD
X-Google-Smtp-Source: ABdhPJzcaFsDGJt9NhEUVa6dpll06jCDC1PkiEDSmfoNgl+wJ0Y1kIC0PkAI+np8jCFrtl1wHhf/YA==
X-Received: by 2002:adf:db52:: with SMTP id f18mr52487842wrj.397.1600697793025;
        Mon, 21 Sep 2020 07:16:33 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id f14sm22524804wrt.53.2020.09.21.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:16:32 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH 6/8] systemtap-native: fix finding proper System.map
Date: Mon, 21 Sep 2020 16:15:42 +0200
Message-Id: <20200921141544.3145189-7-yann@blade-group.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200921141544.3145189-1-yann@blade-group.com>
References: <20200921141544.3145189-1-yann@blade-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

Upstream looks for unversionned System.map file in kernel_build_tree,
and if this fails goes for versionned filename in $sysroot/boot/.
OTOH we have a versionned filename in kernel_build_tree.
---
 .../systemtap/systemtap-native_git.bb         |  6 +++++
 .../systemtap/system-map-location.patch       | 26 +++++++++++++++++++
 2 files changed, 32 insertions(+)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/system-map-location.patch

diff --git a/meta/recipes-kernel/systemtap/systemtap-native_git.bb b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
index 19cc1cf0f0..e24abcc2d6 100644
--- a/meta/recipes-kernel/systemtap/systemtap-native_git.bb
+++ b/meta/recipes-kernel/systemtap/systemtap-native_git.bb
@@ -3,4 +3,10 @@ require systemtap_git.bb
 
 inherit native
 
+# don't look in /boot, and use kernel version to find proper
+# System.map-xxx in kernel build tree
+SRC_URI += "\
+ file://system-map-location.patch \
+"
+
 addtask addto_recipe_sysroot after do_populate_sysroot before do_build
diff --git a/meta/recipes-kernel/systemtap/systemtap/system-map-location.patch b/meta/recipes-kernel/systemtap/systemtap/system-map-location.patch
new file mode 100644
index 0000000000..61e477bf69
--- /dev/null
+++ b/meta/recipes-kernel/systemtap/systemtap/system-map-location.patch
@@ -0,0 +1,26 @@
+Index: git/session.cxx
+===================================================================
+--- git.orig/session.cxx
++++ git/session.cxx
+@@ -2021,20 +2021,12 @@ systemtap_session::parse_kernel_exports
+ int
+ systemtap_session::parse_kernel_functions ()
+ {
+-  string system_map_path = kernel_build_tree + "/System.map";
++  string system_map_path = kernel_build_tree + "/System.map-" + kernel_release;
+   ifstream system_map;
+ 
+   system_map.open(system_map_path.c_str(), ifstream::in);
+   if (! system_map.is_open())
+     {
+-      if (verbose > 1)
+-	clog << _F("Kernel symbol table %s unavailable, (%s)",
+-		   system_map_path.c_str(), strerror(errno)) << endl;
+-
+-      system_map_path = sysroot + "/boot/System.map-" + kernel_release;
+-      system_map.clear();
+-      system_map.open(system_map_path.c_str(), ifstream::in);
+-      if (! system_map.is_open())
+         {
+ 	  if (verbose > 1)
+ 	    clog << _F("Kernel symbol table %s unavailable, (%s)",
-- 
2.28.0

