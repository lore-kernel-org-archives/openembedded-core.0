Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89BD6C021A2
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 21:57:51 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.741.1739311063188446003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 13:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=fwyinCNw;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21f44e7eae4so103061555ad.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 13:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739311062; x=1739915862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=YtWvt1YQV8MU4/Yg2HXJ4HN9AqYCJqlvJXcb0ex1q/A=;
        b=fwyinCNwCA8fsuCrBNcQbjH9c4/qRfJp9/1I9yTvFpl0rmRh4GOV7QP5AHTVjZ6wo6
         77g6mn+yMeBBDc4gadXeJnGwr+gfdcfXKybiTDCDPRP2Nq2MtPPy6KazAyaB91+o1cPJ
         OQtI0maT4bP6cYIRxHCv9osInfI1AK6Ve/nYuuGWkpELTVci1jpnEbGFDMbhleH0Yqam
         /4szGpbZ2X36l+CxDeRKoDlUgXLdMbesJJO3cl4QWCAUnFJXU4QKt6gglp/xXpAa0btT
         Utc632Vzmiortr++qiF5AuyfbCZ0iIXipLTVgcNKOZWWZIoQD5epmZkk6PY1fp/TrFRQ
         Aulg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739311062; x=1739915862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YtWvt1YQV8MU4/Yg2HXJ4HN9AqYCJqlvJXcb0ex1q/A=;
        b=jtxFkUyD+Mq8cjH3ChtXylYgYKMlsBzoc4Kf7YaEezk6Ki9Ah7bEH04MNyjUfiNS3+
         U3b78byGo8DxHioeYF7jRiAPQIIhnmG/eeOaWuN34zrsI2ieGEYQjf3JGIf0qoO73w6X
         VsrsDAK4YQ1dZk2rD0V04Vo3UbAZKfWseMJYiIEnAlLkSnu7Swj9MAo5dE7nFNidMQem
         kSAF6cvkN3x4k5AGZX4xtIgy9R9mLokrgOQnzlgoyCuFL4ddaHma/V7xe0IRNZG12u9c
         98gLjiKJMIm+z8o+EmkgRQbOw+q4mAUOPVQmjIo2lqPM+UI6IhSUO447iEoI2n1OiDMx
         awPQ==
X-Gm-Message-State: AOJu0Yz2ngzwua7XG1dh6vPPm183dMg8jK9Gwrsu0ZPFc+taMRn+WzmS
	AhIBwwwWEsP9006mqfK3R1p20AdRmjbevkFXU4PNyFM+IXzL2J+2yoaJAP/E9phVmKU2uSXz2MB
	Y
X-Gm-Gg: ASbGnctxmns1Fypd30wKcbhI3z6tVNmJe0wV0Kw7VkFslcMfP4LNlL7Xsdgjx/B5WTR
	0foy89QvSFfE7M+8WtBURPau44cc/1Zbdkxtm37xti81t3QttORl/BHvU5nW0KFu0s62bLBjj/S
	GD4XosWyMbWjEj3i1/K0Uokz8gtJ4q4VP9Dd6YZVuqvc8nWKiIaGReqcgk7OMdLQHGEedB0PnHp
	UEa5sF3Ux6QKX6WMESaz3JPFpSZ9QPVQFzULGnUGNEiWG4IvHFvhKcxBam53E3XQ8lLrkDl6qWP
	WXmd
X-Google-Smtp-Source: AGHT+IFmE8wDDUGniS7PXwp/oVR15VP4DPPI7Pz7YNQnu1J+CCQWBVEDHE97teYwD8Gusio2Cu8w+Q==
X-Received: by 2002:a17:902:e802:b0:21a:8dec:e59f with SMTP id d9443c01a7336-220bbc64750mr11976095ad.39.1739311062256;
        Tue, 11 Feb 2025 13:57:42 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3650e6aasm100210495ad.12.2025.02.11.13.57.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 13:57:41 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 0/4] Patch review
Date: Tue, 11 Feb 2025 13:57:31 -0800
Message-ID: <cover.1739310940.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 21:57:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211189

Please review this set of changes for styhead and have comments back by
end of day Thursday, February 13

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/998

The following changes since commit e475321e933e9c58e88dd445328f9228c417b4ff:

  lrzsz: update SRC_URI to avoid redirect (2025-02-10 08:06:16 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/styhead-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/styhead-nut

Bruce Ashfield (1):
  linux-yocto/6.6: update to v6.6.75

Peter Marko (3):
  python3: upgrade 3.12.8 -> 3.12.9
  go: upgrade 1.22.11 -> 1.22.12
  cmake: apply parallel build settings to ptest tasks

 meta/classes-recipe/cmake.bbclass             |  2 +
 .../go/{go-1.22.11.inc => go-1.22.12.inc}     |  2 +-
 ...1.22.11.bb => go-binary-native_1.22.12.bb} |  6 +--
 ....22.11.bb => go-cross-canadian_1.22.12.bb} |  0
 ...o-cross_1.22.11.bb => go-cross_1.22.12.bb} |  0
 ...ssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} |  0
 ...ntime_1.22.11.bb => go-runtime_1.22.12.bb} |  0
 .../go/{go_1.22.11.bb => go_1.22.12.bb}       |  0
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...sts-due-to-load-variability-on-YP-AB.patch |  4 +-
 ...001-ctypes-correct-gcc-check-in-test.patch | 53 +++++++++++++++++++
 ...asename-to-replace-CC-for-checking-c.patch | 10 ++--
 ...t_readline-skip-limited-history-test.patch |  4 +-
 ...up.py-do-not-add-a-curses-include-pa.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.12.8.bb => python3_3.12.9.bb}  |  3 +-
 .../linux/linux-yocto-rt_6.6.bb               |  6 +--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 +--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++-----
 19 files changed, 93 insertions(+), 37 deletions(-)
 rename meta/recipes-devtools/go/{go-1.22.11.inc => go-1.22.12.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.22.11.bb => go-binary-native_1.22.12.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.22.11.bb => go-cross-canadian_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.22.11.bb => go-cross_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.22.11.bb => go-crosssdk_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.22.11.bb => go-runtime_1.22.12.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.22.11.bb => go_1.22.12.bb} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-ctypes-correct-gcc-check-in-test.patch
 rename meta/recipes-devtools/python/{python3_3.12.8.bb => python3_3.12.9.bb} (99%)

-- 
2.43.0


