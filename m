Return-Path: <christoph.lauer@email.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F810C77B61
	for <webhook@archiver.kernel.org>; Sun, 16 Apr 2023 10:31:25 +0000 (UTC)
Received: from mout.web.de (mout.web.de [212.227.17.12])
 by mx.groups.io with SMTP id smtpd.web11.26636.1681641081345341616
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Apr 2023 03:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=christoph.lauer@email.de header.s=s29768273 header.b=K8lerqFP;
 spf=pass (domain: email.de, ip: 212.227.17.12, mailfrom: christoph.lauer@email.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=email.de;
	s=s29768273; t=1681641078; i=christoph.lauer@email.de;
	bh=nxu4mqaxzX1pWXbBT5jqHmQe/whtQjTce8tfFNJ3Qt0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=K8lerqFP19QelIKa2mIzLAX/leVs/Uakf6GcYfrEQwv6D1YAwbwtT1ii/9yS+sGeR
	 V6ZKRa3GIAXbS0uZGWJzlmAbBSoMvQXSo3O76ay78BLTFamH7pHumIcojDZW+Mjs1x
	 AA7MRzTalWn0FHnNRS46n5u7qur9NXOL2gb4u9KFzCuqtMSJFhNyAeoB/oLfbzteYe
	 5zvB2k6Oi2Ss+YGLqdgjExdyyOYj8p7vGspyceurWxO5iuCVxAMj1gl0UgZ9uRKpbd
	 C3EpfSc3sBinNaB61T2+lNb+6vTi5SHgH9R7OYIvNxOF0NGM2yxYAOlUlIpuZV1qlo
	 Vyqjx9uDohGmA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from xtr-acuyocto-p01.xtronic-net.com ([178.251.90.190]) by
 smtp.web.de (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1N0Zo6-1qbIUU30j6-00wijg; Sun, 16 Apr 2023 12:31:18 +0200
From: Christoph Lauer <christoph.lauer@email.de>
To: openembedded-core@lists.openembedded.org
Cc: Christoph Lauer <christoph.lauer@xtronic.de>
Subject: [PATCH] make-mod-scripts: preserve libraries when rm_work is used
Date: Sun, 16 Apr 2023 12:30:52 +0200
Message-Id: <20230416103052.28268-1-christoph.lauer@email.de>
X-Mailer: git-send-email 2.17.1
X-Provags-ID: V03:K1:akJkHbPjKhzEFF/p2WxH5a2Qpv+pJJtppPTlz8a2DAO38YMrgaW
 CFP+x4jt+kF8WZ45KYZdMBPBBd3QBOiR7rxAmYnZ8nvuZCto1aDMficZg8YQQlZ94PIb3CU
 bw+p9Byvwh/6JESeuJIURLUe5Yvb/ZsKLMeCYjgKx6vce08FZlMeq74F3pPDsqh5Jk3VyNS
 SZ4mJwGLxn2zJJUn8+0Ag==
UI-OutboundReport: notjunk:1;M01:P0:hHyzqzHS/Cs=;suwd5KbZlGw1KzDR2Lv//8nETy4
 ktIpQq8wgNsXdWYHGLClMSL2qZZ1dcBmZVH/PSTQ5SgOCEQJyDCwAOng/+xOK6XvPqjoo9voy
 lq66Odxr9V6Dmn4HGti+GJ6h26EJOKfOuSBsrkgrjID5dWCFO7+C/z6L4Uv6crcqNKQXiX7bT
 kI8wSgRJA13M64nJVmqsbKSJC3RSuzG3cQwsedurMUSwA4d1xPNJHksnxKAZq6nP6Bsr9tndR
 Uxjygv1PKj+oE2Oljhkhnl/RPygr2KU5p719gqjnnQRe+djOn0OIsqKOW7s8dFU/P62k/myfx
 GAa3LQ2VKSTvlyg4Fvn9dUicAa/eBETjX4Vy5+L6a3GXT3hL8iw17kbcDNCcod+ZwWWAn+dA+
 /akbNfcDDrUQMHayaJ4ctO2O6PRcGa/HjPt/nSd1sBt8qAdQFaNUBSwM/zxcpOKaznBQ453on
 jBTTpQE8emwCH682ebEtYUeni+kUNNtfG0TOcYXZHN8onyCBv0NIoMyoo3F8bn6oavy7JgvW0
 yIstK/tkI4vdJXvOLEJINRmNgfb4PlnlvPwzY+1p9MrTeSlRNviaI+B+SUZV2f1j2HYgEM3NX
 VQr6h34I8dvEmU306rO79JVbdg5ueqCWfyBPRa64kVseFDTsbA0bv4suQJIp8nt029flBJMMy
 a6qD7zpQEkIsWwcR6sLEdl8oF2Ay9LBQw1KfLZFelnGGoYTBR9Jn1iQIa74s9bjRJQqd88A88
 wSwGXdO/jVZbI04MHdrKAc4WBg1Wa5zxmboNziQusF/sWuSXTZJH1I/ug9JdSrND2X4feoIIE
 94G4NUnOSF5BeawhNldcYddC2WPn6KZOLBeB70ENsEOfVWbV07jayWXkUnqYVbhVAmaiLSfzP
 5RwdIwAS9qfobQljbS7rjLY3kZbmn/bRAbya4O7SKTiouF1Lp5obZTpE2PAKJN0XLOFtohk+X
 a1eFtg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Apr 2023 10:31:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180113

From: Christoph Lauer <christoph.lauer@xtronic.de>

With rm_work active, external module signing throws an error:
scripts/sign-file: error while loading shared libraries: libcrypto.so.3: c=
annot open shared object file: No such file or directory
Preserve libraries that sign-file script needs during runtime.

Signed-off-by: Christoph Lauer <christoph.lauer@xtronic.de>
=2D--
 meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb =
b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
index 28e0807d1d..0e24efc597 100644
=2D-- a/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
+++ b/meta/recipes-kernel/make-mod-scripts/make-mod-scripts_1.0.bb
@@ -32,3 +32,6 @@ do_configure() {
 		-C ${STAGING_KERNEL_DIR} O=3D${STAGING_KERNEL_BUILDDIR} $t
 	done
 }
+
+# keep native libraries required for module signing
+RM_WORK_EXCLUDE_ITEMS +=3D "recipe-sysroot-native"
=2D-
2.17.1


