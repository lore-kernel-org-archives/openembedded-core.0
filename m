Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B133A605FE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Mar 2018 10:07:23 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id l4so2103291pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Mar 2018 02:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=bbIPk2jikvkGwe2WQk/o7phbzwwLBxKbKS1thE4991c=;
	b=XdoSEsKSCi8MInOYbxstX2A67YhaRYKO/f4oU2QnFk5/nJu4PZvRoL9StOjqGDDm8n
	zSa3Fib2cGp1DV/wHV82kfl7+DBkWUkiJiznK15Tqa4DmffG1aAJSicvCrkkICYoPmxw
	gXDoUkrQygr7urn1PI9TX+yf2WY7vIesLU/5AgNmBcE79n/zYaHiqaz2W2BdO7HUBcEI
	YLrW1E81nsJ1/r2LfJuOYyvR+NvvSkzmwdL6TYK6/ZJKSt9yeuxiPoPVL+utrBy3PESZ
	7ae7g269Wd0bKgfOo9Z6peVVYlM4z9j531ell5XZV7/0GZ4znNx26aW2XOjMSUS9vQNq
	XQSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=bbIPk2jikvkGwe2WQk/o7phbzwwLBxKbKS1thE4991c=;
	b=tXthrwnCJe+/awr5KNVgHDCuk+jd/zJCSboX2yWqcIBVg4couIcaWU5LzIW1SxKKi+
	md/Q6bOq2MQJeiEAz7k7Z3wZswoV6zKCuBBni4WTy93TOPXiYGQ41KCVFn3AWGPtrMSa
	tNTLEfuT+dyMdUKeOC/yA8g5l4nYHTQgs7FbDK4v4NZQ5PsnSDfRSpEqacsefFLN4F6L
	zB079w9JE8M9WafTZOGCWyJgpVVldu+kPoArj8A07JDwqxQz0gBqjl6VF4AlEQcOvaYs
	bGPngaeerl5IN+P+gAK0MSHBkupmhFeVzc9kDg7yBIPCOn8bi6pcWidi8D7+QZ4GZ6df
	lfhg==
X-Gm-Message-State: APf1xPCUxDjeYq2lsWjTUsZ2E0Jn2jjxlcPKmqp/XMjUjbvGjHrrKQJR
	Gl9f+LYzvY6tbonqAY2xP9gaMA==
X-Google-Smtp-Source: AG47ELt/bCHJD/3jut7k7jm7VJNxcrL9dtIo78YrumL2hukYIjZk3z11B3EkIwLtlh8wECfPfJMMRA==
X-Received: by 10.99.99.66 with SMTP id x63mr1097249pgb.421.1519898844444;
	Thu, 01 Mar 2018 02:07:24 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	v1sm7853308pfg.33.2018.03.01.02.07.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 01 Mar 2018 02:07:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Mar 2018 02:07:15 -0800
Message-Id: <20180301100715.14551-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH V2] glibc: Enable static PIE support when security_flags are enabled
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
X-List-Received-Date: Thu, 01 Mar 2018 10:07:23 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/security_flags.inc | 2 ++
 meta/recipes-core/glibc/glibc_2.27.bb       | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 49d2417a88..d66dd57649 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -6,6 +6,7 @@
 # in the DISTRO="poky-lsb" configuration.
 
 GCCPIE ?= "--enable-default-pie"
+GLIBCPIE ?= "--enable-static-pie"
 
 # _FORTIFY_SOURCE requires -O1 or higher, so disable in debug builds as they use
 # -O0 which then results in a compiler warning.
@@ -30,6 +31,7 @@ SECURITY_X_LDFLAGS ?= "-fstack-protector-strong -Wl,-z,relro"
 SECURITY_CFLAGS_powerpc = "-fstack-protector-strong ${lcl_maybe_fortify} ${SECURITY_NOPIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 GCCPIE_powerpc = ""
+GLIBCPIE_powerpc = ""
 
 # arm specific security flag issues
 SECURITY_CFLAGS_pn-glibc = ""
diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index e9d4117a47..f5dd086ffc 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -68,6 +68,8 @@ GLIBC_BROKEN_LOCALES = ""
 #
 COMPATIBLE_HOST_libc-musl_class-target = "null"
 
+GLIBCPIE ??= ""
+
 EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --without-cvs --disable-profile \
                 --disable-debug --without-gd \
@@ -81,6 +83,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
+                ${GLIBCPIE} \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
2.16.2


