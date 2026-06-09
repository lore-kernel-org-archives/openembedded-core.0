Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDFACD8CAE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 07:46:12 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.74148.1780991167050018387
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 00:46:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Xa2v/1Ob;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490ac357c55so57113625e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 00:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780991165; x=1781595965; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=p44BRyUvFwg2K9EEDoMYMJsUt6BskATw9rwuUZ8l06o=;
        b=Xa2v/1ObEcLDVBJRv3OCkCVAHsW/qo1UzWvBoOpkzG+raMhxfEof6IieYift5zOiR3
         bIN7dCcKSrQvGRdtSznRN+inhMhhzEMxINg2nrzEqh9ETqoRkRqIa/6zms4F6sL4rpyv
         6TVXlfoXxzv99tnaplZg8pFmAZNyHY1RUg4fI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780991165; x=1781595965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p44BRyUvFwg2K9EEDoMYMJsUt6BskATw9rwuUZ8l06o=;
        b=AEwN0dbwwU85HMeG50YYlEWBim7DKoGFWsM6G766Sgv4XCVC0ZFU6xRhYVS9mS8RRy
         VT2E34HzY+N4gm2jHBeQ39ksFncJnJe1QT28o1BmL+HEx1+t9jq2YhG6rIQH2/sTizxn
         d9+hhMz8OQzhnTG3DU0V5Q1k85GPs3BiGlvr9H+Xv1vGuKysjRFE8Ztac+0VlEFfQgUV
         fu/lt6GrGHx/mJAsmjqtYbNFfFfkTMOZJ08SBSAYNVNwXjrHiVl0VZ8OOWPYHilr1Pur
         B2UR+0C3w0RiDoZK26FWBHWELfRt01AKjFbxiDO/VELgO9h686PeNKGHnqfWkZrcSJTJ
         gujQ==
X-Gm-Message-State: AOJu0Yy0Xzm/W7Vx7mibgLzSbYUUo/h7T9UFs+O+hKjj1bDiGxUh56rK
	8O2EBfrARF5OKJUc1kqKr0auRLQqYwB4kQn4S/BDs62FW0ugkQMkyNNJck3K3IP239RB2SwrFH7
	7QVFK
X-Gm-Gg: Acq92OGv+RaYcTSAPVTEKdjY4NHECKLOijiRHGzIvliPwT6gaJDkKkS+dmDhoEmtQIz
	ozcPHQn6Kv0uZ4Gv32osUHkMCi0r/BOXHZJjDTit34mI3Z/ZqXfO2D6XThnNm/nhStC1xNhzh7V
	biKbUdv3SYpechIVt58yXyKsM+CLxvLwmrHdBFGZf2ozuQqx+XkyDHVn/iy10kLNG+hQIwpyd6+
	B1WuPie1dl1Gp9yJ5jxMwT5wYvLH/TIuZ2rAzzLhYPU4OJlkYJwyzHNiUtjj4735/Y30swGvmQQ
	+dijLoBFNQ1/l2pd2FlKIbLiT+lYc9MxJ+KE1uTmfp9GoPtYztPuId90zlvQhpnmDCUCdDpfDEv
	lmpumwp1qr9avrfLyulqmIqd2LdAMPApIZyCEzeOgHh07UtnpIYeiDFsSq3/31E9h5CHE4lXfOD
	/B4Qmdh3KUKIjdROd8o/4RCFj8+iCPJmNfVgDED9AdiM/nGz8wgSXyToSPOAaVls4=
X-Received: by 2002:a05:600c:5248:b0:490:cb90:3e00 with SMTP id 5b1f17b1804b1-490cb903f1emr165503205e9.14.1780991165380;
        Tue, 09 Jun 2026 00:46:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1942:aa0f:4850:4ec1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490c2cbb4cbsm254006975e9.0.2026.06.09.00.46.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:46:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] oe/utils: Drop all_distro_features
Date: Tue,  9 Jun 2026 08:46:02 +0100
Message-ID: <20260609074603.1429006-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 07:46:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238271

It is just as easy to use bb.utils.contains("DISTRO_FEATURES", "x y", ...)
and this function is just a wrapper. It isn't used anywhere in core.

The contains function is better optimised in bitbake too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oe/utils.py | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 120b6443935..4e09a8b927f 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -170,26 +170,6 @@ def set_class_filter(var, features_var, filter_var, d):
             bb.warn("Unexpanded variable %s in %s is not recommended" % (issue, var))
     d.setVar(var, '${@oe.utils.class_filter_features("' + defaults + '", "' + features_var + '", "' + filter_var + '", d)}')
 
-def all_distro_features(d, features, truevalue="1", falsevalue=""):
-    """
-    Returns truevalue if *all* given features are set in DISTRO_FEATURES,
-    else falsevalue. The features can be given as single string or anything
-    that can be turned into a set.
-
-    This is a shorter, more flexible version of
-    bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d).
-
-    Without explicit true/false values it can be used directly where
-    Python expects a boolean:
-       if oe.utils.all_distro_features(d, "foo bar"):
-           bb.fatal("foo and bar are mutually exclusive DISTRO_FEATURES")
-
-    With just a truevalue, it can be used to include files that are meant to be
-    used only when requested via DISTRO_FEATURES:
-       require ${@ oe.utils.all_distro_features(d, "foo bar", "foo-and-bar.inc")
-    """
-    return bb.utils.contains("DISTRO_FEATURES", features, truevalue, falsevalue, d)
-
 def any_distro_features(d, features, truevalue="1", falsevalue=""):
     """
     Returns truevalue if at least *one* of the given features is set in DISTRO_FEATURES,

