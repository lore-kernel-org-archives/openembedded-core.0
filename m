Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 963C66140D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 15:51:06 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id y11so16666625wrt.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Feb 2020 07:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BpaS7f3+KPfuVHBfmuNvhF8Kzw9InUzrValO+7WWXqM=;
	b=fCZtODh8ij6d5lrZFbEmnhq0DAYbze7P5QE/cifIKjQyZxKhXMUPxyxLTWQ/fhSWim
	TI/Weqci8dXSWuhnK0GAXpPXzeDOrwNNw3l/pKi9+GlFa7uxhYE18hY67dnrsq2XWFKb
	EEjZ7JRG93B9WMwQXuk5TEgz6gJFXAYXzGKUPx63YU8oWydEO8L82hGF4iUD8g5d0FNr
	UIL5wLyQE22fsddbUSFt2SLH1v4k6OS+iz8LQDFgbzHkDOEEp9UHOhoAZ7/qKCVUphpC
	JaXVsPqRIfUU5ewb3bok2oftSUdIzE9ft2Ihoz+nPIvnLuU0PrK9FqsNFA2GLgFWkBkb
	O7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BpaS7f3+KPfuVHBfmuNvhF8Kzw9InUzrValO+7WWXqM=;
	b=hlRzcO8LfjPilq/BUBsSnlVwkfo34zJxn8YiFCYw9CGeUGSDArvAV6sWv0u/D6Jrjd
	Pfw1B6+WmuAUqmJFPoyJJkMIB5LjaTAfGBeqSMB8QM9JNTzjUuB2ZQ9HjC0spcT2QE5J
	T1xD+rMf5AqcNon/Nehn+gZGwmyp8BELtj7f6tgkLeh0cIZgkqOGInbWhUSzPBAIHV5y
	spsS0nuc+Rll6X//4VJWnoFf7N6JslQ4n8YojEHqtiVdvWHkkFtra/3Glsee7KDz1JCP
	Flne9gY4338dZKnkgCWwJiu2P0IL65qLO42HT+EL9O2HSQq6EyB3fIV4qZMHHizq215R
	wn/A==
X-Gm-Message-State: APjAAAVP2nIuGxYZusgu8Bapb++QsXOR6iNA9ayizSdHXcyOmLwWRpcs
	suGaVr/5F0mkEmMZ+rwkYcs+ZDMc
X-Google-Smtp-Source: APXvYqy39U5ycTX3faAVdNAy6sCLlIiMtEr71iWImLW2HSFRgeGm+Cd7OHCMONkpPSei4wWaigiLZg==
X-Received: by 2002:a5d:5742:: with SMTP id q2mr11877261wrw.145.1581868267195; 
	Sun, 16 Feb 2020 07:51:07 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id
	t81sm16513271wmg.6.2020.02.16.07.51.06
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 16 Feb 2020 07:51:06 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 16 Feb 2020 16:50:10 +0100
Message-Id: <20200216155015.21738-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200216155015.21738-1-alex.kanavin@gmail.com>
References: <20200216155015.21738-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] webkitgtk: x11 and wayland are not mutually exclusive
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
X-List-Received-Date: Sun, 16 Feb 2020 15:51:07 -0000
Content-Transfer-Encoding: 8bit

Also enabling wayland if x11 is not enabled is not necessarily
the correct decision.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.26.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
index c7f0d5e983..4aa8533b42 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.4.bb
@@ -38,7 +38,7 @@ DEPENDS = "zlib libsoup-2.4 curl libxml2 cairo libxslt libxt libidn libgcrypt \
 	   gettext-native glib-2.0 glib-2.0-native libtasn1 \
           "
 
-PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'wayland' ,d)} \
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'webgl opengl', '' ,d)} \
                    enchant \
                    libsecret \
-- 
2.25.0


