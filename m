Return-Path: <armccurdy@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id D3BDB7888D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 20:55:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id c5-v6so11018821qth.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Jul 2018 13:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=LZAAVHHL94bKTkdIFrDgSsF90uE9cW4Z09c7T4RoPFA=;
	b=O9xRSFS5vzlSNNekJykU7gypWg0t60cxJtac3m5h+UQAibRkrdZ7ErK6nD+aW3fYqD
	IQ80fhK7RAEhp6WaOs/0pMg0Jw0M1T7L5JyHzQO1qPZy7Z1JQoE4J0xTO47MMqlXiAfH
	dG58HNCcWZvnKiH1fKDFXB+jeIAoLCGaNXDb54s4hWl9iQnMMmtlOYhIZ0XXbn4Pmw+x
	mWoF8tHeXNJeUF+lvE9fnTYtutEMh020j2LYh2Q4IisSJMWwrcnlpdga06t4WJ2KR3wm
	n0oSBDs3VmhMvX8vkMBrJXJi1IRTAFhHRQsuhHBk8OvYnMUq8o8f3ZAnSqKASwhc9l0h
	EcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=LZAAVHHL94bKTkdIFrDgSsF90uE9cW4Z09c7T4RoPFA=;
	b=h+5xOs8/nqCb9ovI14ujRIiOR/BgYbvfAROrrIOJhRx8VF9vETae6WvlOfqlOwT/11
	Ooh+3+j93my3HjRcPwffyU20QnmZYaDb7rlOs+bngIllOCB0xrvFQDoUtaT/cauoAUjp
	uE5qKpTsIICCemDRSi6f/oANPLFDRy28Eor0C3dxUTYSBTLEcLVGNPniJ5KYJDzYNlK1
	gPclItgAW7XpdBj1sE71xQ5qHDYNbfBVHrhTyZb5R49lDlvLr+YDCgqkv2moxbotwQh7
	IfGNNTlepMiY7HwMjTttpVHbNkQvHDMmF4BB+qna0b4+0SCJlroWZejxNVLOOmEe74zM
	F3kQ==
X-Gm-Message-State: APt69E2+3n4qjaj/ZrnEDANv3Sygn+spjZtuNojgFl/w2g9jsnymFa+s
	gAgBNvAl9zbj9kqTPQZq7PTVmg==
X-Google-Smtp-Source: AAOMgpfvXHDC4b8fUn7ixNavJL2dzjl5hFYHRi5CCbEeNZvnc0/s3t/gDjrGY5g01xfYmzsu61dD2g==
X-Received: by 2002:ac8:1acd:: with SMTP id
	h13-v6mr10635993qtk.206.1530910503711; 
	Fri, 06 Jul 2018 13:55:03 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i1-v6sm5690442qtj.65.2018.07.06.13.55.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 06 Jul 2018 13:55:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Jul 2018 13:54:54 -0700
Message-Id: <1530910495-8058-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/2] gobject-introspection: avoid using += with an over-ride
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
X-List-Received-Date: Fri, 06 Jul 2018 20:55:03 -0000

Using += with an over-ride can be a source of confusion so try to
avoid the construct in core recipes.

The current usage functions correctly (it over-rides the default, ie
empty, value of EXTRA_OECONF and then PACKAGECONFIG derived options
are subsequently appended), however the += is unnecessary and can be
dropped.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
index ddec110..96e0d6c 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.56.1.bb
@@ -102,7 +102,7 @@ EOF
 
 # Configure target build to use native tools of itself and to use a qemu wrapper
 # and optionally to generate introspection data
-EXTRA_OECONF_class-target += "--enable-host-gi \
+EXTRA_OECONF_class-target = "--enable-host-gi \
                               --disable-static \
                               --enable-gi-cross-wrapper=${B}/g-ir-scanner-qemuwrapper \
                               --enable-gi-ldd-wrapper=${B}/g-ir-scanner-lddwrapper \
-- 
1.9.1


