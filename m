Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1C1DE772BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2017 07:46:01 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id 19so22750087pfo.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Jan 2017 23:46:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:in-reply-to:references:from:to:cc:subject
	:mime-version:content-transfer-encoding;
	bh=d6eqVoEBooc1uVwt1GDDqhspFlXmfdCO4PlGgxKWA30=;
	b=J7JaFdvJSRP+XpE7Tc5/cf3pais4Ay+NFPwFJCCd6FccCl+A8dGiYO9DtzMYnft9TI
	GxnVONE8LAXU3VQLBdObn/2y37txr+IajU3ZqxdImdGouIblL6KaaunMorZs2l5S0dIR
	omJ6c57taDZjNdX/BXNh+VU8tylfTtum08xvEr840EA7jQCwhj8cKuScqQp9SDPfSpfi
	uiiD3WaFwJQ3p9mw4fB+MQXofN8L0dHKlwW79yizPm6A4oZEr2hMyc8PoX05lH0I9/ox
	rR8r9k/EnHkbUUPiJBblkM4SajOG8jVqavKNGbZznNz0PdDKhpXAjtZgloT0GWADFSE3
	R7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:in-reply-to:references:from:to
	:cc:subject:mime-version:content-transfer-encoding;
	bh=d6eqVoEBooc1uVwt1GDDqhspFlXmfdCO4PlGgxKWA30=;
	b=UsPjYR4ZnuGusnExgrRnVBWhyODCFVXT/Ggci8IqHyd5Zi23J3JNzYAZRYi6kibTe8
	6x5GuAKrD7ZVIKr4GFnphUmsK20jHJxCe0EHCTKzWcnC1aqFWjopCTIYpTuIY1rRh5Dy
	QxBOYprXvIjuTSkHWyCA0GBjXehbWLLktXFH/Zrfz30FagVt1JFcU9Psj5HNM9q6XLvm
	rgCbVt9nU8t/G8THEtlzkRefyTi6G7I7RXZglvNvpsyDSzIkzNjvimoOfXMp4goe6PHM
	/3b7k8zYOABxNBpag+zx8eSPZwHmCQq1ltciXmPlD42TbEQxGfiy39lpmXYi77J1evaC
	QLmA==
X-Gm-Message-State: AIkVDXKSTwxmfQmftDsH9t/fWLRuSihG3PK9HOkrbVdD6OzIkIPZFWzakz1plj5j4bblnQ==
X-Received: by 10.98.71.199 with SMTP id p68mr21870228pfi.104.1485762362381;
	Sun, 29 Jan 2017 23:46:02 -0800 (PST)
Received: from [127.0.1.1] ([58.165.136.65]) by smtp.gmail.com with ESMTPSA id
	e129sm29644938pfe.8.2017.01.29.23.46.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Jan 2017 23:46:01 -0800 (PST)
Date: Mon, 30 Jan 2017 17:45:52 +1000
Message-Id: <20170130074552.32419-1-nathan@nathanrossi.com>
In-Reply-To: <20170130074552.32419-0-nathan@nathanrossi.com>
References: <20170130074552.32419-0-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Cc: Alistair Francis <alistai@xilinx.com>
Subject: [PATCH 1/2] glib-2.0/glib.inc: Only apply MLPREFIX renaming to class-target
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
X-List-Received-Date: Mon, 30 Jan 2017 07:46:02 -0000
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
index cb6aca702f..d0e0c256ba 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -97,11 +97,13 @@ do_install_append () {
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


