Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80272E77170
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 17:55:05 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web11.21214.1733334903396020134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 09:55:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hPN4wKS4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7fc8f0598cdso966495a12.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 09:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1733334903; x=1733939703; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbRE3T8jwqvMuwLpgxqiAUybtLiDZaJzQ2kuq6wjS+A=;
        b=hPN4wKS41LsOSdpbDtbGTfup4eFYVb+FMHEFOUgtGkU0jIMA0LuAVv9C9797PB8pZT
         bsHToU8fMzXyS/qw5azG0FVAVLCh/uf7yaO4MBa3cnriGnJYIJ/0zAjxS4neIAAWbwRS
         +jGgP8vxkhIuFjrWEt4nzDrStNWNbN/b4kl4+yOWGuiQl+IwTD+8Wv/b5IGJzi1pEun8
         TG24BK5/O3fU6orY+rUBKyHfjjam0OH8XYn6x6pXaF8c3Kpwok15k8nEcSbpM/r1HchJ
         flmAk/BaSjixLIlCr8BLk3DQprWCYI2kF4qjyJySvmiHWVHe25joVtlok8naici03/HS
         OcJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733334903; x=1733939703;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CbRE3T8jwqvMuwLpgxqiAUybtLiDZaJzQ2kuq6wjS+A=;
        b=jWNHM9OGrlsT6dT5/zx5/SDNmp6kGF8czxeSfIX2IKvvEto2VfdNvp3HF/8dJWKRVy
         fP0CReMtwtFLuvGCRFK4gVcobTyAkWERNUtnL1Q0C99cZMj4I1eTTrMz66aEkTFjZF4f
         PFPKR0CEPRUKdnsD3nl2GMcvfvSMDNzH5TS2eKIIr9IjOPP+a6F3eL0BjdoSflwOp4FZ
         F42g4XMTZf4fp2v02muvtfIiq6ub8HFuZb8Hafcvut+09x2/+Hi5lJSxKDwNEjwo9nMk
         L0paoiiIZTnPhd/rmNDg+/o8bCRATJEZ434rVmy4OiNcWMQyUzTNLsBHOjlbKhVWAddy
         3BzA==
X-Gm-Message-State: AOJu0YzAUUBi50Pdz89hTtGVOtdIxpat4CnYz5WbpcDXP4IvOvQ5NnPr
	/GFU4jjjUhpfWPhNzjWpAO6h1vgbl+P33mQ4AntDidskTO4ZQwI0AkDWnmZRV9I25iE3j2dOeBz
	a
X-Gm-Gg: ASbGncujXDB9rm4xuFtR3nc8jQkZMKFx9/Kb1Gp962CZiLInSg4E3LQWbZT1AUkTYS4
	mz62Ufp2txM1a15AUu0TNB2T4gj1DPTdk17XlY6/hftCjQlrP/E/C2C1vLV/MX5iZH7sg8ExzQg
	1AC/ctPcYpuA0OZhVOpltlXXPuP7Fz0ARBD79MgocX/u0nJzO5BsQLyIoIzDiyCq6JJLEdBexMU
	MuH7/niE+uJToquHd4HicIsFXl5x9QnyrdLP58=
X-Google-Smtp-Source: AGHT+IHYbG/WWV4Lpjr90qni12XkViI8tSaOLbW8QJ93xEjL/14XZ+/LaFmPU3gVzfW/nZAP1RQLcQ==
X-Received: by 2002:a05:6a20:6a21:b0:1d9:3747:fb51 with SMTP id adf61e73a8af0-1e17d38361amr461065637.8.1733334902661;
        Wed, 04 Dec 2024 09:55:02 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fc9c2d5af1sm11727765a12.16.2024.12.04.09.55.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 09:55:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 28/38] selftest/reproducible: Drop rawlogs
Date: Wed,  4 Dec 2024 09:53:55 -0800
Message-Id: <8e6210530042b722a4f7fea17e5d10cddcd8dfab.1733334655.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733334655.git.steve@sakoman.com>
References: <cover.1733334655.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 17:55:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208311

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The "rawlogs" data consists of a long string of results data which is
already in a structured data format. I can't see this is adding much
value in duplciating the data but it does create a huge string with a
lot of long problematic pathnames and inflates the results data size.

I suggest we drop this data as obsolete and not necessary.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5b2c70fab2ffa409b861d83f048b65d458d03a90)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index 49318be43a..df7d9cc159 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -163,12 +163,8 @@ class ReproducibleTests(OESelftestTestCase):
             setattr(self, v.lower(), bb_vars[v])
 
         self.extraresults = {}
-        self.extraresults.setdefault('reproducible.rawlogs', {})['log'] = ''
         self.extraresults.setdefault('reproducible', {}).setdefault('files', {})
 
-    def append_to_log(self, msg):
-        self.extraresults['reproducible.rawlogs']['log'] += msg
-
     def compare_packages(self, reference_dir, test_dir, diffutils_sysroot):
         result = PackageCompareResults()
 
@@ -282,8 +278,6 @@ class ReproducibleTests(OESelftestTestCase):
 
                 self.logger.info('Reproducibility summary for %s: %s' % (c, result))
 
-                self.append_to_log('\n'.join("%s: %s" % (r.status, r.test) for r in result.total))
-
                 self.write_package_list(package_class, 'missing', result.missing)
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'different_excluded', result.different_excluded)
-- 
2.34.1


