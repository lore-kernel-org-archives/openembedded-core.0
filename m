Return-Path: <akuster808@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF4C7D95B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:36 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id q1so2937672wrp.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=dC7BMpsHbCg8myY6/cpltoSdWg+LyaLZnMxvoN1BZDQ=;
	b=t3I6t3jwZnh3dZrfZZaLBhtosbCbqNnhEIaPhb4QYPueIXpl9zUKOhPdVwCUWciJr7
	UiU4GEuBit0qQawvLMw+Zp2T76NKSlZVBxYBQIDYtNspAn6FKg1lu5gHeuPOnp7CdLTW
	Js2D7DLY+GSpcN5nFY1M5Wl/Zp8C7psP1yZR7vP6LQ6KJ8aSYNTu5l2zy8Ay8IQvBz/M
	gjXJTOWshVwE2DiSSVzS8xRrmfVxS/1IHcS+OFNoNeOm9dFuPPIkzso5UjNpFaS0UYCy
	1TZYe3fBQbCAGamXXUJ5y06EypVPgbhMWltGijay56a7O1t/S8g7Oazt5uTTu4FBNFKe
	qD0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=dC7BMpsHbCg8myY6/cpltoSdWg+LyaLZnMxvoN1BZDQ=;
	b=ZnNPmpXR7sO6d6lFhuMSCWsGWXe3WcEi2B7YcQKC3IzoH3hp7ir/6eaeuhDceBLz4L
	AddARigbzfwmCUBU8bf/K93AjUYID7/dSTPO2zlT8aY915Ok83ier7bPNIwFP/rXah2+
	5UskkOUew+QkYolp0ZE9XrCnDFc8wZFwmTksfyCFWtagj6lS4lnEJMDsSPPYLGqVCkfQ
	iHbhAwOiAWIdLdvPCkCxocMikyb02tXjuzbDgYXaCviiQUld+olpbeWXM+JOszel6SbI
	kJiUwnuXkfAOy+4RFjvwkEvuBz9HQ54D1kqYM8KsYedAG0ExX+dcjprWZrnDdRQJPRat
	wz/A==
X-Gm-Message-State: APjAAAWEY+EXhSQY77La45HgS6XDuka/i+4aCjvh5XroCpMSoJAHaW0g
	tSN3RI8aBt+BRlrUW/BXKfxxRZEDxRg=
X-Google-Smtp-Source: APXvYqzFokrYBc0dgmjI46J5ZpW4KGpj3Vi8qu0xSAOUbYLztO427AZSdmvgDtIA/dv9ifvDf60QBQ==
X-Received: by 2002:adf:dc8e:: with SMTP id r14mr3016252wrj.118.1554901957228; 
	Wed, 10 Apr 2019 06:12:37 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:36 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:50 +0530
Message-Id: <af7ba26a603a12de0aed35e786674c92049c2bee.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 31/33] oeqa/selftest/devtool: Ensure dbus is built befoe running test
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:37 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

If dbus isn't build first the dbus dependency of dbus-wait can't be detected
through pkgconfig and the test fails:

AssertionError: {'DEPENDS': {'dbus'}} != {}
- {'DEPENDS': {'dbus'}}
+ {} : Some expected variables not found in recipe: {'DEPENDS': {'dbus'}}

Ensure dbus is built and present in the sysroot.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/devtool.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 0ce90a4..627bc65 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -300,6 +300,8 @@ class DevtoolTests(DevtoolBase):
 
     @OETestID(1423)
     def test_devtool_add_git_local(self):
+        # We need dbus built so that DEPENDS recognition works
+        bitbake('dbus')
         # Fetch source from a remote URL, but do it outside of devtool
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         self.track_for_cleanup(tempdir)
-- 
2.7.4


