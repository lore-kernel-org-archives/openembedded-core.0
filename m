Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f67.google.com (mail-pa0-f67.google.com
	[209.85.220.67])
	by mail.openembedded.org (Postfix) with ESMTP id 3E53E606A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 19:38:31 +0000 (UTC)
Received: by mail-pa0-f67.google.com with SMTP id hh10so3849148pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 12:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=v/oeAuToX6aIe6fa24v+DrEe7akyRP7yFNBN/IVai9w=;
	b=BUzbAVG/KfoaYvfwsFr4x2uHmG4XzujWWXK8EgQycAPWUwa0wAdfb4SVAm371NEUws
	IIKesCLqczuElmWtF6j1cuFM6fvn78lnEFZdw8GWdZYelC00BfS+aG7x5DbwqBHcSVxs
	BmAO9jtnr43mvjrUHvPauPPt4kjRD8+HTC8Fou+ssaTAKVORVAqaRHsJhq5gjKYqzLle
	G8EE0TvfMz05fZmSvIqTKEsuPYowBF2DEMho1SlucslxrIl/E5a3ltH5bTRJKxZNYjs9
	+d+qhIelKBaEdyRgoUAV0xmqK5WhBSJbZPSRaKwKxNOyHMMTzsIHScuC3TXkQzsv4Rc4
	vMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=v/oeAuToX6aIe6fa24v+DrEe7akyRP7yFNBN/IVai9w=;
	b=A1n7Q391Q39kCVeoHtktvbHxNpPnETbx/MaVKiSRnWGWDNzdd2QgCdTRJGFGQjTv1e
	KchtJ7oZx4CSCyu83PYi64mvCD6Ze6IGOza3Xig36Q+Bf/00FpKffZCklFbNNIkZ5YNo
	OZOSyHYG2F7CykPcACLys5XaGslgbWvmOzq9j/Jl6IlVBvPYdvYjE4DMH5tDokclePi/
	gohMTttOvZ/M/78abIphQqOnGfSJzRh2A+h3PfI9tMwVVQKJRUwYThK3Ch+nmmLOGr6G
	l+UYAPUVHSTu3P7gc9icXDytUojrY+muAuPznko8pVzaAAn6S0+bNs4cTnnvT10ysgqt
	m2cw==
X-Gm-Message-State: ALyK8tK1jbUonvApzMZ5SvorpHt466XJRob8pAUWfYIqmFcnI9jcDXaDxVAVNFfQyUaGdg==
X-Received: by 10.66.255.42 with SMTP id an10mr78655135pad.57.1469043511643;
	Wed, 20 Jul 2016 12:38:31 -0700 (PDT)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	e10sm6465694pay.39.2016.07.20.12.38.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 20 Jul 2016 12:38:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2016 12:38:24 -0700
Message-Id: <1dae681b38dac84b2febd93bdea237c8fc516c1f.1469043317.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
References: <2c386c7b01a0ac2764c4a6d7334d79487f9371ba.1469043317.git.raj.khem@gmail.com>
In-Reply-To: <cover.1469043317.git.raj.khem@gmail.com>
References: <cover.1469043317.git.raj.khem@gmail.com>
Subject: [PATCH 2/3] webkitgtk: Do not use gold with clang
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
X-List-Received-Date: Wed, 20 Jul 2016 19:38:32 -0000

clang cross compiler fails to detect gold linker from
cross-binutils, instead it defaults to ld.gold from build
host, lets disable using gold when clang is active to avoid
this issue

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
index 28517c4..2e5a1e4 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.12.3.bb
@@ -79,6 +79,8 @@ EXTRA_OECMAKE_append_armv7a = " -DENABLE_JIT=OFF "
 # binutils 2.25.1 has a bug on aarch64:
 # https://sourceware.org/bugzilla/show_bug.cgi?id=18430
 EXTRA_OECMAKE_append_aarch64 = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
+EXTRA_OECMAKE_append_toolchain-clang = " -DUSE_LD_GOLD=OFF "
 
 # JIT not supported on MIPS either
 EXTRA_OECMAKE_append_mips = " -DENABLE_JIT=OFF "
-- 
2.9.0


