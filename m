Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6D2D6700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:15:40 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id f144so14234280pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:15:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=/HfYYY/ETKdcc0XsXN+Z7Y9+DEroBrOUHta9M5uGZfY=;
	b=ckxRoYKdGY13EYG2eQOThnPHUQ3Ed2e+q0+w0I4H8ujkZF48ceXNlCFRlVoJiiqNk7
	cSTH2Mitf7sZ3u0cTAkQx1utku7btptJPIe74aD04x6rSO3HTf2+ON0O2SCHzhmMUpwB
	2wLMs+zSHWP8iSv5WyMki1CCR7wk4moXeyGIIgS19pZpb2xZYcliVKrwcK9/THCuh0YA
	+JkChRlhj33u+HYuUYCpOUKehqTxBi6eybbN3WJCIMjXsA1nFYr5Htk6pw5jZRnIGv68
	cvdftk3MHKi8OhWTEnKaJsBp7P4Fj9Jm8mMEBIIFRaT4bfIaS6MO1rjp1iwkbnXP3dhb
	wPKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=/HfYYY/ETKdcc0XsXN+Z7Y9+DEroBrOUHta9M5uGZfY=;
	b=L+15siPn35m+uLIEbKUjVtVrZx+E1qxFIJGtxYGIbaK221+IBHdzqRAJC87xc1vvaU
	Yni6rGLZ9iXpWFibDxgwhiEXIW6nTeQLtJQi3q/Rj8gsuZseogaY5VnOtArStBoX3HBJ
	fCe95GkU4CpkSU9uYv3EVYl5jeVsajIXL3GfHgtsb8OJeRgh3XKsnJlZXj49LRoSMYFQ
	+7Fj/lkgR6zg1XA+7oYLEsdxNUlLJQ+7vORE69D7gNB4MN2vuw5NXdE0lzweHlY8vu7B
	qlRf/U8yTzRUW1L+JeuEV3DMAJVffTLEUMc1iVcgEINVxPklAjLhzwd15f/cp9tJKe8b
	Cu7Q==
X-Gm-Message-State: AIkVDXLYK831OWGT/weVOSk/7321jZExkmC9ee4SFSfE7AQy8ZqTSID7VDrG/Lnw3AUG9Q==
X-Received: by 10.84.232.197 with SMTP id x5mr49192648plm.111.1484576141503;
	Mon, 16 Jan 2017 06:15:41 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	19sm12931078pft.46.2017.01.16.06.15.39
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:15:40 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-2-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 2/30] update-alternatives.bbclass: Disable for mingw32 targets
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
X-List-Received-Date: Mon, 16 Jan 2017 14:15:41 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When building for mingw32 targets (e.g. nativesdk cross compiling for
windows), disable the dependency on update-alternatives as the Windows
platform does not support symlinks or package management.

This avoids the complex (partly non-buildable for mingw32) dependency
chain virtual/update-alternatives -> opkg-utils -> python -> ...

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index a90ef19e45..220171df4d 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -94,6 +94,10 @@ python __anonymous() {
        bb.data.inherits_class('cross-canadian', d):
         return
 
+    # Disable when targeting mingw32 (no target support)
+    if d.getVar("TARGET_OS") == "mingw32":
+        return
+
     # compute special vardeps
     gen_updatealternativesvardeps(d)
 
-- 
2.11.0


