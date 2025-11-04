Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59D10CCFA0C
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 14:48:13 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19534.1762267683557000909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Nov 2025 06:48:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=h4FLvhti;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b98e6ff9071so1871591a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 06:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1762267683; x=1762872483; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=B6azbl7YEKhE+wzIxC/HiafRa5BuvYdWG1adHAXsq8M=;
        b=h4FLvhtiDtHILIeqFWjKOiy47jDoBYukceinFGabxiOFhrvhG376iFCVcwQ8XShhVC
         1QknQ9lbML1ml/IssVKxN6AIPUoME6XyhB2L+B0H9XZ/P2c9gx2OeEAZfDwMhZkkNH2c
         BnccNkXQmboSlo9sUTvAQhx6/UW393XWkD+dBXiViHK19Zvz3t2tj2FKrV7I4j+9gRuF
         gst7tTzFyHeSm2Z8H6/ddKxsyOhd2eNJ2CS+lmIY22yP1cL6ex9CufPddR9h7RLDg7n6
         NZyw1BoKmF2WhGGmRS/QqQ3WmNLGdS/U+HNdgImp+SIA9AS3roMp6Qe6WubGqHZOh7ww
         v+Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762267683; x=1762872483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B6azbl7YEKhE+wzIxC/HiafRa5BuvYdWG1adHAXsq8M=;
        b=CIT93Q91Ge+AdJrhgM1ZdTJ3t3Z0I1opqQJYch1VRr2audOYVDgs+sGcA8bajvpj59
         ahr3FirTPpULR7b7W3sDtfpCPO2jAw7mo1bqEzz6scmC7D3bk8d2lR5Rk0pp4m5QlFVW
         hEOGFE/+Hn61dlOgfO2hiOKHpxVENnRy+XJZVTcUfSfdU1H4TmbIeOlsRA/F+9DOVtSW
         PnXZFE8jW251dD+jjame+ZFiIRlDmdAthw9lTIDwTELvYdZK2FxwyDaritcpM3r+Ltkj
         lm9n5XzuyGFas0NVIq7pYnCabpoqu/bPY/dvJiXIYOjxOzWdS+ia4+4i3KrrnRg+0ZWh
         MWvw==
X-Gm-Message-State: AOJu0Yzb1SJqAReyBxlMEnMijWteyIJWkMYSSpqc6bpl3M0dxT4LV7/0
	ZMreB2PvLwyymfUsl7MFf5Qu2hwzlimZI/tQYOYwHGS+hd8qdP3dp6IPcfcVty6sWNGf6OklQgB
	sE+X2RRc=
X-Gm-Gg: ASbGnctFCFszj3Z4Re/nLy/IC2qfLjd9SGyyRB/qRVXx0nStu5ln/mg/rSs+SobT9If
	GAdGIwWfOX+GTuLI6APu72XAtsujkaa3Vo1w3hTJC6HQMwDLbulzYkcFkh/PoTTHOWrMk7mzdbs
	lLL7b9dcOpfVltfGzlf08I9RvX+/3ER37QC81t5svjJ73bq4IGKVYoVBrH0ZfbLGSUv1OaXbU+x
	HAZqutjavNKw3/dnkRGwX404D3XzUL3Gkn2QFzqyt0TfLqSS8ZDTQRMXWlKnClHfyZ49ZHmiiYn
	5RhfN+EGDfdcNzLjNIKvWGtriyNiISDV1naZecHRs5nAMPTfJXhDXZIFkdd9979ndfYzgWvdryV
	HSGXHy3bB/nQ4xOK9ckD5gpUgDJZ1GOGwZpcYVvLpH3DgjMYMfCwPYqmsLrAKykO6I6s=
X-Google-Smtp-Source: AGHT+IGMtH2Lkqa+dAvnJUS1wf5xpQPXr618THYYEQVrdR7u9RqhP+5sx4YC8YnEJHYra0e5ao6ing==
X-Received: by 2002:a05:6a20:3d8c:b0:2ab:a456:9b09 with SMTP id adf61e73a8af0-34e29745209mr5260148637.15.1762267682703;
        Tue, 04 Nov 2025 06:48:02 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:1f4f:a6d3:d9bf:780d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3417d40da83sm1341481a91.14.2025.11.04.06.48.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 06:48:02 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 0/7] Patch review
Date: Tue,  4 Nov 2025 06:47:51 -0800
Message-ID: <cover.1762267481.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Nov 2025 14:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225726

Please review this set of changes for scarthgap and have comments back by
end of day Thursday, November 6

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2676

The following changes since commit 4cb834388759540ea5bf7265389b9f1b2e15333a:

  bind: upgrade 9.18.33 -> 9.18.41 (2025-10-29 07:13:09 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/scarthgap-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/scarthgap-nut

Bastian Krause (1):
  util-linux: fix pointer usage in hwclock param handling

Michael Haener (1):
  Remove empty file

Peter Marko (4):
  wpa-supplicant: patch CVE-2025-24912
  binutils: patch CVE-2025-11414
  binutils: patch CVE-2025-11412
  binutils: patch CVE-2025-11413

Yannic Moog (1):
  perf: add arm64 source files for unistd_64.h

 .../wpa-supplicant/CVE-2025-24912-01.patch    | 79 +++++++++++++++++
 .../wpa-supplicant/CVE-2025-24912-02.patch    | 70 ++++++++++++++++
 .../wpa-supplicant/wpa-supplicant_2.10.bb     |  2 +
 meta/recipes-core/util-linux/util-linux.inc   |  1 +
 ...-utils-hwclock-rtc-fix-pointer-usage.patch | 27 ++++++
 .../binutils/binutils-2.42.inc                |  3 +
 .../binutils/binutils/CVE-2025-11412.patch    | 35 ++++++++
 .../binutils/binutils/CVE-2025-11413.patch    | 38 +++++++++
 .../binutils/binutils/CVE-2025-11414.patch    | 84 +++++++++++++++++++
 meta/recipes-kernel/perf/perf.bb              |  3 +-
 test                                          |  0
 11 files changed, 341 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-01.patch
 create mode 100644 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant/CVE-2025-24912-02.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/sys-utils-hwclock-rtc-fix-pointer-usage.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11412.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11413.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2025-11414.patch
 delete mode 100644 test

-- 
2.43.0


