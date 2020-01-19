Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
	[209.85.215.181])
	by mail.openembedded.org (Postfix) with ESMTP id E155B7FBDB
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 21:37:26 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q127so14477891pga.4
	for <openembedded-core@openembedded.org>;
	Sun, 19 Jan 2020 13:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=v3Ie9asqY1Czt1lwZVfLd78S1JBCQLjx+cONRntPeTU=;
	b=Bjqgfdbl5o+rHY4/rpCeVcY9likr1OwCnq123vh4PRxwRu6/jK9cNDPJRutrf4UZ8u
	th/2/zmjhyr7XWrjAEyiOEV6ZhE+5Mc2+pGg4TYbxpvjgRUWZuJBjNMJWDMuHeMAFVcF
	WGMOPi8p9cwrNzI3pGFi9wNHhdBEBKTtOSVcT1X2f5QvIiIWfq0nR6I06OgNXQTXLhCm
	mAnaBw368ujSea/I+wuAaop0a/6YMlKIS3l0HnF95jc/OOZ5gvILzGAbdhx1R2+PDFNt
	nc0oRq5YeHh36ni7GNckWkduAgGm1HhnmaONADure1wg8Y4icAC2fMyZaiDsyIqXlGJX
	UaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=v3Ie9asqY1Czt1lwZVfLd78S1JBCQLjx+cONRntPeTU=;
	b=A6RtK9r75n+si7AHo5j7ZIeu0Hg0iBTBbL5L/bmcYx/pUjgU7wAkLAGFYB4TO7caFD
	tyALh5Y/3TIrDBD13byY0yM15qX9+DnKxHunS2MADaiuhFOefr79FM45UtfMZIY9aFmm
	ScQduqFS/rBkQS8gjctv5X4NSreAr1k8ksPrKDQgnqjl+YuyjLgTG6gSXsWKojuhNsQ1
	7JFOrRmELJ/pFt938BezcZw6WlVaXRfKiPPHtTNJ8KzdnC1ckz2u9AOrXuyNWwL9Esve
	veVGSrdymhVAJBW11qGXMSvoeixcyJT0BDTTpHcSX3Yuc2I2inhGEzR4m9zD16geYKjW
	L+wA==
X-Gm-Message-State: APjAAAWQSTceVCgLRruaUE2fmrJ8sTt2I1tnXQdR0AsnU67h0PMyIUMl
	tTYw4kShcrXNP0ZjrEmWfsr+fOje
X-Google-Smtp-Source: APXvYqyq1VeD/Jz+UvbNOSTTVkyDBalXXruHmsk/qGmjZr/+4UpOYFEdrQoiZoeddmTWlNuZI2igSA==
X-Received: by 2002:a63:de47:: with SMTP id y7mr55534326pgi.270.1579469847835; 
	Sun, 19 Jan 2020 13:37:27 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:450d:e003:9142:f492])
	by smtp.gmail.com with ESMTPSA id
	q15sm34912518pgi.55.2020.01.19.13.37.27
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 19 Jan 2020 13:37:27 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 19 Jan 2020 13:37:19 -0800
Message-Id: <70efe880589df1dfe7d71451d62d9d8e4afd7981.1579469619.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1579469619.git.akuster808@gmail.com>
References: <cover.1579469619.git.akuster808@gmail.com>
Subject: [zeus 1/6] linuxloader: Correct loader for glibc on armhf
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
X-List-Received-Date: Sun, 19 Jan 2020 21:37:27 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

Fix the naming of the loader on armhf to match what glibc expects:

  #define GLIBC_DYNAMIC_LINKER_SOFT_FLOAT SYSTEMLIBS_DIR "ld-linux.so.3"
  #define GLIBC_DYNAMIC_LINKER_HARD_FLOAT SYSTEMLIBS_DIR "ld-linux-armhf.so.3"

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 7ad531093d620f18c04d487d79e9dad9f5a96232)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/linuxloader.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/linuxloader.bbclass b/meta/classes/linuxloader.bbclass
index c0fbf26836..e2876cec7a 100644
--- a/meta/classes/linuxloader.bbclass
+++ b/meta/classes/linuxloader.bbclass
@@ -41,7 +41,7 @@ def get_glibc_loader(d):
     elif re.search("i.86", targetarch):
         dynamic_loader = "${base_libdir}/ld-linux.so.2"
     elif targetarch == "arm":
-        dynamic_loader = "${base_libdir}/ld-linux.so.3"
+        dynamic_loader = "${base_libdir}/ld-linux${@['-armhf', ''][d.getVar('TARGET_FPU') == 'soft']}.so.3"
     elif targetarch.startswith("aarch64"):
         dynamic_loader = "${base_libdir}/ld-linux-aarch64${ARMPKGSFX_ENDIAN_64}.so.1"
     elif targetarch.startswith("riscv64"):
-- 
2.17.1


