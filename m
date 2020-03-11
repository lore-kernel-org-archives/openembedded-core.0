Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
	[209.85.210.170])
	by mail.openembedded.org (Postfix) with ESMTP id 0720561BC2
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:28 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id c144so400146pfb.10
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=w7k1HGd9hBJX8mrf80fvsGku+qwTfThKwb63iI8aHGI=;
	b=vJ+StSuXps4lfU2Qq/MjkLYiZZX52ax7R5hnW+tQfuHBJWSDhwL537nfSfZgXslgtX
	OpYsxSYYuFdQdM0wmsW1BPUK+EpyBDSrsheBRhEAaa9I8CreAph3XcUcWrqv5UVBT8xv
	Sxd/qHg5NPxTDMzw0Dkc+qYW6IBtUz/K5ktakPMhQQfK5SkNULPqXs5bQ+ioA+8+aLbo
	mkq9La4x2L0FyYdmy+rURGW1ATtFVqJYYr3PDt+OEt+4FC1lvijeQXctqsO0ulvY2Rya
	GdR3hXZCO2tSaBww/C44YI6KHA3fgIeFyCFcAisu54yB2VcaEpuj8T2sJVD1APF/62L/
	VsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=w7k1HGd9hBJX8mrf80fvsGku+qwTfThKwb63iI8aHGI=;
	b=cpoxLH/tlYA98dEmYBLCxz+uv2FKqN4FSOpZhM9VuSxrZnS9jubzPNucnNCPWCXcp4
	fqJ0qFbUC1CW+YpuempI8gXLOvBMk+ib1ekVQwVsTd7hA1uNOc8qaIfWYozczMIxfZzE
	Q7leN6Tl6VhkFwjrK5lceyNpW9Y2ZDjfZhYZGeLrWK+nwSomH+tlyXT01V5WDTi9v923
	AIEC+ykfrMKAhkeUyT8J8mWMQceouHxIhRVifXa3ord+dNKRGmuVWImhUMPlbNQczJkd
	RGcmTrIIsUHgrgnD55UInRSTZYb/+TgI5dxRoooHC0uWOaiUIB/V7mWhlqd3APpQ3E6I
	u1aw==
X-Gm-Message-State: ANhLgQ3akvmcgqPU3dXhTRf2vk+Zvg8BdZ2GVk7oLu05gfBN6cwKlmuF
	6nz+qybZ9OGa4p9y9fYfF11cL8qr
X-Google-Smtp-Source: ADFU+vvhSOKTPhmeq8pfGtLswlOdcEzlA2BDxAg8Q33gqALn6u3xW2C9yOaXq4ZogXXxRGT6sZ3ZVg==
X-Received: by 2002:a63:5864:: with SMTP id i36mr698869pgm.426.1583893589037; 
	Tue, 10 Mar 2020 19:26:29 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.28
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:28 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:10 -0700
Message-Id: <2f4428d8a7af49b7f251e863b7d4f21301ed1c43.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 09/16] gcc-target.inc: Prevent sysroot from leaking into configargs.h
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:28 -0000

From: Nathan Rossi <nathan@nathanrossi.com>

Prevent the full recipe-sysroot path from leaking into configargs.h. The
configargs.h header is intended to be static and unchanged as the
content is used as a means of determining that a gcc plugin is built for
the same gcc. This also effects the output of 'gcc -v'. Due to per
recipe sysroots and staging, the sysroot path would be replaced with the
sysroot local to the recipe thus changing the content of configargs.h.
This change also improves gcc binary reproducibility. The sysroot path
is replaced with the base target root "/".

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b8d6e2ab68ee5e341fe970b191bfd334e6d2c40b)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-target.inc | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devtools/gcc/gcc-target.inc
index bdc6ff658f..987e88d32c 100644
--- a/meta/recipes-devtools/gcc/gcc-target.inc
+++ b/meta/recipes-devtools/gcc/gcc-target.inc
@@ -137,6 +137,14 @@ FILES_${PN}-doc = "\
 "
 
 do_compile () {
+	# Prevent full target sysroot path from being used in configargs.h header,
+	# as it will be rewritten when used by other sysroots preventing support
+	# for gcc plugins. Additionally the path is embeddeded into the output
+	# binary, this prevents building a reproducible binary.
+	oe_runmake configure-gcc
+	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
+	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
+
 	oe_runmake all-host
 }
 
-- 
2.17.1


