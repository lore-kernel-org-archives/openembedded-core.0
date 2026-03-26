Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AEFF109E548
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:36 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46596.1774529489045670327
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 05:51:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W+TkxgwP;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43b41b545d9so941413f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774529487; x=1775134287; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=W+TkxgwPIvFB3ShchopdEyZTbge+LUhJePrb4E2uqaDpLqayVGFwvFW29anpeqXepB
         0eBT2Ux+KvVdCcaZ4Qj+2Fn8z19mPJcRVTarUwsctrqizZy6R3kaKMAHDVhMA0ISdQ8b
         bb7lK7OUXtMEWmr4O10dBmAardvRznh1br43tGeEQIpYosKVs/lTMNNJXRbbH/2qi7gI
         bj2W4rIpyrgwShyZDMTOmI9ZwaUfOmI6PVq4eGRd1EBIi8X/EVldn2eUvuNYRwp3vseA
         zhUtPnIsfQEyWQo9kEtvcxOdkzAgVVq3Qco0HVBGyoaGh4j7xqeshgqDUmbTxW1mJ2+f
         pm3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774529487; x=1775134287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kAYR3ZSfVW5X86WRFH78salrCpWTUcp6vSQ+giJ53I4=;
        b=svu43LeJBJmbTedlJd8/F3aVZW/bHhTHV9Gggiv9wi3CMLOH5pcikFrDXSVb/ywCvu
         WgAyWg40xLqlygtKA/ibQ/MD0LZO3JZ5cYYZhS2pqiM9X3pJWPybef4HvnTJnPW4BWxe
         QannQxOOMxMPM25ZxclkGBLXSj8XiOb5bVJ+N07rhgxCclur7aR9TiC2+KTZlvqXqFFw
         DhVdHgGjbmAMKOE+IecAfQTOisikvUbJajKpCK615o8tXSwaYnzapJg4JKcsal2GyXkA
         D3t3Twu6mBezbq+kOC4fJqk8Isbi9D0RfWEK204I6+WqH2p4MyvBCpk/gY4E9ZaZ2gkD
         ebCg==
X-Gm-Message-State: AOJu0YxohJ1qvIiYw6RRGsLaEtrK8eTaulVyVvfatfJTFwxwj6M6tNR6
	h3+pC8DyOMjvgUD7Ops6WmHaLb1+nUIHhtOUYenfZ11S1X+Tpl0G6CrR0II41g==
X-Gm-Gg: ATEYQzxcRyu4ywnYxuH8u+O74QOor+mR9M4tsFuxLB7NI7wkFDQUNI0emv5IYH9wTd9
	R5awi+TmAtTzInEGFDVaOdInBSH7/pDQ80IgPH4oOCEQQhaHGkjA90k7U6QMbY95Yo21Vv0uxPE
	uINe95sUaO5grw/VCLr2oDecBl3DmxJyCymsDYYgFeGkcba8BLirc0k+UQwXJuqFpzNTjANU6fk
	asv8oYC9cW1/9KRjl39CH6h8KjSA/QfDZmfzTkzuBWQ/TybkQ7zwh6VHcEJm+Tx/hTwtMsbe03b
	7WiowJGHslx+FGH6HdPNZ9w+cQN+cw19SDa8CQMncncCjVs7OYbxmn9apoedKlamzfVIqVVQgrB
	n3am11bNfw/un3EJiY/urgsZUPVzR2TmfR3Dm3onPJ4K39GLBBzx92zFaVCrxfdH/hLAiQUIu9S
	xYUbDxuirea//2Ew==
X-Received: by 2002:a05:6000:250d:b0:43b:45d1:f449 with SMTP id ffacd0b85a97d-43b88a39c46mr11737897f8f.51.1774529487147;
        Thu, 26 Mar 2026 05:51:27 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf2d3sm7681326f8f.19.2026.03.26.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 05:51:26 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH 08/13] boost: Stop using PYTHON_ABI
Date: Thu, 26 Mar 2026 13:42:29 +0100
Message-ID: <20260326125113.1853869-9-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326125113.1853869-1-zboszor@gmail.com>
References: <20260326125113.1853869-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 12:51:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233993

PYTHON_DIR now contains PYTHON_ABI, fix the settings accordingly.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 64a57ddfb2..7b02ed4282 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -174,7 +174,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_MAINVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then
-- 
2.53.0


