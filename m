Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id A426277331
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:55:27 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id o6so27719965qkc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Feb 2016 14:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=D4gBuQcQNPQgXdxlqwyjfsOlHr6eMHfKw2ZxUstBkmA=;
	b=RxcZGT6+YskGOxbv4a9uOf/biAaR6wZmBHZDLzr0wDW0K/RJvHlrx3WM6xcB4Amkez
	9zeCbeBH6zNYo8yVv9vr6cbOy9HeIUmG6dmabG3HFrX5EVg9z9GszoKLIwrcGK1yZ2Dq
	Pr+3m4rPvHfuElGKlPsEgqLp9xU2GRPLZJ0aZP2BXZ+n/DlckUVH/An+A595anBMz2qS
	+T8U9LeWxcP0bAm3GhWcs5l7W/z13t4sx3ONSTNxFLP3RJ4j6m5D/B7sc1iXtDNnfB0Y
	Kkv5GOQAucZs61UKOQInDhuUALB2uiTVxGUotlsy8LwI4Nqq0AO0ZhwzWj29DKephsic
	diRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=D4gBuQcQNPQgXdxlqwyjfsOlHr6eMHfKw2ZxUstBkmA=;
	b=Mg7CXiaH4Qte2oLWJL34o3gZpdlLttTPLKZ79cbIu1/EETANzBBqD6h7B7NjDkKrIC
	wW5h9BQBHlCTfG4vq7beBIlkjK9KA31jhatbTiVDVtdmUms7V68otke6LBnS1apf3akl
	r9TmKFHy+3WB+mnBMIZMnFr/Za7Sac1lJOz1kuG8BbBI3vZLu678mVCgpBqCi76azYWy
	gusKIEd1eTOMdMwQVJOLe+V6HFAKFj4ZX6ZpLFwzH7Kleh7c/wc7Lz8sdAxvt0GGoNjW
	WoE94tdpSElLaj/9krSyvx3asWTrsYB6YklLQbdLai4v1gIu+1yKSc4Vl51BGpAdUonB
	lLEA==
X-Gm-Message-State: AG10YOTk3nEH4/Y1d1zj4r4tF+0FH4SMmI2hyct0YnM7/2758LpHHe9SAwX2ynRRUT7S7w==
X-Received: by 10.55.76.15 with SMTP id z15mr12352240qka.32.1454626528004;
	Thu, 04 Feb 2016 14:55:28 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	w16sm6327876qka.35.2016.02.04.14.55.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 04 Feb 2016 14:55:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 22:55:17 +0000
Message-Id: <50a1e70e953ca2b1d45b1d665f9db554d57f160c.1454626259.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
References: <5bf2617ddec6ca480122c444b95cf366b3bee378.1454626259.git.raj.khem@gmail.com>
In-Reply-To: <cover.1454626259.git.raj.khem@gmail.com>
References: <cover.1454626259.git.raj.khem@gmail.com>
Subject: [PATCH 3/6] security_flags: Disable fstack-protector for gcc runtime libs
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
X-List-Received-Date: Thu, 04 Feb 2016 22:55:27 -0000

it causes a catch-22 situation where we build libssp in gcc-runtime
but also pass -fstack-protector flags which require libssp, these
libraries are special as well.

also flush out ldflags for gcc libs and glibc

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index ac4fc65..7f898ee 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -39,8 +39,8 @@ SECURITY_CFLAGS_pn-expect = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flac = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-flex = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gcc = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gcc-runtime = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-gcc-sanitizers = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-gcc-runtime = ""
+SECURITY_CFLAGS_pn-gcc-sanitizers = ""
 SECURITY_CFLAGS_pn-gdb = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gmp = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-gnutls = "${SECURITY_NO_PIE_CFLAGS}"
@@ -59,7 +59,7 @@ SECURITY_CFLAGS_pn-kexec-tools = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-iptables = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libaio = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libcap = "${SECURITY_NO_PIE_CFLAGS}"
-SECURITY_CFLAGS_pn-libgcc = "${SECURITY_NO_PIE_CFLAGS}"
+SECURITY_CFLAGS_pn-libgcc = ""
 SECURITY_CFLAGS_pn-libid3tag = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libnewt = "${SECURITY_NO_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libglu = "${SECURITY_NO_PIE_CFLAGS}"
@@ -90,6 +90,11 @@ SECURITY_CFLAGS_pn-pulseaudio = "${SECURITY_NO_PIE_CFLAGS}"
 TARGET_CFLAGS_append = " ${SECURITY_CFLAGS}"
 TARGET_LDFLAGS_append = " ${SECURITY_LDFLAGS}"
 
+SECURITY_LDFLAGS_pn-gcc-runtime = ""
+SECURITY_LDFLAGS_pn-gcc-sanitizers = ""
+SECURITY_LDFLAGS_pn-glibc = ""
+SECURITY_LDFLAGS_pn-glibc-initial = ""
+SECURITY_LDFLAGS_pn-libgcc = ""
 SECURITY_LDFLAGS_pn-xf86-video-fbdev = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-intel = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-omapfb = "${SECURITY_X_LDFLAGS}"
-- 
2.7.0


