Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 78EF87839E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 19:17:50 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id t3so526281pgt.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 12:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Z+hdIk/sXDI8iwPfcmPwW1yvdjPBvJb/zP9Hnnu3mNM=;
	b=pdtl5zH4kE4Gj7PmQTgFEWBaCdU6Rv2Ev6TLRhGmUfWSns/pLj1lPe6TRHQ8f6ohvx
	ipo1cXpEx3g4p4AKnFGH3qNmxA723s/No2uOYFuCclN46ORf3RSjm/iBj85uEZxW1mNl
	iCtz3sszpqiWEIDmb8fhbPFRFVjSAYqQwvK0nD2mYTrquiA0gaL3PUuTav1JaYTit1UO
	c4RJdhKU5+fuP0FL6cfoOYmQ6C+PEHaUHEPuoyGeFDBjdJk2KFa7saNYOx6imewZQH08
	E36MnGjEEetJbDMau4/ztRqho3od32DUD3nQA7UZ00snrN5AScKbEV7wR1o9LptHpiG+
	iiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Z+hdIk/sXDI8iwPfcmPwW1yvdjPBvJb/zP9Hnnu3mNM=;
	b=PiLwf9KjH1SOpxffh5ybVbiAk0xktERuNI3GlcQD3fmjzjCU1q5q1E/rDHjQ5DEJM/
	z93FclgnVI1ZiDeDWLc/nAk9KRDocvKE4Hfg+c2KimIy9chjaJRXxinvC7XgxRaXAbqC
	mgHX6ix2vPAkmMejqzt39t8ox1GamvT92N1YEa5O+S5RZGOEurEDUoXZUp+1gCM+nXwn
	g3VKloHs5HSwennWJ/DUAEswSnunKjawq9zk5J1/F3czAnprAfhFkFRB9UpspyRg1ZAV
	7YVgD0rXezQt4UX9+Es4oj5rMevXJx5pF1EWqQ0d/KJBQ1KgXuLHJnJPMRd4b44IWjrH
	8gQg==
X-Gm-Message-State: AHYfb5j0c2+8WW2xzGDLweVpEC7KsKAqLbRzfRU7hrPVY9Hm6opX1NaT
	cbDcl/nW+6wadzyK
X-Received: by 10.84.208.227 with SMTP id c32mr8076207plj.281.1503602271514;
	Thu, 24 Aug 2017 12:17:51 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	r86sm8486965pfi.161.2017.08.24.12.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Aug 2017 12:17:50 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 12:17:41 -0700
Message-Id: <20170824191741.11096-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH] systemd-boot: Make EFI_CC overridable
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
X-List-Received-Date: Thu, 24 Aug 2017 19:17:50 -0000

Some layers may be setting their own EFI_CC
keep that possibility open

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/systemd/systemd-boot_234.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-boot_234.bb b/meta/recipes-core/systemd/systemd-boot_234.bb
index ed55e537eb..655797f3cc 100644
--- a/meta/recipes-core/systemd/systemd-boot_234.bb
+++ b/meta/recipes-core/systemd/systemd-boot_234.bb
@@ -8,13 +8,14 @@ SRC_URI += "file://0007-use-lnr-wrapper-instead-of-looking-for-relative-opti.pat
 inherit autotools pkgconfig gettext
 inherit deploy
 
-export EFI_CC="${CC}"
+EFI_CC ?= "${CC}"
 # Man pages are packaged through the main systemd recipe
 EXTRA_OECONF = " --enable-gnuefi \
                  --with-efi-includedir=${STAGING_INCDIR} \
                  --with-efi-ldsdir=${STAGING_LIBDIR} \
                  --with-efi-libdir=${STAGING_LIBDIR} \
                  --disable-manpages \
+                 EFI_CC='${EFI_CC}' \
                "
 
 # Imported from the old gummiboot recipe
-- 
2.14.1


