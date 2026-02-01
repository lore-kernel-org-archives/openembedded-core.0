Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADC72E7C717
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 11:02:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27674.1769943746357118231
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 03:02:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=1AOOzot9;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a09d981507so25399525ad.1
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 03:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1769943745; x=1770548545; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeG9oF1HE6TatN/FkSTIJaH+D+SZv3JZvmFb1yLp6fU=;
        b=1AOOzot97PBsbc7WKjFbSQxBJZXYMt+xiniU52YetZtaLSCVGJhPQJxqi3L8mvnUWN
         1Zt9ZbHcmj+SH8G171McgKJ6vEBFiwZT03KZidA99/Nr3l+r4ZoOYBg/Wp9YJPwgBa7L
         ej9Vib8f2+Nr9eMAWNU/JeolGKD4YRZtuKVAQgZRCIazLnm5ZyZVXurTFmNpfKdm/Fi4
         3xjURa/2eLcnnPZx3XKCAo+9+93sWVNsAa3kXP9KbCybsMKx1PN2JSOTCLd/R3PvDcwC
         xwlZjeptGMKjn331XuJGazBqvFJtw7n1IJ7wokIWUx0aBoojpqhibHdSNoTKPbSuYMHv
         TNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769943745; x=1770548545;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SeG9oF1HE6TatN/FkSTIJaH+D+SZv3JZvmFb1yLp6fU=;
        b=pg6wHTxk8rK/77iE+5m0uwL5skLE0L/2Ao8ibL411RvULFKa7EEAhr2jIJ3/itf877
         6fgIY2EmhxPVgn4NPXnS9Yew6o5XF6Mjwst1gAjlmA04EbTdnGf1dK50/xkEKjZBkM4/
         ye8DsC8EwZlVRlucCVmwO+V5qsLMTRk5YBc5//lVGabGySSVzUTrFde72nTEg7kTaO9g
         GvprllCkVu+tP7WBR/NPbDp1wHrvbmrrLQdVMgypJgCR1uRtfLu/gNNVraEL2VnFBtl5
         MAEEOARmM407SwLKtywAGmL15Lm1W1k7pnv/hdSXyox46zscSllqrJZM8TLZuNtaR0gm
         /H2A==
X-Gm-Message-State: AOJu0YwbdjWh+PrePEPMwRp42ym+w3iDlu9G8SuI3nvdTH9TE8zasrQ/
	fuLoeLTpJ7bZWH8WCWdvUErHr1QXLH7+BWnHtn2A9JDYuxZ4jmZThP8/IF+evvJrz4PYPgISDcl
	rc2+t+KA=
X-Gm-Gg: AZuq6aKRq2Wh1jLOw99+1lvOlOOSICk69p209Ngx4NTvDL1Kxv1GjDuun1MqSV9wcEV
	c/QfdDsKFxwmRfzEwm8SULtsbqoyHoXu16AplCT0NW5CD0AihKVS5T1pUWza6VPf/uu2hLjDalB
	Zce7siASCmEcGsaH+1bL+KrGwWnNDeKAwW7ptDyffFjUQmEkOAua+ysyEdbjXOSU67H6rZQlNvF
	orOgzz9LXXsWEyBXZ+U+XRNPdTIdO/QU779J05TiN25KeNSaq54BXcsrkUx/aoNYoGgtljWsocj
	Yfl8cHOYZewc4zpdBQPD9I3q7mMdVHSAwS6nMzacLTKTezpfOczvlJ8c9MRsQyUDFUTjn4j/ZIF
	XYE5lGS1fZ0nFZ2cA6TLAkT9rhg5jUdyH9mxZrxDSKo3WSDWO8MmAD+BaotAYXv4p8Vb2UfIUqY
	V2sBjZNPS6picAgEk=
X-Received: by 2002:a17:903:283:b0:2a0:7f8b:c0cb with SMTP id d9443c01a7336-2a8d96cb4c0mr96927655ad.4.1769943745549;
        Sun, 01 Feb 2026 03:02:25 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b4c45c4sm114986155ad.62.2026.02.01.03.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 03:02:24 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 2B5B21003CE; Sun,  1 Feb 2026 01:02:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 01 Feb 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun,  1 Feb 2026 01:02:24 -1000
Message-Id: <20260201110224.2B5B21003CE@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 11:02:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230254

Branch: master

New this week: 5 CVEs
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2026-24061 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24061 *
CVE-2026-24515 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24515 *

Removed this week: 0 CVEs

Full list:  Found 40 unpatched CVEs
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
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2023-6238 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6238 *
CVE-2023-6240 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6240 *
CVE-2023-6535 (CVSS3: N/A): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-6535 *
CVE-2024-50613 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-50613 *
CVE-2024-6519 (CVSS3: N/A): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2024-6519 *
CVE-2025-22921 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-22921 *
CVE-2025-25468 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25468 *
CVE-2025-25469 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-25469 *
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-56226 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-56226 *
CVE-2025-59529 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-59529 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *
CVE-2025-66476 (CVSS3: N/A): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66476 *
CVE-2025-68276 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68276 *
CVE-2025-68468 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68468 *
CVE-2025-68471 (CVSS3: N/A): avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-68471 *
CVE-2026-0915 (CVSS3: N/A): glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-0915 *
CVE-2026-24061 (CVSS3: N/A): inetutils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24061 *
CVE-2026-24515 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2026-24515 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  ffmpeg: 10
  avahi: 4
  libsndfile1: 3
  expat:expat-native: 2
  busybox: 1
  glibc: 1
  inetutils: 1
  qemu:qemu-native:qemu-system-native: 1
  vim: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

