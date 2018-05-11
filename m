Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 4ED4A754CE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 08:10:14 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f8-v6so1555694wmc.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 May 2018 01:10:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=A20ep1OMA9m7zey5BOrV7BVeUpzZlQpxjRmToxW4fzU=;
	b=XDCUbSpftyhmFnp8ApA1S7Q+Hrp7FI+3RaURgJSYX5kd60eOGtKtfRxoxb6WS0D59u
	Hx3L1ek/6emcfTOlGtpz9UpJ8XXIalmNQEoecFALBktDiokIMPKUM/5Q+3WLJeOUFhxl
	vvXz1hHAV0m7j30RvIBX/uVz0YS+ZrWNge19oUB9t5NzP+XvSVpa9CBdNak+g/zJ3ODo
	PvbSHUqmw2p1EiYJuTKQ12q4aQOnVi8D573jWVKndLTscbYdpOQL4rlCZFE2N2DUvl5o
	YQ9ln7/Nu6f+IY89FU6BZaK7RVWq7nxRc3f3hDg+ai/HeFEA6rGfJSS508sEwmvFg9Nl
	m4OQ==
X-Gm-Message-State: ALKqPwd4cSoQvZUfFLDOdgdPHj0uw5dL+FGQVlwkZ7AOSi8RJtBYQ6Uy
	fVOq3KGPxYHdRWleqSMNTNY2+fl0
X-Google-Smtp-Source: AB8JxZpML3JUARVDr2sQLidqSg8JMnLg9mupGPJusY4UlgiwxbktMWrhEjFCx/dzcpzJ+eZ142S+Xg==
X-Received: by 2002:a50:9164:: with SMTP id
	f33-v6mr6262487eda.29.1526026215566; 
	Fri, 11 May 2018 01:10:15 -0700 (PDT)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	g15-v6sm1559064edb.69.2018.05.11.01.10.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 11 May 2018 01:10:14 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 May 2018 09:10:12 +0100
Message-Id: <20180511081012.12843-2-git@andred.net>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180511081012.12843-1-git@andred.net>
References: <20180511081012.12843-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 2/2] gcc: Remove patch causing ICE on x86_64 valgrind compile (on x86-64 only)
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
X-List-Received-Date: Fri, 11 May 2018 08:10:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

This is similar to commit f76ee525a75d, but instead of disabling
the patch on all builds, we only remove it for x86-64 builds, as
the original change's commit message mentined issues with this
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


