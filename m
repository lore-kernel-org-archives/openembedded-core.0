Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
	[209.85.128.68])
	by mail.openembedded.org (Postfix) with ESMTP id 50AC27F962
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 10:47:38 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id d139so6115973wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Jan 2020 02:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=yn0WutylgZvej/YPy9oTofvfn9iZg8kXo23BxC/r0d8=;
	b=Hi9Pge7Q6zsPyNP7q2Fk0KUFF2T7cfAeYRKhLD3wPh/ezd4NdL64bqRYNWq+LIaJct
	MoV3vEK16mbPkTs1YuICie9GW8BPWEstMPydox5s2R1bYefPevECqHBVz+wBiGwJjJGW
	fsUtHh2FcrunJ5edprgY37rjEZeB5kvUa5X7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=yn0WutylgZvej/YPy9oTofvfn9iZg8kXo23BxC/r0d8=;
	b=YYXMrKQT7cJa7IEOt5HZ5iFZ7otiH3N9ewKBdJa0BJCbdGq+nFlDipmVbQqGoF4VCc
	cVu5hI8gDG6eGL+HkKUgPfdn/NQ+WwblQr+UlAvC3sP0yIRDj4Me60CE/xFdYO5kZibx
	tEgAAtaUM+EGlS09uUgAXz/+hXeLqSUwNaRMfe5D6KZQ7eQxDKp3SJaVprYODeOmVZ5U
	QYurXofOaUGxNeH/T0UVo7HbS8eWH7YHu0n+P2WKwF2bFtNYZljxcAhQ9Nem/fWmPxBM
	+DAjznYF/EVQitq8HlltZDorJLIfIQZLeWTnkfoN7N0Ruxl/I3Wy+vF+iL4rc/AwEg9N
	uGcg==
X-Gm-Message-State: APjAAAWEOLU1rl79COspw8hNogMhLYVlboPC36K8bSYatP+3Mj0qveeL
	dMevKBXXwu4p1ffGpXzEJ1Qs1nDOpC4=
X-Google-Smtp-Source: APXvYqyZ0znnj243Ndafru4O8MHGf0cx0Dk/8qRAtX2v/JJyOC+pKv1TWjMZeeyGCX06c2jN7yKvZg==
X-Received: by 2002:a1c:3187:: with SMTP id x129mr9592502wmx.91.1578739658719; 
	Sat, 11 Jan 2020 02:47:38 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k11sm5657807wmc.20.2020.01.11.02.47.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 11 Jan 2020 02:47:38 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 11 Jan 2020 10:47:36 +0000
Message-Id: <20200111104736.31797-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200111104736.31797-1-richard.purdie@linuxfoundation.org>
References: <20200111104736.31797-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 2/2] glib-2.0: Fix hardcoded paths in checksums
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
X-List-Received-Date: Sat, 11 Jan 2020 10:47:38 -0000
Content-Transfer-Encoding: 8bit

The expansion by this function, recently added by the meson site handling code
was causing hardcoded paths to become embedded in the tash hashes. Avoid this
(and hence avoid eSDK failures which exposed this).

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 953fba501a7..5e71c81cca1 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -29,6 +29,7 @@ def find_meson_cross_files(d):
     if bb.data.inherits_class('native', d):
         return ""
 
+    corebase = d.getVar("COREBASE")
     import collections
     sitedata = siteinfo_data(d)
     # filename -> found
@@ -36,7 +37,7 @@ def find_meson_cross_files(d):
     for path in d.getVar("FILESPATH").split(":"):
         for element in sitedata:
             filename = os.path.join(path, "meson.cross.d", element)
-            files[filename] = os.path.exists(filename)
+            files[filename.replace(corebase, "${COREBASE}")] = os.path.exists(filename)
 
     items = ["--cross-file=" + k for k,v in files.items() if v]
     d.appendVar("EXTRA_OEMESON", " " + " ".join(items))
-- 
2.20.1


