Return-Path: <prvs=09430007d=alistair.francis@wdc.com>
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0C87ED62
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2019 20:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1563396901; x=1594932901;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=zkLHpsKfSX+r1yVNq1FzZ8bo5puBU/qAga78V3EYNe8=;
	b=pEZodiikzEaaIO52yj26ig4Jlqw2WVLYdWVXoRDOKUWVYlVIEIVMkdmE
	2GW4CFMt967YIKOqQlSFK0E0Y7yZNBBMC1dRtBML6BcGHP4itQZ0CNOaz
	jwT8fQPeL9SZheazVA88U+shJxe3jI1Noubf9K2MeLVvtbe0rfaWo40/S
	lSRE95IlftNshS2mdmECtZoNGQAsZhTZGmmEc3AZq2rXEsmmgJ0pG6Cqv
	za960DfeKKx5/zqjiAE4zLTk7JKUYwP3mJpxBtC+NMBixBBw/HXishEZR
	Cj64QGcmZXCtCcxOI1ovh9aOJnQhUoWB0WGiBze+3IbxNbad7jx8wqftA w==;
IronPort-SDR: +9/arbC6hQMrR4BfVtT/twMcEZwky4kJdYjc55zUF84HpZWhSRmA4R8W+Z9Qvm9N3kGlGrDbN8
	MOjIXcchsoXCgkf4LQDOu2JOJn22nj+K2NU5LyNMSr8CUMoFGUm0GhOhfEW2c+UrdU8R7qo/Lx
	98p6H4b3NrfGt4yb+SAdheuuv4/3PZPFzLJx+sJ8GAarI2SHArYGKIiunDTTo+5FQ7K/cWmCo0
	2jYD+E+0sZqmcw7fp3JGGrOp0NSp44EEEfVHUQzxvG/MzPzjLouuKn7WCI+5fzZS6SrJI7NAoo
	4hA=
X-IronPort-AV: E=Sophos;i="5.64,275,1559491200"; d="scan'208";a="219761772"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
	([199.255.45.14])
	by ob1.hgst.iphmx.com with ESMTP; 18 Jul 2019 04:54:45 +0800
IronPort-SDR: 09g86SXS5XMc0tPROrMXeTg0aJtrOqK3KT5qCTW0XqdGq/SB9zvjNCrojUFqsPxSkhYsmuhsDo
	I6btFocH5Ypz+DLmXq83AQfjw7AQ351wP8xyD3PPyLNrqgJljLhLm5XS/wpmSghCsxFweI690T
	yxAdtrOFphsO1E4ebKp6oGQOfxSM9nMzVReRTJ3pEnsN5BD6A42vgUWUI6UYjF5X86NMFG872t
	Hun2Yip7TZEl22jCgHC58Qiyq/Ygx6h/rRMjWnGeDk1Ud3oWLxtSJf35ucGsNPJFd2+kmbs4SN
	IIZm1RNDnD+ljk0yLqyEeVeJ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
	by uls-op-cesaep01.wdc.com with ESMTP; 17 Jul 2019 13:53:15 -0700
IronPort-SDR: 8AXgu+BA/f2MCI9ARy+8FRAxvIalNaGp4KVXnLOAJWSnMKXEj+FyvRu8ZBybrATMLACZPRZ8VA
	qaEhlxzAAoGxthH0hVgUjHN6yXDt51ZtQNTS0nWuYwPONjseu3D4/IO6AhvIUn5OrpjapoogbF
	sq08/CKe3F/Qc2hWB/ybcpzzObQ+WpXZrYraP/+5vOJ1iYLpWexJ9zX0YXB6xOresCEMRerrN9
	Ve2/nK67ti02S0ZOg6tZLyuX0P0s58ONxAs2rpLofFjMuYoengaUnTgHhfZ9A+3qzrL3bCWftl
	mWw=
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
	risc6-mainframe.int.fusionio.com) ([10.196.157.140])
	by uls-op-cesaip01.wdc.com with ESMTP; 17 Jul 2019 13:54:45 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jul 2019 13:51:49 -0700
Message-Id: <20190717205149.32709-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH] opensbi: Fix installed-vs-shipped warning
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
X-List-Received-Date: Wed, 17 Jul 2019 20:55:00 -0000
Content-Transfer-Encoding: 8bit

Fix the following warning by just deleting the files:
WARNING: opensbi-0.4-r0 do_package: QA Issue: opensbi: Files/directories were installed but not shipped in any package:
  /lib
  /lib/libsbiutils.a
  /lib/libsbi.a

Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 meta/recipes-bsp/opensbi/opensbi_0.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-bsp/opensbi/opensbi_0.4.bb b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
index 139718c72b..068ae762d4 100644
--- a/meta/recipes-bsp/opensbi/opensbi_0.4.bb
+++ b/meta/recipes-bsp/opensbi/opensbi_0.4.bb
@@ -31,6 +31,7 @@ do_install_append() {
 	rm -r ${D}/include
 	rm -r ${D}/platform/${RISCV_SBI_PLAT}/lib
 	rm -r ${D}/platform/${RISCV_SBI_PLAT}/firmware/payloads
+	rm -r ${D}/lib
 }
 
 do_deploy () {
-- 
2.22.0


