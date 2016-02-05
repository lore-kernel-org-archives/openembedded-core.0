Return-Path: <kergoth@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5DA77303
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:02:40 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id p63so3856621wmp.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 09:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=jAmA4hYmGdhW86giltSVZYapiS77CMEUFwfLMfncrZk=;
	b=i/zuEM6HsWqRaShdeWlvZLJV7pBNUyWM87ENEFrNBkwXmGDCFrs12ZubiBw6/y553K
	tWwaHPKam6A4R5Xtp1stfXK3VklNFj6UeiLKeF6kIwrtB8yo8Ga/EC8B4MIWpoM2DQBI
	bSPEuqyIQdpGsufevX/iIMazTxg1qCxGsA1/kTjm2DbTwz2R8DHciCoa0lqbupJ/BqB4
	5d9i+HDMmRdEF0UUr3knCG8tK6+DfcWi0EwtvPjsl40OrPHntpKSQ7636zS2lHOpWS6U
	RtYjfVXXHf04eIMacNfWI2jZnGh7YmVbzHSeC+42V7YlvIhHTdOifK/2MynSa/oTpxwx
	wXvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=jAmA4hYmGdhW86giltSVZYapiS77CMEUFwfLMfncrZk=;
	b=Ol6DlTPj3wda+rTkH6ZcjaUWMKYYoF7xbcbNTJooEAuylQ29XMJKRw+Vj5ogQkNFD7
	H7kUpLSSBTBE/0XsCF46vrDdSYuV768c/kLtuoksoYdoV5wBCaGKE72FCQw3kaTT7Obt
	KkoryuQK6hgEz8lWcEyZiZ54cOxhLHXGM3WBSoJLNW0iaWrKs8EbYEAAmsAZXflYt8Z3
	2GYEt46q7uSz0SfhFjLRu+C71pbq8iXjqAHP56fUEbkwWeYAa9xPuIVW6J6/C1eyIs1m
	TBx1QHG9+zchvHiUi+6jiRBVSacpT0GLRTWfae7a8NPf3NbUbRR5ipJrLTNGrsdjc1Rd
	BxhQ==
X-Gm-Message-State: AG10YOTmB1k1J2fgAPgdkUG+BRq3vWFnUDCFp3zUTzfD4bEJpHdrwuuuHoOELDVhmfz+tg==
X-Received: by 10.28.223.67 with SMTP id w64mr38849529wmg.28.1454691761331;
	Fri, 05 Feb 2016 09:02:41 -0800 (PST)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	v191sm18077361wme.1.2016.02.05.09.02.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 05 Feb 2016 09:02:39 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Feb 2016 10:02:34 -0700
Message-Id: <1454691755-9327-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 1/2] python: set PYTHONHOME for nativesdk
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
X-List-Received-Date: Fri, 05 Feb 2016 17:02:41 -0000

From: Christopher Larson <chris_larson@mentor.com>

This ensures that the nativesdk python functions correctly without needing to
set PYTHONHOME in the sdk environment setup script.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-devtools/python/python_2.7.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python_2.7.11.bb b/meta/recipes-devtools/python/python_2.7.11.bb
index 0287c19..0c00d6e 100644
--- a/meta/recipes-devtools/python/python_2.7.11.bb
+++ b/meta/recipes-devtools/python/python_2.7.11.bb
@@ -123,7 +123,7 @@ do_install() {
 }
 
 do_install_append_class-nativesdk () {
-	create_wrapper ${D}${bindir}/python2.7 TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
+	create_wrapper ${D}${bindir}/python2.7 PYTHONHOME='${prefix}' TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo'
 }
 
 SSTATE_SCAN_FILES += "Makefile"
-- 
2.2.1


