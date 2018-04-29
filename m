Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 07AAE744D2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:44 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id f189so5129642pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=rDjOx9JKZd+yZsuc/wtqNsuwD+B0Vx+tt4bnYcGFwMk=;
	b=ulYLbQ9ygyMedg6AUwlf8t4pGUmBFPdtgPrL44i9dedGvbH2yTBWWItr2tX1DOGZ6+
	og4q0QZlvInVoBdlFzn2vU7/CeFP394hEAA2WfxTVDq+oBBHDUeb1B0OH+eRZxlihczW
	2t72rnZ2YKeeB+1WtGDvQjlXzF4WzebCm7xDV8JevPWPIt8O84a/6wfQoMIz6u+znjjk
	62y6fcc0tk8m5HhZZG/zLw2Ao+Dvcz5G91O+de/VjGjM/njlZxxJ/8bwdcGGh8PKnzIV
	La0GU8sqCoOM9cR+JJ9jHl/FWvoPvKs60fqT5NwoYJPQmOXlpO0B2a8VHhLofySRPedC
	eZtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=rDjOx9JKZd+yZsuc/wtqNsuwD+B0Vx+tt4bnYcGFwMk=;
	b=ryvnyBhag3KqzT4nxJ297tcSLE7ObdFrPCRMaSKrUkgCLID92rgLwqPjm7aIo7sbRz
	GetA658oVexy90QNj/gphWXLOC4h7K+bAV6SdYUt4v+WyRmkA67mbDXJyArziJRpyn3X
	17TybiLja5n+AqHk0BtEUs6o5HbNbDzsi4dHKeZCWHso6yMBR7vvk5j9YSEvtORf+u7S
	EVUtAo/3qup0OeIIkB/LKpTWW1j2rAkaeSzSiHw7HxKUnM6uB9joctDae2y2CXSu8+Ek
	vrUBQprl743jG/w7JJYnG/nMn8VStptBoYPpWsLH4vZCHnqdSifNJz9kvks542wgdPEJ
	DY4g==
X-Gm-Message-State: ALQs6tAphi9IGU0qH506yS2vavoYmZmXnuGfTXQ7K/EBIcGKgIj37msw
	08ppgYCaFR21bSzkXJ1mFhlXIg==
X-Google-Smtp-Source: AB8JxZp/hRFpTXtfEEDB1pNmt9msJPIMmJMlW52zw7lQ5xKF06mGKOsjLS6WiSeM+e4/ZpB7wxrtyg==
X-Received: by 2002:a63:6108:: with SMTP id
	v8-v6mr8165348pgb.245.1525030605426; 
	Sun, 29 Apr 2018 12:36:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:36:11 -0700
Message-Id: <78d503fde6a4bf966f0961146ccd7056a2cff1d6.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 24/24] allarch.bbclass: Exclude package_do_shlibs from do_package signature
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:45 -0000

shlibs is largely useless for allarch, the particular usecase where it
fails is when DISTRO_FEATURE is changing due to libc being different e.g.

Variable package_do_shlibs value changed:
-DISTRO_FEATURES{ldconfig} = Set
+DISTRO_FEATURES{ldconfig} = Unset

musl -> glibc or other way around 'ldconfig' gets added or deleted to
DISTRO_FEATURE set, neither this distro feature nor the shlibs processing
during packaging is of interest to allarch packages which are largely
arch independent scripts

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/allarch.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/allarch.bbclass b/meta/classes/allarch.bbclass
index 51ba509cd0..1eebe0bf2e 100644
--- a/meta/classes/allarch.bbclass
+++ b/meta/classes/allarch.bbclass
@@ -45,6 +45,7 @@ python () {
         # These multilib values shouldn't change allarch packages so exclude them
         d.appendVarFlag("emit_pkgdata", "vardepsexclude", " MULTILIB_VARIANTS")
         d.appendVarFlag("write_specfile", "vardepsexclude", " MULTILIBS")
+        d.appendVarFlag("do_package", "vardepsexclude", " package_do_shlibs")
     elif bb.data.inherits_class('packagegroup', d) and not bb.data.inherits_class('nativesdk', d):
         bb.error("Please ensure recipe %s sets PACKAGE_ARCH before inherit packagegroup" % d.getVar("FILE"))
 }
-- 
2.17.0


