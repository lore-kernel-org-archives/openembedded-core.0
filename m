Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3054C83F03
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 03:12:20 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.15048.1751425937055787733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 20:12:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=dT5HlXnY;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso3774009b3a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1751425936; x=1752030736; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqU01+/RmW8eVmNMkALn22Mk0LYdLTS7N4SFLIDYvRE=;
        b=dT5HlXnYoaJuTyagT66CalSg2dgLsGEFlwl7jNxQNAKc+YwptVGvXeHsDgHeBvUl6d
         bAS7Y8YnxrgJt376CYtjg0EbYWMxdojN5RfGKJl+CZKYQ7MuPtL67VmPa7DWwJ3P+ype
         gc4XI2W/21FGVpTJomry+yVe9bM6DiWFbK7SfnwQ46Nb6hMmyhIB7BIJQIAiSn++m4vW
         qSIklOXH7WvIWDZsxiM95ozq6thDWJ+ygnxn0obBj13VEo4xmxSRaR3VVGor5/p15ruz
         Yzvp5rcHrGB7LcdTyi9M5ODJWBsAkeiYFBlPVhsLejjPtp4/iofOhDP116hIOwZ6VRmu
         oQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751425936; x=1752030736;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqU01+/RmW8eVmNMkALn22Mk0LYdLTS7N4SFLIDYvRE=;
        b=RCqGtlC3Hzq+tys2kr+BvipmdwjaFokN3xSp0OOXA9ujMZSAmc4VJRuepySM+ivgFk
         0Ybwg/6YSlDwrSSSYmC85BvUyspD/J/3wjJvmp/c62oA5ppy/hvpkt2JzJIj2Hr3FgW9
         ZQNq+6kfMW+Y8uL2vmC89oCLP5C8VoRRxBxZqfNGiT36cUU5n2+tY02E+AJmc7OTVnn5
         XEFCIpgc+4mhfQ7dCTWtao3FdIsOd82ZzyCIfCyq/ChMKCXzOJtw9BpLVYU/Bb5Ehtw7
         l8S9lESz3hARCS5/wqrH88msMyZt53Cbgo7m1xrKFPyL71pBctDK9JpYHRzWHG7vgKoN
         GDQg==
X-Gm-Message-State: AOJu0YyMJMDVG57KW+noczfbiXDkrGPthxTOUewlPCoq8iwTlejngN+l
	BykFwFBd2F4YpPCwpaR9z9hGIBTb/a8PCKtBXYyQ6p/A4Xg5Uk0Gok3WZgQi2Nh/TMM8xlU+AKy
	1+MK2
X-Gm-Gg: ASbGncvFvuXweDD1CcjuBd7I++mbaC7AYQ4UfF8eq+7eD2dHxKh0AxOl71LHVOP52dw
	gCQMIw8AhlXBXM6sVWa9YbecDcDYqQGq4+SZHVQ18WAAneuwvrjRb7w86teEOZCsyibd2XjzCLL
	AxVxmahVFFUGo21sFSNkMFc34IZyOpd7mnglwm8lS9ZdtDfI+dax3dOBNQQRzI/pG0DfWqhQDNc
	GMOKvSLWczK6c9Dju8XBql6CKYb/4Z0gsUN/fZxkBPE5tgPLKyXKDHESUlh0uK8ykr8wWgh7zhM
	X9JP0Ddw45a7MQM+rh4zxbH+ghi8iSUevjdPGxHH7zHFcWt8zSyXM53njwdsfv+Q
X-Google-Smtp-Source: AGHT+IHzbcxt6BG2ONySg2nkrBwFHSXoL7KRSP9s6yXm3Apy67ihHQkicU1AfF4s25XUcKhAxqJ0bQ==
X-Received: by 2002:a05:6a00:10c2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-74b50e5c6b6mr2179973b3a.4.1751425936109;
        Tue, 01 Jul 2025 20:12:16 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:34f8:320a:2e39:118e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af58069a9sm13633241b3a.174.2025.07.01.20.12.15
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 20:12:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 00/19] Patch review
Date: Tue,  1 Jul 2025 20:11:45 -0700
Message-ID: <cover.1751425749.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 03:12:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219754

Please review this set of changes for walnascar and have comments back by
end of day Thursday, July 4

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/1924

The following changes since commit f359677709aba80735a38578475a34e1b83d321c:

  tcf-agent: correct the SRC_URI (2025-06-30 09:11:01 -0700)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/walnascar-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/walnascar-nut

Bruce Ashfield (3):
  linux-yocto/6.12: revert riscv config sync
  linux-yocto/6.12: update to v6.12.31
  linux-yocto/6.12: libbpf: silence maybe-uninitialized warning from
    clang

Daniel Turull (3):
  linux/generate-cve-exclusions: use data from CVEProject
  linux/cve-exclusion: Execute the script after changing to the new data
    source
  cve-exclusions: correct cve status for 5 entries

Mathieu Dubois-Briand (2):
  linux/cve-exclusion: Update exclusions after kernel update
  linux/cve-exclusion: Update exclusions after kernel update

Niko Mauno (3):
  cve-exclusion_6.12.inc: Update using current cvelistV5
  linux: cve-exclusions: Fix false negatives
  linux: cve-exclusions: Amend terminology

Peter Marko (4):
  linux/cve-exclusion: update with latest cvelistV5
  linux/cve-exclusion: correct fixed-version calculation
  linux/cve-exclusion: update exclusions after script fixes
  linux/cve-exclusion: do not shift first_affected

Randy MacLeod (1):
  linux: add CVE_STATUS for a chrome* bug

Ross Burton (3):
  linux/generate-cve-exclusions: show the name and version of the data
    source
  linux-yocto: refresh CVE exclusions
  linux-yocto: refresh CVE exclusion list for 6.12.31

 meta/recipes-kernel/linux/cve-exclusion.inc   |   125 +
 .../linux/cve-exclusion_6.12.inc              | 13028 ++++++++++++----
 .../linux/generate-cve-exclusions.py          |   122 +-
 .../linux/linux-yocto-rt_6.12.bb              |     6 +-
 .../linux/linux-yocto-tiny_6.12.bb            |     6 +-
 meta/recipes-kernel/linux/linux-yocto_6.12.bb |    28 +-
 6 files changed, 9931 insertions(+), 3384 deletions(-)

-- 
2.43.0


