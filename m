Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.2592.1620321187786795384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 May 2021 10:13:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=a38RhkeK;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id b15so5631564pfl.4
        for <openembedded-core@lists.openembedded.org>; Thu, 06 May 2021 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y0aiJSgA7xdRycqjCFFdpue0o63AaK8oup7vCmjOR9A=;
        b=a38RhkeKPD/9HpU6kkEavo+Sk44NhjXBvMy0ESmxbfzcteSx2KLrZiyUbc8W0XS+Gf
         fwlPignk+FgvmWb8SntUgX9DykmUSN6sne6CaXNnPgHzqkJWrufWXmNUHACJDPltxQLL
         Ah6WcjbydAUMY+m+MR9aPVNxhas3A7UL1H5cx7XkdiTTTaUysN/iVUOTvaHLJI3VSAHn
         YpTkJn4bYlE8OXQmoZR6ZCxnq2YCXWyDWXUkn9WZ1tFsnj+ZJuns37F54bo+2RftXP6v
         Yu88oaJhv9amJLqpdvZ8G7cMi3FWc7ex5W5JayjXG3q52FSs/ZthXxaGmt1tQ9zUmxQj
         KBDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y0aiJSgA7xdRycqjCFFdpue0o63AaK8oup7vCmjOR9A=;
        b=TUj2ZnC+SIX27L4DI4jf5fIhZkgakwzjUBv3ZxH5OfbdqjgdkBlx9qt6UHfOofhFNr
         N4t5m1HADQEGhgSKmXvJ9k55ZVqRPNVcbIHpcDpfYxPbXCDznWueHuB1Dc30kqGcXkxp
         ecEdY7repsbU5mcXCTNwn1LpuPapx32B4oo4LLffmhwK9UxsNClgxj/r6spk8hXaevW8
         jAtbzjTlkeMuomUafsH2cuDvpgny9BimFN439vhVo1CAEVKVIpRdPRU9dnikRPpFvOHL
         MEphgTIRSa+yDiQs2VTxGXFV/q2acCT6Keh97KFSlK9QBdaFK3uWMHIKn5o78Ip0RWc7
         z1Ew==
X-Gm-Message-State: AOAM530zwz1OHpRgpRhA4IZ/Nw9WC0VgnOIf60d8HZsyJrm0+mE6a/uv
	feLTADFblKf7w9Zkc5v4WcvQvHJfTLSqcdZm
X-Google-Smtp-Source: ABdhPJwFE4GtXWAi3PmJLqda9UctiTpPzTfa/GktGAHibNxoZEApBoLrfXqUK4k4CcAoR07O7RjBjQ==
X-Received: by 2002:a62:ee09:0:b029:247:56aa:dfa6 with SMTP id e9-20020a62ee090000b029024756aadfa6mr5767943pfi.69.1620321186285;
        Thu, 06 May 2021 10:13:06 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id n18sm2265997pgj.71.2021.05.06.10.13.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 May 2021 10:13:05 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [PATCH] cve-extra-exclusions.inc: add exclusion list for intractable CVE's
Date: Thu,  6 May 2021 07:12:32 -1000
Message-Id: <20210506171232.2832063-1-steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The preferred methods for CVE resolution are:

1. Version upgrades where possible
2. Patches where not possible
3. Database updates where version info is incorrect
4. Exclusion from checking where it is determined that the CVE
   does not apply to our environment

In some cases none of these methods are possible. For example the
CVE may be decades old with no apparent resolution, and with broken
links that make further research impractical.

This patch creates a mechanism for users to remove this type of
CVE from the cve-check results via an optional include file.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../distro/include/cve-extra-exclusions.inc    | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta/conf/distro/include/cve-extra-exclusions.inc

diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/conf/distro/include/cve-extra-exclusions.inc
new file mode 100644
index 0000000000..956b3a9a3c
--- /dev/null
+++ b/meta/conf/distro/include/cve-extra-exclusions.inc
@@ -0,0 +1,18 @@
+# This file contains a list of CVE's where resolution has proven to be impractical.
+# It contains all the information we are aware of about an issue and analysis about
+# why we believe it can't be fixed/handled. Additional information is welcome through
+# patches to the file.
+#
+# Include this file in your local.conf or distro.conf to exclude these CVE's
+# from the cve-check results
+
+# strace https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0006
+# CVE is more than 20 years old with no resolution evident
+# broken links in CVE database references make resolution impractical
+CVE_CHECK_WHITELIST += "CVE-2000-0006"
+
+# groff:groff-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2000-0803
+# CVE is more than 20 years old with no resolution evident
+# broken links in CVE database references make resolution impractical
+CVE_CHECK_WHITELIST += "CVE-2000-0803"
+
-- 
2.25.1

