Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.38017.1591020739853013372
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2020 07:12:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PEtVOrfm;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id s88so4577296pjb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2020 07:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ZMvL5gIltzR+/ftxOtSg7S1/Z4AvWHKimG42jBtCmX4=;
        b=PEtVOrfmWSjBpDf/ce/VMkD7yvmcyQyvmZaIiKLZfDIQNOpIxMctoh1z58NcI7HkHm
         ZKFisVVVGe6DifEHvMux4n6/WfnsXZrzB9HR8X/K1kZtyMXAsK+TZ1yUoL+b0rgkLcUp
         VuxbYlArjeNREB3hpQ5T3KMRhgvxQ35vX+n+zHuHxziNzE+YPDw8wwe+zRbdoF36bj2y
         hg4RfUoD+Zn1tfeSXhVKGyVtEOSLhrFbn7XDFoB/+n8U89t4uH/Eoyf28yhnwFq1JiK/
         LZw8/d0i/KtFYB7d2RM1NKsHYxVMB6uLOzzt7ernWeE9fS17mBEck/8h5+edhamhd1P5
         Uorg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZMvL5gIltzR+/ftxOtSg7S1/Z4AvWHKimG42jBtCmX4=;
        b=gsg538ht42PYvuQexCDWUAswqakg0+Z1JaxtyBJDapJ5dMh0Ll5cwOQdoOkloVaGlJ
         C8fUoS0k3jJ6wnhhurElRT1no+GovDHko55zJAbC+SKW7kHVTNT8mlyz0qJbKDAG8mLJ
         FC5cwYuD3bUgAhn6Q6RSVRZ7X8vVa+hqccla47Jj9RQ8o0vL3o8bOtZP34c+dbSSzTG6
         HbLcYPt5JbRGk0l0F3mG5I4JiFwyDhOhMjeUCBcvWMC3IQ4giBeXDGJtjS2D+TljMujf
         KgzbEJxQ5b3Q/cLhHa5lV/o+cERDAWNKujLEk5vg0wosSBiUvoUOuCiGVG1GFvj9ST5s
         sd1g==
X-Gm-Message-State: AOAM533fo+Mij8jQ9LrLh8K1u4wpmKg0romAVixOawuljh9CICvKBphy
	mkWktRCqGeLYW6Y9xdKLRWylKOxUkpk=
X-Google-Smtp-Source: ABdhPJyf+4BlxAho1TvkCCBqMMk0FakvWE2u/ESaEsPY41eqCW05twq8KOhXqJ07WoYEk652dYadAA==
X-Received: by 2002:a17:90b:188c:: with SMTP id mn12mr8053727pjb.8.1591020738979;
        Mon, 01 Jun 2020 07:12:18 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u19sm5509859pfk.98.2020.06.01.07.12.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2020 07:12:18 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] qemurunner: fix ip fallback detection
Date: Mon,  1 Jun 2020 04:11:20 -1000
Message-Id: <9c2efe41d5d894094552c4bbc4180675a5aac751.1591020366.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591020366.git.steve@sakoman.com>
References: <cover.1591020366.git.steve@sakoman.com>

From: Konrad Weihmann <kweihmann@outlook.com>

When falling back from detecting ip from /proc/./cmdline the
output of runqemu is acutally
'Network configuration: ip=192.168.7.2::192.168.7.1::255.255.255.0'
which doesn't match the given regex and leading to run failure, although
IP is detectable.
Fix regex by inserting an optional 'ip=' prefix to first IP

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 75f2471d15fab024775c59cb70c54e3f25f9ae72)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index cd95d33bdc..77ae08ebeb 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -287,7 +287,7 @@ class QemuRunner:
                 self.logger.debug("qemu cmdline used:\n{}".format(cmdline))
             except (IndexError, ValueError):
                 # Try to get network configuration from runqemu output
-                match = re.match(r'.*Network configuration: ([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
+                match = re.match(r'.*Network configuration: (?:ip=)*([0-9.]+)::([0-9.]+):([0-9.]+)$.*',
                                  out, re.MULTILINE|re.DOTALL)
                 if match:
                     self.ip, self.server_ip, self.netmask = match.groups()
-- 
2.17.1

