Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 79BFA6072C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 19:40:35 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id i5so122646758wmg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2016 12:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=f96DPnR6lMDos2lmqqCEkADSz8JeOtdTBNXap2GcsGM=;
	b=ySXLEnBe072MD2S6rKYBWcadxPmtGjyXBCbL9orvoEVBEMz2sLUHKzMKPKfwSlglZG
	sWoYqPT3LVFqrVUs1oCS6o7fG5y5nSAGGnWX8zpybi6ya578sPUxly5hBsBu2v4SKaAw
	7FbPDXY2NxZWw3dKjxJsgroosTivuSnEVJDsYRl9AssywSiAHUVZdvMJGr8yH7jDrE13
	67lv/U9DiCHKVNhFhfFF3TDdCpqneE+EhoCuGLPiUaGFpJXB4SrC3FXJQrTnBCexojB6
	gsOjaTIxI4fvAvS9xRDo1eYhC0ZSL4ZuZTynpgZDj5CNoinQiBtNuywnhOjtHsMALC8V
	/Qnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=f96DPnR6lMDos2lmqqCEkADSz8JeOtdTBNXap2GcsGM=;
	b=FG3qT0kgnwND3+crUJSim6XGCf741JjImR+83wSvnJKPuckRjGnp7MzkOLkCEFCsmX
	5aDmfswhL0Ux449/B4sK5OnwEZVW7s5WZeVkatNZTOLa5B5ADyoYpz07YNn59KxlQeae
	2ebe1QNgj0+DoQ/yq8zIq0BeoGB9/BEA7+BWSl0tD3w1I0apuezYFgtV4G/N9EQkN3nV
	XVN3Cwhd4Op8IwRoYWXldPNOTmzEEZ/DtqgMnAhuzLLHDpKxwZBmOikoT87k+ol0EJN9
	JpXqHKjhH8P1ygvRFKx8Z17EqbYRIqwD1wemJHCWMxzgaCMia/GMAYzTP68TLjVdP03G
	yRPA==
X-Gm-Message-State: AEkoouuL732rbZA/tRYkdx5hJ+JkoChmmXltJgVk0H7OWsjuJgR52L4H5oL3/GiZrs7vVfHu
X-Received: by 10.194.77.97 with SMTP id r1mr37253083wjw.83.1469734835878;
	Thu, 28 Jul 2016 12:40:35 -0700 (PDT)
Received: from localhost.localdomain (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	r67sm13712650wmb.14.2016.07.28.12.40.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Thu, 28 Jul 2016 12:40:35 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jul 2016 20:40:24 +0100
Message-Id: <1469734824-3351-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.4 (Apple Git-66)
Subject: [PATCH] cml1: fix tasks after default [dirs] changed
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
X-List-Received-Date: Thu, 28 Jul 2016 19:40:36 -0000

These tasks relied upon [dirs] being ${B} by default.  As the functions are not
simple, add back [dirs] so they work again.

[ YOCTO #10027 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/cml1.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
index b5dc028..5834806 100644
--- a/meta/classes/cml1.bbclass
+++ b/meta/classes/cml1.bbclass
@@ -42,6 +42,7 @@ python do_menuconfig() {
 }
 do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
 do_menuconfig[nostamp] = "1"
+do_menuconfig[dirs] = "${B}"
 addtask menuconfig after do_configure
 
 python do_diffconfig() {
@@ -73,4 +74,5 @@ python do_diffconfig() {
 }
 
 do_diffconfig[nostamp] = "1"
+do_diffconfig[dirs] = "${B}"
 addtask diffconfig
-- 
2.7.4 (Apple Git-66)


