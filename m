Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com
	[209.85.215.194])
	by mail.openembedded.org (Postfix) with ESMTP id 114D379E49
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:48 +0000 (UTC)
Received: by mail-pg1-f194.google.com with SMTP id t13so1638405pgr.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l0uxifx/W+w2rL79ITRq3KQLpKFnMJQzhHzxX97THkA=;
	b=vXsEqI/ilf0H9up6o6RKymcGMHA5T9UE/m1YYJpNMsIMz16EPXuPm9ZrQssA5sM5vD
	lKskg0ivDkjVSCgxGt6n+Fu7nMVy/QzKLfo4qbhU3SyfDwNrntmllsVuJ/SU1Tmkz0SC
	56Ntl87ZRH3VhISZZA1WuDcNe+9yuAWqyu2UBGVV/lmLht+ne4Pouxs7MzC0bIodVnmd
	8tGg6wLH8yJ5VBi8GXbQBtyFjEh5Jqu4VrBofdcV9nuP06Gn0/pdTHFVsh/jI8/ATOHK
	bnbhfg6RXsc/d9zoqfM+u1FXZ8QPeTQYJp/DauWC7qYJqMPBimChy0tQS0/+GVl1kSCV
	XgMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l0uxifx/W+w2rL79ITRq3KQLpKFnMJQzhHzxX97THkA=;
	b=mqI6wVjEeG7RmXmP8p6c9cSb4senxdjcgBVl2zyqfr4g8t8/x56PtwWIjnkaXvyH+O
	1fOlTvEDkh7hImdmjiCWf7K1IL4oDjQtMluOK2O086tyEsE3yHT5t7Z7pxgk5PmQe/GB
	YWMbHt3IRU0tglXnpR5QpPzLLmV73JsSWopaXqJZ0Z9lr8AIVcYJFs5DquzZjcTyZinC
	c410+HZUjO9W87rUo0EicWpLl8DFPeMHCiUKqb9RifSvTm5HRlNIUQIZG8Q/q8CUvRyn
	Mp0L1gawlOymu7Dwe6zWqGfxzeQxJh2AippIIva4/9H8KNfki7RXLJG9hQMrAjK6KL4b
	/Lfw==
X-Gm-Message-State: AA+aEWZYfOz6l73t7l8698/UckSemrOoQjoUzcs53cRbF2eVZGxhd11B
	LX8O3T/YHuEK9JJQculbas7FznmJ
X-Google-Smtp-Source: AFSGD/V0+EkKJlA98N0y1/6T3LRRdBgh8BmzgQKFpkus4tOvMaQI50X3cZ1myMhm+nhnlY4ziZmFPw==
X-Received: by 2002:a63:ef04:: with SMTP id u4mr395959pgh.197.1544737190129;
	Thu, 13 Dec 2018 13:39:50 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:49 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:49 -0800
Message-Id: <99170250dfbea35226b139ed5390abf668814462.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 41/45] image-buildinfo, oeqa/selftest/containerimage: Ensure image-buildinfo doesn't break tests
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:49 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Having image-buildinfo enabled causes containerimage.ContainerImageTests.test_expected_files
to fail due to the presence of an unexpected file:
  ['./',
   './etc/',
-  './etc/build',
   './etc/default/',
   './etc/default/postinst',

Tweak the class to allow it to be disabled and disable it from the test just in
case it was enabled.

(From OE-Core rev: af67bf422a4df5b7e07894512ff73a5f493682ab)

(From OE-Core rev: f49ab8b1610c045acaed7b964d12f07f969df856)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/image-buildinfo.bbclass           | 2 ++
 meta/lib/oeqa/selftest/cases/containerimage.py | 1 +
 2 files changed, 3 insertions(+)

diff --git a/meta/classes/image-buildinfo.bbclass b/meta/classes/image-buildinfo.bbclass
index 213fb9c..87a6a1a 100644
--- a/meta/classes/image-buildinfo.bbclass
+++ b/meta/classes/image-buildinfo.bbclass
@@ -64,6 +64,8 @@ def buildinfo_target(d):
 
 # Write build information to target filesystem
 python buildinfo () {
+    if not d.getVar('IMAGE_BUILDINFO_FILE'):
+        return
     with open(d.expand('${IMAGE_ROOTFS}${IMAGE_BUILDINFO_FILE}'), 'w') as build:
         build.writelines((
             '''-----------------------
diff --git a/meta/lib/oeqa/selftest/cases/containerimage.py b/meta/lib/oeqa/selftest/cases/containerimage.py
index 99a5cc9..8deaae7 100644
--- a/meta/lib/oeqa/selftest/cases/containerimage.py
+++ b/meta/lib/oeqa/selftest/cases/containerimage.py
@@ -39,6 +39,7 @@ class ContainerImageTests(OESelftestTestCase):
 IMAGE_FSTYPES = "container"
 PACKAGE_CLASSES = "package_ipk"
 IMAGE_FEATURES = ""
+IMAGE_BUILDINFO_FILE = ""
 """)
 
         bbvars = get_bb_vars(['bindir', 'sysconfdir', 'localstatedir',
-- 
2.7.4


