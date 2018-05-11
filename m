Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 1388A755BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 12:50:47 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id a8-v6so2542996wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 05:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uaT2N/uQ/z62kWfp94gyZVwNCJnBdslJ/aRxdoAJND4=;
	b=eFDmaSJFyAiCmWCOX6hlvcxV0ATx0PyoRQDI6NkSvGTjrIeucA7zphoLHkqhGqLyUn
	x5uaDVgZKh9maBr1Y4amWWceAGMr4IVrjlrsZ9UMotgnAdiyOwYg08Ohm37oRLEuXo1I
	8kdzZbd6sY7OBEkZmCoWwWgsF/81nDkV8FdGfwhMlE9TPAEVuH0eOvOwgPyiP9ph69QA
	K5XOulHKcoIrg+xsPNWQij8/58hWh1WXS9/9K+v/rDdPYFXpiWeGjZLSycq+u8LUEUjq
	WcOHCqtv2jnyxswWksNjhFZR6Y9KY0C5EXxKMmboZ2tnt5Pfdrr6JfhlLZ0QKl1Ll/2I
	UVBA==
X-Gm-Message-State: ALKqPwfp7hwgFgmBROn//uQSxXRZw8UE5BBFJiyUgWz+7zdkTBPsYnCC
	csKPt0iiRmXGBwpIeIjASLfJdQn7
X-Google-Smtp-Source: AB8JxZoQKwwTWpAk/1iswUcKwgkJFgsPBRAQwmP3Zav2/W8LYzYrWAcN24e9el3a87IDe82LmuWTgg==
X-Received: by 2002:a50:866d:: with SMTP id
	42-v6mr7117773edt.229.1526043047949; 
	Fri, 11 May 2018 05:50:47 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	e24-v6sm1699382edc.80.2018.05.11.05.50.46
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 05:50:47 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 13:50:46 +0100
Message-Id: <20180511125046.29184-1-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180511081012.12843-2-git@andred.net>
References: <20180511081012.12843-2-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH v2 2/2] gcc: Remove patch causing ICE on x86_64 valgrind compile (on x86-64 only)
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
X-List-Received-Date: Fri, 11 May 2018 12:50:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This is similar to commit f76ee525a75d, but instead of disabling
the patch on all builds, we only remove it for x86-64 builds, as
the original change's commit message mentioned issues with this
patch applied on that architecture only.

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index 1803917f01..9a23863022 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -81,9 +81,11 @@ SRC_URI = "\
            file://0048-sync-gcc-stddef.h-with-musl.patch \
            file://0054_all_nopie-all-flags.patch \
            file://0055-unwind_h-glibc26.patch \
-           file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch \
+           ${LRA_PR70904_PATCH} \
            ${BACKPORTS} \
 "
+LRA_PR70904_PATCH = "file://0056-LRA-PR70904-relax-the-restriction-on-subreg-reload-f.patch"
+LRA_PR70904_PATCH_x86-64 = ""
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
            file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
-- 
2.16.2


