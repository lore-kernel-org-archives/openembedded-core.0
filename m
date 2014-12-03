Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5C36AFB5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Dec 2014 12:41:06 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so31280249wiw.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Dec 2014 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=yZZcmKMitsona1coGgdKlSXaKYNMho/Qse/FhD7o+RM=;
	b=hqE0A54Sf/v/Pvh5GB+0dTjytOLalPJAaLOJcgNksy6LqOIh4lvBtP5T6l0S5oRSXl
	6ijP389EuCfzefM+dYA8jxIsibDQgTGsLXcyF3/KJJ1XKCBPRJ3+AYMvNGO5vOc44XgB
	ZlEADWVmecbtHtpUALz6MnyxDqfoNR/izk8CYA0HGRjCLEPJTXJmGLjM6IGrvSMcaLht
	jsRyyAhB+H8Aw/h+VvS3ug4o7/9u9QrpfzMrXr2kDQf8aG/JujuPFVL+ua/KaCtD6tgj
	+HrZCKyV8m+3+lrp9kR5g6acAhUiWK6HZnIXp7VaLY7hRV2B7FgFGvyD2MYDZ/11kl/3
	0Onw==
X-Received: by 10.180.105.131 with SMTP id gm3mr35047845wib.34.1417610466766; 
	Wed, 03 Dec 2014 04:41:06 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id ce1sm36130063wjc.2.2014.12.03.04.41.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Dec 2014 04:41:05 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Date: Wed,  3 Dec 2014 13:40:55 +0100
Message-Id: <1417610456-788-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
References: <1417610456-788-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 2/3] gettext-native: build libintl so that other native recipes can use them
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
X-List-Received-Date: Wed, 03 Dec 2014 12:41:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I have a native recipe around which directly compiles/links against libintl.
Gettext contains this code (usually supplied by glibc) as fallback. In native
case this code is used by default because we don't have glibc there. This patch
changes static linking into dynamic linking making libintl code shareable.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta/recipes-core/gettext/gettext_0.18.3.2.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext_0.18.3.2.bb b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
index 65d4103..98838d7 100644
--- a/meta/recipes-core/gettext/gettext_0.18.3.2.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.3.2.bb
@@ -39,6 +39,9 @@ EXTRA_OECONF += "--without-lispdir \
                  --with-included-libunistring \
                 "
 
+# we have no glib intl
+EXTRA_OECONF_append_class-native = "--with-included-gettext --enable-shared"
+
 acpaths = '-I ${S}/gettext-runtime/m4 \
            -I ${S}/gettext-tools/m4'
 
-- 
1.8.3.1


