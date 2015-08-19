Return-Path: <coldnew.tw@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id B013B608B7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Aug 2015 05:54:15 +0000 (UTC)
Received: by paccq16 with SMTP id cq16so105981321pac.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Aug 2015 22:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=5jqpD+Y9mCSJqcaNOWRTHZ559lYMhIj+KaZBaGhWNKA=;
	b=LhjW+SOIhK2XTC5hYKZCj4kD6YtX5ySg7CCnLcyfPbDlirrWpRGMpvWFH4B3o+Trei
	vWrVpBSoWHiFPTGhhiiOLLtzGBjSoO7TVjUcFKIYkvNJ8acdC7sOVwHvVLBxn1wCn/+b
	gcXEMZUcGNSSgb+PiIjW1fHf85IyU65QbgiL61wxhDrOQtAqnsUH19M8tR4WYqSI3NFe
	zy7TQatYs4bOpwV/AckbS8wu5YpJi/RynUI6nWlRwSi0p+zT6WMsOUNnKEv2W8bXYYMc
	2QQDuGQnE9G7OJkSQLfwsdoQVZ9C5zCH1M5880kbCrRf1N5dSdiaa/X6wGkVemXT3IxY
	1kEg==
X-Received: by 10.66.232.68 with SMTP id tm4mr21418031pac.157.1439963655638;
	Tue, 18 Aug 2015 22:54:15 -0700 (PDT)
Received: from localhost.localdomain ([203.70.194.104])
	by smtp.gmail.com with ESMTPSA id
	mw3sm20130277pdb.76.2015.08.18.22.54.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 18 Aug 2015 22:54:14 -0700 (PDT)
From: Yen-Chin Lee <coldnew.tw@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Aug 2015 05:54:03 +0000
Message-Id: <1439963643-30697-1-git-send-email-coldnew.tw@gmail.com>
X-Mailer: git-send-email 2.3.6
Subject: [PATCH] perl: Undefine finitel for uclibc
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
X-List-Received-Date: Wed, 19 Aug 2015 05:54:21 -0000

finitel is not implemented in uclibc and since its not posix, it wont be
implemented in future too.

Fixes perl 5.22 build error

perl/5.22.0-r0/perl-5.22.0/sv.c:12135: undefined reference to `finitel'
 | collect2: error: ld returned 1 exit status

Signed-off-by: Yen-Chin Lee <coldnew.tw@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.22.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/perl/perl_5.22.0.bb b/meta/recipes-devtools/perl/perl_5.22.0.bb
index e3a7f41..3ce7849 100644
--- a/meta/recipes-devtools/perl/perl_5.22.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.22.0.bb
@@ -134,6 +134,7 @@ do_configure() {
         if [ "${TARGET_OS}" = "linux-uclibc" -o "${TARGET_OS}" = "linux-uclibceabi" ]; then
                 sed -i -e "s,\(d_crypt_r=\)'define',\1'undef',g" \
                        -e "s,\(d_futimes=\)'define',\1'undef',g" \
+                       -e "s,\(d_finitel=\)'define',\1'undef',g" \
                        -e "s,\(crypt_r_proto=\)'\w+',\1'0',g" \
                        -e "s,\(d_getnetbyname_r=\)'define',\1'undef',g" \
                        -e "s,\(getnetbyname_r_proto=\)'\w+',\1'0',g" \
-- 
2.3.6


