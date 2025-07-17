Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C35C83F1A
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 13:09:45 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.48246.1752757782212691078
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 06:09:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ak6LdQoQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-451d6ade159so6477585e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 06:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752757780; x=1753362580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+GpRwF5DX1Cwlcc1js15gDZEovt9exZKkI5r0OSLZ/0=;
        b=Ak6LdQoQxRc3SAOSs0BsV0l+9cxZd7agfArS1pbs6Y1dwwfkMsm5elRecETyrQP+S6
         yognYWnYpKy9DrgUJlLNXxUnpXWW4B4kgq8PVtYrAFrsYZRJWNB+RcWjlXg1Y4KWRcCM
         9wnWJ2hc4aGoUhD1yrQ7D4S0/heAKicbdV/zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752757780; x=1753362580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+GpRwF5DX1Cwlcc1js15gDZEovt9exZKkI5r0OSLZ/0=;
        b=xKXCCE71r980NMpW3Btjp9Ov0MZ9RnmE047lM59ZKMge6GYUpT/692YAHT7L3i8peZ
         nQdeuhhvL5TIBPivWudeyyJa978aWJwD1JBmB9f6oEi2Kite5q2x6oxvNhsVcavTLa08
         rPtH3dcNvLTiPB5Sl5pDq+2aleyduhYTKlV3zwhk05jspWvv6w23iRk08OeQ8fcxYaNF
         k9vF5VxGJxddFVHOXCWk9xFjecwNiKXSyyvw33H+rLuD2mbXUysfhoQ6XQHx+ts8u/0M
         GShQFNzTx5wOWfR3s4LShCjxKhZystXlvOL23G8ktPj1AHsEUPACNmoZ4NzCQJJw39aN
         dGyQ==
X-Gm-Message-State: AOJu0YyWa02YnLIHAZvb92KxUhyni1+aY94uh7Ua97r1ZQIY2K3aTqPI
	htpPMtDeOT5ubdpCZ90D+yhFbzQPzuv1cAadgZJuqZJFDHLaW85OITpyMDxqHeutCOfjKPaCAcQ
	M+aB7
X-Gm-Gg: ASbGnctgy+GzJ/kOdLp48WzpTMLXe6RIeiWgACxCkRrLgb4+1YcOihsL1MbqRld48A7
	9iRkIPL4zncCIH8eGoJqv0EiOCNBmZsF6volQaNwZeGs1q/d21crlEmDoOwkJ68IPYMMRphkwWv
	ZftQdJ8XNl95HObOtS10h/nMAQDFBe9xQ1oGp+BhAAeq7UFsD3jOsaabpj4I++UjmfPFTEeAxUv
	jMP4KJgMD7VJFfGV97BYDltvSxRHxt4aSLLpPJJts3OorBINbqrE9QdJoLWvhf9G6bxMg0OjwVp
	7LM9G4gDXMrUkPtNSu7fJ7zzIhrtOyE0y5d5TmFb4PCpFLhoicr9ig4AXFmZvfznsJDiyjyV4nu
	RcZrgawmN81h0DZ4vX9CgrYzTyLMBT+q5JhGuN/6bj9xZ2pTVb5E=
X-Google-Smtp-Source: AGHT+IHXfhN5TBvPJbYJa/KfMEFh0yhalMRxYnW+2WWmuad441Q+QcUzjtaSRIXSRBPMSqfTtPazdw==
X-Received: by 2002:a05:600c:3b29:b0:456:1b93:76b with SMTP id 5b1f17b1804b1-4562e34a578mr62988075e9.4.1752757779930;
        Thu, 17 Jul 2025 06:09:39 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:c05c:a45d:32ee:c317])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e14d07sm20905771f8f.66.2025.07.17.06.09.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 06:09:39 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] gst-examples: Fix buttons in gtk-play at runtime
Date: Thu, 17 Jul 2025 14:09:38 +0100
Message-ID: <20250717130938.169424-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 13:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220542

The media player buttons weren't working. At runtime there were warnings
like:

(gtk-play:824): Gtk-WARNING **: 12:37:53.946: Could not find signal handler 'next_button_clicked_cb'.  Did you compile with -rdynamic?

Add the missing linker option to make the buttons work.

[YOCTO #15915]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
index 8835b7d97bc..df8fd4bd263 100644
--- a/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-examples_1.26.3.bb
@@ -18,6 +18,9 @@ S = "${UNPACKDIR}/${BP}/subprojects/gst-examples"
 
 inherit meson pkgconfig features_check
 
+# gtk-play has runtime errors otherwise
+TARGET_LDFLAGS += "-rdynamic"
+
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"

