Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F08AC7EE3A
	for <webhook@archiver.kernel.org>; Fri, 27 Jun 2025 06:30:34 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.7314.1751005826325671778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Jun 2025 23:30:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=fAZayVhU;
 spf=pass (domain: linaro.org, ip: 209.85.208.172, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32add56e9ddso15105651fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Jun 2025 23:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751005824; x=1751610624; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DTUB9X5GgYcgEpNF4OJGtzgYuPO+9/qpUKDwNSCqCA=;
        b=fAZayVhU5IVAPKX8SMg+98J8majnTJH01jXFJXZrM8Tl3VT43/1dzmGiu/9NRp3uH7
         VqqxeDkAMB74W53lFsSXFS1DbfEROKy1oebe3WDjuefWkKygYkBPf77mfrrhz3d3HfwI
         F1o1RTaW9jtg3ABCfTXt0DTnh0vFPica4hnUFudR0tJDVe26zDEXIBnUADemVtyr0oQ4
         gBIgCyYy0JPc/oA7CxYvosqTtxG5L9AmjjOYpdT3yI5s10JZZ3nSH2IwwjzvyPNN6WX7
         ir/CcoI/Bqsp2g6tqieuh43v1sFvnvBYlXsBJ5iqwfNiSGU1cjhZnVzMReIVMx1inDSF
         i9Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751005824; x=1751610624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DTUB9X5GgYcgEpNF4OJGtzgYuPO+9/qpUKDwNSCqCA=;
        b=incMyKloaB2y67bRdd8YNDG1b0r9AxM19bymnrPKtLF+ADf7ZLNmylkui4r0+754f6
         V9Qj9jpo0/T/zhMzpO85Zk/fiVopx96Kcn1ZpgyiOZlPWVKr7A4s7NDIc/2lTJKp6rG2
         JulRZrgQMygJLxkDTh1F1GEnwD/ggZ/dDEXToewotEu8NUzffPmIzkcNRmUl+LpkUNql
         l95HB2Cv085PLzKBiHwAm8s/Ig32llWmWWGUln5e3pEJZKKaLfdwIUdFJm3wEnKajnPi
         2fyw2g/iVUqQ2O/XJUezRbDIgoWx48EpY5mXo+n6mBMJIoX8dj75/2qFVeWwWVYkBkHC
         g8lA==
X-Gm-Message-State: AOJu0YzA2xi0qVDfyp1GAmyHQK3eBfCNPcZRHo0/FO59d+FjradtEFz5
	hP78KMASa0bvXMUnQJwChbW30515nTzkri0OXGkr4bGXfYipqzYDYBeIDtEDgEtFwdIf24nmKsQ
	hDt830BE=
X-Gm-Gg: ASbGncvFypZzbUXBwB+jbRqP/PCocpLYyMHoV1M35RHiI+o3HVKkhZHWX5bMyXSG+jj
	Djpr9+wJK83aPTQqx4H2OPlSO9UIm9IVVtV9uzqJ7im0i0fnvWVxjIoUKVDQ10as00p8VBfmTxl
	uNeVTH+aFslybKiJsv/Fi0RIgrcVYLRNZiZe/s8icFeAUbL1vmIFQLmbt7abIwtDMbnjLX/rr/3
	hf1YF3oIemfvQ0xxwSrPVs7AqLz+gN7vpF+Zx6IsLwLnjikjwDbmgmrMzWo6HNzqu949MOUKgl+
	ZHodTBjggHh/h3pLzXAyjWlHa3ArEnttdYYw7WMbf40I0CcLtZtcQveOk5DoXHezna3nfo6r/y5
	ApjjgeeJpMBwUFbOn5Pdth4A+Eg/PSoDHbtGybS3rQrrJRpVAvw==
X-Google-Smtp-Source: AGHT+IHiQUUyBLMZ7II4C9ARkj5LLpiWMnv3I6u4+Z7Utv8xanWf9gIY37HhUzR/4KeiErFi0wZDXQ==
X-Received: by 2002:a05:6512:ba9:b0:553:50f6:ebcd with SMTP id 2adb3069b0e04-5550b7e675bmr769748e87.10.1751005824337;
        Thu, 26 Jun 2025 23:30:24 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2a740csm318916e87.89.2025.06.26.23.30.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 23:30:24 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/6] oeqa runtime apt.py: check errors and fix quoting
Date: Fri, 27 Jun 2025 09:30:01 +0300
Message-ID: <20250627063004.781560-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250627063004.781560-1-mikko.rapeli@linaro.org>
References: <20250627063004.781560-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Jun 2025 06:30:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219379

Check that shell commands succeeded and fix quoting
warning:

core-image-minimal/lib/oeqa/runtime/cases/apt.py:44: SyntaxWarning: invalid escape sequence '\['
  self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 meta/lib/oeqa/runtime/cases/apt.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 8000645843aa..b7cda0095394 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -36,12 +36,12 @@ class AptRepoTest(AptTest):
     def setup_source_config_for_package_install(self):
         apt_get_source_server = 'http://%s:%s/' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run('cd %s; echo deb [ allow-insecure=yes ] %s/all ./ > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run('cd %s && echo "deb [ allow-insecure=yes ] %s/all ./" > sources.list' % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def setup_source_config_for_package_install_signed(self):
         apt_get_source_server = 'http://%s:%s' % (self.tc.target.server_ip, self.repo_server.port)
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run("cd %s; cp sources.list sources.list.bak; sed -i 's|\[trusted=yes\] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
+        self.target.run("cd %s && cp sources.list sources.list.bak && sed -i 's|[trusted=yes] http://bogus_ip:bogus_port|%s|g' sources.list" % (apt_get_sourceslist_dir, apt_get_source_server))
 
     def cleanup_source_config_for_package_install(self):
         apt_get_sourceslist_dir = '/etc/apt/'
@@ -49,12 +49,12 @@ class AptRepoTest(AptTest):
 
     def cleanup_source_config_for_package_install_signed(self):
         apt_get_sourceslist_dir = '/etc/apt/'
-        self.target.run('cd %s; mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
+        self.target.run('cd %s && mv sources.list.bak sources.list' % (apt_get_sourceslist_dir))
 
     def setup_key(self):
         # the key is found on the target /etc/pki/packagefeed-gpg/
         # named PACKAGEFEED-GPG-KEY-poky-branch
-        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
+        self.target.run('cd %s && apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
 
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_FEATURES')
-- 
2.43.0


