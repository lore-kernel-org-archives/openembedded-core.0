Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.289.1616517487489398589
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 09:38:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@blade-group.com header.s=google header.b=B9AGMMij;
 spf=pass (domain: blade-group.com, ip: 209.85.221.48, mailfrom: yann.dirson@blade-group.com)
Received: by mail-wr1-f48.google.com with SMTP id c8so8540197wrq.11
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 09:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blade-group.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mCW4bILB+LperKwPIvwUOih8C9Ai89TRRyff3sQdkO4=;
        b=B9AGMMijNNaEG66kmYlWNYRSl3huK+SC5/GiT5IEhhdyhd/TciApDC12A4VUEntFA+
         u1LPTseqdVgw3zX3mmlu+V1vDQiLIHLgbvDojRjBEyvJB2RdNx0GqhW/ly7ppFkssqz2
         jipZqMwNySpKWEvou24sw9rRA724lif6etr7B0TtoTGE7d3P6COjgp13lEULN42qu7XW
         0wdxKyfkvk2Q8dWxONVEsNNZja8v7086mZ0SsyGZVa9ADTuPPtm7C/PqDDRWMo6AWuOu
         y+R1KtZ8ylKcFt01Vtvondg64lJRyO2A2IBDWb2kN1ET9pgybhoOgVCyD1MVF1pWLD3H
         zv4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mCW4bILB+LperKwPIvwUOih8C9Ai89TRRyff3sQdkO4=;
        b=bpqYCQHml7dv04Q8RbpHEptPQv5XmhBADNNY4Q8tSLtk0dOohe2XdW+NNyVuoqQFN/
         TvAC91RSPDoYrwFs8MVxz9XbZz8/uGck+WemajPb95H8c/bxlbtaowkH3VKPOH0eN29P
         f+I2gye7utPg2Q5D1PYm7l4l6G+dlENx3NjsNXPyLfVr6p9GNy1s9Ba0Pd/IJshqVKzs
         +kP0lKQykDH7R7HPtu2oKzPRcuFK2vrsVOUSgmCGcO8XMyKkKCeExUPz0fH4W8yjt2WR
         3Nbabp0frKnX4ve37y/TslvzgQx03vrANa+gCi6w3WirQBPEoZEZgR2cxUtQuV0xLfuh
         SF/w==
X-Gm-Message-State: AOAM532/+WJDV/XT5Hc99SuApXiVwCG1UFD9eaL4m5Y1XDt4qyqUGdLd
	n98RI4+EC9BxfBZsvf5inGI9hsWpZNHaPg==
X-Google-Smtp-Source: ABdhPJxMppYNWces93pW3eR0mDA8JW5CJB921kuENf3gjTlwMEDXLVchqLGIJnJ0Gea53dA5RwluOw==
X-Received: by 2002:a5d:6cab:: with SMTP id a11mr4933361wra.419.1616517485998;
        Tue, 23 Mar 2021 09:38:05 -0700 (PDT)
Return-Path: <yann.dirson@blade-group.com>
Received: from blanquette.lan ([88.120.44.86])
        by smtp.gmail.com with ESMTPSA id h20sm2987356wmm.19.2021.03.23.09.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 09:38:05 -0700 (PDT)
From: "Yann Dirson" <yann.dirson@blade-group.com>
X-Google-Original-From: yann@blade-group.com
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>
Subject: [PATCH] [RFC] ffmpeg: make LICENSE_FLAGS fine-grained
Date: Tue, 23 Mar 2021 17:37:42 +0100
Message-Id: <20210323163742.810094-1-yann@blade-group.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

The rationale here is that if the user can only whitelist "commercial"
to use any part of ffmpeg, even it the list of features is carefully
reviewed when switching the whitelisting on, there was nothing to
guard from inadvertently activating a new feature that would not have
been reviewed.

This patch adds one LICENSE_FLAGS value for each feature, except for
those that bring no codec, trying to be on the same level of legal
safety - but then I may miss something.

I tried to leave out of the safe NONCOMMERCIAL_PACKAGECONFIGS list
anything that brings a codec, notably libavcodec.  I also did not look
at non-default features yet.

There may still be a problem if any feature in ffmpeg gets activated
by default upstream and not registed as a PACKAGECONFIG feature.  At
least any of those that depend on another lib would not be enabled,
that could be seen as a sufficient safeguard.
---
 meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
index 08be38ca50..3a36c95151 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.3.2.bb
@@ -16,7 +16,17 @@ LICENSE_libavutil = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGP
 LICENSE_libpostproc = "GPLv2+"
 LICENSE_libswresample = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
 LICENSE_libswscale = "${@bb.utils.contains('PACKAGECONFIG', 'gpl', 'GPLv2+', 'LGPLv2.1+', d)}"
-LICENSE_FLAGS = "commercial"
+
+# PACKAGECONFIG features that do not pull codecs
+NONCOMMERCIAL_PACKAGECONFIGS = " \
+ alsa bzlib drm gpl lzma zlib xcb xv \
+ avdevice avfilter avformat swresample swscale postproc avresample \
+"
+# An ffmpeg feature not in NONCOMMERCIAL_PACKAGECONFIGS should be explicitly whitelisted.
+# See https://ffmpeg.org/legal.html
+LICENSE_FLAGS = "${@' '.join('commercial_' + cfg \
+                             for cfg in '${PACKAGECONFIG}'.split() \
+                             if cfg not in '${NONCOMMERCIAL_PACKAGECONFIGS}'.split())}"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.30.2

