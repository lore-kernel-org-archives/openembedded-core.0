Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id D9D1065D00
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Nov 2017 05:54:37 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b85so6016969pfj.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Nov 2017 21:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=u1eu9qeJMwQOMC8RhHmrcG8iXWiIO+OuqZgfEpMA8SE=;
	b=OIv0+B1aF/miGLurliWQgGG83xnT148SMCxRVh5ewxnLfKEUG9uqwvANWzeJjYhDUI
	Fz6XfuGZyapZ6bpWlbCueWfhouz1iIWHdtFItHGvzWPg491JbL5e1pqoBbwRGtz/0Ez5
	m4B7DyPeOzgIUh13fKkVjgOop9gw+lPbxmSSy5eFotzxCfRoU5NvzZF7xJ6S5pUDMLpZ
	xx34ngPvYSD5k6U0fcbHpl4Q1VR9WaSEWrpJj/Ttao1v8qWvQdctb/TSfV7TF+rE8Li7
	Svvw8Ecv7FkezNDLju27JHx9/EvDUqcNJ7CW0JAgZcVCiZXz2IPH2N4qcJh5UtpbpH5D
	gaCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=u1eu9qeJMwQOMC8RhHmrcG8iXWiIO+OuqZgfEpMA8SE=;
	b=mjYYIjUrLWy1qxBssYEs5yaeVNqeAMqyY6dQDcl0fn6RTESU0SH4M+EwbYVcSUDBt1
	U2GaUeXlLVEa1hUWzrLr2EnPc3X6YoTqNp7oRIMxodNb6q0oGc3dlo7RFI0+RvA5qHwc
	1NSysmLi/9yyHIsW1QZ4Ohrj3rGQgLNOZSIFkyt8wzPhldY/me6G/17cO7S7mEscq2SU
	SHCi45mnm/cewQQ6rsg8fqjMMpogNeZt22G+EqhBEVkxlF2LFeWuJRWkuJ7sjEGhM7Tj
	sP3ngrdxTp69RBjv+M0H4yhP8Z/I+JJNP+AHbD7t23xqqi9Q2K2v/v9IxR41K4aZ2TSn
	r1Rg==
X-Gm-Message-State: AJaThX54xLUrkZWKxyqndPzQtUysA/0KIHoCxUPMxCdPiMoYEIxNssjU
	7lnH26yeqwqd5+9yvfIsFxC3XA==
X-Google-Smtp-Source: ABhQp+QeIdPfBvsijHRADrp6eq4XT30dpH8NqrNSF5citTuj3dKIzc2fqfgLkkF82LFS7i/UhMnGAA==
X-Received: by 10.84.140.235 with SMTP id 98mr3071249plt.428.1510293279000;
	Thu, 09 Nov 2017 21:54:39 -0800 (PST)
Received: from e6520.gateway.sonic.net
	(173-228-90-28.dsl.dynamic.fusionbroadband.com. [173.228.90.28])
	by smtp.gmail.com with ESMTPSA id
	r80sm17179259pfa.169.2017.11.09.21.54.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Nov 2017 21:54:38 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 21:54:31 -0800
Message-Id: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Fri, 10 Nov 2017 05:54:38 -0000

The default systemd-tmpfiles config file expects to be able to create
files etc belonging to the wheel system group. Currently the wheel
group is created at run time by systemd-sysusers, but that doesn't
happen if systemd-sysusers is disabled (as it currently is by default
when building with musl libc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/systemd/systemd_234.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
index 81a9509..7fdb65f 100644
--- a/meta/recipes-core/systemd/systemd_234.bb
+++ b/meta/recipes-core/systemd/systemd_234.bb
@@ -333,7 +333,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--sys
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
 USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
-GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
+GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal; -r wheel"
 USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
 
 FILES_${PN}-analyze = "${bindir}/systemd-analyze"
-- 
1.9.1


