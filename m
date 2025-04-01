Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43600C3DA4A
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 22:36:30 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.69.1743546986165476154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 15:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zUAZhlM4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.180, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22403cbb47fso127287295ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 15:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1743546985; x=1744151785; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21WfVQUq+lX0KRd8sOtbbIqueOgE3o5Rq/Cg1eEWE6o=;
        b=zUAZhlM4sJmmPUxDh2LhRNZjf3C/WBwSdn1QldH0pgPGh5t0WsjfpzrtMJnimrU8Mb
         pzww0YGhp9lz4opKMcQsMTxtfEXSiJ2hLLmxbEPKRzv7yqtdC8kPOqZimpcG6AjVQHWO
         KlEe4YKvHhDy7/6HI6sJ/8Dv7fmsFD0HImoQrD8K3/upQpFVz65oGwyYkTBcyQUMxnY7
         nmOZf2aQejB1i99DcutJWj/2F2+w1FfyfcC7AUCQz2fmxLJW57P0CdxOeyVlDiC/VzJe
         8925rpXMszYvN8hObDWlZLxcIbd8cRO2IJ3gGa8CEG16FMkGfzuRPeQroy/tbDZ/leKH
         N8BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743546985; x=1744151785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=21WfVQUq+lX0KRd8sOtbbIqueOgE3o5Rq/Cg1eEWE6o=;
        b=AKKYALtdgD6jFhIAZbTKuw79NkKCwKCqVZgo8Bb7ngyWxPehDOhBxv71rM3gd30brx
         GT/hNuuNk9aGi5nBziI5a1+la5K0Gop/9dlQEX7PEvFWMrI3dNtIyUOSiTwgvn5JnQaa
         CeZNUlFmV4v67n4jnmTtIvJ5vp+gBbN6fNjb3nApt+JDvTHtVE108TCkQgf0AQSFvOjD
         spPvZWNv93+YTdyDwJ7AgnxzUfoeggePab16McJdrqpYa8/OcNyItIiqclnDtj1TPDTN
         ZsLUzETnyssgeVmptJ+KQqkdyCNVP3V44b6cS7wTb31HHSRMw1FWPW/PMCxnoYia1PTQ
         w02A==
X-Gm-Message-State: AOJu0Yyth7SFyOlMxxNjt/SHhG3MhW8s88NShiKTMNizK+FikJDGmX/P
	VbTDweYYzwqR/GnwrXv461Zi3M4P/iG5HMEboX6mXf1dpV4Md4sg/uoHC+IJ5qaOgM6+nKU+M+i
	Z
X-Gm-Gg: ASbGncvmlEHWwFTD0XyC2k/7QiQfFKV5/rehHh8RnCfBumUJle9EeEk6/WNjhWKjF2v
	UXrF3cYJ9g8C1f4HO8i2t/74+6Z7znNmwnwEg0UXsmfo80/jMOjd6VZZ46vdSmMiItdlenqbl9q
	cUFgW3j0dq13G5jSybf6jfiORFQUu4qTG9PA2nicyxrkwdn2x1evIA/r6nmR7u+yuJl8RZCcdRB
	49c7Zmniaz94Qv93fNYVPBPSrmDtXpwrG9ruhXry28ZG/IiFmv7H4NC8xkWlH4UWejGORYXV3Lg
	0B2IAwrhbhq7wVHIjqK+1jCv6TSUy+zDwM48
X-Google-Smtp-Source: AGHT+IHVlFMGNds50dSd2TmKbt5061U85FS2JsE1PQyCALC1SkGORhR4WpGzwOQxhm4orT/xUoy5Ng==
X-Received: by 2002:a17:902:f542:b0:21f:8453:7484 with SMTP id d9443c01a7336-2292f975694mr199926145ad.30.1743546985328;
        Tue, 01 Apr 2025 15:36:25 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:6021:5333:bc00:e45b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e226a7sm9534241b3a.48.2025.04.01.15.36.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:36:24 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 1/8] zlib: fix CVE-2014-9485
Date: Tue,  1 Apr 2025 15:36:08 -0700
Message-ID: <32c4b28fc06e39ab8ef86aebc5e1e1ae19934495.1743546795.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1743546795.git.steve@sakoman.com>
References: <cover.1743546795.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 22:36:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214153

