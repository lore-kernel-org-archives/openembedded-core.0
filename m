Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com
	[209.85.216.50])
	by mail.openembedded.org (Postfix) with ESMTP id 17F8060CC9
	for <openembedded-core@openembedded.org>;
	Sun,  9 Feb 2020 16:10:09 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id j17so3101339pjz.3
	for <openembedded-core@openembedded.org>;
	Sun, 09 Feb 2020 08:10:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=pj/qwqPiQSuS4dGTetuX4yEjO60nzbglbFtaKDWYtGw=;
	b=IC1NSUDfeXaq+tiQddu59edRRR7Z5rMClSXcTPa8BFM11yvrCkJcvjwPBimpVbC/xY
	zFKiEodgur9E8PKsT9gTFfPNb00HBHDARSj0EbuuEteWmwhrMORQZfpWkuKRSQg/7qvL
	qSGi5+GywhyoQeTAn+WP1O8pGS86v+6Jt9436rAjcN1d5jNNm7Y7g/wt6YoT9LASMLby
	UlqED0QnReJlpktokJvt1iVy677kwLRhudB1pEqDPyNGzME7CMSYMt2lncON92GL8mZz
	fUwoxUan+pcXAjZsEEL8ayzY8IkHqFY67wbVUIXcC2KTkdC6KiauiWTM1QgPD06Ka3NI
	TAxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=pj/qwqPiQSuS4dGTetuX4yEjO60nzbglbFtaKDWYtGw=;
	b=EU6LMLPZixM2BX//TdQyxWxfdCaXfmLHx4XzEfdoA3hoboQMa2QgVLE3KVENWHoHKj
	M0I3HXSJ5mFMJ7P4O+ON+N3HdNrsAmW/z9vh7KpT8K5xjYEfq6O48MusPLDhgDmoLQ6C
	xpx34bJX6glcuTdUHhKlI9ghvUCulM7Ip1+d6O8onQmV/xhpK2ovjy3p228yLCkGRbFW
	lZx+kUEH9AcjN0k5ojd2rRfLn40oD5BPQmX15bB5EtjvlTyo2e0f0cbqU9fO4SE5iMFb
	u/Sr7ZNtOWVV7AgRHeaPsJHOhnhN2f3DfMzrGBiWyRIa9rOziTaBGZ+UMMLGrg7K8m5H
	RB8g==
X-Gm-Message-State: APjAAAWPQBsqTq/cVGM825ooWNDtw9joE3malbVrjclagwd2RVQE6nXB
	x42sZ2PAYKMehQf3g+YS66jh+eLI
X-Google-Smtp-Source: APXvYqxzhvor/q6XRb6W9y/GW8ocuhIwu1N+VCEmQKGQgS6B3SAagmE+O+32ToyM/sPE6jTJM3096A==
X-Received: by 2002:a17:90a:a115:: with SMTP id
	s21mr15397750pjp.23.1581264610985; 
	Sun, 09 Feb 2020 08:10:10 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:154b:3780:5122:4aa9])
	by smtp.gmail.com with ESMTPSA id
	u126sm9408153pfu.182.2020.02.09.08.10.10
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 08:10:10 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun,  9 Feb 2020 08:09:37 -0800
Message-Id: <edaff3c94e47c3e237a4366ef7cda4681e6b375d.1581264380.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1581264380.git.akuster808@gmail.com>
References: <cover.1581264380.git.akuster808@gmail.com>
Subject: [zeus 09/29] oeqa/reproducible: Improve test output and ensure deb+ipk compared
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
X-List-Received-Date: Sun, 09 Feb 2020 16:10:10 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Adding newline characters between the packages in the failure output
massively improves readability.

Also ensure to output ipk failures when there are deb failures by
calling self.fail() at the end, else sometimes only partial differences
are returned.

(From OE-Core rev: 6e2e0480852177db75a6108d77c99c92c4e9950f)

(From OE-Core rev: 4d470f48f7fb5e05fba1ca3a59fb4f85d910026e)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index a9110565a9..1b0b5bae70 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -174,6 +174,8 @@ class ReproducibleTests(OESelftestTestCase):
         # NOTE: The temp directories from the reproducible build are purposely
         # kept after the build so it can be diffed for debugging.
 
+        fails = []
+
         for c in self.package_classes:
             with self.subTest(package_class=c):
                 package_class = 'package_' + c
@@ -197,6 +199,9 @@ class ReproducibleTests(OESelftestTestCase):
                         self.copy_file(d.test, '/'.join([save_dir, d.test]))
 
                 if result.missing or result.different:
-                    self.fail("The following %s packages are missing or different: %s" %
-                            (c, ' '.join(r.test for r in (result.missing + result.different))))
+                    fails.append("The following %s packages are missing or different: %s" %
+                            (c, '\n'.join(r.test for r in (result.missing + result.different))))
+
+        if fails:
+            self.fail('\n'.join(fails))
 
-- 
2.17.1


