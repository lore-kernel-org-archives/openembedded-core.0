Return-Path: <jon.szymaniak.foss@gmail.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6981C745A7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 17:51:44 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id d185-v6so13377979ioe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jun 2018 10:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=2jyJCcTKc01k8L9o6wYkSqudCp8bj8qb2MYnhcmOISo=;
	b=Z7KaFeX6+snFaQY1h3HcQnyK/DNeNhduyjP5l06+9cVplXnaIdIJH0PnobAF9PRN/L
	Ln/uueXMS2UfYOlLdua7tUisQF+VcCdlkbfSmpi3PgQQUZnv/R18JmuFJa6m1lpXbupX
	KkKly81LEZETH0dV8t7cW6EpbluErAiwMivdYd4z5gOcECs993FIKrNDtFYrVPAMyt28
	e1a0Gj+EFnWTnnjP+JEh2WF1yXCmWHgADaaVY1a352CeyFhI0vvvB56xl/pdvhNazidg
	Y0SlkXAJgn0N3nxQe6t3kZlIukcGa9zA2YxDT7WUHPdu0rsFGQkPG+hXelGxKucLg7H/
	vniw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2jyJCcTKc01k8L9o6wYkSqudCp8bj8qb2MYnhcmOISo=;
	b=GGEXxSDCHY1Oy6IeU2RfOazYwNrKzwBjeWRxXu46bgi5umLkbkahW2or7cqNdm2lTp
	LwD5Xz/HDNKcknf0Np+O5QYr2jTWALzlfvzyi0xHvy1eumqGDD3ZshiFr+A65crFXR07
	f7kV7YCoA3obKwDbGvlqyF2n0SPY0RBBkWJlpcNLcUMXkixc1dN/QQQB4pFTOGl2rwhQ
	CdulaRqSukekUCr5Qpp+jVg7/QeJAR3Wl8i/3ruq46STeQ6tNDhmi0efdVZ8Q0kd2YZ4
	HfWMAkhtMcQ0v7ZStVxiyXCVIXM3D4SoKQc6cCA9i6aiR+Dp3NH2pRGlt0OJAYvr97rC
	bm5Q==
X-Gm-Message-State: APt69E3nVOhDN95Ou3mhxDhCMRVIiNraIz0gpPpWcOUm3capQyfQIYSO
	Ff7EYEgpFuNLhsbvL8BB5xlbhTAp
X-Google-Smtp-Source: AAOMgpeK2KrziedxUIMHJQMG/zRAkoRzx0xXbYxroFAsC73DGdl/M5vctpeCKy3+7jtYgIAcpvlEiQ==
X-Received: by 2002:a6b:7111:: with SMTP id
	q17-v6mr3199385iog.141.1529949105233; 
	Mon, 25 Jun 2018 10:51:45 -0700 (PDT)
Received: from localhost.localdomain
	(207-229-172-14.s4620.c3-0.mct-cbr1.chi-mct.il.cable.rcncustomer.com.
	[207.229.172.14]) by smtp.gmail.com with ESMTPSA id
	z142-v6sm4616244itb.28.2018.06.25.10.51.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 10:51:44 -0700 (PDT)
From: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jun 2018 12:50:43 -0500
Message-Id: <20180625175043.25267-1-jon.szymaniak.foss@gmail.com>
X-Mailer: git-send-email 2.14.1
Cc: Jon Szymaniak <jon.szymaniak.foss@gmail.com>
Subject: [PATCH] qemu: Use capstone version included via git submodule
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
X-List-Received-Date: Mon, 25 Jun 2018 17:51:44 -0000

An optional dependency upon the capstone disassembler was introduced
in QEMU v2.11.0-rc0. The necessary version of capstone is included
in the QEMU repository as a git submodule.

The QEMU configure script uses pkg-config to determine if an
installation of capstone already exists on the system, and defaults to
this, if found. However, there does not appear to be any capstone
version or API compatibility checks.

To avoid any potential version conflicts or API incompatibility issues
in the future, use the `--enable-capstone=git` argument to force the use
of the capstone version included by QEMU as a git submodule.
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 094a975177..37f8398967 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -23,6 +23,7 @@ EXTRA_OECONF = " \
     --libexecdir=${libexecdir} \
     --localstatedir=${localstatedir} \
     --with-confsuffix=/${BPN} \
+    --enable-capstone=git \
     --disable-strip \
     --disable-werror \
     --target-list=${@get_qemu_target_list(d)} \
-- 
2.14.1


