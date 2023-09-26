Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D227BE7E638
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:12:23 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.20196.1695737534440931704
 for <openembedded-core@lists.openembedded.org>;
 Tue, 26 Sep 2023 07:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=e5KyJVLn;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-692c70bc440so4132612b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695737533; x=1696342333; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=y+A1EU4Lf3wU7zpFta1rfnafAsHMaIJn4UKN3ud9iRA=;
        b=e5KyJVLnUQInkmRLEN0YIoqYhj/wVI3/o2ZrkM13yEYuScUNwtAKcyE84vRagFOgcB
         zZPvICG3NTq26o4Gegl3wkS1gd3Ct/pPBvCvisgqQVxxmnN+anBP2k/Xy+mz/qkHJiqM
         TWiqQHIMql9zD5M3JJ56KCXARZtRRVPyo3QT51FsSJtSvgs6PQTMFJXbRA6KmMDMSSMb
         ug36vO9Z0jIh2oYFKqOxK0XUqyfVKw31efYl6SWGlDLb5F0zAnLTakeB8jDbj5/Ghfgr
         7qMwiO0S9l6fNmApQAgX0RGvvWu5BhSVcLRHyr5kcF7eoAxX4FqNwpl5dgm+CbWPp2Lp
         AJSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695737533; x=1696342333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y+A1EU4Lf3wU7zpFta1rfnafAsHMaIJn4UKN3ud9iRA=;
        b=MyPr9wjJkkHh+9heSQNOR41+iCYI7Q2Q9TVcye+SldnKUjm5tr2qdamhQvZw2rP5Dx
         wgH+IdUyrr7u11HAByl265TKa0sn9IRDNLXlwP5TBkPQZjL7syUzCh3EuZU9v90DBnSB
         GlastjZw8hn3dTt7gT03pgwCfcxF4WkKqn2aVdE06O4APFIQEAtOJ1qh2TQ4dKTTSmGk
         eUPecjEOC0mw78/N7wqiDtcLegzEoC4yivasre67y25owsKU/4l0l5BCEw7lcqNG3VYH
         ud3lJVD7d4rQWlBKeXAPGWlogTGAq+sCxDOLXDWasIdhSYbnd6FFCeLA/StF/R5nFND0
         UaeA==
X-Gm-Message-State: AOJu0YwsBDuomAvLug8I4WQ/cf42YzYUitpKKYR9mYQGYkJgUSm0tTqs
	fpYDflIAd2kLuavmQmmY74armrSjanuwwesO+vs=
X-Google-Smtp-Source: AGHT+IE3k8LA4WptzUIJuYQijpmjw/k8Z7fbDJ/QufB/WOPlbqWvtZpxFzivixB668MbDVklNwvZKw==
X-Received: by 2002:aa7:8882:0:b0:68e:43ed:d30b with SMTP id z2-20020aa78882000000b0068e43edd30bmr9485942pfe.21.1695737533144;
        Tue, 26 Sep 2023 07:12:13 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm1348861pgc.80.2023.09.26.07.12.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 07:12:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Tue, 26 Sep 2023 04:12:01 -1000
Message-Id: <cover.1695737244.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Sep 2023 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188246

Please review this set of changes for dunfell and have comments back by
end of day Thursday, September 28

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5947

The following changes since commit 8b91c463fb3546836789e1890b3c68acf69c162a:

  build-appliance-image: Update to dunfell head revision (2023-09-16 11:16:49 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Archana Polampalli (1):
  vim: upgrade 9.0.1592 -> 9.0.1664

Michael Opdenacker (1):
  flac: fix CVE-2020-22219

Richard Purdie (1):
  vim: Upgrade 9.0.1664 -> 9.0.1894

Ross Burton (1):
  gcc: Fix -fstack-protector issue on aarch64

Siddharth Doshi (2):
  gdb: Fix CVE-2023-39128
  libxml2: Fix CVE-2023-39615

Vijay Anusuri (1):
  go: Backport fix for CVE-2022-41725 and CVE-2023-24536

 .../libxml/libxml2/CVE-2023-39615-0001.patch  |   36 +
 .../libxml/libxml2/CVE-2023-39615-0002.patch  |   71 +
 .../libxml/libxml2/CVE-2023-39615-pre.patch   |   44 +
 meta/recipes-core/libxml/libxml2_2.9.10.bb    |    3 +
 meta/recipes-devtools/gcc/gcc-9.5.inc         |    1 +
 .../gcc/gcc-9.5/CVE-2023-4039.patch           | 1506 +++++++++++++++++
 meta/recipes-devtools/gdb/gdb-9.1.inc         |    1 +
 .../gdb/gdb/0012-CVE-2023-39128.patch         |   75 +
 meta/recipes-devtools/go/go-1.14.inc          |    7 +
 .../go/go-1.14/CVE-2022-41725-pre1.patch      |   85 +
 .../go/go-1.14/CVE-2022-41725-pre2.patch      |   97 ++
 .../go/go-1.14/CVE-2022-41725-pre3.patch      |   98 ++
 .../go/go-1.14/CVE-2022-41725.patch           |  660 ++++++++
 .../go/go-1.14/CVE-2023-24536_1.patch         |  134 ++
 .../go/go-1.14/CVE-2023-24536_2.patch         |  184 ++
 .../go/go-1.14/CVE-2023-24536_3.patch         |  349 ++++
 .../flac/files/CVE-2020-22219.patch           |  197 +++
 meta/recipes-multimedia/flac/flac_1.3.3.bb    |    1 +
 meta/recipes-support/vim/vim.inc              |    6 +-
 19 files changed, 3552 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0001.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-0002.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2023-39615-pre.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.5/CVE-2023-4039.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/0012-CVE-2023-39128.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725-pre3.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2022-41725.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_1.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_2.patch
 create mode 100644 meta/recipes-devtools/go/go-1.14/CVE-2023-24536_3.patch
 create mode 100644 meta/recipes-multimedia/flac/files/CVE-2020-22219.patch

-- 
2.34.1


