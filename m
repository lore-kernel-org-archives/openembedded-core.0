Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B079E77347
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 22:05:59 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.30364.1696025154319138995
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 15:05:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20230601.gappssmtp.com header.s=20230601 header.b=erOS/HZO;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40535597f01so147980935e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 15:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1696025152; x=1696629952; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T8wcXUTpuCwpIQilQYEJZ0xc/RCvNcq2/zTF1/5YAtg=;
        b=erOS/HZOmpjmDQ913+EcH9dORMfsy4RZuFHFcQItw2GkBwst/k192dgvBN8u2Q8j7p
         mvjd1Y3eIy1aPcWC93FiKXI7sR9T/qbze8L9SK+SlQVKPwb3hvC7jvatxMLr7yaa50zx
         iAqbsJV84yEFEKKowFpD4R1Jb5SGpN/q/APo53g8JhDhyZmxPC5PB2Q+erLHdm2l+Gcj
         vmBPydeuLeBiFO77iLF45TFP/YC71O/Y01AEH1CjGeysJeLm20xNDcBdK2XDzULWay6J
         sMAyrnPrSSxGt/sbkUyCWW0EDYZuSF68h9aJqQEt15qgivc4FzgbqIRcBDtHcOa5IvA/
         wEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696025152; x=1696629952;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T8wcXUTpuCwpIQilQYEJZ0xc/RCvNcq2/zTF1/5YAtg=;
        b=kGrTtOO0bEPyJ1yDNfYJG3q4Vpm1MnmwjgkhZx4FwjvLOMRTCqH8ZZILr3czWHIQa2
         8RdnnFcZOSX7LV8azbhaXtpdn+r8j93lOxluk8HW/uGZdKd+1HLibVapHZEbQNPpXcfL
         zqu5LppuH+oVrI7PAwypnigUPtrlvD1WCgM0UBtkJJVkWlXA6zkLr+2n4un/pxeDEiBQ
         wEolDjRcGlLTQzQ+/mHIiL4cT9PvNyfyHW4200o/fqrUj0Z7sno9MD+aCzZDNpnQv1vd
         5TKadHLzu/j/uckGpDSrOiUBamKlHr4lheVIt5mpiHy9K2CAH/nErF/S9tdR4RUW9fOz
         Xpjg==
X-Gm-Message-State: AOJu0Yx/fFXReB29Yiyx9LeNs6ETckENKyMKgSkcGqd43EbRp3BqyQFd
	7O4LJFC0+n++91UxsqDcjvcQh2xYHN7qQkJcZXM=
X-Google-Smtp-Source: AGHT+IHm1E5vN231JkpynZxBqsLgXixbov+kJgiCbwzEHN1M/nyjxFIwVl4dSsD6FUNtu4/nb6livQ==
X-Received: by 2002:a05:600c:220b:b0:401:eb0:a974 with SMTP id z11-20020a05600c220b00b004010eb0a974mr5322158wml.3.1696025152012;
        Fri, 29 Sep 2023 15:05:52 -0700 (PDT)
Received: from P-ASN-ECS-830T8C3.numericable.fr ([89.159.1.53])
        by smtp.gmail.com with ESMTPSA id t15-20020a1c770f000000b00406408dc788sm2210046wmi.44.2023.09.29.15.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 15:05:51 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?J=C3=A9r=C3=A9my=20Rosen?= <jeremy.rosen@smile.fr>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 0/4] QA, ptest: Add unimplemented-ptest checks
Date: Sat, 30 Sep 2023 00:04:59 +0200
Message-Id: <20230929220503.3169745-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 22:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188448

To increase ptest coverage we can check if the sources of a recipe looks like
it contains unittest and warn the user that a test may be implemented there.

This series provide the check infrastructure as a package QA check and some checks for :
python pytest, perl Test::, meson, cmake, autotools-based tests... as well as
the naive check of "Is there a test/ directory in the sources?" which work
surprisingly well.

Jérémy Rosen (4):
  QA, ptest: Add unimplemented-ptest infrastructure
  QA, ptest: Detect python and perl based tests
  QA, ptest: Detect build-system test harnesses
  QA, ptest: Add a naive heuristic to detect test subdirectories

 meta/classes-global/insane.bbclass | 54 ++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

-- 
2.30.2


