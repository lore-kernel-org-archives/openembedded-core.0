Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF1BED2502E
	for <webhook@archiver.kernel.org>; Sun, 11 Jan 2026 11:02:35 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8605.1768129345223874152
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 03:02:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=QeSj2SE1;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.175, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-bc17d39ccd2so2391920a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 03:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1768129344; x=1768734144; darn=lists.openembedded.org;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HM6bGULAfeBwV8+KO5O3Zj8rf14qewpH1WplMcfghIE=;
        b=QeSj2SE1qJmpC7bpcq1o6a6I2XAlromE89R+u4930AzynXMqk6ePB2yaVja485mD2Q
         wK6lr1DWhFdDL9vi84ceLoqqJaW8uW+DxQw4XovyDRmW3bHRmey1j2Vb7Zo0s+wJZWyN
         J7X4hcTzO9dQHDuZJQeCjtm2p2MxYKA+IzYxyYM+EnTObdrouvvE+h2EaKSlFRIgsZHQ
         atMJe/TDbEworVGynhcu7CsqZ6GSEQthkgI34EjgqyduwbDyuXVcpZ9eYfpXOPWo2koM
         Fe4MCMtgW4QIdxMyMd80LuRyFx8wMmNiTSyTcmMoZZv4PTnvdbTlSgOXS8SPkFS2ULY5
         W+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768129344; x=1768734144;
        h=message-id:date:user-agent:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HM6bGULAfeBwV8+KO5O3Zj8rf14qewpH1WplMcfghIE=;
        b=XpAqHP/K0RiNCf3OacqxVRB9NIkf7tTehI0yjp0j/o33jpZp2iU85Xd2qgVz9/cQ//
         8K02nc2toj3cyrJlux0J3ym7JSFBu55Y4HyoDK5HQvE0P7XifuI4T3PmcQLnxp/XZWKF
         H0NTAT3lLdnTpJkwCKU/86eMBuNACFNJNsd3Tc2zb/EU4Dt6EKF8I1WlApX2HHxkpOFl
         Fq1JIt5qk0EIr5KCt/3l3Tg1om+ZmgLWWxW0rVN4srmHZi0WxLUsj1/6bMfBSBi0Q2l1
         I1bBLzKpt8pSrIl9slAtTwyN8EwB6UQmH0JCC2GWAbE0C3hK+mZWvQmgUf6nzPjdRksB
         ngig==
X-Gm-Message-State: AOJu0YxliSxPG3OusoZ/nzwsF3FJVj+SFSeRDzlPME3aE30pgxQiF2fa
	L7027t3VJLJvGGxKgG9V9KfiQ9aAYikh0pfshX9LoZtaSsROngeKC34g5jy+ecMsy52IJwMp7B8
	nVo51
X-Gm-Gg: AY/fxX6/I6PfTALpJsLtm0gPR0TBH0Vfy89H961bmur+v3ZOys+rhiASzNBIaAophDa
	ZPQJ9iilqzZhjAATBHXS46lcxFMkWHOIvJsHb25nMYQXD4TkfHD4wd/PKvSxWTWxy2AIb5KYy99
	0JRlKdpnVoz5XbXXGxbrxNBzUotdoVCfUzOPoK6iu0W4V0qN1CnKYKY6c0Nfr43Bcy5rTvlTYFA
	w7lYv8UYHA/iDV2WmjxRKzJUYe38jAD+i0zYGXCmZ08m/EfumAlz+k7aVPZ+KYMOZP/Z+MAYEAB
	LrfxInFpXvAkJlZEqPWAhfBy4ALV8XkruUMLDdrKbj5JbVOaYaNaWptAbDnktYMjqAGF0iLWi9P
	cgEz4EmgOmkpknESP1eqFvXN2J1ctDwvpF+1nfSWLIBdgWiYwUpXFwUujLjCNRp4ZbgvX6RnGV4
	3GCAWHm1gftQZ5kIc=
X-Google-Smtp-Source: AGHT+IHubNquAgxfz+4HEbN9IHfukKiV7w0jBdLO3FQ0LWy8czk192a8El78Pm+TPAN6sgKsdqQmTg==
X-Received: by 2002:a05:6a00:bc93:b0:81e:5a6e:340 with SMTP id d2e1a72fcca58-81e5a6e0706mr5399811b3a.26.1768129344089;
        Sun, 11 Jan 2026 03:02:24 -0800 (PST)
Received: from builder.sakoman.com ([71.19.246.55])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819bb4c8187sm3246625b3a.29.2026.01.11.03.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 03:02:23 -0800 (PST)
Received: by builder.sakoman.com (Postfix, from userid 1001)
	id 376821003CB; Sun, 11 Jan 2026 01:02:23 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 11 Jan 2026 01:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 Jan 2026 01:02:23 -1000
Message-Id: <20260111110223.376821003CB@builder.sakoman.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 11:02:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229174

Branch: master

New this week: 8 CVEs
CVE-2023-51791 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51791 *
CVE-2023-51793 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51793 *
CVE-2023-51794 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51794 *
CVE-2023-51795 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51795 *
CVE-2023-51796 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51796 *
CVE-2023-51797 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51797 *
CVE-2023-51798 (CVSS3: N/A): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-51798 *
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *

Removed this week: 3 CVEs
CVE-2025-12084 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-12084 *
CVE-2025-13836 (CVSS3: N/A): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-13836 *
CVE-2025-7424 (CVSS3: N/A): libxslt:libxslt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-7424 *

Full list:  Found 29 unpatched CVEs
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
CVE-2025-52194 (CVSS3: N/A): libsndfile1 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-52194 *
CVE-2025-60876 (CVSS3: N/A): busybox https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-60876 *
CVE-2025-61662 (CVSS3: N/A): grub:grub-efi:grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-61662 *
CVE-2025-66382 (CVSS3: N/A): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2025-66382 *

Summary of CVE counts by recipe:
  linux-yocto: 16
  ffmpeg: 7
  libsndfile1: 2
  busybox: 1
  expat:expat-native: 1
  grub:grub-efi:grub-native: 1
  qemu:qemu-native:qemu-system-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

