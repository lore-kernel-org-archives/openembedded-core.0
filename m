Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 25BAE7300F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 05:59:16 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id 5so490296pgj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 21:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=G6RNco3HPg2LdId7fLIUJ9VR9aMmpxU6cWX2mBJ3wlQ=;
	b=gHwTwsdKkbhSGyy5DUTn1zCYeRysrLxHjtXn1Zub2+eqx771zTEqwJCJ4oNz2FLSlO
	UN+hq0G7xSHzwmobmoZU88GqVQZ57Tg9D2sVMcCDZBJbKaCFQB391xr5yiAELFkH5Za0
	k5X/ipeqDZMReytbvYQkPNGFyYvaMGSgCIqceIiux5AsFPxam0egN5YhVNdNCJ9LUywA
	eixxJaAqSt+tBEcC7ocZb5ChZDHyjFyH6cfY0jN44I9jwgRQrm1QQzY7Yg+lZMRxfH5T
	XoIrCw0YZ+ex5S04i0KpiBhhoF9agKgGIG4O11rVCtr31D6OffV9bb45bFJwEpt8++Z9
	CaCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=G6RNco3HPg2LdId7fLIUJ9VR9aMmpxU6cWX2mBJ3wlQ=;
	b=buDBmKvj99vsN52Mli2gIC9Og5TvsiiOMyAHsFDysFM3xEZ74Y8fivt0TnBeQVPv5X
	/dcLLg37BqJidgoO5LFkaGWSvX+7tV5L02akAnSCDz//5TUTomDdO54L54tv1ijr/OE5
	IVHEhTfBrDbIDaJ8p0+pC3Lnicql0WGwP1NdjCXd2O/nLBn5OJIQ6E1Ltue3T5w3C6lr
	a+DfkfpQ+Nn+ZOnT8P2d4Vo6HsB6TdIVhCo3FCJj+hv8aWC0BnpZBtfAZYjx71eex+Y7
	LMgNzlBjfE4V2r0F0+8sT9j+fDVLn31HZYjw9pw64CEvmA8vKXO+HDH1Rbu0wbRtM1vQ
	RYpw==
X-Gm-Message-State: AMke39nvMnhR4BmD8Fy/dLX1Ic4cD+xKzfvINJ1pmMNgu2hvOd5TGBxVwdC2YyhQJfl9FQ==
X-Received: by 10.99.129.200 with SMTP id t191mr39648952pgd.129.1487743158212; 
	Tue, 21 Feb 2017 21:59:18 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66])
	by smtp.gmail.com with ESMTPSA id q7sm695018pfb.98.2017.02.21.21.59.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 21:59:17 -0800 (PST)
Date: Wed, 22 Feb 2017 15:58:57 +1000
Message-Id: <20170222055857.2877-2-nathan@nathanrossi.com>
In-Reply-To: <20170222055857.2877-0-nathan@nathanrossi.com>
References: <20170222055857.2877-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 2/2] glib-2.0/glib.inc: If 'charset.alias' exists drop it
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
X-List-Received-Date: Wed, 22 Feb 2017 05:59:18 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Delete the 'charset.alias' file during the do_install task if it exists.
This file is not shipped in any packages and on the targets that it is
generated (musl and mingw32) it is undesired.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index bbac7ebd32..6600d33dcd 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -91,6 +91,10 @@ do_install_append () {
 	if [ -f ${D}${bindir}/glib-mkenums ]; then
 		sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/glib-mkenums
 	fi
+
+	if [ -e ${D}${libdir}/charset.alias ]; then
+		rm -f ${D}${libdir}/charset.alias
+	fi
 }
 
 do_install_append_class-target () {
@@ -108,10 +112,6 @@ do_install_append_class-target () {
 	fi
 }
 
-do_install_append_libc-musl () {
-	rm -f ${D}${libdir}/charset.alias
-}
-
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
2.11.0


