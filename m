Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D8B1125815
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 13:42:14 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21750.1773236531971310683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 06:42:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Jf5ap78U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4852b81c73aso40254015e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 06:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773236530; x=1773841330; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=8hTKwXJ5pi7vbkiMA14C3+eW0pmCEgmVhK6YPfLucoQ=;
        b=Jf5ap78URRryJUT6bGHC40EbEZN6OvQ1mFBQfDD8w8bTuANu2gSN7wRMzGLkuN70oh
         6Qb7QoUjMvrvZ8/YNstoFfSaTZOGiEYCkyZR70HvTqqFWurqU3pkeakKhJM75MHWAr6c
         eSf93E+du0Hn0gFF2jSGr3w3wXb9zVIgh5MVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773236530; x=1773841330;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8hTKwXJ5pi7vbkiMA14C3+eW0pmCEgmVhK6YPfLucoQ=;
        b=YNIKGo4opSmTdFFuGzekCvrFXOvVYL7U/Qxys8MLLYQVjRw5ti0pYbUjIMGRsc/MmC
         vd3IEatbM8s2PUpnQ6kqK4A4Dwlyd7rVBcYc+FlgSnhO7CvH/lbTGTVZ8vxIYRzYJPs7
         MBezWkB8lX2YcnRucMoTNLaofYEXCmGYEqr+BU5iQ81qByQurCYYOBnnznQXXGDh/47q
         URRd53a54yyZ7t4i6Z80mlSXqZNtMLL1ybIrSFIqNA05EsS/BQLSbRoixyu8K/bkXlU+
         puDs/bXB2TPhgkH2yl986TqXqo8oM294QcmLBcuLSGTh5inUse7xuT0SlI1dzKJ2OPvu
         fxpQ==
X-Gm-Message-State: AOJu0Yz93wuo9sn1DqdG9GewF1CZ4l8d1Lzch0rKc8r1ZoevcGY1CXpY
	ucdpznpw4jcpgUb2FeP6+9X8kKQm7Rz90V2+4U/6fWS3Ph4+Ri9zCu1sbo4DwkQJWgzuSd1yn3Q
	KfnlmSNU=
X-Gm-Gg: ATEYQzw0fExo72wetxtJGuuKHAQ2Xz55mC63klq2fOB1+gzM2c1rEc7s1t19CFht7KU
	UU6ky0hEQdrGgrksx8pwpwURKGOr5/JqONtKHD9gqFha6klnsO/bBrBRnCJ4AC34B+9qx6ZCSXj
	G5JXueo1FdMjBZp1H5JVZX7Rjtgm9TwiKIGKlVzob3/FArsKECnM3n3nK7d9mzijMCitkUHBEij
	mCLZ8Np4P/FjkACv5LeW/szt8XtGcBEQdc55N4EufGIASAxvtA8cujhKaDiYbtqt7sgZpW4gkXk
	2aCqR724necnxYvxrQMh03WxZpKgzx5jKeEIGm3LsZoklbhnCG6MgHLyil2/OIVtSYiN2zVtYB7
	STxt6hb8u9p4kcDSzElqLWaLdbb6ERjyRg1Ce9bBJljiYHG7FucVbHOK3eIogrbXXkSFTr0Bt/5
	JeGc2f6slFeJP85TPk6ybPAOy1c7T0xebT7Zsib7fPQOr9JInJsYI=
X-Received: by 2002:a05:600c:1c0f:b0:485:439b:683f with SMTP id 5b1f17b1804b1-4854b0fb25fmr50172795e9.20.1773236529960;
        Wed, 11 Mar 2026 06:42:09 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:7fc5:b1af:c486:ad0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b0dc8d7sm17579435e9.25.2026.03.11.06.42.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 06:42:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] bitbake.conf: Set PACKAGECONFIG vardepvalue
Date: Wed, 11 Mar 2026 13:42:08 +0000
Message-ID: <20260311134208.3459009-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 13:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232882

For PACKAGECONFIG settings in recipes, we care about the end value, we don't
really care how it is constructed. bbappends to recipes can add things to
the default PACKAGECONFIG settings, for example being dependent on a DISTRO_FEATURE
or other variable. If the computed value doesn't change, the task hashes can remain
constant, allowing for better sstate reuse.

To do this, set a vardepvalue of the variable value itself, ignoring how
the actual value is calculated.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/bitbake.conf | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index f21e8f8918b..5f632d9f8e7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -931,6 +931,10 @@ SHELL[unexport] = "1"
 # Used by canadian-cross to handle string conversions on TARGET_ARCH where needed
 TRANSLATED_TARGET_ARCH ??= "${@d.getVar('TARGET_ARCH').replace("_", "-")}"
 
+# We only care about the computed configuration, not how it is constructed which may
+# vary with bbappends
+PACKAGECONFIG[vardepvalue] = "${PACKAGECONFIG}"
+
 # Set a default umask to use for tasks for determinism
 BB_DEFAULT_UMASK ??= "022"
 # The umask to use for shared files (e.g. DL_DIR and SSTATE_DIR)

