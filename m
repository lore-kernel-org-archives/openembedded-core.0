Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 6699A72F2B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 13:17:44 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id s67so7731978pgb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 05:17:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=i/Il3d3e3SDqqXmu8nqihYJlGw2Mgn38Mdb1R/jfhHg=;
	b=fuYmTuM8VYBvG07eW/CXbVsdgh9n5sDrkU+d8BZ5hO3cICRizwlh2F/1lg/uu7VKUN
	Aj/Nhb8BmplP7guDhk+uiQBoCP9X4Jn0k48Cc24RHEvcVq50P/3vfMnCtcOT9O+qT197
	YuuZGxInwsx7dbhNmvuZf/M7lt0BgUgaLuBGSAzXPjRG1olOvEA6YSH9wxSWCMat3kD2
	qsjRWQOgLtQHIfw54va93SReGreWAWTrAVn59f60upIqWNZNfzb0e3cvMIw0Zzrl4ZgL
	bF5Cz8c3mQmoihylwAJf9lhp2a5+VtV70b7kSBxDOm7Qmbka5CrDq5l0MX5/7ZW+F3oT
	Qc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=i/Il3d3e3SDqqXmu8nqihYJlGw2Mgn38Mdb1R/jfhHg=;
	b=o/ds8VefdwUzhspnzs1XMWMCRHsrq5kE1WKCeFwllS+21saI7INC0S5j+qI3RdtzkM
	8S4sGtB4CRkIVkmFFlJewFKfte+K0d3r3+8GKE2dEkv5TGgSheAPp6efxNc5SPhAVw+x
	nlHOD9cGGlubW4TqOj4WpERHwWEN4B84n5Sljcu5vcS6BULaswFXgV4c+rpFe4j5k+Z2
	e+F69z6+wiRN7rcrx6uTUJeOvstws8IlKL0fC/b9Yt+Axs0MItdX6g/BHR4jqbOP8HNc
	dV9X/EFpIyEu6SAx+qtZZ8UP35f9EGNS3TZdVP5sNnd1LvCkSVxO7oQEFfhH2jA88IcM
	w8Og==
X-Gm-Message-State: AMke39lkEsz9ZLLEIlGW9UTWoctGYPgGlgInPUnaTDhXwqZafBIcvmMwZmQCYjZrwAsk9w==
X-Received: by 10.98.19.12 with SMTP id b12mr32571273pfj.150.1487683066614;
	Tue, 21 Feb 2017 05:17:46 -0800 (PST)
Received: from [127.0.1.1] (CPE-123-211-135-66.lnse3.woo.bigpond.net.au.
	[123.211.135.66]) by smtp.gmail.com with ESMTPSA id
	c11sm41223621pfe.68.2017.02.21.05.17.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 21 Feb 2017 05:17:46 -0800 (PST)
Date: Tue, 21 Feb 2017 23:17:28 +1000
Message-Id: <20170221131728.21595-3-nathan@nathanrossi.com>
In-Reply-To: <20170221131728.21595-0-nathan@nathanrossi.com>
References: <20170221131728.21595-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH v2 3/3] libgpg-error: Don't replace the syscfg header for mingw32
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
X-List-Received-Date: Tue, 21 Feb 2017 13:17:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

For mingw32 targets do not attempt to replace the
syscfg/lock-obj-pub.*.h as for mingw32 there are no arch specific
headers that are included in the libgpg-error source.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.26.bb | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
index 87c4f5185b..393ccfb236 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.26.bb
@@ -25,7 +25,10 @@ inherit autotools binconfig-disabled pkgconfig gettext
 CPPFLAGS += "-P"
 do_compile_prepend() {
 	TARGET_FILE=linux-gnu
-	if [ ${TARGET_OS} != "linux" ]; then
+	if [ ${TARGET_OS} = "mingw32" ]; then
+		# There are no arch specific syscfg files for mingw32
+		TARGET_FILE=
+	elif [ ${TARGET_OS} != "linux" ]; then
 		TARGET_FILE=${TARGET_OS}
 	fi
 
@@ -40,8 +43,10 @@ do_compile_prepend() {
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;; 
 	esac
 
-	cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
-	  ${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
+	if [ -n "$TARGET_FILE" ]; then
+		cp ${S}/src/syscfg/lock-obj-pub.$TUPLE.h \
+			${S}/src/syscfg/lock-obj-pub.$TARGET_FILE.h
+	fi
 }
 
 do_install_append() {
-- 
2.11.0


