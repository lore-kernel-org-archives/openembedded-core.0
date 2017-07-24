Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C514C7836B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jul 2017 00:47:59 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id k72so5811174pfj.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Jul 2017 17:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fmKa/cv5hgKDO2NxdDd8Drv0wQsYrP7DdTKLHzpt5B4=;
	b=nzuv5MRIcWCt0KntoMqTRZv774jxMoKR5pIdWsbB/SFJMvhS73PqeBxMfAptSW89R7
	81w5Eq3TobuXC+vxqlFdn/qVk5TNUwNupptBZbmdKBqas0y76jr/7vZKbB7Q7+uGhRyV
	/udEju2duqgL75giEL0WLvelnfnPCIOAwW3PnNvXeCKodkyEtZfvx77ZShUx/OxBQxW/
	j6eVEcihPUPlPp+8E5MxAoVL2hudj5M9F9c8x0DWn5hNZgClOS81OQBD+XbZj1DlBXZf
	XbRP8HQSIs2exvTK3CQ7E7KwgQq2SbfOuor5H7AUH56XUvHx2x92S4LxXLSGFZuYlB0e
	OWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fmKa/cv5hgKDO2NxdDd8Drv0wQsYrP7DdTKLHzpt5B4=;
	b=D8gMOH5qOB5kwpDI4g4+hrX9BjhJTTRiDQfuXlujPYGKm/nOIeuIN0qPBmdotMd5IN
	i7Nb0eGg58xi3SV2dLkfNgvDy+SkhVl8ST5tKlpon1F0aHZugNoZJ8I4HYlDQ+j27EMA
	k55LxsFg1gg04thjwJU/4d7DaoyS3LhaiEfDMgH4p5KBfyni/dqwR/gC8Ohl2XFzKxEr
	fV54KlN+PhDSuFWrxzJz8Q1jh03Des+oq0GuZaiif30chwcvA6wxaKACXrrKVIis0Fht
	ffcXqT+pe7x2lfgCdLZIXjjELia+qtCNQweSi0spNDjlPMRT2N7XvPCHFGpRHkbrIjQ6
	3bZg==
X-Gm-Message-State: AIVw113YMU1/gfvUtPsxM+c5N3qjSDqIfewPa1s/xfc9bklINOJRXh+M
	3Nj1XnfrokYf1M+d
X-Received: by 10.99.96.67 with SMTP id u64mr9396922pgb.424.1500857280698;
	Sun, 23 Jul 2017 17:48:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::9b53])
	by smtp.gmail.com with ESMTPSA id
	s3sm18228742pgn.70.2017.07.23.17.47.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 23 Jul 2017 17:47:59 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Jul 2017 17:47:45 -0700
Message-Id: <20170724004748.14778-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724004748.14778-1-raj.khem@gmail.com>
References: <20170724004748.14778-1-raj.khem@gmail.com>
Subject: [PATCH 3/6] libproxy: Remove PIE flags from SECURITY_PIE_CFLAGS
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
X-List-Received-Date: Mon, 24 Jul 2017 00:48:00 -0000

External compilers will explicitly pass -fPIE -pie flags
unlike internal toolchain which does not use them, so the build
fails with external toolchains because, its passing these
flags to linker when building shared library, which is not
correct it should just use -fPIC

Fixes errors e.g.
| /mnt/a/oe/build/tmp/work/corei7-64-bec-linux/libproxy/0.4.14-r0/recipe-sysroot-native/usr/bin/x86_64-bec-linux/x86_64-bec-linux-ld: ../libmodman/libmodman.a(module_manager.cpp.o): relocation R_X86_64_PC32 against symbol `_ZNSt8_Rb_treeINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESt4pairIKS5_St6vectorIPN9libmodman14base_extensionESaISB_EEESt10_Select1stISE_ESt4lessIS5_ESaISE_EE8_M_eraseEPSt13_Rb_tree_nodeISE_E' can not be used when making a shared object; recompile with -fPIC

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.14.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.14.bb b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
index fcdb82f06c..f91bd67f7b 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.14.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.14.bb
@@ -32,6 +32,7 @@ EXTRA_OECMAKE += " \
     -DLIB_INSTALL_DIR=${libdir} \
     -DLIBEXEC_INSTALL_DIR=${libexecdir} \
 "
+SECURITY_PIE_CFLAGS_remove = "-fPIE -pie"
 
 FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
 FILES_${PN}-dev += "${datadir}/cmake"
-- 
2.13.3


