Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id D5D7065CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:28:41 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id z133so696210iod.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=wH60y2JGz79UHofBLg4gx8rfIHrkZxfEMD00KlHZavM=;
	b=q951NKHs513quB558lX11NZj9rnN94nruFohHqlvJDyvDUBHRpQPv2UcFrK139CHZr
	KZVonuvp4gF6vU4R20YWJekSBC5kh1/oqO+SyoD6FiOsDlQIpU5kLs0Qqueg0n4svF3G
	eZALw8UYks3lXlimflwEDvLww2AP8oUtB5tF5UZtNPCg6mA8ynldv3uEOImaijYQvxF0
	ArUvi8SdbGn3SLdSyQviC+zUjbIbbBx/f8zl8mt+l0xesng9oA2FdrDHuXtU6lTyNv79
	I707Ap95Efdt1Lw5ciW+uVzSjdrHIi36CYB1G3DcJG9rGYMdkGRMTgC5MF++p3sqBlgY
	NyXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=wH60y2JGz79UHofBLg4gx8rfIHrkZxfEMD00KlHZavM=;
	b=U6ZlOZkNEB+msusR5Mp6RnvIZIr0W3aI51HMl4hiStjebeSObeMVXOoYBHazc3VXPG
	L6ftvDGa5lulURb1uWdZp7EQ6OckmdSxiNCDMvMxQv1HXReVtzNc05gFd5lsBTdgYTdy
	pOfDJc3nt2/01PsNdtwcq9+cQa2FPLOqvmE0+TeuCsqq2U3O0qtltnHCF3DDpuxiLh9/
	0ukN+SxfXhWszQdQgmeZ1n2lCfwx0aSfHbgBKwUZ+1gkLfcwgh7+qmCMUWeSPTXcqRuS
	yV+/Gd3EB+xOfdnsqpB+jxdfjAegA3e3YNHPIgc+veOtSmGULlRc1N9KnVcHs48m7rOn
	xbOw==
X-Gm-Message-State: AOPr4FVhHHutS+27hA/VBKoQtojC6ootlR6PuusrZ+Am+xX7N525RUa5unirtlhRG//IcQ==
X-Received: by 10.107.136.69 with SMTP id k66mr1024469iod.0.1460420922147;
	Mon, 11 Apr 2016 17:28:42 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j34sm18580510ioo.20.2016.04.11.17.28.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 17:28:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 17:28:28 -0700
Message-Id: <1460420908-16890-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460420908-16890-1-git-send-email-armccurdy@gmail.com>
References: <1460420908-16890-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] pbzip2: don't skip do_configure
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
X-List-Received-Date: Tue, 12 Apr 2016 00:28:43 -0000

Although pbzip2 itself doesn't require any configuring, skipping
do_configure means the 'make clean' step performed by the default
base.bbclass do_configure is skipped too, which means that pbzip2
may not be rebuilt if something it depends on has changed (e.g. if
libbz2 has been modified).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index 77e70fc..06d37ad 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -18,8 +18,6 @@ SRC_URI[sha256sum] = "8fd13eaaa266f7ee91f85c1ea97c86d9c9cc985969db9059cdebcb1e1b
 
 UPSTREAM_CHECK_URI = "http://compression.ca/pbzip2/"
 
-do_configure[noexec] = "1"
-
 EXTRA_OEMAKE = "CXX='${CXX} ${CXXFLAGS}' LDFLAGS='${LDFLAGS}'"
 
 do_install() {
-- 
1.9.1


