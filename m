Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B990CAC5A7
	for <webhook@archiver.kernel.org>; Thu, 25 Sep 2025 13:41:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.11855.1758807661331099152
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Sep 2025 06:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=ZuQGAfok;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f198bd8eeso783460b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 06:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758807660; x=1759412460; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=kSXXop8rpXclhT/6T5Ql0bYggodwQYNcpCokDz/OXUg=;
        b=ZuQGAfoks7QnRoXAa7IFWKPDz6mHdwRFmOt3pJr5LPVuP3XLo39Qhoobbm42xKQBlB
         n+fK7vnxA3/1NWmN/wROgPsAf4l/fKSfbN6no5IFd5LN17hW4QqPQOnFHK4c4qldBEsf
         qHYvkWqSz2BMMcp7rQLInZ8Jg4n72oXc+6b44mxz280pbFlQwn813SRC0rDnrNrwKYOY
         pNb8FfhVsPh5KUuZZExrulB6ypn0rZf3oIvnVQWHnnfNsrmV3wP0CkxGomYqiPb3MrRk
         aKLeEVPTukzgMFwFIGcQF81Cr0Qo3sy9OXbt/vC3qsJwGfK6SLpG/PH69eebYUaisb4d
         a5cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758807660; x=1759412460;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kSXXop8rpXclhT/6T5Ql0bYggodwQYNcpCokDz/OXUg=;
        b=HZKlLSf3XDKnhCbGZNB8ORQK3MsyE4HCZo0InUQ2Jt3nJEceC/VOv6yK/hyuQhVByH
         hc1EB94A6b7Om3DODDzS1N8fl+JHAab7izUzZXbO/9WE+uT1lKh55dblhYaP4l8uMa55
         8N/n680Ido6NVdXgOQLYhDBChWak+7Nvkui9EgUiCtX8CUNfsKQjiUy4ArlNZ8WG5U9Q
         jIZk26JegaCSnoP7xUYixDSMxLpxGhtVuViI4xdROSlrpaVEYZwlFxsnT88s+3x0ATYs
         wXYf74ykFYFjXnVPyB6kK9k/y5oUHGbWMYrpKvsmjpmhG40IPPSq1Oz2OItB4wL6ZXx4
         u+8Q==
X-Gm-Message-State: AOJu0YwuKwUZL98MZkAnfotdThARY4EmaktrIMG73/mjHol55UQPTuro
	VIDrXFE6ZI8qYzNs7nqAFcKg28fOE+rVYi4KCHym/l3RFNwiYw0YeUdLlVgtIPsLanYTRN23xTx
	XGFhR
X-Gm-Gg: ASbGnctc5iYabLb2BK6AHHLi65I5cTiQIFib+se80xSS+aEju+yow7Q4zkPEH7pCZm9
	+yM1C3BwWjNq4R2NYuB8oZLA6YvRFUPhM1WjkgybLcgjsGk7P6IKhnCzOLniBaOlg8sagNVM2lr
	OouMAsOomJe6fOcQ8p7z7o4Nz8+V+R7iuAp8v361xfs1sCiAO62yaaU7BQYbL2dZcGFx5XCnd7o
	Lr3lCklLbJEmVTnTTcXThqE6eYk8y/Ja/F+rwn5fmhG8R7BNrWWuFA0ay7zHSFiMu6rOQ9woePF
	Gnfh7Op7q4c1FhsYx4D491ybbfqXVf0s1abh1Nu/gwgstQb02UqjHueC9232LyzGNJ71fzu3urM
	2pZtWMnDnyEbGlw==
X-Google-Smtp-Source: AGHT+IHG8Z9sGK0kXB4lxTj9EUFFfeYdPyjrCnIFaJUjy3XHoymf5hBVwIWcgNi+AgVu067s09IFLQ==
X-Received: by 2002:a05:6a20:7343:b0:262:4378:9ddb with SMTP id adf61e73a8af0-2e7ca214e3cmr4606826637.23.1758807660430;
        Thu, 25 Sep 2025 06:41:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:127b:348d:dc99:9937])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3346e9eba87sm2430014a91.0.2025.09.25.06.40.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 06:41:00 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 00/11] Patch review
Date: Thu, 25 Sep 2025 06:40:44 -0700
Message-ID: <cover.1758807463.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 Sep 2025 13:41:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224018

Please review this set of changes for scarthgap and have comments back by
end of day Monday, September 29

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2436

The following changes since commit 4cf131ebd157b79226533b5a5074691dd0e1a4ab:

  buildtools-tarball: fix unbound variable issues under 'set -u' (2025-09-17 09:32:52 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Adrian Freihofer (2):
  llvm: update from 18.1.6 to 18.1.8
  llvm: fix build with gcc-15

AshishKumar Mishra (2):
  systemd: backport fix for handle USE_NLS from master
  p11-kit: backport fix for handle USE_NLS from master

Chris Laplante (1):
  util-linux: use ${B} instead of ${WORKDIR}/build, to fix building
    under devtool

Martin Jansa (2):
  sanity.conf: Update minimum bitbake version to 2.8.1
  lib/oe/utils: use multiprocessing from bb

Nitin Wankhade (1):
  examples: genl: fix wrong attribute size

Philip Lorenz (1):
  shared-mime-info: Handle USE_NLS

Ross Burton (1):
  libxslt: apply patch for CVE-2025-7424

Yogita Urade (1):
  curl: fix CVE-2025-9086

 meta/conf/sanity.conf                         |   2 +-
 meta/lib/oe/utils.py                          |   3 +-
 meta/recipes-core/systemd/systemd_255.21.bb   |   1 +
 .../util-linux/util-linux_2.39.3.bb           |   2 +-
 ...36-Add-cstdint-to-SmallVector-101761.patch |  28 +++++
 ...cstdint-in-AMDGPUMCTargetDesc-101766.patch |  23 ++++
 ...-include-to-X86MCTargetDesc.h-123320.patch |  32 ++++++
 .../llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb}   |   5 +-
 ...amples-genl-fix-wrong-attribute-size.patch |  44 ++++++++
 meta/recipes-extended/libmnl/libmnl_1.0.5.bb  |   5 +-
 .../curl/curl/CVE-2025-9086.patch             |  55 ++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 .../gnome-libxslt-bug-139-apple-fix.diff      | 103 ++++++++++++++++++
 .../recipes-support/libxslt/libxslt_1.1.43.bb |   3 +-
 .../recipes-support/p11-kit/p11-kit_0.25.3.bb |   1 +
 .../shared-mime-info/shared-mime-info_2.4.bb  |   5 +-
 16 files changed, 306 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/llvm/llvm/0036-Add-cstdint-to-SmallVector-101761.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0037-Include-cstdint-in-AMDGPUMCTargetDesc-101766.patch
 create mode 100644 meta/recipes-devtools/llvm/llvm/0038-Add-missing-include-to-X86MCTargetDesc.h-123320.patch
 rename meta/recipes-devtools/llvm/{llvm_18.1.6.bb => llvm_18.1.8.bb} (94%)
 create mode 100644 meta/recipes-extended/libmnl/files/0001-examples-genl-fix-wrong-attribute-size.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-9086.patch
 create mode 100644 meta/recipes-support/libxslt/files/gnome-libxslt-bug-139-apple-fix.diff

-- 
2.43.0


