Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A38CC4452A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 08:53:31 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2625.1784364803140992134
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jul 2026 01:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Q+OkwoyU;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4954afac04bso12576835e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 01:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784364801; x=1784969601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Du+VSNE1xIMo50GF9aElXyhvyHaKEuTQflcLfv0ulmA=;
        b=Q+OkwoyUQK/6Si1uePU6a1vmEOzMLTnQwAfkvQGCwcRubvYZsUalUYBhOSZa5G8VTX
         +28AGRtJLlwC4hQOtcPXo7q/xTdn1u/GvmF6me0eX7jrbCBsCOX6ZguETrSAC+Ye1nYD
         YwUmj8r130bBDrlDfQ3Cm4wYPFBIQ03gml08A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784364801; x=1784969601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Du+VSNE1xIMo50GF9aElXyhvyHaKEuTQflcLfv0ulmA=;
        b=CY0v+7H35qF9jHIkOEqtuzZMof8oFrzEj68+DtADdslEA0u3tGVC96wh63KoQTan10
         VeODzsGEqsiG5vizT6DuY0Zst5XHxVpWkVgE7O5KoLpGqRwyM2UqZhuVL56JD9UkW8lo
         HqN3pbG217ldHQVC+8BLIEBFpB3H3eJiuqoU+cyKdhBmcVY0LUxY4+isn7RS1gfB9go1
         BCuFi+fHd7o3lg6yhogpMSFYG5ilwUhdPAz3xRNxk52QPDDPzdD8FQ9eFWegpq5wG/WG
         IjrYCbODupoBi5IgxGcgYl+z7K70UYi7ccTUtvmE0tfGHndoyd81cvgspX5H7cfE94N4
         d1EQ==
X-Gm-Message-State: AOJu0YyE8BNFfrzTImqGNxJGe/bROFTZcpH817qcBWVtvRKC1ERX+L8b
	Ks3Xaj2YblmtZvESg03lWfiuuyI5894jTU/nnURWgnvOiA6xByQfqSIv1hig1Q9LMpzsJshIo83
	9BFtQG3o=
X-Gm-Gg: AfdE7clHlcqvIv5QmI0U0z9cqIvMXmDsZsRDdRXkwp9SCu4PLMOej28DEGei0vv1fYy
	IJ/dnaY9AmKoBv6fb8SCJLwwJx56jUv35IY2eolf/5evOSRkbqcZRpPb3ez4GJACPRQfizg+SEO
	LO24nWVIwf/zmFvWhhFe599d+LCC3vLPhmhdFC00+JQEmrKlRWjVz1I6MouVkZK0AmF8OiNxJrQ
	QyfS+EusPW4kP7VtcOi16r1OlxntSFZehNmikpKGI67IrvSwQleG80TRqqgSTuMJAkdRT7QLJfw
	vFxB2OlxnjWiRKF20I9UgRKLd2m1fHud1opOXEYZMUkfg5sHoN1Z3HqRxfY2yvsg+c2N9MTG13s
	QOIf4LNN3Km0TraVDwk6k+iUOvsNATUF5kmkwQq5/B2cjcs1c6/kmaeGUbBL0UryOKfmbeLrSXU
	e+ziN+Sexk4EauJ+ev63nbo67cVBt9cjdcODfNVakhMMdnPOj6/hyU9mC04cTSXLG96UhYvMsui
	yih1z4=
X-Received: by 2002:a05:600c:4692:b0:493:bcef:565c with SMTP id 5b1f17b1804b1-4954a3e6dd1mr63316485e9.1.1784364801296;
        Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa001444456ef7d84e9a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:1444:456e:f7d8:4e9a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2b87c6sm176409335e9.7.2026.07.18.01.53.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 01:53:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 03/17] kernel-fit-image.bbclass: Do not include kernel property in DTBO config subnodes
Date: Sat, 18 Jul 2026 10:52:42 +0200
Message-ID: <5b089fb1ede8b0a0e6f8948d31ab166e6315cfd2.1784364567.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784364567.git.yoann.congal@smile.fr>
References: <cover.1784364567.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 08:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241240

From: Marek Vasut <marek.vasut@mailbox.org>

The OE 5.0 implementation of fitImage generation did not include the
kernel property in DTBO configuration node subnodes, while the current
OE 6.0 implementation does. The previous implementation was correct,
because kernel together with only a DTBO overlay can not form bootable
result. The kernel property should only be part of the configuration
subnode which includes both kernel and DTB. Fix this.

Fixes: 05d0c7342d76 ("kernel-fit-image.bbclass: add a new FIT image implementation")
Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 06ed34005957a6afb88270603df5e545941546b0)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/lib/oe/fitimage.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
index 881d0eae0ab..d7e21171ab9 100644
--- a/meta/lib/oe/fitimage.py
+++ b/meta/lib/oe/fitimage.py
@@ -425,8 +425,13 @@ class ItsNodeRootKernel(ItsNode):
         opt_props = {}
         conf_desc = []
         sign_entries = []
+        include_kernel = 1
 
-        if self._kernel:
+        # DTBO configuration sections do not include kernel property
+        if dtb and os.path.splitext(dtb.name)[1] == ".dtbo":
+            include_kernel = 0
+
+        if self._kernel and include_kernel:
             conf_desc.append("Linux kernel")
             opt_props["kernel"] = self._kernel.name
             if self._sign_enable:

