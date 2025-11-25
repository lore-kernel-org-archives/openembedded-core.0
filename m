Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2DDD0EE2B
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 20:55:09 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4178.1764104099633032429
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Nov 2025 12:54:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=pjljg4I9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7ad1cd0db3bso5170497b3a.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 12:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1764104099; x=1764708899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=0hyd+XT1TW2IU4mMLj760PJo7+hbcrSCWNPcDp+5sdc=;
        b=pjljg4I9KQrwq8h+7OJTNdidfQXTInHClxUyVA6eU86t6Y6gffZ7VPRLDfWwvcqckm
         ATZVV66/K8eAT4rAvsSmchspkziHQx+i/Ufk1EXFi0wrEs7C7/k4ag7hZJLSeJt6Xfcd
         UpwNwlZsNnRjdlDpvW9tfSDQeXGXG2LP4ByJez4gfZYE8zAowa+HyxIV9PRBDKA8SAn0
         FBBUJ84RVzq8blUh9KdHFoiPiWdyWFfzE8zxD6vjnhvL3qruHhUh6VRU5wapJ9LwjOiN
         t6kG9GtpLgyiTVM32YBS4cYPyhugjkbM+lsSB6P6lBrpudHVr9Appm3zOI+wlaSTU6IR
         JLYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764104099; x=1764708899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hyd+XT1TW2IU4mMLj760PJo7+hbcrSCWNPcDp+5sdc=;
        b=xO1F5/vtjHIM99GftNrWqZEM7XG7SjwLzsgXsQ8Ou6Cf9qRpKgNUXjS+k1dHmIMyve
         YVyN4unSAfFrvmQqzqXqMh77g3vhINuoAjCnla2SBijHMuXXoLHEjGMMUKIjwzQvnVZd
         8WVGO8/KdkpDq90Q99VPrUmKT8Xc64udV4lx7OUNpIP3Idu3qnYp3AupVnpKQvZMatIM
         +g/+tUDF66F5xQl6P6vi5o2RtaqFf7DIeRhBEuVA8CBzkAM2ZpLqFCs7pyrnWrz1pQt3
         Y2OQBruodAunb6w2UGimA3cgd2Mv7J5Ywn5qKyOmbHcojAXQYECQpF7Jpe8stvAUb6+m
         dedw==
X-Gm-Message-State: AOJu0YxA5ySccIMthz4wVYcPniCiluX0AYH3kZfSG4TsEMzwWE94UBWj
	4N7xOim+BDQxYqfShSSrQ4ZMbc9/FZvnw6bb5Ee3V7YVmjScZcO1KA2uRqTiTMAO+HKy0O3LVF9
	VTwmQ
X-Gm-Gg: ASbGncsyqK9AKlOwxf1DNI/F9iOzfLkoCIhTg52B4SrKixJdq1Htd70deHT5bKZ7xst
	QXxZGxgcl0kVDAvgeHKlUMHekwsg1c7Lb4B9jxKUEwNlQVfvIh6rTPWMTtmQ1ORMPT1bUQAiQO2
	iLk/1ErzGCQBZUt6YvONB9Ex5fe3ZQbfqXzzg9sOIUVScKYifXAtw7vFD/P/ZYnpdHY81YPRkZr
	PYJIDDyOBKSi7XPTNGM8I8U+LQTbyTuycHnRIeU9NiJqllXsBqS8XUMPXOhCWbtwHeMqGegeHnm
	mkfwxc+DP6PZiVgZHIpO6vtcLa2k/UMv+CkjxS56esrGNeCjc9vgsc6IS6leD5uURjVNzBujKIf
	ufWhGfiQMNev19y2Zkiy/U78kF0AAC3tE0qa3Re65TqmiJko4o3ZgHFQ+XG2swIi7zFZz5dClbb
	K92YG/xKAg7TCn
X-Google-Smtp-Source: AGHT+IFbGcA4lo38VVFoJ75dDo3LyhF8CLBPpVgQ3LDy9JPKdbWqUXV3nhLrCRHkIu6xE6n0YEQltA==
X-Received: by 2002:a05:6a20:3d8a:b0:342:d58b:561c with SMTP id adf61e73a8af0-3637db55559mr4409364637.27.1764104098736;
        Tue, 25 Nov 2025 12:54:58 -0800 (PST)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3476a5a3099sm322602a91.11.2025.11.25.12.54.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:54:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 0/9] Patch review
