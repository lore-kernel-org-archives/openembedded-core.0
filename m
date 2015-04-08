Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f45.google.com (mail-wg0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id F014D73D14
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Apr 2015 12:40:43 +0000 (UTC)
Received: by wgbdm7 with SMTP id dm7so86837956wgb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Apr 2015 05:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M2EB4L8yCBtsVz5E+DIvywFUkHDRXD+JcQA5PUEJh5U=;
	b=0ZRUdVKx9iBbqIvnXbNta/mwm+gf067nuv3jUMHW4X9xDNlpiXtrq8DGgmydLDMMPL
	UuDg+RURp6zZz8FaLv3CBgfX9UY6ZiQkN9qVg340DD1ANewtu93PoH/8y7IvRam+jXs8
	NOChAIJadaF/iLkB7eAjofiue0NaUSa0e7VtNzJoVjfppKX3M/DEgPvikQkt9Px66+B3
	wz93H7lp2yhP86+VGgZYlUAIateDUhbegVT6isVJUQMqHsGivMniljDyz1ogjYCKAGUO
	Da/faY/wrvgvmYcLmE8wBw2gCcmvs84t1U/JnRmPuOQ5UWrPeNX4CDewq0ckhLNvXQcY
	TQgw==
X-Received: by 10.180.208.7 with SMTP id ma7mr14343589wic.0.1428496844227;
	Wed, 08 Apr 2015 05:40:44 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id k2sm15528637wif.3.2015.04.08.05.40.42
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Apr 2015 05:40:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Apr 2015 14:40:44 +0200
Message-Id: <1428496845-32389-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [PATCH 1/2] tzdata: fix postinst
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
X-List-Received-Date: Wed, 08 Apr 2015 12:40:46 -0000

* add quotes around possibly empty tz variable
* use exit instead of return, because we're not in function and postinst
  fails:
  line 9: return: can only `return' from a function or sourced script"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/tzdata/tzdata.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzdata/tzdata.inc b/meta/recipes-extended/tzdata/tzdata.inc
index 37ae926..ee56d36 100644
--- a/meta/recipes-extended/tzdata/tzdata.inc
+++ b/meta/recipes-extended/tzdata/tzdata.inc
@@ -60,8 +60,8 @@ pkg_postinst_${PN} () {
 		tz=$(sed -e 's:#.*::' -e 's:[[:space:]]*::g' -e '/^$/d' "${src}")
 	fi
 	
-	if [ -z ${tz} ] ; then
-		return 0
+	if [ -z "${tz}" ] ; then
+		exit 0
 	fi
 	
 	if [ ! -e "$D${datadir}/zoneinfo/${tz}" ] ; then
-- 
2.3.5


