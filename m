Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f53.google.com (mail-yw1-f53.google.com
	[209.85.161.53])
	by mail.openembedded.org (Postfix) with ESMTP id BF2D66C466
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:01:13 +0000 (UTC)
Received: by mail-yw1-f53.google.com with SMTP id p65so2374261ywe.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=7cU+sw8Ct8ZHPN7wmoPn0AU3DbsiFdlrcquUxOF1gJ0=;
	b=CLF8UG31U97jHyf2Uk/OPSCsy5YgES0UCnyKkjcbPc65DUXF+rTEUt4p8VEZ01RoQG
	w6BZ0Y3h/YlQwTfFYcDmSm41sVKiFnmXOajqHGjuLTc+JYSUBP6N5zApEPEzuVFOQR1Y
	+CAj7Zmo8gEPAUeR8O35+hYOmbmgwxFlocgnTkr5hErFQmKvE6ZHaT4s7KpdKCrQTkTP
	W5FPml+s1pryuQCYngcOtLn8ApsztcYvAYb67HOlyMHL2RQqtJUkCIllXsreSf6Ly7fi
	iFLNc7dsLNr3Zx9sGB5dgBHaUCIFMkXkMAj0CbwaIzmB6JrkIPGZ0fIQ9P4ZHRSJ3GYh
	YJTQ==
X-Gm-Message-State: AJcUukcL0PGXdvhC6WUKckwgn+9LlRmDl+7HA3+C9dIboT0CqQGDxVL/
	EI6BcqYtyfGmmSxRZ700UWyTZ2VV
X-Google-Smtp-Source: ALg8bN6b6ujLlYhg/SiGVuhMX8dG0RzLzz8ImXJcA2igaQuNef4vRo0/6yvaYkUsGt2eLeBGgtV7Wg==
X-Received: by 2002:a81:6f41:: with SMTP id k62mr6897061ywc.211.1547640074730; 
	Wed, 16 Jan 2019 04:01:14 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.01.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:01:13 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:50 +0000
Message-Id: <20190116120051.12182-15-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 14/15] util-linux: let -ptest package depend on all of util-linux
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
X-List-Received-Date: Wed, 16 Jan 2019 12:01:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

ptest executes all the binaries, so they really need to be available
in the file system.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>
---
 meta/recipes-core/util-linux/util-linux.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 47264028f2..458df5d047 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -290,7 +290,7 @@ python populate_packages_prepend() {
 }
 
 RDEPENDS_${PN}-bash-completion += "util-linux-lsblk"
-RDEPENDS_${PN}-ptest = "bash grep coreutils which util-linux-blkid util-linux-fsck btrfs-tools"
+RDEPENDS_${PN}-ptest = "bash grep coreutils which btrfs-tools ${PN}"
 
 do_compile_ptest() {
     oe_runmake buildtest-TESTS
-- 
2.20.1


