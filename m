Return-Path: <liu.ming50@gmail.com>
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by mail.openembedded.org (Postfix) with ESMTP id C87307F331
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 09:03:37 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id u6so11911077edq.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 Sep 2019 02:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=zgHE0Pei722yBV8Ta2IMMbokW5Q43YsRYpCgIbj5YV4=;
	b=IgBwkEUo8dzo6aQjYw+Xe2K4U7Elrgf2sIgbZsz0xRMlEUfWtxXa1EUEnNIpyZD6YZ
	uFpxcaVNsu1fRPZvj1XaFc6vE5d2WGd4sW85n7ccokxd0dZ7ZDAR61nbRM7rOFQFhue7
	hrzfIUELFQoaFQGVELJ4ttuqSmwvDciHiegtVxLUIA6Q5I0niFaCrp0+7zCL4x8gY0iV
	FhwrOodeD/Tbno+rR/964Tj4HflcdZVPCwLfZCmLpHG0VQRue5Y9t9yy5vcUjloWQTBP
	swENQ4fQGXLQnWul6XmY5K+KmIymuevl2ZuUhLy3kJstQlBSrByDCjBJIXJos0Kt6EJG
	wXYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zgHE0Pei722yBV8Ta2IMMbokW5Q43YsRYpCgIbj5YV4=;
	b=X++eFEnXvVn4/IoSXwSSBWnKd+kuHebm8vh2+VWtuEsFvKtZg8Kr4atFljy+J/eBkK
	T4pp4neeIn+VcdzRG3vcqN8SlKZdLu6y77W+NaSpbKgUhfodDk8GQUkdO+gfocXMufkh
	/GpqHLq5doGAEqV7A66z5hPPOIix8YCC76N3fS9KUnaibNAD8hV2vgyOt/N0f/1YwOyc
	oh2RF4VZHN2PWse5jljyBuZ1+UAfyK0wBsCAY5wr8PB0+Qg5kDQOGJSxRBg8bStnprng
	UaJfAIN6k72PBuiv8S2f2VX1rjiumFt1WSbflUq0IOFjoleowCygYehMDRkM3XKgDqrY
	DpxQ==
X-Gm-Message-State: APjAAAWbexy781+UawYSFZffz0yrD6b4tI5s9G4m3lBn05j/9tK2UYMg
	ON+W24u1j6TEGEg120c6zUiKhHR/vk4=
X-Google-Smtp-Source: APXvYqzFYiZlVfSL6DsVH98d+ohVp5o7my9dPKN+djTmgX+5raH6Pbvwo1NKg69Zrd353JR9Sp22Rw==
X-Received: by 2002:a50:8d5e:: with SMTP id t30mr12595973edt.112.1567501418066;
	Tue, 03 Sep 2019 02:03:38 -0700 (PDT)
Received: from peterliu-Precision-7530.toradex.int ([27.191.203.54])
	by smtp.gmail.com with ESMTPSA id f10sm820964ejd.30.2019.09.03.02.03.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 03 Sep 2019 02:03:37 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 Sep 2019 17:01:48 +0800
Message-Id: <1567501308-20950-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: stefan.agner@toradex.com, Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] iputils: fix a usrmerge build issue
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
X-List-Received-Date: Tue, 03 Sep 2019 09:03:38 -0000

From: Ming Liu <liu.ming50@gmail.com>

Fix a following build issue when usrmerge is enabled:
| WARNING: iputils-s20190709-r0 do_package: iputils: alternative target (/usr/bin/ping or /usr/bin/ping.iputils) does not exist, skipping...
| WARNING: iputils-s20190709-r0 do_package: iputils: NOT adding alternative provide /usr/bin/ping: /usr/bin/ping.iputils does not exist
| ERROR: iputils-s20190709-r0 do_package: QA Issue: iputils: Files/directories were installed but not shipped in any package:
|  /bin/tracepath
|  /bin/ping
|  /bin/arping
|  /bin/traceroute6
|  /bin/tftpd
|  /bin/clockdiff
|  /sbin/rdisc
|  /sbin/rarpd
|  /sbin/ninfod

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/recipes-extended/iputils/iputils_s20190709.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/iputils/iputils_s20190709.bb b/meta/recipes-extended/iputils/iputils_s20190709.bb
index 34a6c68..ea7e6e3 100644
--- a/meta/recipes-extended/iputils/iputils_s20190709.bb
+++ b/meta/recipes-extended/iputils/iputils_s20190709.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[docs] = "-DBUILD_HTML_MANS=true -DBUILD_MANS=true,-DBUILD_HTML_MAN
 
 inherit meson update-alternatives
 
-EXTRA_OEMESON += "--prefix=/"
+EXTRA_OEMESON += "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '', '--prefix=/', d)}"
 
 ALTERNATIVE_PRIORITY = "100"
 
-- 
2.7.4


