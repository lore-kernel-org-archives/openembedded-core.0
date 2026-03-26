Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D910D10A62F1
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 14:30:52 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.49675.1774535444343458718
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 07:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rgTvI8Us;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: zboszor@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-439b7c2788dso638748f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 07:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774535442; x=1775140242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=rgTvI8UskT96amnoio0OKfBc4fU/VznnNtgRsDImnBg6/LS7goPNCckBK3satWaz/T
         H90FNzzERtgzOcL959d90DP/k1UeqxBJm/WVszzXaK/AJTho48k6kFSUuiux5aLFH1AK
         tfPSXALeVpAmwhLEPbTYMWxh9oPvgXNMKkeUKQbtG4DzcQFABM0JzOv9lXGYnZH+HZsh
         zkUTlgbuQJBGBzwN/NAE0gG1xEJYY1BkphVTjwJLSeU/fVgJQiKN1TsKqZE0tlNmayUX
         sFtWd3PjzKWd9mpTbvbv5QajWMW1vssRBvkINJcy3iwB0BxISLWo99Qp3tQDY48cJ6Mg
         F7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774535442; x=1775140242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FQDWN8sD13TBgoi6JTeU+5Vi9yxSudpaP4uM5+8DvWs=;
        b=f0HJOV26ZFsExHss4n2BnGPMbdTF5rJlX70OBUu5G+NqqjDaErRPdWniWKwuBsKYl+
         BSlGksxiBwAHK0lHDZ0E0JS9o/NsnPxzLzQa7a+W2hk4GAbVSRFpNyRUf81uu2Ho+QeP
         yjkgwuF8FRBFMzA60KPCbMR96zOIeb135bXte82sYPamsXpYr5jZ3OrGAL7wn7JS7XyD
         AFwwlT5LTUBKSqvJTF09r63QgOFZRDB6VI6Dm1kmVpDRqNALVGtx8nlBnrFXqfBr6IsS
         uPs/XJ+2h8+He/BrIQQvM0eV5LRT07Ya/ZqfE+eWuaW4G14ySp05gpZNIY0Pu+Q0iPFv
         MzcA==
X-Gm-Message-State: AOJu0YzjetxF1cZe0Al4lCYY1NzwJXT/I3LFzwExFLGZk/3yV3NW5pbg
	KgZJ0O6oItAu4XqG3aDqsGhCf/MI6ryBo+sp3ys7NbeR0B+HW3Y9hRkpiFg5mg==
X-Gm-Gg: ATEYQzw8UVqAsia4J4JtWnDdJqW15cPt2RRx5v8VjyHCKZh3hypMsUSXs+DkQemo2Xv
	X7Xv8poZFQ7wsjRpn6g7mTZq54Q7uS9ZCoq006rIOUM/UGuFNW3QdUdhMPXi7j9p2dWQ/B/SxZo
	727eUulP4APAhp+mJTfI4Ifk4RiCAXSXU+CsZKpIOwT1UzoFStw7D3TBQJwE/GDyFCmOMx/radB
	74Dv3DZPjZZj0lYvHOOo4AxxFzvOkIrQSbo7XJiPgqd7XYcDY8rBuui/iA1C2XqsoDibMwODxEr
	es8MGK+iA89V0miuUlKpaHDTaHlaBUuk0sgyObUCh24nLWhEm+GyO2TaoZv025cPiC4EK55iB3s
	Aikhnvyw8AHvmpEBDG6FVijAffsnbdFVL22tssC5nQoI8fdBbxLnoJXaHNZDyD5QsqyEcuXndWi
	ezLS+orxFv3yG7Ug==
X-Received: by 2002:a5d:44c3:0:b0:43b:8fa4:194d with SMTP id ffacd0b85a97d-43b8fa41b04mr6594486f8f.6.1774535442336;
        Thu, 26 Mar 2026 07:30:42 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b91942f24sm9162880f8f.11.2026.03.26.07.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 07:30:41 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2 11/12] libcap-ng-python: Use PYTHON_DIR for FILES
Date: Thu, 26 Mar 2026 15:30:19 +0100
Message-ID: <20260326143020.2083293-11-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326143020.2083293-1-zboszor@gmail.com>
References: <18A06529173E9998.57592@lists.openembedded.org>
 <20260326143020.2083293-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 14:30:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234014

PYTHON_DIR now contains PYTHON_ABI, use it.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
index f702056f02..f13c2eba17 100644
--- a/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
+++ b/meta/recipes-support/libcap-ng/libcap-ng-python_0.9.1.bb
@@ -14,4 +14,4 @@ do_install() {
     oe_runmake 'DESTDIR=${D}' install -C ${B}/bindings/python3
 }
 
-FILES:${PN} = "${libdir}/python${PYTHON_BASEVERSION}"
+FILES:${PN} = "${libdir}/${PYTHON_DIR}"
-- 
2.53.0


