Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
	[209.85.221.48])
	by mail.openembedded.org (Postfix) with ESMTP id B37E5744E4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 15:36:53 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id m1-v6so16737074wrg.5
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 08:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3/dktMBOsGOePnruZpL4yEJ2VPNhUs+Jqkm1kTgGPOo=;
	b=c9j9Erhmsu8J4UuxSe1l+ELzbqSOadBeJMJe19dhb5LULz3m2I+qjVYyBe2gd65SHb
	AD8PD6lDmcobak858pn/H0dPKYPZZDlvRWQ5xOkyfD081LePPkfRhKJ3glVOlQfppzbh
	unew65MLDzjpspgM+pVy6UcmEd+F0cPc1DLUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3/dktMBOsGOePnruZpL4yEJ2VPNhUs+Jqkm1kTgGPOo=;
	b=hGnGuzuf9WQZdisURUyZHQSpNUwZtgLLTDlEUopNeTUgccZZDVtyd8pyEA/4pE3mz9
	dVKacdNfISV29qbsWaQ/gsrh7gpXmiH8n5/LMn6JNuWYPHhZ6kaH/At/j5QicHy2aOEm
	WQNWWp766rkh+9ASUgpU7Rvx9YSTJUt4H977MCUgpdMp7rLuiE/CxNHgfU111NI+zu15
	kkhi3JVsGoMCv/4OEgj6NCnu9Gsj2qtwhrOmTts7smO5e3SKlCH/G0fPnmBk4X+FZ1g7
	wasBAE1OQye+HvMcV6hJnwcaD1RMKdvXtYZwjpCvEk1jq1sTXxj5tZBMo1hOAQmxpKQB
	Ysfg==
X-Gm-Message-State: AOUpUlG+ry5s1yGQ+WhGYdpRjLQaJV9Gk3xnZF/n121rJ0E8knG/cpni
	BHKE8BYK5oUydEf5ape0op3xA6b5wkk=
X-Google-Smtp-Source: AAOMgpdkLCdJBMDFa3f3F6hrU/PelUJxotVDCNZQBLuYi2n69bp/SJQ1sTwaAdqki/ui1MUo42v4bw==
X-Received: by 2002:adf:b2f4:: with SMTP id
	g107-v6mr10320724wrd.53.1531669014303; 
	Sun, 15 Jul 2018 08:36:54 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	z9-v6sm54571558wre.49.2018.07.15.08.36.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 08:36:53 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 16:36:36 +0100
Message-Id: <20180715153641.21029-7-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
References: <20180715153641.21029-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 07/12] oeqa/selftest/wic: Use a subdir of builddir, not /var/
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Jul 2018 15:36:53 -0000

Using /var/ leave wic open to races with other processes on the system, use
a subdir of builddir instead to avoid this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/cases/wic.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 055175212a6..5302e47da1a 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -64,13 +64,13 @@ def only_for_arch(archs, image='core-image-minimal'):
 class Wic(OESelftestTestCase):
     """Wic test class."""
 
-    resultdir = "/var/tmp/wic.oe-selftest/"
     image_is_ready = False
     native_sysroot = None
     wicenv_cache = {}
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        self.resultdir = self.builddir + "/wic-tmp/"
         super(Wic, self).setUpLocal()
         if not self.native_sysroot:
             Wic.native_sysroot = get_bb_var('STAGING_DIR_NATIVE', 'wic-tools')
-- 
2.17.1