From: Divya Chellam <divya.chellam@windriver.com>

Directory traversal vulnerability in the do_extract_currentfile
function in miniunz.c in miniunzip in minizip before 1.1-5 might
allow remote attackers to write to arbitrary files via a crafted
entry in a ZIP archive.

Reference:
https://security-tracker.debian.org/tracker/CVE-2014-9485

Upstream-patch:
https://github.com/madler/zlib/commit/14a5f8f266c16c87ab6c086fc52b770b27701e01

Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../zlib/zlib/CVE-2014-9485.patch             | 64 +++++++++++++++++++
 meta/recipes-core/zlib/zlib_1.2.11.bb         |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-core/zlib/zlib/CVE-2014-9485.patch

diff --git a/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch b/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch
new file mode 100644
index 0000000000..bf575d59f7
--- /dev/null
+++ b/meta/recipes-core/zlib/zlib/CVE-2014-9485.patch
@@ -0,0 +1,64 @@
+From 14a5f8f266c16c87ab6c086fc52b770b27701e01 Mon Sep 17 00:00:00 2001
+From: Matt Wilson <msw@amazon.com>
+Date: Wed, 17 Jan 2024 14:46:18 -0800
+Subject: [PATCH] Neutralize zip file traversal attacks in miniunz.
+
+Archive formats such as .zip files are generally susceptible to
+so-called "traversal attacks". This allows an attacker to craft
+an archive that writes to unexpected locations of the file system
+(e.g., /etc/shadow) if an unspecting root user were to unpack a
+malicious archive.
+
+This patch neutralizes absolute paths such as /tmp/moo and deeply
+relative paths such as dummy/../../../../../../../../../../tmp/moo
+
+The Debian project requested CVE-2014-9485 be allocated for the
+first identified weakness. The fix was incomplete, resulting in a
+revised patch applied here. Since there wasn't an updated version
+released by Debian with the incomplete fix, I suggest we use this
+CVE to identify both issues.
+
+Link: https://security.snyk.io/research/zip-slip-vulnerability
+Link: https://bugs.debian.org/774321
+Link: https://bugs.debian.org/776831
+Link: https://nvd.nist.gov/vuln/detail/CVE-2014-9485
+Reported-by: Jakub Wilk <jwilk@debian.org>
+Fixed-by: Michael Gilbert <mgilbert@debian.org>
+
+CVE: CVE-2014-9485
+
+Upstream-Status: Backport [https://github.com/madler/zlib/commit/14a5f8f266c16c87ab6c086fc52b770b27701e01]
+
+Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
+---
+ contrib/minizip/miniunz.c | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/contrib/minizip/miniunz.c b/contrib/minizip/miniunz.c
+index 3d65401..479e475 100644
+--- a/contrib/minizip/miniunz.c
++++ b/contrib/minizip/miniunz.c
+@@ -367,6 +367,20 @@ int do_extract_currentfile(uf,popt_extract_without_path,popt_overwrite,password)
+         else
+             write_filename = filename_withoutpath;
+ 
++        if (write_filename[0]!='\0')
++        {
++            const char* relative_check = write_filename;
++            while (relative_check[1]!='\0')
++            {
++                if (relative_check[0]=='.' && relative_check[1]=='.')
++                    write_filename = relative_check;
++                relative_check++;
++            }
++        }
++
++        while (write_filename[0]=='/' || write_filename[0]=='.')
++            write_filename++;
++
+         err = unzOpenCurrentFilePassword(uf,password);
+         if (err!=UNZ_OK)
+         {
+-- 
+2.40.0
+
diff --git a/meta/recipes-core/zlib/zlib_1.2.11.bb b/meta/recipes-core/zlib/zlib_1.2.11.bb
index 393ac61e3d..dc8f7c6c85 100644
--- a/meta/recipes-core/zlib/zlib_1.2.11.bb
+++ b/meta/recipes-core/zlib/zlib_1.2.11.bb
@@ -13,6 +13,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libpng/${BPN}/${PV}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
 	    file://CVE-2022-37434.patch \
            file://CVE-2023-45853.patch \
+           file://CVE-2014-9485.patch \
            "
 UPSTREAM_CHECK_URI = "http://zlib.net/"
 
-- 
2.43.0


