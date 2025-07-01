Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD60C83038
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 07:34:21 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web11.4663.1751355256745435894
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 00:34:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=RHB+YrWw;
 spf=pass (domain: linaro.org, ip: 209.85.208.173, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-32b435ef653so42966631fa.2
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 00:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751355255; x=1751960055; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DTUB9X5GgYcgEpNF4OJGtzgYuPO+9/qpUKDwNSCqCA=;
        b=RHB+YrWwva48hIERtCmHQRdAAAxmLBdY+DI1Fo53Yvy0XYmU4f7e4szjnXEyEvmvnq
         y/9epe+l21g0tZcmrdSk9WNs7HWkpVsq29Ifr+Dq5rRovQLe2QBSQKLOYfVoSL/mX8WF
         ccUnYwUQNz60cKOOkmBUM/in/cQbyOrR+cabdY7Wz9nneTDXWiCbqN4nQRVc1LKFN6J4
         ATYiX20fZ9GWddp4N4XSximms2oaoYCiHrLTdvmVpTms6MpzezeB0SYyZCwwjvE9gSky
         2K6MKzOHSgvm2tZqH8bRD/PLq29oiR3yggYGSYdmVUZWjR5JDRQf8FEtzSwhquCZ5ZXf
         KPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751355255; x=1751960055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DTUB9X5GgYcgEpNF4OJGtzgYuPO+9/qpUKDwNSCqCA=;
        b=pU/gjfmAkDKQidj2Yx5957b88jQLsHbZr2iwPiu2qkFP9eduDeXlqiu+33kf9Iw8eI
         /PZykwv90L90pDOPHHyi1lQgxpGQJPLra5UR8JzTeg3Dbsi5LgX6LwWM3/AGM9WzC2AY
         K7A57/LsnYTFMs22epF7ACT/6Aoi6dhn6I+O+W4ggU5ysdjMZx8Ou5Rvn52bFeEkXqEc
         2tojUDAN6igvhmyYU3Ly97Fgk5+nwgZc3SIfbuDB/wYcHsAvEuVe6eJKGyKOamV/W6bY
         hcVLQ7bKx3NLxpk39CMl/jheupivFOhfdev0oLVaNOMpYCgactI3yrDgVhRTf/HeNcUV
         L+Hw==
X-Gm-Message-State: AOJu0YyANdxe9/m0Vh7jv4izq7vTWwi25xt/GOqavpbocUuMbhy7jJcm
	tlZZ8i9uv9M3A6u3pG36J3Kz1DpCCmvBV5UoGQHoeBiU1Plgc4eCL0ZWeY4vyqfkGE37sWd/Ifi
	wMpDLb7s=
X-Gm-Gg: ASbGncu15k+KUWXCZn1zf6p32L0tgAS7cRvrCRkH8cFivYnftB+qvUD0nc4Wcl+bCBU
	HJBOcMydCYMCAqXn+o7UC+C4+eDklyEd18L0DilHhj4EXLTg7P5SnbkkKFg1YNhce8+jMhn1Uhl
	rVoR9ENpPaVoilB2LPBi21zBLJAc9Rw7Ls0wSMnl5ofrgBhLBvQUpiaIk/Qsc+pdGdpllSPy9L9
	zcXGLerS2K2VA+FklwMdkhmoFurjN6g/383DyLFr4O0uJevQ89eNXIhOS0Z636NOVuPyaFQKHl7
	IiTOaRKuANSMyvNc3kqDdcVj8N4w/R08ZdfJv2r1UZxXs+OScWHO5aTWbXHEGBpIcq0hG55fNVf
	/lbWQfnTw/jpASDhLy6iY3LspOQTjEAD59zsvGqw=
X-Google-Smtp-Source: AGHT+IGWhSMIll5VOXvXYlvuBnNYqEbOdNsVwZacjebDjW0m86eXFmo5NQQwK80Rhc7mEXBWrIf8FQ==
X-Received: by 2002:a05:651c:4ca:b0:32b:75f0:cfb1 with SMTP id 38308e7fff4ca-32cdc519965mr45273901fa.24.1751355254670;
        Tue, 01 Jul 2025 00:34:14 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2dead99sm15268581fa.22.2025.07.01.00.34.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:34:14 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 2/6] oeqa runtime apt.py: check errors and fix quoting
Date: Tue,  1 Jul 2025 10:33:55 +0300
Message-ID: <20250701073359.979368-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701073359.979368-1-mikko.rapeli@linaro.org>
References: <20250701073359.979368-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 07:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219549

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


