Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E5C5C8303D
	for <webhook@archiver.kernel.org>; Fri,  4 Jul 2025 15:10:48 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web11.14485.1751641841696869228
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jul 2025 08:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZWgUpHb2;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-749248d06faso890022b3a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 08:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751641841; x=1752246641; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=t9LQYCPKWWURL6Vgv95UUJrhenxD/j8EEt9szI+0toc=;
        b=ZWgUpHb2qBd8DIk2Ap7vTB2rGyXCIJl73MYtLJ6uaxmf5WMJHsHTH8zjeKiOM3V441
         V1HOtehcKmYqbN2XoYdA7GWNYRXSxtCjuYBFgPGjI4EOq+y0F+GzqM57ms4J3c6+kLZK
         hFNflDb86wmkIpnchOnpfc8Dibpi9s9Sqx5QD571nPSBSdK6x06VVNTK1YaJ6ENwIaDk
         tcLPhaA9ZUgk4sniPkccTYAW+QrqIeeEY0dMd1HOz3PUJqSYXtLH01GpiLiTSq8TQM+Z
         93i6jwN4kPjQ7jzxf4cUMkTBlsegAkPGfolRSkCVTNc3cG/c9FaVPPyF0FBfASYPZ245
         Sojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751641841; x=1752246641;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t9LQYCPKWWURL6Vgv95UUJrhenxD/j8EEt9szI+0toc=;
        b=mo5XUFxzvY78l8hmJBIjZ+Cen+4dj2O9taR5OlnYzfSi17tgAI4SWIjwETdiVowDjp
         pzIQ/nKhlCMZJU8kOn4lDlc0B+bNNsa5d8aeAhwqRpbF5TPYb5tNn9qIGh1ctRf18F1K
         Lb+9mGCdbOLNN3hfSgKRArBWV2vM0iZJDm5waX0fjb4brtJnzgHt0mmTMih2uX2u97+u
         KGYxXTCjib6CV8fnHK5kZ+mKCWGZEd4aFrq8aoJpECworozDvmvRtl7BYmQR70si6ho0
         5+Gltha3DziNAelWYf8WwjcUeR1siTGcUWtwc7PArYsTASQpBp1+5PYLNMIZPzrTnWIo
         mV1Q==
X-Gm-Message-State: AOJu0Yw6BExjrB3+ckBHagrBQSbIJ+TItebcSqmBxxZjcwgy92k0mp8e
	87PjxFU3P1DTpj3eukSQG7aWhsw1mBJ5QQW3cfODWJF78YTuqvdePebg4UwfQb/dooPs2PeqXNF
	tw7io
X-Gm-Gg: ASbGncsaX/5dY0nSkSns+9gqWfxs6ZutTwEgf3912jgJtwYAidzMR3T+od1Re3jxmkS
	RiPhXCL+sGJT1xHIBJfibcgKckyqDlyx6DiX1K55bCaMoH+oJOXAJTVUHOF9EIedWvw707fuonz
	CXii5X1Yq0I7hj5Y8Rk3NGYfOU4CNgutMjaVp8f302CdjCd0Ys08Cny29cc94wkwLJgaVNcrIRU
	kSH1dw4HghMg0Ial0BRMaVrIy9i3q+GhuogSyHjWpmO2IZ5PkscbOJLm+j7NSAhUoTak9KVi6bi
	azGR4J7qK8aryLlNElUrKbP/p0S/sZDqZ2mPNDmrpzr3fxlGdhNCPg==
X-Google-Smtp-Source: AGHT+IFtMM0L0DKAL6Qzwlh2wFpFPUr9K5m7M/3LPFEEN7Z2ofdghneJ6IidE1YjMk79Ct8qje8gSw==
X-Received: by 2002:a05:6a00:3c94:b0:748:ff39:a0ed with SMTP id d2e1a72fcca58-74ce6a25428mr4597742b3a.20.1751641840642;
        Fri, 04 Jul 2025 08:10:40 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:d985:cb7d:ae84:68cc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce417e869sm2159592b3a.82.2025.07.04.08.10.40
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:10:40 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Fri,  4 Jul 2025 08:10:23 -0700
Message-ID: <cover.1751641631.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Jul 2025 15:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219926

Please review this set of changes for scarthgap and have comments back by
end of day Tuesday, July 8

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1948

The following changes since commit 175cd54fd57266d7dea07121861a4f15be00a882:

  tcf-agent: correct the SRC_URI (2025-07-03 09:01:28 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Archana Polampalli (6):
  xwayland: fix CVE-2025-49175
  xwayland: fix CVE-2025-49176
  xwayland: fix CVE-2025-49177
  xwayland: fix CVE-2025-49178
  xwayland: fix CVE-2025-49179
  xwayland: fix CVE-2025-49180

Divya Chellam (5):
  libarchive: fix CVE-2025-5914
  libarchive: fix CVE-2025-5915
  libarchive: fix CVE-2025-5916
  libarchive: fix CVE-2025-5917
  libarchive: fix CVE-2025-5918

 .../libarchive/libarchive/CVE-2025-5914.patch |  48 +++
 .../libarchive/libarchive/CVE-2025-5915.patch | 217 ++++++++++++
 .../libarchive/libarchive/CVE-2025-5916.patch | 116 +++++++
 .../libarchive/libarchive/CVE-2025-5917.patch |  54 +++
 .../libarchive/CVE-2025-5918-0001.patch       | 326 ++++++++++++++++++
 .../libarchive/CVE-2025-5918-0002.patch       | 222 ++++++++++++
 .../libarchive/libarchive_3.7.9.bb            |   6 +
 .../xwayland/xwayland/CVE-2025-49175.patch    |  92 +++++
 .../xwayland/CVE-2025-49176-0001.patch        |  93 +++++
 .../xwayland/CVE-2025-49176-0002.patch        |  38 ++
 .../xwayland/xwayland/CVE-2025-49177.patch    |  55 +++
 .../xwayland/xwayland/CVE-2025-49178.patch    |  50 +++
 .../xwayland/xwayland/CVE-2025-49179.patch    |  69 ++++
 .../xwayland/xwayland/CVE-2025-49180.patch    |  45 +++
 .../xwayland/xwayland_23.2.5.bb               |   7 +
 15 files changed, 1438 insertions(+)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5914.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5915.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5916.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5917.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0001.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-5918-0002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49175.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0001.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49176-0002.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49177.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49178.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49179.patch
 create mode 100644 meta/recipes-graphics/xwayland/xwayland/CVE-2025-49180.patch

-- 
2.43.0


