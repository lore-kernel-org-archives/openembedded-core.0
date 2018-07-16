Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id BAF1375114
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 20:45:18 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id b15-v6so33252727wrv.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 13:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=GOVQAoAkAJezayn6ER9gXS0G1H59h5A1l1rzDwFidhU=;
	b=BiTotQA3FTD9pTN+KO1rd1w+ccQP8KdG5pBU7saz0KsiCQodvtvhFm+g0Tn56O7aEi
	tvjxQaMHA8cb71Y3ZumGR9AghVNNLqGddeBHXs6WWJ03O5ATrnaIcRXOt+IlYvqhfTB5
	q2qplu1ZLaOwlpQvk5clwyDRhq+bYwIlBD+1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=GOVQAoAkAJezayn6ER9gXS0G1H59h5A1l1rzDwFidhU=;
	b=dGaYilhaGj7qu3fcA/S35iI0zOs+Y73tUBEo9TO/Ga6NENhINaMYuSEotWGKaIJ4y2
	8+GMy9U3WMwD7LNKD61eEzIo3QhfutvWxGP1k+ocuUXOuwB0fnKpLPUmkFuy9Me2mFcX
	jHGCG8ijaUshy7Wbj0SLOfz7GbRN3NHJsNVNCx+pu6tekp/viES/ULn5ue2Pu4jyLuZN
	5ERarzUFFSYCPDAbgR9DrchspcqfUhifZDDKm4gQl7kSXiQa50lyATWpOSqfMQTnWpLs
	/Ac+IFIca93KA5CGwPoh1QEEfpWZb/VaVRcb8SPmMDmTtfW4G/c/wE7OJqzgL6iKcKjW
	mmbQ==
X-Gm-Message-State: AOUpUlE/sgVsgBEjvEE61wmILpQnGm6K+5pl4FP5h/bveDD4vwCY5FqO
	alAXJh62BvxIKP4s/KEJ9S8fHaVpp4E=
X-Google-Smtp-Source: AAOMgpfx1E0jSfQDlTVKvaMv8xsjLWwrj2i78L3SvkguWlCyGIXzijq5XfbzP9UC7FZWzHoSIZepxA==
X-Received: by 2002:adf:dc8e:: with SMTP id
	r14-v6mr12871924wrj.166.1531773919099; 
	Mon, 16 Jul 2018 13:45:19 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	b1-v6sm20379930wma.23.2018.07.16.13.45.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 13:45:18 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 21:45:17 +0100
Message-Id: <20180716204517.19882-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] populate_sdk_base: Use default value assignment for SDK_TITLE/SDKEXTPATH
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
X-List-Received-Date: Mon, 16 Jul 2018 20:45:19 -0000

This allows the user mode flexibility about centrally overriding these
rather than needing to do it on a per recipe basis.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/populate_sdk_base.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index aae6786e586..7ffaf84a45d 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -63,8 +63,8 @@ SDK_PRE_INSTALL_COMMAND ?= ""
 SDK_POST_INSTALL_COMMAND ?= ""
 SDK_RELOCATE_AFTER_INSTALL ?= "1"
 
-SDKEXTPATH ?= "~/${@d.getVar('DISTRO')}_sdk"
-SDK_TITLE ?= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
+SDKEXTPATH ??= "~/${@d.getVar('DISTRO')}_sdk"
+SDK_TITLE ??= "${@d.getVar('DISTRO_NAME') or d.getVar('DISTRO')} SDK"
 
 SDK_TARGET_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.target.manifest"
 SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
-- 
2.17.1


