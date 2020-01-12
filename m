Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id A11716BCDC
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 16:39:50 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id c9so6243650wrw.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Jan 2020 08:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Vw958Fd5q6UzlP+xx4oUSvPRQb9j7F3BxoVNFTPBKOI=;
	b=gc7XGdMqNVPl8mV0iXh5k1RfJz6YMkx95qvfeF69G4cbED8sa76w18RV4dgDFBo7J3
	d+LD0K7RRktMOpxtiotmOfRQNwvSgatLYGhDzLB6pYya949LhM1Ks5ZclcvKSRrABtr9
	C1dPXdTOyUnw4HnvgILPigbf7riIYmBQqX3Bxk/t+PHJGHJHolIS6DB5rHW1K3l0EI3G
	k+7CZlNm2R9dOxpdUwRrev5SjnTgSIhszRZFCdTq7ILEvLvZTiyJuhDtmkzhjY7kwAyh
	6Dn1VLeLDZYE51OwPJ15ia0fvLyD7ZgG5z4lAo4M+LrK3c5N1z/bHr7ezZ6Zzt7j0QAE
	QcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Vw958Fd5q6UzlP+xx4oUSvPRQb9j7F3BxoVNFTPBKOI=;
	b=qz+5ltK6HtPazBaf+3fsYf84Rh3fdZjs9dPbB6dIj7iXlkZYrJTyfsTAyX9ndGSicH
	iX0hSZOAFfgGdZmrm7NUvs/tDqZknFSOfgTbDz5n2lKsmwXEkapdJbfdJUH0jUJPjGW/
	fjztvz8p8ADqCuh/+J7UxzQrggujHevc8HCL2OjI+8DwWK0wwqUVSkWJg8lopakPNVTe
	xCRxW+/kXTZ29WmRKeyQM4il3cH9J1YE7Q1zaKJQPgxmTPJDChUNrG57+FykJ+BNLxHt
	J/2feHwzq7kprC61dUod+ICqaC2z9l4ZznoXW06O60RgXEP2MXqEXmXorD1+a/b+vs5o
	fYLQ==
X-Gm-Message-State: APjAAAX8bmjs/4ecdoVXvemlG06zfm5eFHtPcacR3LJHFj1fTxkm+7i5
	fJ/mv8Ud5rFhT6tTkVjYQCdYQiwjwuc=
X-Google-Smtp-Source: APXvYqxLRHqLEbIrA3ip51h+uGndK7oIjGFbf3Bbnnyo28lQtSxICVnudFd9rc//2x9Cu1y+zsGDOQ==
X-Received: by 2002:adf:e5cb:: with SMTP id a11mr13562349wrn.28.1578847191223; 
	Sun, 12 Jan 2020 08:39:51 -0800 (PST)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	b21sm10742619wmd.37.2020.01.12.08.39.50
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 12 Jan 2020 08:39:50 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Jan 2020 16:39:47 +0000
Message-Id: <20200112163947.79331-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] glib-2.0: Fix hardcoded paths with dots in names
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
X-List-Received-Date: Sun, 12 Jan 2020 16:39:51 -0000

b4087338be09 ("glib-2.0: Fix hardcoded paths in checksums") fixed
embedded paths in task hashes, but if these paths included dots then
these were flattened when COREBASE was computed. Fix this by resolving
our filenames before replacing the path segments with COREBASE.

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
index 5e71c81cca19..e4cf50d22f6c 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.62.4.bb
@@ -36,7 +36,7 @@ def find_meson_cross_files(d):
     files = collections.OrderedDict()
     for path in d.getVar("FILESPATH").split(":"):
         for element in sitedata:
-            filename = os.path.join(path, "meson.cross.d", element)
+            filename = os.path.normpath(os.path.join(path, "meson.cross.d", element))
             files[filename.replace(corebase, "${COREBASE}")] = os.path.exists(filename)
 
     items = ["--cross-file=" + k for k,v in files.items() if v]
-- 
2.17.1


