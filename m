Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B9EC982D9
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 22:08:39 +0000 (UTC)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1606.1789682910568262308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 15:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JRTQOuOz;
 spf=pass (domain: smile.fr, ip: 74.125.225.140, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso1215025e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 15:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789682909; x=1790287709; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3fNkoEPp8E7+aElQtdNDPV2RIlm9VBjzODsLQTrOOJY=;
        b=JRTQOuOzndpVfjGnjLcBlwufTrl9hyZ0Dc765x7l40gX/Pd/v55AjIuu8tZma8DLEr
         Vl/3YzdtRjT/SJJb28zC6YzXpIFgd0LAW7LAkewcURSkrxKc4Fv1VEEzVDVpCQt8UYWA
         Dz9h1PP5bseGFhMoe16H7TfhUcHpai33NLuWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682909; x=1790287709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3fNkoEPp8E7+aElQtdNDPV2RIlm9VBjzODsLQTrOOJY=;
        b=qlXijjxsrFugcvPFs45KouQyhLWajbNghtrBnb/OsSO7TJeq6pkkCUIW6av5SeoMu2
         50gVLoK3crCW+AgxWk/5XA9qIstRdpBZgMFvzCrAACM8RuZ4FEURDrC44nsRvAum+FR1
         zixo3FQw4G3Ma0Nvl3v4Z1BSG7Nt1dJIKGnYGn/fY7b1aRSX67LESowa15qNMZxtKjLC
         961/QjjlyzEcksD23B4DbG6vaRaoQPH9EahY0qDjNR3W8kajMXImCezgzXYHPd+s54Pm
         O5u07QKBsIfrPLaVzbDC27U/3yxGzRTaYWHvvWqXlHjzTiAHKppxTUShsg5pvFOOjFlH
         j28g==
X-Gm-Message-State: AFuF++moGa1UgYgmTBi9xIk4BDVtJuKn41EoN3E+r25sb7NSgEBRLQcO
	NHz9OK6UGpbHosDlcaqk00X2SX/JbRfRAnmovOdCnpTRvEzLESY50OzDpTS8e017EHmdpOWsBa/
	03czNDkk=
X-Gm-Gg: AYBFou2zuJdM80u6tYTjQ2+df7QRkYUu6uev4YC7ZVWaRIzQN8/GvvVwCy5WSoulnUY
	9hxMGyGhTakoDUELUyrRt+egLhwOxz2q+GUDYqOgsb+HHhuU+GiCIY+s0cpHn2RSyFR5nZ+/2zW
	Hlt/7BnNQ/1trtwGJtRDWRHvV79mBprNIf74t1C2Lyehyz3pTyIAq3RCx/zCk6w1+JtFsKU/WOw
	w0FG2ZBWdt8fnQOYea/8dmFTOKdhumL1nfDGlbHazZdE5CstRK64cABpg4hzlmRp+ROh+zcVltv
	rirKyr19kvFxbC0M+NUBBDvV1bz7UyrM/2ddVsJc7Woo8x9rqOPiDzB2qiOvdCXYKtz8eVyOqqT
	J4AtMnJtkr3IFlqLuTIWqUw2T2bH6ogCRLXuMuNpnCcOO8IjkqTaf9e2BpkxralP/8ijDfYfCt7
	kCSRPWNX9+A/OPBeR0a0PkfMz/tLj5W+6EUMCvm9bw6D6otlLsS/sDGzIWzQw5L1ntYxwlmKiNi
	dcG1Wt3lYBz0kHKa1D9xvG6ycEtiMEuhn04bz5VnYLUul9x9/VFQm3wm9orDaAaxeMyMhO/olg=
X-Received: by 2002:a05:600c:6206:b0:49c:fff9:f684 with SMTP id 5b1f17b1804b1-49fc5735339mr3214005e9.21.1789682908900;
        Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc471b9a2sm8984075e9.0.2026.09.17.15.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 15:08:28 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 73/79] ffmpeg: Fix for CVE-2026-64834
Date: Fri, 18 Sep 2026 00:06:58 +0200
Message-ID: <b4e6170b9f6da996fe0818b78de0fe364b174f59.1789681419.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1789681419.git.yoann.congal@smile.fr>
References: <cover.1789681419.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 22:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246168

From: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>

Pick the patch from [1], also referenced in the NVD report [2].

[1] https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/11d5f475be95d22d5f0692220cc772b116abc632
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-64834

Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../ffmpeg/ffmpeg/CVE-2026-64834.patch        | 36 +++++++++++++++++++
 .../recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch
new file mode 100644
index 00000000000..d4a44d293c2
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/CVE-2026-64834.patch
@@ -0,0 +1,36 @@
+From 9ac8fe453e443c3fc07bf85099cc93ca100d302f Mon Sep 17 00:00:00 2001
+From: Pavel Kohout <disclosure@aisle.com>
+Date: Tue, 30 Jun 2026 21:55:16 +0200
+Subject: [PATCH 3/9] avformat/rtpdec_asf: reject ASF objects smaller than
+ their header
+
+Fixes: infinite loop
+Fixes: MzWwJdpZF2Ls
+Fixes: c2f3eec445389d67afc8c699ba23915a20cae51c (Implement RTSP-MS/ASF packet parsing.)
+Found-by: Pavel Kohout (Aisle Research)
+Signed-off-by: Michael Niedermayer <michael@niedermayer.cc>
+
+CVE: CVE-2026-64834
+Upstream-Status: Backport [https://code.ffmpeg.org/FFmpeg/FFmpeg/commit/11d5f475be95d22d5f0692220cc772b116abc632]
+
+Signed-off-by: Bhavesh R Maheshwari <bhavesh.maheshwari@einfochips.com>
+---
+ libavformat/rtpdec_asf.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/libavformat/rtpdec_asf.c b/libavformat/rtpdec_asf.c
+index b3b346f..f7fa69e 100644
+--- a/libavformat/rtpdec_asf.c
++++ b/libavformat/rtpdec_asf.c
+@@ -56,6 +56,8 @@ static int rtp_asf_fix_header(uint8_t *buf, int len)
+         uint64_t chunksize = AV_RL64(p + sizeof(ff_asf_guid));
+         int skip = 6 * 8 + 3 * 4 + sizeof(ff_asf_guid) * 2;
+         if (memcmp(p, ff_asf_file_header, sizeof(ff_asf_guid))) {
++            if (chunksize < sizeof(ff_asf_guid) + 8)
++                return -1;
+             if (chunksize > end - p)
+                 return -1;
+             p += chunksize;
+-- 
+2.43.0
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
index 35153b81a99..c00c3f32b78 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.3.bb
@@ -30,6 +30,7 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://CVE-2026-64831.patch \
            file://CVE-2026-64832.patch \
            file://CVE-2026-64833.patch \
+           file://CVE-2026-64834.patch \
            "
 
 SRC_URI[sha256sum] = "6136812ea6d4e68bdba27e33c2a94382711cdf4f8602ffef056ff792bd6f9818"

