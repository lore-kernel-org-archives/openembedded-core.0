Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96A8CA0EDC
	for <webhook@archiver.kernel.org>; Sun, 17 Aug 2025 11:47:19 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.51307.1755431230806219829
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Aug 2025 04:47:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=NgmGAj9V;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b471738daabso3153827a12.1
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755431230; x=1756036030; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3AHjObmRD3q8fC2XpKlMIaxyolAiwT8OuKVeG9geZM4=;
        b=NgmGAj9VjEL41Qeac1cgAWT9q3cVCBprz9R234rU8y5FLe5LUQY2Wua+KkMuTicxyt
         uMeo5cc7uyNoaZo0z7/PHtF06jt6Y7Cv+GZAixmsB8F73nWDSva3t1F9JNcL+OCPc86d
         V4ee5IvM/IJrP2Nv1fZBjgawZosl7k+Lo+eg1W55a7rNIIS+ZgyPGyRW7Q74Dhk6mHJR
         E78rXtQCYfuWYyThE+weSBmG7Mt6gxQ78gX4F84Ttin2JOToDKHnMA6f5VP6kr07d/vd
         vsYwyM3ogkD2ppUUTHySQtBpnGhqW91o9VKpMMvnjAYInxGEmUkEqf6yWpWdwkZenU3a
         3eGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755431230; x=1756036030;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3AHjObmRD3q8fC2XpKlMIaxyolAiwT8OuKVeG9geZM4=;
        b=xLLUG47oe5H7/LmvGX2QnXJRD7fHCExmp5ldwOXK6mGRATaJmAL9V26O++w+vCzMpm
         Ju+kxTuUZvXTx4h5CJOSX3aVD70URTju+Uu+vvWX695QatjIrVBeXw3Rmsg60zAOmkyv
         XT2SSwXEj1RpDNM7golDOmpa0dpWIe8Y+9TTWYhhbk1wPKgcEZQNLTF7L/voriy1MjvX
         J/0HIdAo2AI2M7oPa6s+qGNJWyrUqkWTUilSLqUNSMnNAn81ry79Cp4J8V18GQR0AqF4
         E8DQriJJWIYffvSd7HTW/6RbF396fIXcGGlApmMq7+1mRj3sycVeFuWhh5C60VXzytJV
         vv/Q==
X-Gm-Message-State: AOJu0YwSujVAJGWuITPifOpl6UiFW8UgvL9L5qHma/i3TEj/d09DWqss
	Uvnu/t5fA1jNc2CUo2fTj/oIYabNTXLKqlaHTAi37cVEDzqSjvdCY9BPByY1AqWyDcf5OQjTCGE
	9gcf6k5k=
X-Gm-Gg: ASbGncuShSix9u1oCVC5sIYdlTeqRinlo2ghU6kOkCD+Dfv3zjK1yUb6Zn9I+P7T5fL
	0mH61pFjDYaJrzxQnIiCGxLpCUibjgXn2pBvybHnSURos6hr2ipoi2Ucq7KmWd8VSr8xouidrUM
	MMfbFCu4HuOqd3mM6yTwAgv7aAmLggoSlXNnrjS137P/fMEw8laSpu9Dm3YlkV5O8SYZEmWjxRx
	CEpJD5oLDKWjaWBzS8zi24o60ubwe+Nz8zsn/NjOlAJQVC1pua5rJAhGt+Gulw6FPGZzeoh5V2/
	3ruqqmK+Rhdtjl640hy7YjOOsp2tulHMRnOQ8wjdIkeGxsyD5MLaqLEwiaxv0H/LJKrXGcJsQ4Q
	LCCF6cndlRVevJFNUcOeoIml9fZ5qetRzzyThIA==
X-Google-Smtp-Source: AGHT+IFhKgEGg/3xK5h5g7BOLgYUFpKuuHGs38He80boVn7ord0jz80JUNTPaewAWYHCpWHUhg/U9w==
X-Received: by 2002:a17:902:d58f:b0:240:5c38:756b with SMTP id d9443c01a7336-2446d710a8fmr103858845ad.14.1755431229980;
        Sun, 17 Aug 2025 04:47:09 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d54e2a3sm53912175ad.125.2025.08.17.04.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 04:47:09 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 43BAF10038E; Sun, 17 Aug 2025 01:47:09 -1000 (HST)
Subject: OE-core CVE metrics for walnascar on Sun 17 Aug 2025 01:44:35 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 17 Aug 2025 01:47:09 -1000
Message-Id: <20250817114709.43BAF10038E@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Aug 2025 11:47:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222004

Branch: walnascar

New this week: 15 CVEs
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-4056 (CVSS3: N/A): glib-2.0:glib-2.0-initial:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4056 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-5916 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5916 *
CVE-2025-5917 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5917 *
CVE-2025-5918 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5918 *

Removed this week: 1 CVEs
CVE-2025-6965 (CVSS3: N/A): sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-6965 *

Full list:  Found 47 unpatched CVEs
CVE-2019-14899 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-38096 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-3397 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-39176 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39176 *
CVE-2023-39179 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39179 *
CVE-2023-39180 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-39180 *
CVE-2023-4010 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4458 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4458 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-56738 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-56738 *
CVE-2024-57995 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-57995 *
CVE-2024-58097 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-58097 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2024-8354 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-8354 *
CVE-2025-21751 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21751 *
CVE-2025-21833 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21833 *
CVE-2025-21949 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-21949 *
CVE-2025-2759 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-2759 *
CVE-2025-32989 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32989 *
CVE-2025-32990 (CVSS3: N/A): gnutls:gnutls-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-32990 *
CVE-2025-37803 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37803 *
CVE-2025-37860 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37860 *
CVE-2025-37925 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-37925 *
CVE-2025-3887 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-3887 *
CVE-2025-40014 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-40014 *
CVE-2025-4056 (CVSS3: N/A): glib-2.0:glib-2.0-initial:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-4056 *
CVE-2025-47183 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47183 *
CVE-2025-47219 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47219 *
CVE-2025-47806 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47806 *
CVE-2025-47807 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47807 *
CVE-2025-47808 (CVSS3: N/A): gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-47808 *
CVE-2025-53905 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53905 *
CVE-2025-53906 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-53906 *
CVE-2025-5916 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5916 *
CVE-2025-5917 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5917 *
CVE-2025-5918 (CVSS3: N/A): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-5918 *
CVE-2025-8224 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8224 *
CVE-2025-8225 (CVSS3: N/A): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-8225 *

Summary of CVE counts by recipe:
  linux-yocto: 26
  gstreamer1.0: 7
  libarchive:libarchive-native: 3
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 2
  gnutls:gnutls-native: 2
  qemu:qemu-native:qemu-system-native: 2
  vim: 2
  glib-2.0:glib-2.0-initial:glib-2.0-native: 1
  grub:grub-efi:grub-native: 1
  libsndfile1: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

