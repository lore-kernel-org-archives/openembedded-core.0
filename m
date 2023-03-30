Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF33FC6FD1D
	for <webhook@archiver.kernel.org>; Thu, 30 Mar 2023 21:14:13 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.38926.1680210847409167621
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Mar 2023 14:14:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=i4sKkkRd;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.54, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f54.google.com with SMTP id d13so18528138pjh.0
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 14:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680210846; x=1682802846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fLTN6Mgqlk7XAg1zyy2hujU2yzmDPZr8bo5rWdvO5Hc=;
        b=i4sKkkRdqwBNUeevPzSUzuxWcB++82GdVoRFCSg30t+5cuPggjw3mLeojws3Tz8b9f
         yPyMpLjKzcCXcLFZLYmNoKuLNK1RzYwnDcZE94CvPZaozvZMqKFPkidVR0fwaWWsd066
         34WCWB3My9PsjP/oOMklaOSX3rqgmxXtnJEl4+DQv2+pPGz/pfVdRhoHrE9mJ3ujX8JD
         3KOrMVk5yeIPzw0McgjwpagGXIwCObeDQU+P81OUCRNMynJ0pauSiIclAxKdv6BPWT1Z
         gPdf6HA2grLKWUI+quuax769tSM59Cu8m7Jr33e+3079I38DROYlaZOHljySZviza69Y
         7o0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680210846; x=1682802846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLTN6Mgqlk7XAg1zyy2hujU2yzmDPZr8bo5rWdvO5Hc=;
        b=vXCTaayPw026lCh4WOeXJJ09UKCizlfrqrNyAUKPSbLfZYQ/OVk31eCfbdgTbFsLvm
         7UA+nWzJpBQHE6IopUBzIIDJxJiUyLQfcWa71Q8obUhOM3P/8O57T3wYKpPyKYbyPaHP
         yXIUhge/OVPZBTr3vu4r1pU8I9PMjr+z6jYTlegV3PtfHllL089CfVvaAmpvZIZ8qCTM
         GV8Ke11ykKCFoCKPTXEEVdKqQ3I2BX1QJ25EsKL8siw8Cn2T/GYAOj0XOV/U8I94MjNM
         mtzaN5G/TXp/2yN9Qg6X8rr7oqJW2v+l9IyImk/jFkdt8p1PM73mzjf9uNvjMElsotBQ
         LNYA==
X-Gm-Message-State: AAQBX9fURVsvYYDLVmVaTukM/kdxJZ+sqtG5tVz+qXSnHDYZGRwK7nsF
	nzNRDjr8gHOPwfabQT5gPIQQlGJvVn4CxlQ0XJA=
X-Google-Smtp-Source: AKy350a5wMSMsqS8yo3hn6W/FE55xS5lbHSG8mlAC7aPDyjeFJShVw7P2M19dKqBhw8ko9bHVs99Qg==
X-Received: by 2002:a17:903:2803:b0:1a1:c0e6:d8d6 with SMTP id kp3-20020a170903280300b001a1c0e6d8d6mr20017834plb.54.1680210846456;
        Thu, 30 Mar 2023 14:14:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id c30-20020a631c1e000000b0050301521335sm250661pgc.11.2023.03.30.14.14.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 14:14:06 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 01/14] python3-setuptools: fix for CVE-2022-40897
Date: Thu, 30 Mar 2023 11:13:43 -1000
Message-Id: <f2230ead6c145efc902336b2b9d5a4f0ecb749de.1680210378.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680210378.git.steve@sakoman.com>
References: <cover.1680210378.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Mar 2023 21:14:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179360

From: Narpat Mali <narpat.mali@windriver.com>

Python Packaging Authority (PyPA) setuptools before 65.5.1 allows remote attackers
to cause a denial of service via HTML in a crafted package or custom PackageIndex
page. There is a Regular Expression Denial of Service (ReDoS) in package_index.py.

CVE: CVE-2022-40897

Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]

cherry-pick and modify from OE-Core rev: f574d8d57ff3fbc38e350e7a90913993081c4fdf

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...-of-whitespace-to-search-backtrack.-.patch | 31 +++++++++++++++++++
 .../python/python3-setuptools_65.0.2.bb       |  4 ++-
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch

diff --git a/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
new file mode 100644
index 0000000000..20a13da7bc
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-setuptools/0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch
@@ -0,0 +1,31 @@
+From 9e9f617a83f6593b476669030b0347d48e831c3f Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Mon, 9 Jan 2023 14:45:05 +0000
+Subject: [PATCH] Limit the amount of whitespace to search/backtrack. Fixes
+ #3659.
+
+CVE: CVE-2022-40897
+
+Upstream-Status: Backport [https://github.com/pypa/setuptools/commit/43a9c9bfa6aa626ec2a22540bea28d2ca77964be]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ setuptools/package_index.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/setuptools/package_index.py b/setuptools/package_index.py
+index 270e7f3..e93fcc6 100644
+--- a/setuptools/package_index.py
++++ b/setuptools/package_index.py
+@@ -197,7 +197,7 @@ def unique_values(func):
+     return wrapper
+ 
+ 
+-REL = re.compile(r"""<([^>]*\srel\s*=\s*['"]?([^'">]+)[^>]*)>""", re.I)
++REL = re.compile(r"""<([^>]*\srel\s{0,10}=\s{0,10}['"]?([^'" >]+)[^>]*)>""", re.I)
+ # this line is here to fix emacs' cruddy broken syntax highlighting
+ 
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
index 1a639ea333..d7cbb99c9d 100644
--- a/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_65.0.2.bb
@@ -9,7 +9,9 @@ inherit pypi python_setuptools_build_meta
 SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-easy_install.patch"
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch \
-            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch"
+            file://0001-_distutils-sysconfig.py-make-it-possible-to-substite.patch \
+            file://0001-Limit-the-amount-of-whitespace-to-search-backtrack.-.patch \
+"
 
 SRC_URI[sha256sum] = "101bf15ca723beef42c8db91a761f3748d4d697e17fae904db60c0b619d8d094"
 
-- 
2.34.1


