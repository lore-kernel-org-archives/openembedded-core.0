Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 30E53731D8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 12:05:18 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id o80so115991345wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2016 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=fyszcrSgqpwtvkWhjrHERm7wlofJiRBzOHfEHz2TAm0=;
	b=PxSeANLTigW233VY5HQd3TZqmZx4qeITEovLZcOpMgds2Fd3l4589CB2rYHZozDEm3
	DhcbomNI8ekuMlEytzZjaafCjGJM7/suPbRqk96X/ml6alI/5ugWfoM5aRU8grDVZFBD
	3wxslCNQuDLeEifY+a4QlATwVSIXaXQJXxEAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=fyszcrSgqpwtvkWhjrHERm7wlofJiRBzOHfEHz2TAm0=;
	b=DjEHiNDH55jlWk1lHr4bk6PJnOsrq+7QVrGgXC1S9yTEqXamAnImKunzsiqBVC29CN
	e/lyTUij50wEDQYpDUWloR1/2PVs0TfXzapg1BVqVRJnTimERqH3I123zYxHLYVIem+A
	ITinskABn9CwBsDOK3GpZVZbDTwCkaUcMl90rT7ymdqo5l+vz4/8JKXtvbiHYm7HxneY
	GPSMtgPvll17n8AldnZ0mu/X33mu8R2nimcS+R4Be8j9ioGWk1Bun+zEdYYh+inkC/cm
	D3Fan/Kv6AxjDCmXr83SblU0JlipDEaV8WVfgoPyek956BJjtTSP2tfsYte4MU4pZ92g
	PjGQ==
X-Gm-Message-State: AE9vXwNsaeyFlQRo8i1E/NdpnSoNtpRWOW93/U+9Yb/hzvcaVpW9DSfeYBBOWohDCREet/OU
X-Received: by 10.194.171.131 with SMTP id au3mr3577932wjc.125.1472213118375; 
	Fri, 26 Aug 2016 05:05:18 -0700 (PDT)
Received: from hackbox.linaro.org ([81.128.185.36])
	by smtp.gmail.com with ESMTPSA id
	e12sm43218600wmg.17.2016.08.26.05.05.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 26 Aug 2016 05:05:17 -0700 (PDT)
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Aug 2016 13:05:00 +0100
Message-Id: <1472213100-11245-1-git-send-email-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.7.0
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] gstreamer1.0-plugins-good: enable v4l2-probe
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
X-List-Received-Date: Fri, 26 Aug 2016 12:05:20 -0000

A new mechanism to probe v4l2 M2M devices was implemented in gst 1.8 series, in
order to get such devices probed we now need to enable v4l2-probe compile option
which upstream decided to keep disabled by default (unfortunately), see [1].

With this feature disabled, it is not possible to get v4l2 M2M device to work in
Gstreamer which is a common use case on many embedded platforms. This patch
enables this new option as soon as v4l2 support is enabled in gstreamer -good.

[1] https://bugzilla.gnome.org/show_bug.cgi?id=758085

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 4621bf8..0d52343 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -28,7 +28,7 @@ PACKAGECONFIG[pulseaudio] = "--enable-pulse,--disable-pulse,pulseaudio"
 PACKAGECONFIG[soup]       = "--enable-soup,--disable-soup,libsoup-2.4"
 PACKAGECONFIG[speex]      = "--enable-speex,--disable-speex,speex"
 PACKAGECONFIG[taglib]     = "--enable-taglib,--disable-taglib,taglib"
-PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2,--disable-gst_v4l2"
+PACKAGECONFIG[v4l2]       = "--enable-gst_v4l2 --enable-v4l2-probe,--disable-gst_v4l2"
 PACKAGECONFIG[vpx]        = "--enable-vpx,--disable-vpx,libvpx"
 PACKAGECONFIG[wavpack]    = "--enable-wavpack,--disable-wavpack,wavpack"
 PACKAGECONFIG[x11]        = "--enable-x,--disable-x,${X11DEPENDS}"
-- 
2.7.0


