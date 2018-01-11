Return-Path: <sstncr@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1B75F787E4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 16:07:35 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id 141so6396413wme.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jan 2018 08:07:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=CRudM4oDLNNBwlO06OPmqbS/fi26G9WpbANE6ikhc7Y=;
	b=JzQWXNHxLn62WANe2v26Bdj/9mpXg1EcK3Z/xOYY6ZchfQh8TIRhknkytDee9QFSLe
	VKWJkVjkhLTWo5UyDy61DVTqpbaM/u07MT1cpVzMTEBwOQ7qk55mTYSzigWKsZ9NW9pR
	W1llkkI+cegl62Yg5ecWWyaBTReIjdrvxwdhvY0e54qp7QD8+kMQHAoiNqv45ea1GGcU
	GPAEdVTy5BaRo+M8mhohNZrodOzKPIGK8k3QzA/8amU1oiPaviS9EZ8RV/k60ESkHaL8
	o9aUgNUuFP/OQtOF2jsAQi4l9AXkkOUrxk7BR0wJrds8cpoxgIcnwagWJsQqgTbMyXhC
	sRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=CRudM4oDLNNBwlO06OPmqbS/fi26G9WpbANE6ikhc7Y=;
	b=cD82ssqwbaGQQFfPl9SE1wzpibZie9RS5meuBdQ/USi1qmkIMEzfnmewF3y7RbWJgD
	T3HOlrV9LWKAlt5/j0mEgBOKrcMYC9q8PWL2+4keQE3B5euGe9P3K3oJKtB6e45geDEF
	Z0gBh+obRLRyGCRZ3kwynxzGuqt7mNC7E/6REiX1T46py8ztwydhN+y/rMF3JHec+Vzc
	Xpt4FWX4X4VuqnqxqX5uoHG1kextadrfl2SchHUFkKdq3VBnZdPn0mXcnatDk4pXgqya
	AFevL1clj7QvdgUju5PAhr/T6IYIt1wJjvcZIYrm+WJdTV4M0xWM0XwKi8ORuHfaf53a
	Mx1A==
X-Gm-Message-State: AKwxytdFR59F8oF9jJK/uR8id3Yv2NP4NWI/UHL4CqW7QGKliWSWl4nW
	L/dS4wzfCmld3IXIi5RCH1LfA8St
X-Google-Smtp-Source: ACJfBotdKo8mw66TSg0LNvLyTIrbtHmls8kyXTT/z3FmugEuVIoaRCMDv+2sCwYp6+NCQi54JylkgA==
X-Received: by 10.28.14.133 with SMTP id 127mr1485975wmo.152.1515686856464;
	Thu, 11 Jan 2018 08:07:36 -0800 (PST)
Received: from ubuntu-xenial.corp.fitbit.com ([86.120.134.70])
	by smtp.gmail.com with ESMTPSA id
	p32sm13192986wrc.9.2018.01.11.08.07.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 11 Jan 2018 08:07:35 -0800 (PST)
From: Stefan Stanacar <sstncr@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jan 2018 16:07:21 +0000
Message-Id: <1515686841-28097-2-git-send-email-sstncr@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
References: <1515686841-28097-1-git-send-email-sstncr@gmail.com>
Subject: [morty][PATCH] kernel.bbclass: Fix symlink creation when using externalsrc
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
X-List-Received-Date: Thu, 11 Jan 2018 16:07:36 -0000

do_unpack is by default in SRCTREECOVEREDTASKS so this append can't run, since
this tasks gets removed by externalsrc when it's enabled.

However this was hidden because externalsrc does run do_fetch and do_unpack if
there are type=kmeta or file:// entries in the SRC_URI value of the kernel recipe.
(e.g linux-yocto).

Make this a separate task so that it actually gets run for kernel recipes with
no file:// or type=kmeta in SRC_URI.

Signed-off-by: Stefan Stanacar <sstncr@gmail.com>
---
 meta/classes/kernel.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index f8318b8..3eaae03 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -102,7 +102,7 @@ inherit ${KERNEL_CLASSES}
 # the symlink.
 do_unpack[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
 do_clean[cleandirs] += " ${S} ${STAGING_KERNEL_DIR} ${B} ${STAGING_KERNEL_BUILDDIR}"
-base_do_unpack_append () {
+python do_symlink_staging_dir () {
     s = d.getVar("S", True)
     if s[-1] == '/':
         # drop trailing slash, so that os.symlink(kernsrc, s) doesn't use s as directory name and fail
@@ -119,6 +119,8 @@ base_do_unpack_append () {
             shutil.move(s, kernsrc)
             os.symlink(kernsrc, s)
 }
+addtask do_symlink_staging_dir after do_unpack before do_patch do_configure
+
 
 inherit kernel-arch deploy
 
-- 
2.7.4


