Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-bk0-f45.google.com (mail-bk0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id ECF4D610DB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 13:45:38 +0000 (UTC)
Received: by mail-bk0-f45.google.com with SMTP id mx11so1195286bkb.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Sep 2013 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=QkOKkUrfYHqvV9/idLWkEKljXeT9LUSBcHrLMJiN68Y=;
	b=DZZlAEOJfWclky+u8AWcN0l76PbY5P9ZRKpGE85BCuENJg9PbcV0Loi0mBVE1hUkx6
	2wXSR/lk3jC084XfN7AwYoR3t/+oTTorQwco56cXitTUlqmWrDqKlFarSH+EYAt1xJOL
	hzKtMDTIoSeFlJY2CT+yV7UN04XJPQ5iFpy6bxEhVhSrxA40yk9ptF+qFCx7qNfnNwFi
	WY5IsngiSwND/kjfaRRj68FxJ2YCXr3sY5qclYM9AJbhAy4QcMhIi+ShHtyDiFp52fOo
	33ZFzqIwbGKSP8nb5Vekye0V+AVUlZD1HWvR8RYP/L/S2x9v+GK0CQkE45BwtqLlULoY
	Nj+A==
X-Received: by 10.204.111.196 with SMTP id t4mr47687bkp.38.1379943939239;
	Mon, 23 Sep 2013 06:45:39 -0700 (PDT)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPSA id b6sm8758888bko.16.1969.12.31.16.00.00
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 23 Sep 2013 06:45:38 -0700 (PDT)
Received: by nysan (Postfix, from userid 1000)
	id 645C9400339; Mon, 23 Sep 2013 15:45:26 +0200 (CEST)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Sep 2013 15:45:25 +0200
Message-Id: <1379943925-31969-1-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Subject: [PATCH] Avoid host contamination issue libpam -> libprelude
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
X-List-Received-Date: Mon, 23 Sep 2013 13:45:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since we dont use prelude in OE, we just disable autodetection of
prelude in the libpam configuration.

Problem described here in the Yocto mailinglist,
subject: "libpam libprelude issues"

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 meta/recipes-extended/pam/libpam_1.1.6.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pam/libpam_1.1.6.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
index f7493c5..c9bdcb0 100644
--- a/meta/recipes-extended/pam/libpam_1.1.6.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -37,7 +37,8 @@ EXTRA_OECONF = "--with-db-uniquename=_pam \
                 --includedir=${includedir}/security \
                 --libdir=${base_libdir} \
                 --disable-nis \
-                --disable-regenerate-docu"
+                --disable-regenerate-docu \
+		--disable-prelude"
 
 CFLAGS_append = " -fPIC "
 
-- 
1.8.3.2


