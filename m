Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web11.217.1616596806528702689
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Mar 2021 07:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=zh82odH/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id t18so11839570pjs.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Mar 2021 07:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=IkJWsBnxnqIvFHBEihLDcKevVy2IqQwhq12hgFVqBa4=;
        b=zh82odH/jCMpRiUUpq5UcSeW/6FFafp7YrP/uLQk/40V+7xJfSU9HOSdrQOfFCk9V7
         amJOazFJONZjoxIrMJvYhziXMkstZAGe3dN+NQAY704mdODFb9XrZFv/2pCF9GOI6K5H
         u9k3SPvY9/vlRY/9cO1V9qoRXj+Oum8wpDm8g0WNg9Onp5pPWfFUmqY3Rf6qrxG09bWM
         XGsfUIgX/6pkUGysuvN/t5T0m9yX4z1d36+QQghKnzCUZMxjN5z91sHIRUMY7R3JKUAA
         wjLYUkI/Nj1H199B2pjHdl7POe/nZ1e8pw7qIIH9YC2EOeksxeqFtowRn0hm43RTYFRx
         tQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IkJWsBnxnqIvFHBEihLDcKevVy2IqQwhq12hgFVqBa4=;
        b=rlusyLbyhuCNEhnuVaSjMmYejg6l+1+QeFkPZXQCI1B5WNr2jTQ8CeezihHpIO/QjM
         HHmLsLTwl/T7CioTKG5d2Ege8dgOJ4LUuSn/5wvoTNSsJrAwJgZehHjRTlU1hQJBqTum
         WprPFCVm6b6wKwqseUI9ltQHn8CfQgcacysDaLQK+81M9ZWOdBJDXVpSJPaeEoIh88ww
         V0yTpn1uoB9T7tPSsxBExt9hahZdPa7QVlWN4AtNwxemxCqbTsdf7SCXUzVPh3jlMQwc
         YBBx/aZn1FAMd61F7ylG6MjCIiNqTvR2ThOxBvEwA4a0+A6g9PG0qkruy0fgAde/i6F4
         Hp7Q==
X-Gm-Message-State: AOAM5339zozGiYxM2Sq3xSSXfeGyNpbhjqiqe9A7WUemVADbPiXm62ec
	5Y+/Yt8xXiNca7dGCxZisgULdT/6rVC/wndH
X-Google-Smtp-Source: ABdhPJwH5+sUeRscZtW2cyrSavzODpYdYWdRDTkSdA/eCYCDlDw95KJwq/SFJtATS/YO97HUL0zt4Q==
X-Received: by 2002:a17:90a:c096:: with SMTP id o22mr3825753pjs.119.1616596804812;
        Wed, 24 Mar 2021 07:40:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w17sm2705806pgg.41.2021.03.24.07.40.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 07:40:04 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 13/21] cve-update-db-native: consider version suffix when update CVE db
Date: Wed, 24 Mar 2021 04:39:08 -1000
Message-Id: <b8d3e1754faea3ba0b6e07d5a830fbab12b5f53d.1616596544.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1616596544.git.steve@sakoman.com>
References: <cover.1616596544.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lee Chee Yang <chee.yang.lee@intel.com>

some record from NVD can merge or split suffix from version, for
example:
  CVE-2017-15906
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:5.0:p1:*:*:*:*:*:*"
  "cpe23Uri" : "cpe:2.3:a:openbsd:openssh:4.7p1:*:*:*:*:*:*:*"

in such case include the suffix into version when update local CVE db.

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 13cc68197f81bb7c76fa1abecc5dd720b8bdb8d5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/cve-update-db-native.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/meta/cve-update-db-native.bb b/meta/recipes-core/meta/cve-update-db-native.bb
index 9e8e006a32..5d9fb59cbc 100644
--- a/meta/recipes-core/meta/cve-update-db-native.bb
+++ b/meta/recipes-core/meta/cve-update-db-native.bb
@@ -137,9 +137,14 @@ def parse_node_and_insert(c, node, cveId):
             product = cpe23[4]
             version = cpe23[5]
 
+            if cpe23[6] == '*' or cpe23[6] == '-':
+                version_suffix = ""
+            else:
+                version_suffix = "_" + cpe23[6]
+
             if version != '*' and version != '-':
                 # Version is defined, this is a '=' match
-                yield [cveId, vendor, product, version, '=', '', '']
+                yield [cveId, vendor, product, version + version_suffix, '=', '', '']
             elif version == '-':
                 # no version information is available
                 yield [cveId, vendor, product, version, '', '', '']
-- 
2.25.1

