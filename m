Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32346C27C4F
	for <webhook@archiver.kernel.org>; Sun, 23 Jun 2024 11:19:24 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web10.115583.1719141554846528613
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 04:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=PFIJF6dO;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.182, mailfrom: steve@sakoman.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-44054a2c153so15618501cf.2
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1719141554; x=1719746354; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8YS8uVBSApV72KbxvKOlYT3/KcfewUhvnmIviJ4fNc=;
        b=PFIJF6dOeSFSGtpfAGEtto4kli0f0SYGMO5TboWRrFWCOAJqU3xu6rPZ15JW2/Nm6+
         sQXkzO8s8mFom0a4AHb2yQ12t/Nhaf3AE6SNmnmHBHkFHfJZ8AKhaiW73jpRo2RpHRuw
         Ou+3vvdORKL1Kex6trlZg73zGkcog1MXN8rbDsyhLvo+rJz8mWPMgGE7vM8Ne284Oysn
         +E0XZpyq2F/ev3Hch8bEknO9TNb9Osl488oK5o+Vi1r9eJ0kXKzb6dVe2++1y9rtA7MO
         IxDMZMP8mP0lT6Bd9dmGz7NrcWyin4mbVbFdsPSiPHCCyqdBo7VL4TLvXLoDrahWHkq4
         eQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719141554; x=1719746354;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H8YS8uVBSApV72KbxvKOlYT3/KcfewUhvnmIviJ4fNc=;
        b=Uoz+iam6BMBRSfXNtEQ7CrNkb7E4mXT5XgezsmrAr82CFKc5NM5wTCErrrkhzSbHE0
         c3FpAvoiTwF8e1/jn5ikszU0Yk4XRor18SDsvG99vqhOpkUWwsa/YVU751PNG9d/x1iq
         pE2VKhWX45gdNcBDzznXTpQrqhJBK3XVyDS/OJVuCAuWeLrDjH7t6luv72mIfJb2nCgo
         JK2UQpXkuL5nWSlSTkOysq+Et8fjGz5+4Pxp6gdiIBAIp9tOnGPmyus5omHIxHAvYw/w
         tdw2BtXb1DPrBkYkO6y5gnYR6HaV83rXi//yWXNkf1coPr3FGuZmpz5H7i44HbTU6kEt
         ef9w==
X-Gm-Message-State: AOJu0YzfzlIfG3otdW6UhQpyiBk4hHG8p7DyMVTbAyTQXMTmDR056NWH
	zjCcxEVsv4+b/NsWrC4NAdh9YnL3d9Z/a3Vrp2W/PIWqZsxNkl3c8YX7DEJbKGsvuMGPKz6gPS+
	+AZg=
X-Google-Smtp-Source: AGHT+IG0NNvtx/HQhYjSl9R3Enug73aFK/oWw+z0Z4s2Sa/MMj4IwBeOhPK3ohRCQNTKcqX96kGZkQ==
X-Received: by 2002:a05:622a:6:b0:441:4a7d:4b9 with SMTP id d75a77b69052e-444d91a26a3mr26923181cf.15.1719141553422;
        Sun, 23 Jun 2024 04:19:13 -0700 (PDT)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-444e316673csm471711cf.89.2024.06.23.04.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 04:19:13 -0700 (PDT)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 00F1510039F; Sun, 23 Jun 2024 01:19:11 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 23 Jun 2024 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 23 Jun 2024 01:19:11 -1000
Message-Id: <20240623111912.00F1510039F@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jun 2024 11:19:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201051

Branch: master

New this week: 2 CVEs
CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24789 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *

Removed this week: 0 CVEs

Full list:  Found 39 unpatched CVEs
CVE-2019-14899 (CVSS3: 7.4 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14899 *
CVE-2021-3714 (CVSS3: 5.9 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2023-1386 (CVSS3: 7.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1386 *
CVE-2023-3397 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3397 *
CVE-2023-3640 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-3640 *
CVE-2023-4010 (CVSS3: 4.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4010 *
CVE-2023-4039 (CVSS3: 4.8 MEDIUM): gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-4039 *
CVE-2023-42363 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42363 *
CVE-2023-42364 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42364 *
CVE-2023-42365 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42365 *
CVE-2023-42366 (CVSS3: 5.5 MEDIUM): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-42366 *
CVE-2023-51767 (CVSS3: 7.0 HIGH): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51767 *
CVE-2023-6238 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-21803 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-21803 *
CVE-2024-23848 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-23848 *
CVE-2024-24789 (CVSS3: 5.5 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24789 *
CVE-2024-24790 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24790 *
CVE-2024-24857 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24857 *
CVE-2024-24858 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24858 *
CVE-2024-24859 (CVSS3: 4.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24859 *
CVE-2024-24864 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-24864 *
CVE-2024-25739 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25739 *
CVE-2024-25740 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-25740 *
CVE-2024-26596 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26596 *
CVE-2024-26900 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26900 *
CVE-2024-26913 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26913 *
CVE-2024-26949 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26949 *
CVE-2024-26952 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-26952 *
CVE-2024-27012 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27012 *
CVE-2024-27017 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-27017 *
CVE-2024-36971 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-36971 *

Summary of CVE counts by recipe:
  linux-yocto: 29
  busybox: 4
  go:go-binary-native:go-cross-core2-64:go-runtime: 2
  gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-14.1.0:libgcc:libgcc-initial: 1
  gnupg:gnupg-native: 1
  openssh: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

