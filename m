Return-Path: <nathan@nathanrossi.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id E894271AC8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 14:16:45 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id 75so5491278pgf.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jan 2017 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=+4meqZSsinulyEJGZxqD3xDRgfAiaTp8d67qRj4rnOQ=;
	b=d492ZxhsA4fd0YbkihDBP7sMa3Ta6+s9ClFcyyMlBym+HpH262XFjVHiikTJvyCqsq
	02QCiSINX9EceXQOwBBYgMW33oPQNRXmIG7kGXB2CrNoDXBrYphsTPzOLZBjRkZ8mx/e
	tdHH174X+kxDYoVG11iCDhbI2DK5aG1i0gsPj96yMfI/WfbK5IICSVsiqJrbkaW/tejX
	ghevXPzif5x1dQn3VNCQ2TlYe+2KAjfi3Ni+Sp/MfcEolGikuWfjSQhkgpQYnp1CeKgS
	lyIENFFZ0JlcuB9/4pyodT9pd/IezXHv+Q1lr4VoMidcfKSQ6BVUxjnpMmCz4Qb4uyJp
	l42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=+4meqZSsinulyEJGZxqD3xDRgfAiaTp8d67qRj4rnOQ=;
	b=F8vYiBnS1pS6s1nT5rTm2kVkLjdX24z3YnWSe6gt+iaG6UDa6hJdfaKbMDPMgEfNbT
	HnSI2mEjeoATNILuviiiPa1dOeU5baSnkKe+CXf+u+I0W38IlGZoYmMRJZS+8MwmPb9h
	4P/8jQnyVfn3WA9kV2L3mCrqIeQ392hp3VSfkAiK8rQQ91lofzcdUhev0KClHV/isj2f
	BXOviPEf9McggizOhRGvwYfi5nwL4NoWQPcyzHScC2aGpb1umtulAs5XKlsQKZspoz/O
	PJNfLi7QVZ8VMpp2o60iueMJHoQmVXE6zIjW0eqHnUL7C3x4tq0gkp+T4TO5r1JaQK6+
	emzQ==
X-Gm-Message-State: AIkVDXJ6B9VV5YCC5jqL838fl1BX95kjP8DGHSDEu+qhpXEpSqNVlK2UHdku70WPzf7HzA==
X-Received: by 10.99.53.195 with SMTP id c186mr40199047pga.24.1484576206708;
	Mon, 16 Jan 2017 06:16:46 -0800 (PST)
Received: from [127.0.1.1] (CPE-58-165-45-185.lns1.lon.bigpond.net.au.
	[58.165.45.185]) by smtp.gmail.com with ESMTPSA id
	d68sm16365526pfj.92.2017.01.16.06.16.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jan 2017 06:16:46 -0800 (PST)
Date: Tue, 17 Jan 2017 00:15:10 +1000
Message-Id: <20170116141510.3321-14-nathan@nathanrossi.com>
In-Reply-To: <20170116141510.3321-0-nathan@nathanrossi.com>
References: <20170116141510.3321-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 14/30] glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
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
X-List-Received-Date: Mon, 16 Jan 2017 14:16:46 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

When renaming the 'gio-querymodules' binary to prefix with the current
MLPREFIX, only do this for target packages where the MLPREFIX makes
sense. This skips renaming for nativesdk targets which have MLPREFIX set
to 'nativesdk-'.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/recipes-core/glib-2.0/glib.inc | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 0f8535b1b3..b892989b87 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -99,11 +99,13 @@ do_install_append () {
 			rm ${D}${datadir}/installed-tests/glib/gdbus-serialization.test
 		fi
 	fi
+}
 
-        # Make sure gio-querymodules is unique among multilibs
-        if test "x${MLPREFIX}" != "x"; then
-                mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
-        fi
+do_install_append_class-target () {
+	# Make sure gio-querymodules is unique among multilibs
+	if test "x${MLPREFIX}" != "x"; then
+		mv ${D}${libexecdir}/gio-querymodules ${D}${libexecdir}/${MLPREFIX}gio-querymodules
+	fi
 }
 
 do_install_append_libc-musl () {
-- 
2.11.0


