Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id D024D760A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:46:06 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id 194so30896156pgd.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=hLrHeaEDjyGG5MrxgJmNLKEIwBxs/pwlP05KbraQhFg=;
	b=EvZ8+fTmyOW70yBbYXXmbAM0Vw15cXNS4gtFLX4Ti0w2vj118GaFokF5ZsKvtSKNI6
	yIp2NBj861KP2dzEhmxd8SijgPTyepSBDkzILVyCPQNGErOBv6l93MagwZB1iUieSAxb
	vvN8AJxoohbbUrceoWT5aNA32pyCDsTXkV25hhzJkXcyy+/00ECkenLabu7Vy82bi1cA
	6MM7YeYsMslT3UPoXVHH1+8VY3Dh2oQVhM57/I2Ul7dxl/0hxkcg/9suqe2FSeTuLVwO
	kjYNAHoGEWMweYqbnxDO6psNu3zz03LiXYxQKg2dpVMVY4Pv1P6n8p5HuWGwHkvYAsbL
	E1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=hLrHeaEDjyGG5MrxgJmNLKEIwBxs/pwlP05KbraQhFg=;
	b=NlXdSKTKSKjRIydmAxBw6WKq4BG1Q+D0ewyNMr/1z4hxA0VS1Pu2VhKnKXxyIj7Hya
	DA7shUBRZEOx1gjEaaX4w67aIlcsTWqazlRq8TNz8Bli2B4sIqAgMIaPlf2IuE4rGjmO
	H4hjqZ0y28gE9V5X235LIfJCVRMutquXy2sbmNaZ2awDeMzyfpkT7J1QBAkhVKXAaT49
	wCIx3aCmL7PcDk8ayAdIwjmu5NZ8MUujWIY8qXENLYpiyIiWxwZy4npO5dRbqZRPjXQX
	zdPTZgdhIOYGeRsLiKpStqjGLDf/2R5XxgU4sef3b552RrlghOUr3jley4aIOoJotCHL
	f3SQ==
X-Gm-Message-State: AIkVDXJY6hDopmguVjqbld/MJTW938jFyKaLD3Hw4HWIBar+Ru4I6vyIU2BgxJVWPeUKlw==
X-Received: by 10.99.143.18 with SMTP id n18mr22146390pgd.133.1485762367110;
	Sun, 29 Jan 2017 23:46:07 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	j28sm29649649pfj.2.2017.01.29.23.46.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:46:06 -0800 (PST)
Date: Mon, 30 Jan 2017 17:45:52 +1000
Message-Id: <20170130074552.32419-2-nathan@nathanrossi.com>
In-Reply-To: <20170130074552.32419-0-nathan@nathanrossi.com>
References: <20170130074552.32419-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 2/2] glib-2.0/glib.inc: If 'charset.alias' exists drop it
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
X-List-Received-Date: Mon, 30 Jan 2017 07:46:06 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Delete the 'charset.alias' file during the do_install task if it exists.
This file is not shipped in any packages and on the targets that it is
generated (musl and mingw32) it is undesired.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d0e0c256ba..3367ac9153 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -97,6 +97,10 @@ do_install_append () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+
+	if [ -e ${D}${libdir}/charset.alias ]; then
+		rm -f ${D}${libdir}/charset.alias
+	fi
 }
 
 do_install_append_class-target () {
@@ -106,10 +110,6 @@ do_install_append_class-target () {
 	fi
 }
 
-do_install_append_libc-musl () {
-	rm -f ${D}${libdir}/charset.alias
-}
-
 RDEPENDS_${PN}-ptest += "\
             gnome-desktop-testing \
             tzdata \
-- 
2.11.0


