Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A11C071AC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 10:19:19 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z45so12541452wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 03:19:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=hLQ1EhueyOG3LVZnHJ84NboTeArt0jy2K7Us4VkHnp8=;
	b=XiMmOLqTfb+ncn+SdPmsR4ivMkrycMu47IxzMby0rxC6KC0H6l9WyDiUi00J/fwyk8
	moc9x47l5LtiK9LziHpiIzOt5N0LAtJyy1RFUqhEypiOwTZGkyF6dGPkBD0cFesJcz/l
	iIUa5KmuC2DyN4iCRLGBKKgWBOHz65zT/a2JKi4pH9sImV0hZbICwyW0ENbn+uUTYjJy
	Am6m81r3v5g24fcOd9wTxzXaM9gPEfk8Un/1sqIamILJ3g042YnDUuWur70uEuq0yMBm
	TAnZfKJDWXsI0B97eZW+ftIONQYPHo2tIsAVB2KwnxNMIRwjcdAhkQ30LsleBQQhMAXZ
	APKQ==
X-Gm-Message-State: AKS2vOxySawrsw2KoG0RArLO+Jx7mO9dTmImOQqSmLbYaO/g1sfm/XNW
	KhUwmEFQcuqB+kMBvy8=
X-Received: by 10.223.132.225 with SMTP id 88mr1026925wrg.80.1497867560117;
	Mon, 19 Jun 2017 03:19:20 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	48sm13823466wry.31.2017.06.19.03.19.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 19 Jun 2017 03:19:18 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 11:19:17 +0100
Message-Id: <20170619101917.31865-1-git@andred.net>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [RFC][PATCH] tclibc-musl: use musl's virtual/gettext implementation
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
X-List-Received-Date: Mon, 19 Jun 2017 10:19:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

musl implements the GNU gettext API version 1 and 2
  http://www.openwall.com/lists/musl/2015/04/16/3

Generally, there should be no need need for the
actual GNU/gettext in systems using musl, so with
this change systems using musl can avoid a needless
dependency on a GPLv3+ tool.

If an application ever appears that needs
GNU/gettext API version 3, we can think about a way
to support it at that time.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Acked-by: Sylvain Lemieux <slemieux@tycoint.com>
---
 meta/conf/distro/include/tclibc-musl.inc | 1 +
 meta/recipes-core/musl/musl_git.bb       | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tclibc-musl.inc b/meta/conf/distro/include/tclibc-musl.inc
index 3d3f6ac4f4..172b09ab20 100644
--- a/meta/conf/distro/include/tclibc-musl.inc
+++ b/meta/conf/distro/include/tclibc-musl.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/libiconv ?= "musl"
 PREFERRED_PROVIDER_virtual/libintl ?= "musl"
 PREFERRED_PROVIDER_virtual/nativesdk-libintl ?= "nativesdk-glibc"
 PREFERRED_PROVIDER_virtual/nativesdk-libiconv ?= "nativesdk-glibc"
+PREFERRED_PROVIDER_virtual/gettext ?= "musl"
 
 #USE_NLS ?= "no"
 
diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index fba47096f5..9cf097d067 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -15,7 +15,7 @@ SRC_URI = "git://git.musl-libc.org/musl \
 
 S = "${WORKDIR}/git"
 
-PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/libiconv virtual/libintl"
+PROVIDES += "virtual/libc virtual/${TARGET_PREFIX}libc-for-gcc virtual/gettext virtual/libiconv virtual/libintl"
 
 DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            virtual/${TARGET_PREFIX}gcc-initial \
-- 
2.11.0


