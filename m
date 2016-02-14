Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC3D7326D
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 20:52:59 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id y9so99468323qgd.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Feb 2016 12:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=F6YyEYhf9r88D7HbyzPgNtB23zilDotE51zHk/UGKPY=;
	b=S4S1031fGjQ4i80Yqh+TtECJ62EOh7X4sC3Yc0tu0kLsTYCQwcJcgvoLscmuM6enkS
	Ia3Tf6x42m07RovcAHrG8GVm6CRVSKPDdSnWwxk1UXfK6m03afNtLWb7VjssHIdLHjjJ
	bwP532KZqPBZFi9YDsPy6ZI/M53qyew8jbPEs+v99+KuMwnTnG4JQXOvCCAH66vhAFcq
	+N/9bq9OZ+Yo2k7bRfW3D12WpMxKK7h3WDLHb6If1tpZ01N/pf6j6+nJd5CmiCs8ROhM
	ZUm0jAnlO2lvHm00cYLXdKAD3as/dUDSkrNV0Olmy7bpJEsWDbsMtDEI5fRT4t82rXum
	pwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=F6YyEYhf9r88D7HbyzPgNtB23zilDotE51zHk/UGKPY=;
	b=ge8fkjAJXE1Qur4sIk+DfHapx2SRGFY79UapJE+6r0NAJ/o9gqgrp+7V/XOAOaQjZg
	FVxMFh5HC6l26qpPfVlyiumEndSP6K0yZCoBKs7tFvJdAsHkOWahWbbcTTxoY7kgwz+l
	30CaqwyRt+OWWssbeK2dc6eeJyfqGULrBCHxOVxSw7jQR+FFg/qTMxF4+KsD88/kzpgE
	PAcfhSwVtvrnypPBaVEvZFUJaP/sTZWd2hwi+E/aEd+zyuLUD/LJTpH5ogxfHqWI253Q
	TWfhCbppJlqXf9EPbjlZD+hsMT67D5n0+Lsrzubel6ezLQsfViFSgGO888WQ8D9wYGLD
	gp2w==
X-Gm-Message-State: AG10YOT6WHV+omgc3+c+mdNmX43D8uRGrtx3BjYqtth1QL33Ku2cBCoIpA9oK8IOk+1ZYQ==
X-Received: by 10.140.104.50 with SMTP id z47mr16450201qge.68.1455483179694;
	Sun, 14 Feb 2016 12:52:59 -0800 (PST)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	q22sm9893272qkl.19.2016.02.14.12.52.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 14 Feb 2016 12:52:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Feb 2016 20:52:48 +0000
Message-Id: <1455483171-66851-2-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.7.1
In-Reply-To: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
References: <1455483171-66851-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH 2/5] security_flags: Add SECURITY_CFLAGS to TARGET_CC_ARCH for binutils
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
X-List-Received-Date: Sun, 14 Feb 2016 20:53:00 -0000

libtool decides to
filter out -fstack-protector-strong on its own and its documented here

https://www.gnu.org/software/libtool/manual/html_node/Stripped-link-flags.html

this causes linking errors when linking libbfd.so since objects (.o) are
compiled using -fstack-protector-strong so they are expecting to link
with libssp but the option goes missing in linker flags.

With this patch the security flags are hoisted upto CC itself and
libtool thankfully does not touch CC.

Adding to CC also means that we can now remove it from LDFLAGS since
when gcc driver is used to do linking then we have LD = CC and this
option makes to linker cmdline

Since CC is used without CFLAGS in configure tests, some tests fail
complaining that -Olevel is not used while using _FORTIFY_SOURCE
therefore added SELECTED_OPTIMIZATION to TARGET_CC_ARCH as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 235f413..f2ab644 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -103,3 +103,5 @@ SECURITY_LDFLAGS_pn-xf86-video-omap = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vesa = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xf86-video-vmware = "${SECURITY_X_LDFLAGS}"
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
+
+TARGET_CC_ARCH_pn-binutils_append = " ${SECURITY_CFLAGS} ${SELECTED_OPTIMIZATION}"
-- 
2.7.1


