Return-Path: <sujith.h@gmail.com>
Received: from mail-pf0-f181.google.com (mail-pf0-f181.google.com
	[209.85.192.181])
	by mail.openembedded.org (Postfix) with ESMTP id BCE7F71633
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 12:51:56 +0000 (UTC)
Received: by mail-pf0-f181.google.com with SMTP id e128so29859907pfe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Apr 2016 05:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=M+L8o6r/hz3lwHjV6OwwkE2wZGmoaikfQ8Hiu2DhSKY=;
	b=Hb9n8P5mvWctTlt36mdg0r9KPbuU65Q/xDNIdn3nVKEGDABrT6+6nCAttR8v1hnFzw
	tCIc7Q7NrMSEVakZpVh26yVu31ZC1iLkLx8nCSX6zg+8ItwLQ+9seGfPJwC1N5Bdsthb
	DPLmEGy07CV/v06DIBcnwonw3HuZmaXBR9gH+1RJWffBYClfzg2ddgrnbMlTxaIruV0l
	+zgG/a8Mw21mmOxPJgjvRicEJfKveJCXV3L/NSXz5EE3rGTR2gI2k4HOdKworjtmQJ08
	8sFuqsZjpCQGc5/DhQxLvLSAepDYrUqjrvs5zRII1XJO8fHBSD7ciu9GyTlwDq9tNK7d
	n40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=M+L8o6r/hz3lwHjV6OwwkE2wZGmoaikfQ8Hiu2DhSKY=;
	b=Nu6dTV3/HIvY6xuOVOWWKNy8x0kYwZj4iHCKvfBqq8pQl5brR6ukHAvpy+EKhFkJYQ
	sucuFex0s0cE04gEIJf4174I4cs9U2vshsRptlZNmVo9aQXRe+1gmiiCzc+zIpmXFd2b
	DY0rvZKQxgBKAfkfA2WtdKt55HDHFehIHvmrmM+Xiy/75n7RVSPNC21wFmpz52k8yZZi
	W2kATefjGJ8qwASLE9TdbZagHaAn5ofER5RtXRyiOMAjv1puSWnHK2mJiG/MYu3VzhBd
	hzwfRgSvu07ELtonp6BEsJAvHluR6l+AaYsn/YJv8VNWgvdNy8v/AiCbTIYAMm4Xs8rD
	2spA==
X-Gm-Message-State: AOPr4FUkZmTKyQDt18WOfXVrTa6B5SZRE9lQAVPqN2Xe8j3EEmvcVeb6+uAER1x+53laCA==
X-Received: by 10.98.89.141 with SMTP id k13mr20382318pfj.14.1461243117194;
	Thu, 21 Apr 2016 05:51:57 -0700 (PDT)
Received: from kdekidd0.inp-wifi.mentorg.com ([139.181.35.34])
	by smtp.gmail.com with ESMTPSA id d3sm1102003pfc.25.2016.04.21.05.51.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 21 Apr 2016 05:51:56 -0700 (PDT)
From: Sujith Haridasan <sujith.h@gmail.com>
X-Google-Original-From: Sujith Haridasan <Sujith_Haridasan@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Apr 2016 18:21:37 +0530
Message-Id: <1461243097-9546-1-git-send-email-Sujith_Haridasan@mentor.com>
X-Mailer: git-send-email 1.9.1
Cc: Sujith Haridasan <Sujith_Haridasan@mentor.com>,
	Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] gobject-introspection: fix floating dep on python-mako
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
X-List-Received-Date: Thu, 21 Apr 2016 12:51:56 -0000

From: Christopher Larson <chris_larson@mentor.com>

This was resulting in non-deterministic builds where g-ir-doc-tool may or may
not exist depending on whether python-mako was built previously. Add
a PACKAGECONFIG so the dependency is explicit.

Signed-off-by: Sujith H <sujith.h@gmail.com>
Signed-off-by: Christopher Larson <chris_larson@mentor.com>
Signed-off-by: Sujith Haridasan <Sujith_Haridasan@mentor.com>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
index 9b16147..67891a2 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
@@ -108,6 +108,8 @@ EXTRA_OECONF_class-target += "--enable-host-gi \
                               ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '--enable-introspection-data', '--disable-introspection-data', d)} \
                              "
 
+PACKAGECONFIG ?= ""
+PACKAGECONFIG[doctool] = "--enable-doctool,--disable-doctool,python-mako,"
 
 do_compile_prepend_class-target() {
         # This prevents g-ir-scanner from writing cache data to $HOME
-- 
1.9.1


