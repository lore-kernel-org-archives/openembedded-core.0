Return-Path: <akuster808@gmail.com>
Received: from mail-yk0-f193.google.com (mail-yk0-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 88C2771633
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 01:29:48 +0000 (UTC)
Received: by mail-yk0-f193.google.com with SMTP id r207so4472251ykd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 17:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=VC56No81RHUJyFwWD6J75MezhDffajZf/iy5EvH7prU=;
	b=FEMrUZ7cvQpvmh1suKL3EGCbE02awL9HIha1tapQxtza7ICz1wdoZjdCOP6faHvJZe
	lhWHmBP7aYbJAtLKr65yBsO2MY71e3DA6dt1l9QRG+GBZmq0S7QCvdwJI/HAQaGWiqpV
	BNCbeMnJk8P6+WKIUL6PQraNa4rLl55z0KJlvbnKRpPGu6iPSVk/cR1TNkQwRdjZWUJ8
	z8uXfdzPo2UvHESEv9dts1mfVkopCsqj0QZF6jbqzPsi5HDiSCirHbs3F48Q7PJjml2K
	OZmPuo1V863oKSlgR+Qa+sl42Zb4uevMr0gtvUh0Bh/MsVtkf/cXHX03GvcWFzNIo/j0
	TFmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=VC56No81RHUJyFwWD6J75MezhDffajZf/iy5EvH7prU=;
	b=U7NctkSbCMBBlrP7RPwjUDbGPZWlkFeaBf7joBtsuN93z+UNtZmoBw8XrFoP7hZHjl
	IctvbhwNdMimqo0dP3QYxo4TDSiauxrR/WOGSXbhIMjtP4nYy4HQCyOqAr2/v5OmLmvv
	yq616k9kNPNA0fQr/rr5S/0Y3dlN5FPKhin7fpOmHkg256H6ytOmQfmvwcQKjPHx2b5c
	iCqRCzS/D9EsJc4wiSQBpZN0AObUkzNyOyeuWyzDe6oaVVHpE8bLYe+8W3epKeYugM95
	qZ4Y9narSXKrNrcTOukSn20ICfaS0uE+v8j6xUcIXE9cJNghuZ8lPaf1qk055qYoS8dk
	LChg==
X-Gm-Message-State: AG10YOT+c148Pjz2lA/yY/CyPiZ8aLIYABKFycvOJel+xGzejj42o2WIKgGa1S+zSX7bdg==
X-Received: by 10.37.14.213 with SMTP id 204mr16575724ybo.70.1454981389189;
	Mon, 08 Feb 2016 17:29:49 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	e132sm5813430ywa.18.2016.02.08.17.29.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 17:29:47 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 17:29:42 -0800
Message-Id: <1454981383-15843-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1454981383-15843-1-git-send-email-akuster808@gmail.com>
References: <1454981383-15843-1-git-send-email-akuster808@gmail.com>
MIME-Version: 1.0
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH 2/3] nettle: Security fix CVE-2015-8803 and CVE-2015-8805
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
X-List-Received-Date: Tue, 09 Feb 2016 01:29:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nettle/nettle-3.1.1/CVE-2015-8803_8805.patch   | 71 ++++++++++++++++++++++
 meta/recipes-support/nettle/nettle_3.1.1.bb        |  4 ++
 2 files changed, 75 insertions(+)
 create mode 100644 meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch

diff --git a/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch
new file mode 100644
index 0000000..b4ff228
--- /dev/null
+++ b/meta/recipes-support/nettle/nettle-3.1.1/CVE-2015-8803_8805.patch
@@ -0,0 +1,71 @@
+Upstream-Status: Backport
+https://git.lysator.liu.se/nettle/nettle/commit/c71d2c9d20eeebb985e3872e4550137209e3ce4d
+
+CVE: CVE-2015-8803
+CVE: CVE-2015-8805
+
+Same fix for both.
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+Index: nettle-3.1.1/ecc-256.c
+===================================================================
+--- nettle-3.1.1.orig/ecc-256.c
++++ nettle-3.1.1/ecc-256.c
+@@ -113,8 +113,19 @@ ecc_256_modp (const struct ecc_modulo *p
+ 
+       assert (q2 < 2);
+ 
+-      /* We multiply by two low limbs of p, 2^96 - 1, so we could use
+-	 shifts rather than mul. */
++      /*
++	 n-1 n-2 n-3 n-4
++        +---+---+---+---+
++        | u1| u0| u low |
++        +---+---+---+---+
++          - | q1(2^96-1)|
++            +-------+---+
++            |q2(2^.)|
++            +-------+
++
++	 We multiply by two low limbs of p, 2^96 - 1, so we could use
++	 shifts rather than mul.
++      */
+       t = mpn_submul_1 (rp + n - 4, p->m, 2, q1);
+       t += cnd_sub_n (q2, rp + n - 3, p->m, 1);
+       t += (-q2) & 0xffffffff;
+@@ -124,7 +135,10 @@ ecc_256_modp (const struct ecc_modulo *p
+       u0 -= t;
+       t = (u1 < cy);
+       u1 -= cy;
+-      u1 += cnd_add_n (t, rp + n - 4, p->m, 3);
++
++      cy = cnd_add_n (t, rp + n - 4, p->m, 2);
++      u0 += cy;
++      u1 += (u0 < cy);
+       u1 -= (-t) & 0xffffffff;
+     }
+   rp[2] = u0;
+@@ -211,7 +225,7 @@ ecc_256_modq (const struct ecc_modulo *q
+ 
+       /* Conditional add of p */
+       u1 += t;
+-      u2 += (t<<32) + (u0 < t);
++      u2 += (t<<32) + (u1 < t);
+ 
+       t = cnd_add_n (t, rp + n - 4, q->m, 2);
+       u1 += t;
+Index: nettle-3.1.1/ChangeLog
+===================================================================
+--- nettle-3.1.1.orig/ChangeLog
++++ nettle-3.1.1/ChangeLog
+@@ -1,3 +1,9 @@
++2015-12-10  Niels Möller  <nisse@lysator.liu.se>
++
++   * ecc-256.c (ecc_256_modp): Fixed carry propagation bug. Problem
++   reported by Hanno Böck.
++   (ecc_256_modq): Fixed another carry propagation bug.
++
+ 2015-04-24  Niels Möller  <nisse@lysator.liu.se>
+ 
+ 	* Released nettle-3.1.1.
diff --git a/meta/recipes-support/nettle/nettle_3.1.1.bb b/meta/recipes-support/nettle/nettle_3.1.1.bb
index 7d7134f..1fe3461 100644
--- a/meta/recipes-support/nettle/nettle_3.1.1.bb
+++ b/meta/recipes-support/nettle/nettle_3.1.1.bb
@@ -7,5 +7,9 @@ LIC_FILES_CHKSUM = "file://COPYING.LESSERv3;md5=6a6a8e020838b23406c81b19c1d46df6
                     file://serpent-decrypt.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e \
                     file://serpent-set-key.c;beginline=14;endline=36;md5=ca0d220bc413e1842ecc507690ce416e"
 
+SRC_URI += "\
+            file://CVE-2015-8803_8805.patch \
+            "
+
 SRC_URI[md5sum] = "b40fa88dc32f37a182b6b42092ebb144"
 SRC_URI[sha256sum] = "5fd4d25d64d8ddcb85d0d897572af73b05b4d163c6cc49438a5bfbb8ff293d4c"
-- 
2.3.5


