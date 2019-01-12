Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8ECE07BE41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 10:11:59 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id e26so12550177lfc.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jan 2019 02:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ABRm/hWKXFXRsBEztOumNy4jAKuCCwwZr+c+sXe0ebQ=;
	b=typPlHt9lxwuQXHkNwszFwN8JYlcOdKekeOJvuuYnIHI8RReV3HLIiCEJicuLlsDpU
	NFQ1P+XLJe2Z+8DNpF/hx1q81rpu2JY6o/CrflbHEWa7UWw8EQgPSxRJ8pxQUGJU29+Q
	xvLcwcB6R4VEwT3OL4aJTaCb+wmhIMBAjO2oQHvOR3qUVvwdjm9XsEJF1ajWm/M5t3Qs
	nuEPUXAEscN602JzmjHim+SWKmFTDHZC3nItzqhg4BR3Lf8Ehz8V+UKFeKPNVvEI8Xvb
	NKi9fpjk3om5I8AzMxNLfIzoLkGbhsBxkeXRGB8cU7J3EA+A/hxRbD2Wyd7f7yyjvnPd
	S7OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ABRm/hWKXFXRsBEztOumNy4jAKuCCwwZr+c+sXe0ebQ=;
	b=pre6LSEUDOTKPdKHJ5gYxSBFC9fPIBOJQq/6zYPdVUeGz2pbNwIT5OmbnyOSpoy0jm
	HE5kk4Ej9WnaI8+9Kg8AKz0YC6S8F5Sf+Y4NvyOxdmk5ke0tG+8a4hb4TdoBsmE7jbe+
	3BPidkPWqNAjiGI0tbetmFMwW4NivGyHjcUZa8Ry2gafWANFMwFbCHOHhhrpLYLJbKTJ
	8+qEWg8NoQhMZrU4nA26gZfu4MHTR3xBYxG7ya53qXdv0VURLK1R4HaM5g/m7+2Kd17z
	WDSe5ID8WhJLHiZXv/Nzs+vDkLLvn1cW6lk3EP7Q2PphXvc2f+5JDmpdf31r1fxoJOon
	R9vw==
X-Gm-Message-State: AJcUukfehv9SQK9NOGht9eF54fO9SbBHBtnLA08oc0mQCNtK/RmaAjp+
	yX0vYUIdMBYo+6BamUghU2HThmqj
X-Google-Smtp-Source: ALg8bN4bgEPsqD8dwY3hJy3G1msN9dxnHtYz4kLqKjdephIXbQ+WqcWX0rHLfjekUKnFXmkq1FdQ/w==
X-Received: by 2002:a19:4ace:: with SMTP id x197mr9483754lfa.39.1547287919840; 
	Sat, 12 Jan 2019 02:11:59 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r7-v6sm16282314ljc.10.2019.01.12.02.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 12 Jan 2019 02:11:59 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 12 Jan 2019 12:11:52 +0200
Message-Id: <1547287913-25526-2-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
References: <1547287913-25526-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 1/2] libgpg-error: Support build for native on ppc host
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
X-List-Received-Date: Sat, 12 Jan 2019 10:11:59 -0000

In Ubuntu 16.04 LTS userspace is build for PowerPC 32-bit while kernel
selected by the installer depending on PowerPC machine type:

  * 32-bit for PowerMac G4 (ppc7400) and below
  * 64-bit for PowerMac G5 and above

Thus uname(2) returns ppc64 for 64-bit kernels and 32-bit userspace
making build impossible due to missing some of lib64 multilib
equivalents in Ubuntu repository.

Using setarch(8) override to make whole host look as PowerPC 32-bit
can actually help with build but requires mapping for ppc target to
their libgpg-error equivalent to fix native build.

Build tested on Ubuntu 16.04 LTS host on PowerMac G5 with command:

  MACHINE=qemuppc setarch ppc bitbake core-image-full-cmdline

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/recipes-support/libgpg-error/libgpg-error_1.33.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
index 325529d..4153954 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
+++ b/meta/recipes-support/libgpg-error/libgpg-error_1.33.bb
@@ -47,6 +47,7 @@ do_compile_prepend() {
 	  mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
 	  mips*)      TUPLE=mips-unknown-linux-gnu ;;
 	  x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
+	  ppc)        TUPLE=powerpc-unknown-linux-gnu ;;
 	  ppc64)      TUPLE=powerpc64-unknown-linux-gnu ;;
 	  ppc64le)    TUPLE=powerpc64le-unknown-linux-gnu ;;
 	  *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
-- 
2.7.4