Date: Tue, 25 Nov 2025 12:54:43 -0800
Message-ID: <cover.1764103986.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Nov 2025 20:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226775

Please review this set of changes for kirkstone and have comments back by
end of day Thursday, November 27

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/2776

The following changes since commit ff72b41a3f0bf1820405b8782f0d125cd10e3406:

  oe-build-perf-report: relax metadata matching rules (2025-11-19 08:28:19 -0800)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Divya Chellam (3):
  ruby: fix CVE-2024-35176
  ruby: fix CVE-2024-39908
  ruby: fix CVE-2024-41123

Gyorgy Sarvari (1):
  flac: patch seeking bug

Peter Marko (3):
  libarchive: patch 3.8.3 security issue 1
  libarchive: patch 3.8.3 security issue 2
  libarchive: patch CVE-2025-60753

Praveen Kumar (1):
  python3: fix CVE-2025-6075

Vijay Anusuri (1):
  python3-idna: Fix CVE-2024-3651

 .../python/python3-idna/CVE-2024-3651.patch   | 2484 +++++++++++++++++
 .../python/python3-idna_3.3.bb                |    2 +
 .../python/python3/CVE-2025-6075.patch        |  364 +++
 .../python/python3_3.10.19.bb                 |    1 +
 .../ruby/ruby/CVE-2024-35176.patch            |  112 +
 .../ruby/ruby/CVE-2024-39908-0001.patch       |   46 +
 .../ruby/ruby/CVE-2024-39908-0002.patch       |  130 +
 .../ruby/ruby/CVE-2024-39908-0003.patch       |   46 +
 .../ruby/ruby/CVE-2024-39908-0004.patch       |   76 +
 .../ruby/ruby/CVE-2024-39908-0005.patch       |   87 +
 .../ruby/ruby/CVE-2024-39908-0006.patch       |   44 +
 .../ruby/ruby/CVE-2024-39908-0007.patch       |   44 +
 .../ruby/ruby/CVE-2024-39908-0008.patch       |   44 +
 .../ruby/ruby/CVE-2024-39908-0009.patch       |   36 +
 .../ruby/ruby/CVE-2024-39908-0010.patch       |   53 +
 .../ruby/ruby/CVE-2024-39908-0011.patch       |   35 +
 .../ruby/ruby/CVE-2024-39908-0012.patch       |   36 +
 .../ruby/ruby/CVE-2024-41123-0001.patch       |   44 +
 .../ruby/ruby/CVE-2024-41123-0002.patch       |   37 +
 .../ruby/ruby/CVE-2024-41123-0003.patch       |   55 +
 .../ruby/ruby/CVE-2024-41123-0004.patch       |  163 ++
 .../ruby/ruby/CVE-2024-41123-0005.patch       |  111 +
 meta/recipes-devtools/ruby/ruby_3.1.3.bb      |   18 +
 ...ax-path-length-metadata-writing-2243.patch |   30 +
 ...request-2696-from-al3xtjames-mkstemp.patch |   28 +
 ...st-2749-from-KlaraSystems-des-tempdi.patch |  183 ++
 ...st-2753-from-KlaraSystems-des-temp-f.patch |  190 ++
 ...-request-2768-from-Commandoss-master.patch |   28 +
 .../libarchive/CVE-2025-60753.patch           |   76 +
 .../libarchive/libarchive_3.6.2.bb            |    6 +
 .../flac/files/0001-Fix-seeking-bug.patch     |   34 +
 meta/recipes-multimedia/flac/flac_1.3.4.bb    |    3 +-
 32 files changed, 4645 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python3-idna/CVE-2024-3651.patch
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2025-6075.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-35176.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0005.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0006.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0007.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0008.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0009.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0010.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0011.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-39908-0012.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0001.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0002.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0003.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0004.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2024-41123-0005.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Fix-max-path-length-metadata-writing-2243.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2696-from-al3xtjames-mkstemp.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2749-from-KlaraSystems-des-tempdi.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2753-from-KlaraSystems-des-temp-f.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/0001-Merge-pull-request-2768-from-Commandoss-master.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2025-60753.patch
 create mode 100644 meta/recipes-multimedia/flac/files/0001-Fix-seeking-bug.patch

-- 
2.43.0


