Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8DE7C4332F
	for <webhook@archiver.kernel.org>; Sun, 29 Oct 2023 13:18:34 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.71959.1698585512982092626
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Oct 2023 06:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=2LgvlXAW;
 spf=softfail (domain: sakoman.com, ip: 209.85.222.177, mailfrom: steve@sakoman.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7789577b53fso256149385a.3
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 06:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1698585511; x=1699190311; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wx1a3bNMRi9UbTKrVEXZXwrdfwnqvCpM2TayLPXhEE4=;
        b=2LgvlXAWZ3+s6YtZKVwZDuS+4JIdXyyNnZsy3pGbd36w1wSd6A0WRW3ZxiPXgLqQWt
         Ru3R0NJzxjN8wYQr2ycO8xS6myb5KDnfilBrihzO5SvUZt0qi1adh8RNfNJRLWplNYFU
         k3Hk2QmBWPOxFv5/UGpp8kTy43XGyWmXkzXDusf8SdmkTVDn9xV6d8RKTpeHGvBPzdQJ
         Sfz6utugHi+TkbuN/fpBhGXXjDOkG6o6hNHVzfkDJA0tqMnfgfBsgVF4jjL32HsHrx/0
         zFlmGp9F2/oTPGvWWsJ+zn4xnVyyu4tN8B9z4Gv9tsTSKsy8Xg+wb6EYamB07tLtPd/3
         7Q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698585511; x=1699190311;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Wx1a3bNMRi9UbTKrVEXZXwrdfwnqvCpM2TayLPXhEE4=;
        b=AZtM91Fpc7dAbt3stE1V4tHQkTnZbMPfZYO0lHLjikHjz9Br+FQyECxRAObFbCef0E
         K+KDDjfmxj4xqjjNlVU6F040p6EA/hfzvOtf+ox1xO7Mwnhou2OxPVb05wCeLsqTmV2s
         SYzuK0WSmOJ8fET6gqBokVs7LLrrNKIKBaivJX4RuMVEoXqESabtBCyQ9oHuWadFh0y1
         /FNpTnn7t5St2dn/LckgVF8m4PM5GS1ePDOsAGN3zez7H36Sm6Hucq4s427RG6Hw3/jJ
         qdtNoDUF2237oVRLRkDIpUDUcT/ZiLAdLpV/GT/1UaYNDOVPdplvxrId6fJsXjj8yKvf
         upbw==
X-Gm-Message-State: AOJu0YzqwGyBc+RqAjU1G8k4NNCUFbpY+uBJOGm/7NQrJzeiU2zYfX0D
	xOT0My6rRIgEJsWUxSZFo72db9XVxDC0IeSo+I/E4w==
X-Google-Smtp-Source: AGHT+IH2YtiOe70ZASbSpo40ewHOYJ3IBv5IbZLAqvpTqmpa1aSvl9kkp4pIPcAgl6Kv+uNQim429A==
X-Received: by 2002:a05:6214:21cf:b0:66f:b88c:ff07 with SMTP id d15-20020a05621421cf00b0066fb88cff07mr8437277qvh.33.1698585511249;
        Sun, 29 Oct 2023 06:18:31 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id c16-20020a0cd610000000b0065d89f4d537sm2532890qvj.45.2023.10.29.06.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 06:18:30 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 97EBD1069A8; Sun, 29 Oct 2023 03:18:29 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 29 Oct 2023 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 29 Oct 2023 03:18:29 -1000
Message-Id: <20231029131829.97EBD1069A8@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Oct 2023 13:18:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189774

Branch: kirkstone

New this week: 3 CVEs
CVE-2023-38545 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38545 *
CVE-2023-38546 (CVSS3: 3.7 LOW): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38546 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *

Removed this week: 6 CVEs
CVE-2023-2680 (CVSS3: 8.2 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2680 *
CVE-2023-43785 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43785 *
CVE-2023-43786 (CVSS3: 5.5 MEDIUM): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43786 *
CVE-2023-43787 (CVSS3: 7.8 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-43787 *
CVE-2023-45853 (CVSS3: 9.8 CRITICAL): zlib:zlib-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45853 *
CVE-2023-5535 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-5535 *

Full list:  Found 40 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 6.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-33065 (CVSS3: 7.8 HIGH): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33065 *
CVE-2022-3515 (CVSS3: 9.8 CRITICAL): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3515 *
CVE-2022-36648 (CVSS3: 10.0 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36648 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-47007 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47007 *
CVE-2022-47010 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-47010 *
CVE-2022-48064 (CVSS3: 5.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48064 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-27043 (CVSS3: 5.3 MEDIUM): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-27043 *
CVE-2023-2731 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2731 *
CVE-2023-28198 (CVSS3: 8.8 HIGH): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28198 *
CVE-2023-29403 (CVSS3: 7.8 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29403 *
CVE-2023-3019 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3019 *
CVE-2023-32370 (CVSS3: 5.3 MEDIUM): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32370 *
CVE-2023-3576 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3576 *
CVE-2023-37769 (CVSS3: 6.5 MEDIUM): pixman:pixman-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-37769 *
CVE-2023-38545 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38545 *
CVE-2023-38546 (CVSS3: 3.7 LOW): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38546 *
CVE-2023-38560 (CVSS3: 5.5 MEDIUM): ghostscript:ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-38560 *
CVE-2023-39323 (CVSS3: 9.8 CRITICAL): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39323 *
CVE-2023-39533 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39533 *
CVE-2023-40360 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40360 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-40397 (CVSS3: 9.8 CRITICAL): webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-40397 *
CVE-2023-41175 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-41175 *
CVE-2023-4135 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4135 *
CVE-2023-42467 (CVSS3: 5.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42467 *
CVE-2023-44487 (CVSS3: 7.5 HIGH): go:nghttp2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-44487 *
CVE-2023-4527 (CVSS3: 6.5 MEDIUM): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4527 *
CVE-2023-45322 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45322 *
CVE-2023-45803 (CVSS3: 4.2 MEDIUM): python3-urllib3 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-45803 *
CVE-2023-4863 (CVSS3: 8.8 HIGH): libwebp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4863 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

