Return-Path: <jpewhacker@gmail.com>
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5C69B7E7AF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 13:34:26 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id w25so3036837ioc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Jun 2019 06:34:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=y9iy8oJPRlx7MiWyL7lcoN2b8M7sulf0iZVqF/j6ZvU=;
	b=lMk2Xw2vjlTPqQ8eolIWG6wI+XKTL4BAo1Wtuha7UeKZ9SvNiEgEPTesD8h+dNWW3t
	mxnyM4rW/poFP2sN4dXCyHEptAJEsJfTD+M+hNi2bDdCceNmxssZy3Co7rDRwIgs5jFh
	crAvYV8BijRrhEoqQRyLqBqwJyHoTMEyh8qZ584WbW56WFtv0EYJfAERyL289cjeQb4b
	zvqyO1IyftmqkciE+1EBhQHy3HwO7OHGkc+D19FHNtDeB50MkaV546oA5pd4x+k/NynA
	DEUKINB4ODAMzEWlB+UWafDpeHOyJjD31Qh/fZtDZ+ZtWGP02z+4/8gC9kI9ZJ7xQprP
	eftg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=y9iy8oJPRlx7MiWyL7lcoN2b8M7sulf0iZVqF/j6ZvU=;
	b=Y2u5nBUXufG3dBJQ4ugtIt7CcDY4SE1gW87QisXqr9g6At0DFxGVV+oEZzhatAqJb5
	JIjX0Kj60Ov/iq8A7RU2LAf7/uBeiZ653g0PinQjPsuctfqv+MvcYbtvbf7wI3AJsC+7
	PhrzUGQxog0wUSAZO2my1IiaAYRI1Pf1oCc4IIteASTc9gj2OdVCqmmhlgndFySY0jVb
	KxYw3010u2iq/A9Wp/zZnJ+/gv6ISOj9LtTIBueQZc47j/Jl/b8BDoAH2L2PmXFlj5zW
	S+U8DuBD2jH9A4LrJYVSvnlphH2ZOmjw+7HzLSFFE2FOLbobpZPSeOlSXJMbLrLuG1IY
	lFtg==
X-Gm-Message-State: APjAAAU3cLMiFo03rUElCsqMlxV4rtBFvwu9rEiSeLm+jvnRF/kh2cYm
	5plQG6hNsn+tg980Wxz+S5X+vqnL
X-Google-Smtp-Source: APXvYqzSDpCohiBSDGM5kPo/7XrK6LDslVn6gPyjBURGNLFV0ss3NQQMH+E7Hu3LUF85G9aEllqhjw==
X-Received: by 2002:a5d:8747:: with SMTP id k7mr23626879iol.20.1561124067197; 
	Fri, 21 Jun 2019 06:34:27 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	n21sm2141094ioh.30.2019.06.21.06.34.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 21 Jun 2019 06:34:26 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Jun 2019 08:33:56 -0500
Message-Id: <20190621133356.10907-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620154704.13940-1-JPEWhacker@gmail.com>
References: <20190620154704.13940-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Subject: [PATCH v2] bash: Remove .build files for reproducible builds
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
X-List-Received-Date: Fri, 21 Jun 2019 13:34:26 -0000
Content-Transfer-Encoding: 8bit

Bash has an internal "build number" that it tracks and automatically
increments ever time a given builds is made from the same sandbox.
However, this can make builds non-reproducible in the event that a build
directory is reused multiple times.

Remove the .build files after every build if reproducible builds have
been requested which will reset the build build number for the next
build.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-extended/bash/bash.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index c91cc8ada8d..039b8687a24 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -39,6 +39,12 @@ RDEPENDS_${PN}-ptest_append_libc-glibc = " \
 
 CACHED_CONFIGUREVARS += "headersdir=${includedir}/${PN}"
 
+do_compile_prepend() {
+    # Remove any leftover .build files. This ensures that bash always has the
+    # same version number and keeps builds reproducible
+    rm -f ${B}/.build
+}
+
 do_compile_ptest () {
 	oe_runmake buildtest
 }
-- 
2.21.0


