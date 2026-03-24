Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998FEFEC0EB
	for <webhook@archiver.kernel.org>; Tue, 24 Mar 2026 18:00:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3789.1774375240674687249
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 11:00:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=c68/jkPE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so45317935e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 11:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1774375239; x=1774980039; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6I9gTBirD0fW2A6WnhA3FDx2aOITtmuuR6J0yMsizu0=;
        b=c68/jkPEWoOeJQ7XyAL7z93jPAEyKU6Xd6k5+d+gC6BNB0ar7XvZRSrbWaqzZDp3TI
         ExSgYFeylkBFdbMAncaIluctZfaR42PUESOAfjCruuJMBkcRqhZgrtAhnZTrTt3YYZbU
         usPrT1zdLJGv/P3p7iMAi6tDoG7dbMJDTwFvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774375239; x=1774980039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6I9gTBirD0fW2A6WnhA3FDx2aOITtmuuR6J0yMsizu0=;
        b=Ly5ecSM5wH7ifpqKY77QhVATEcaoJPHyjv/IdHokClpXraK0rTZL9IHRZc46GGnsFk
         P+ue741Nwc8FPsjysX4hlhahB3PFhC7GBF/KwVnOybrnluJNQfGYRGJSN/SRmnZa2sL5
         S2NfnSbncic9uEMDnmzDONwxq3XCJh06GaXUl2sxVoT0l5j7/0B3EPBOPu1qqJq0vcjz
         l1hX52KC48WO+NKhLHf/ouzym3g7I8KRQdR/oCbPRwhXe9Rdzc5GosM5ovM/thkkvkia
         6QEqCVqJGFarKwUY+QleaEf85XE+lTuglYJgnutxsSg4dMe5n28GSd6uhOO/zDc+zvI7
         0QvQ==
X-Gm-Message-State: AOJu0YzYoWPtOZS28Wm2in7EppUAuYpN/S6pJOTQKyv5e3iufp32a31V
	XoXT0F4pGN89jvVR5O3lLAgSH6KcgfBBU9aEFQE/3K29xKuUJOAcVa4rDCsk50jmCSz/2FMrskS
	QkbKA
X-Gm-Gg: ATEYQzxSvy/JIVbF5GV/XRdpDY3w3/p7OsGE1N4ADzaKdHrwi5lM+n/jzmRRhEpfvxG
	S757PHrJckyp5RpY7omAqlhwqXPe/8WtkVf2QYJhSQI3L2mQwJhyHjDb1ZbIvYr91SnzfekaLCw
	kAbQJCj2kb4T+KN9UlFgWLz3Ay3EXM2IZqIZzzIygxi76f6oOf97FXZY0K9JUe4sj0+I6VChvXE
	e8K7GFuGkEhcl0zj2ExPl2cAWCmxFad4nU2lJLMXgsDRjx2RY+QebRftCb/DzBRG+PuhwTXluiv
	QP8qy4fSVg1KhbYjlFXVZ8v52VMm/ll1D5v8zjVYIXKtLCJ+OAE55e1FxCBCLJ8emVeoCE+C6iy
	TYCvdL9bKGYHfYrqxuxKVPdbOKyYl6D5RUmLjZEELl2seXUdz2O4GRwQPI/U7JocakY4VmovRlc
	6zH2FSD+DqtiBjGB6T3yzdU7yzj+se8byAzcnmKEyzDMibLwhQxlLv
X-Received: by 2002:a05:600c:1f12:b0:486:f9aa:2b57 with SMTP id 5b1f17b1804b1-48716046df7mr10096345e9.16.1774375238343;
        Tue, 24 Mar 2026 11:00:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:a42d:49b6:a690:7df7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711117377sm23629385e9.36.2026.03.24.11.00.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 11:00:36 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] conf/templates/default/local.conf.sample: Document yocto project sstate mirrors
Date: Tue, 24 Mar 2026 18:00:34 +0000
Message-ID: <20260324180034.3456047-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Mar 2026 18:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233821

Add information about using the Yocto Project sstate mirrors to the local.conf
template, enabling using the config fragment.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/conf/templates/default/local.conf.sample | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/conf/templates/default/local.conf.sample b/meta/conf/templates/default/local.conf.sample
index fb6ed2c3bf2..6947e8e46da 100644
--- a/meta/conf/templates/default/local.conf.sample
+++ b/meta/conf/templates/default/local.conf.sample
@@ -204,6 +204,16 @@ BB_DISKMON_DIRS ??= "\
 #file://.* https://someserver.tld/share/sstate/PATH;downloadfilename=PATH \
 #file://.* file:///some/local/dir/sstate/PATH"
 
+#
+# Yocto Project SState Mirror
+#
+# The Yocto Project has prebuilt artefacts available for its releases, you can enable
+# by enabling the following config fragment. This will mean the build uses the network to 
+# check for artefacts at the start of builds, which does slow it down initially but it 
+# will then speed up the builds by not having to build things if they are present in the 
+# cache. It assumes you can download something faster than you can build it which will 
+# depend on your network.
+# OE_FRAGMENTS += "core/yocto/sstate-mirror-cdn"
 
 #
 # Qemu configuration

