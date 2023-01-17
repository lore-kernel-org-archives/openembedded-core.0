Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA024C63797
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 14:09:04 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.196991.1673964539796302408
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jan 2023 06:09:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ErjrPIXd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.182, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f182.google.com with SMTP id k18so9608515pll.5
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 06:09:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lh6vq5CF0VwNgINokrSPSrKjjxUpGsTg3CHyEJU+css=;
        b=ErjrPIXdsrZYKWF0bS57I+dD+VetRXI9hEN7HTRBhOUyr4fCaPqRPMbSqGCe2slLIK
         3UywkKq+c9cb8piPJD+cztiBZcEufdTNZzjo3BmFpGEVyEEQAiiQVt3Ba8TidQ7M6cig
         y/tm18k56md5iyGmP4cjAtFwK6VYxp+nBMyzV5KvUyaBz0hOodZOtVgGZuVQsHwfM0KF
         kqckyGhFwmTwAgqJA0hdurhOueJSCezPrp30k6mSc7q4BpNt20eH2oq9YwFUp9tWzrVC
         cfC4zur1meuLfjPE4B5H1baPgrGX1AnQC9dwOqpEp2T2ZuIBHkDt98j9Xo9SjQr5hQDv
         nnCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lh6vq5CF0VwNgINokrSPSrKjjxUpGsTg3CHyEJU+css=;
        b=AZcG66bFpgmVhTJHfShixwLtXyB9MTvf90ynZ/IXPdglT2yHO3rd/nBDxvIrfQGnF4
         WiQanFINg1/0FB6rAE3+rXwuxpsYrPi1mCp2eujBneCGyp6chGD9D/TUEsdhc7VZU7Bq
         ogLHK+8phMKObqV5BUhKYQ461AV17re4WxMLTv7t1IN3vAukVZUbZPKjY4yrzMnEMLr9
         Tgz7C/ml0R2mA4XxYQKUeF1YnUE/Xf6Gh4Ig0HU2ZTAHqnBNoast2eWUtYquiPtjEzZE
         lTJc7Tw76Dn6Z+1KZ7LWOAO5ygh30ex/9lQcIcbEE8b3/e+XVBcUEe0LFd3krfdWdnnk
         lupQ==
X-Gm-Message-State: AFqh2kpmj+/UkpQSn7kKFbk1x5oflkxiT9XruyWpFqx1t4rzHpYUbAlR
	8dXngOs6f+X3lUNf6waA6ixHloa8I6QhfgCUY30=
X-Google-Smtp-Source: AMrXdXuSCpoCPfMEFzRSA1WFc5c2o7ctfxImrbGW+GdJizvQBLbz8X4ZouVYIXeSW2ATBkps8GFXQA==
X-Received: by 2002:a17:903:48d:b0:187:1b7a:6930 with SMTP id jj13-20020a170903048d00b001871b7a6930mr3734390plb.6.1673964542558;
        Tue, 17 Jan 2023 06:09:02 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-5-74.hawaiiantel.net. [72.253.5.74])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090264c200b001930b7e2c04sm18197788pli.287.2023.01.17.06.09.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 06:09:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] python3-wheel: fix for CVE-2022-40898
Date: Tue, 17 Jan 2023 04:08:40 -1000
Message-Id: <0974291e545aec68755dfb634c75dca37cca1ea9.1673964419.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1673964419.git.steve@sakoman.com>
References: <cover.1673964419.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Jan 2023 14:09:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176042

From: Narpat Mali <narpat.mali@windriver.com>

An issue discovered in Python Packaging Authority (PyPA) Wheel 0.37.1
and earlier allows remote attackers to cause a denial of service via
attacker controlled input to wheel cli.

CVE: CVE-2022-40898

Upstream-Status: Backport [https://github.com/pypa/wheel/commit/88f02bc335d5404991e532e7f3b0fc80437bf4e0]

Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
---
 ...tential-DoS-attack-via-WHEEL_INFO_RE.patch | 32 +++++++++++++++++++
 .../python/python3-wheel_0.37.1.bb            |  4 ++-
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch

diff --git a/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch b/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
new file mode 100644
index 0000000000..bdaae7dd10
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-wheel/0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch
@@ -0,0 +1,32 @@
+From a9a0d67a663f20b69903751c23851dd4cd6b49d4 Mon Sep 17 00:00:00 2001
+From: Narpat Mali <narpat.mali@windriver.com>
+Date: Wed, 11 Jan 2023 07:45:57 +0000
+Subject: [PATCH] Fixed potential DoS attack via WHEEL_INFO_RE
+
+CVE: CVE-2022-40898
+
+Upstream-Status: Backport [https://github.com/pypa/wheel/commit/88f02bc335d5404991e532e7f3b0fc80437bf4e0]
+
+Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
+---
+ src/wheel/wheelfile.py | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/wheel/wheelfile.py b/src/wheel/wheelfile.py
+index 21e7361..ff06edf 100644
+--- a/src/wheel/wheelfile.py
++++ b/src/wheel/wheelfile.py
+@@ -27,8 +27,8 @@ else:
+ # Non-greedy matching of an optional build number may be too clever (more
+ # invalid wheel filenames will match). Separate regex for .dist-info?
+ WHEEL_INFO_RE = re.compile(
+-    r"""^(?P<namever>(?P<name>.+?)-(?P<ver>.+?))(-(?P<build>\d[^-]*))?
+-     -(?P<pyver>.+?)-(?P<abi>.+?)-(?P<plat>.+?)\.whl$""",
++    r"""^(?P<namever>(?P<name>[^-]+?)-(?P<ver>[^-]+?))(-(?P<build>\d[^-]*))?
++     -(?P<pyver>[^-]+?)-(?P<abi>[^-]+?)-(?P<plat>[^.]+?)\.whl$""",
+     re.VERBOSE)
+ 
+ 
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
index 2f7dd122ba..3ee03ddd36 100644
--- a/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
+++ b/meta/recipes-devtools/python/python3-wheel_0.37.1.bb
@@ -8,7 +8,9 @@ SRC_URI[sha256sum] = "e9a504e793efbca1b8e0e9cb979a249cf4a0a7b5b8c9e8b65a5e39d495
 
 inherit python_flit_core pypi
 
-SRC_URI += " file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch"
+SRC_URI += "file://0001-Backport-pyproject.toml-from-flit-backend-branch.patch \
+            file://0001-Fixed-potential-DoS-attack-via-WHEEL_INFO_RE.patch \
+           "
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.25.1


