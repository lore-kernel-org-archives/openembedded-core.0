Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id EDD28797DC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 13:31:33 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id n11-v6so21399209wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 06:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CeH2FbE7mCIx6LNF05r36Z9I68kV+s5dEVFmvTkijdE=;
	b=JjKXlvDB2oxEc+BjwG8na+DGtbKbbd8NwHWVOxp3VxplVONAdJbeoiH0X/RyRL8vdp
	fyhtXaxNMdeKLsl64aZy9GMttfH/NAtrc9QLEkukqnbtFTkUVg8vn2o9FH13wFiVdYi2
	ACXLpBtvThLm0L8dLKJxncJtRp+gQtpIh2RcJ62o7RIuFaLmGH43sgUdc+Ae/M97wJOX
	lPu5kCyPl4si/vmKaH2NaUkFLs6GpulL3PcLhEF33HNrOM7Kf8RvgV3U6f8cPayVqzCM
	E0MLAEHtPZeNWuz9Ti+iIxK02OY+Uui8Q+GrwX4XGdKQXiu4U8nH4bJC45OKzSPs/+aN
	+uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CeH2FbE7mCIx6LNF05r36Z9I68kV+s5dEVFmvTkijdE=;
	b=LnAqb7Tky0Opm1CBa+4s10WAK1DeBvkk8IfmzU/h5apG+jGSe9kUKANgf7TQbokvFQ
	5b+dq/zTNqd3Expj4/GmippzkjTbRYrzXUeJj1wXnnXa2AunR9voUWt/ZlUMWMVeGstf
	macQ3nz5/Ujd5XWkS00b2bwQTtZdqXRhEWE0C4y6NfNHLnzM12VDq3Ht9HCWn8TjSH5T
	Ql0Rtnrww8y0Zsbgb1f5x00sELW5l3P4KyKlzcs3hW19H493pWDNz6jfBiHSqN6bOR5l
	rizdqjlcEVlw9BIT+aS4NfDZITQZYzlKZN8CB9uvePqXeKuuqABMVjNCV8cu8F2LKzY7
	kpZw==
X-Gm-Message-State: APzg51BK3IBi6OCkFouJEhmgWxpiw5Rv+TxBWIDqLdpLt+imRiw/7dcc
	/fSNDZGrPDJPM/9REE0mtqpCETCMQd4=
X-Google-Smtp-Source: ANB0VdZvY/TvOePJqzQYQGKXBhppU/T3PAwnal2EnHV1+Cu52JR0yetENYBwJZAXjvNBaD/0aw+Xew==
X-Received: by 2002:a1c:a8cf:: with SMTP id
	r198-v6mr716358wme.133.1536586294227; 
	Mon, 10 Sep 2018 06:31:34 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	p11-v6sm17695045wrd.74.2018.09.10.06.31.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Sep 2018 06:31:33 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2018 14:31:23 +0100
Message-Id: <20180910133123.22372-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180910133123.22372-1-ross.burton@intel.com>
References: <20180910133123.22372-1-ross.burton@intel.com>
Subject: [PATCH 4/4] python3: fix multiprocessing
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
X-List-Received-Date: Mon, 10 Sep 2018 13:31:34 -0000

glibc 2.28 slightly changed the behaviour of sigaddset() which broke
multiprocessing.  Backport a patch from Python 3.6 to solve this.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/python/python3/signal.patch | 56 +++++++++++++++++++++++
 meta/recipes-devtools/python/python3_3.5.5.bb     |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/signal.patch

diff --git a/meta/recipes-devtools/python/python3/signal.patch b/meta/recipes-devtools/python/python3/signal.patch
new file mode 100644
index 00000000000..534a097771c
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/signal.patch
@@ -0,0 +1,56 @@
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 4315389df3c4e8c1f94a18ab11a4b234762132b1 Mon Sep 17 00:00:00 2001
+From: Antoine Pitrou <pitrou@free.fr>
+Date: Mon, 23 Apr 2018 22:22:49 +0200
+Subject: [PATCH] [3.6] bpo-33329: Fix multiprocessing regression on newer
+ glibcs (GH-6575) (GH-6582)
+
+Starting with glibc 2.27.9000-xxx, sigaddset() can return EINVAL for some
+reserved signal numbers between 1 and NSIG.  The `range(1, NSIG)` idiom
+is commonly used to select all signals for blocking with `pthread_sigmask`.
+So we ignore the sigaddset() return value until we expose sigfillset()
+to provide a better idiom.
+(cherry picked from commit 25038ecfb665bef641abf8cb61afff7505b0e008)
+---
+ .../next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst  |  1 +
+ Modules/signalmodule.c                                     | 14 ++++++++------
+ 2 files changed, 9 insertions(+), 6 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2018-04-23-13-21-39.bpo-33329.lQ-Eod.rst
+
+diff --git a/Modules/signalmodule.c b/Modules/signalmodule.c
+index e0d06b434d..138e74e8a9 100644
+--- a/Modules/signalmodule.c
++++ b/Modules/signalmodule.c
+@@ -744,7 +744,6 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)
+     int result = -1;
+     PyObject *iterator, *item;
+     long signum;
+-    int err;
+ 
+     sigemptyset(mask);
+ 
+@@ -766,11 +765,14 @@ iterable_to_sigset(PyObject *iterable, sigset_t *mask)
+         Py_DECREF(item);
+         if (signum == -1 && PyErr_Occurred())
+             goto error;
+-        if (0 < signum && signum < NSIG)
+-            err = sigaddset(mask, (int)signum);
+-        else
+-            err = 1;
+-        if (err) {
++        if (0 < signum && signum < NSIG) {
++            /* bpo-33329: ignore sigaddset() return value as it can fail
++             * for some reserved signals, but we want the `range(1, NSIG)`
++             * idiom to allow selecting all valid signals.
++             */
++            (void) sigaddset(mask, (int)signum);
++        }
++        else {
+             PyErr_Format(PyExc_ValueError,
+                          "signal number %ld out of range", signum);
+             goto error;
+-- 
+2.11.0
+
diff --git a/meta/recipes-devtools/python/python3_3.5.5.bb b/meta/recipes-devtools/python/python3_3.5.5.bb
index 02decf470c8..15ec7d7fda6 100644
--- a/meta/recipes-devtools/python/python3_3.5.5.bb
+++ b/meta/recipes-devtools/python/python3_3.5.5.bb
@@ -41,6 +41,7 @@ SRC_URI += "\
             file://0002-Makefile-add-target-to-split-profile-generation.patch \
             file://float-endian.patch \
             file://ftplib.patch \
+            file://signal.patch \
            "
 SRC_URI[md5sum] = "f3763edf9824d5d3a15f5f646083b6e0"
 SRC_URI[sha256sum] = "063d2c3b0402d6191b90731e0f735c64830e7522348aeb7ed382a83165d45009"
-- 
2.11.0


