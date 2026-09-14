Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E7C7C88E67
	for <webhook@archiver.kernel.org>; Mon, 14 Sep 2026 04:33:15 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12924.1789360387752389648
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2026 21:33:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RA6mosZJ;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b965f447cso10573325e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2026 21:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789360386; x=1789965186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IBrEh15hQt44tx+az77z3ut6gp5cr72yOfEKx/I+7aY=;
        b=RA6mosZJN1+5qYf2X4434/9cMlsfqEMSI+4KNxmoJFxQS9vzw+fDgG4F3zbgj4ZOoA
         7UyKg4RuUI1asEESWAmT+9dFGKIMh5uSzpx6MCPid6Zc3CXknpSgrbWchIQIYtFJ5oHU
         rRA7q4tOu1ZJ72Xm/8ZMkAtbcu1VdT5KVFRmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789360386; x=1789965186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IBrEh15hQt44tx+az77z3ut6gp5cr72yOfEKx/I+7aY=;
        b=epjoaEndJyxGjOCn6sZMp+QFiIB/fwJzKu4jHMLedCX1DSBqzkuPTT+got5Jepg4Pt
         uuv/nq/nXSWq3ok8Pmjn0ypCsQEKXzAM2rfAh1DOaSzauWQRpUQBjgzNl+0Yx0m7iE8y
         KpUEQIuMmmXKEPeJNJX1Bpqu3stDlFyFyoG/RZpBP5T9OQSRs2F/1sRqe03bMzv/IbDI
         nlBJGJc/5vk403SspibXTx8+Or8axPqB8WDWblxUaH1ZtsW+4FgzMm5cGPFmNldmvkt3
         36tAbryadThFpeK2UQt0MpD/HyjWD75lSs6lDfwhhx1m+EA/6GSHR3rZDCQk5MYGv8oi
         2Xtg==
X-Gm-Message-State: AFuF++n8cwL5VYvd4A6CY59/Z1pV+aFd3WlnryVCEP7QIHxzDdhqsqVK
	4MWtOo0mUX+hoA7/hWUU4V5Lqd3shsvUg4Sp4TKI1fH5C+NBElCcUeBeIOHUJJZMI03Ni/ZbnjB
	sic4XD/U=
X-Gm-Gg: AYBFou3SbCXb11nDC3JofLLQHI0Tt40wLe3ZgnArS1DfSfx2E24DcVLtsx7KU5jyGSo
	c4eGYWnvQt7yfoNQqedRRMmPFlTZk90+mMj23aycRXSlO8rfHJ1VL5JLsQh+1tcEpeASlf7f8eo
	lP7AdqXnjm29FohFJl934c3i3GX17O9Grxe2dpgNqeqSVwVFa8mne0V17xqh4qH142/FMjdbKgR
	Q+glUwQMEwKGvM5tzp9Poq910TeY5sxxlY0UuVn3cAd+o7ncqfJaZTHWz1YA54ik2ubW7ZSDyC3
	XkTRMKJ7zyEHXGV6FvZMWP5CbaM7RFbUacLBrhEMjBffr3dF08hoz9CFJ+t7vNiwSTfpyR8y+Kw
	S7jVT8ojLJqaNaMIS0zAzwGya68k1+SdYBIBuwtxGgb+w9XXvKyqs7CYmpITlmONn7ZEOnftmbS
	G/h5CJQoLnSFJKfzAtTrPAc1XVuhKhCTMmNnkRHa5ODIYtUPq87LaJxYyqI6j6wz3Shjrx5HcO1
	rXS3K9AOrWK8XUPQFdpbC/iJXuA/VOw3ZKqD8EEhuMKaEn3hSOMa+Md0gSFNc+amQZ/1ctZOlzd
	6766AcisdpqCYwu2sTbcsrYMLp2RUZyQKyYAqNo08Yur
X-Received: by 2002:a05:600c:3b0e:b0:49b:d03:8d3a with SMTP id 5b1f17b1804b1-49e7a64894amr7774755e9.11.1789360385613;
        Sun, 13 Sep 2026 21:33:05 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm374201815e9.2.2026.09.13.21.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:33:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for master on Mon Sep 14 03:07:51 2026
Date: Mon, 14 Sep 2026 04:33:02 +0000
Message-ID: <20260914043304.24-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Sep 2026 04:33:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245746

Branch: master

New this week: 6 CVEs
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-59679 (CVSSv3: 9.0, CVSSv4: 9.2): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-59679 *
CVE-2026-80926 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80926 *
CVE-2026-87910 (CVSSv4: 5.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-87910 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-90781 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-90781 *

Removed this week: 71 CVEs
CVE-2026-0799 (CVSSv3: 8.7): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-0799 *
CVE-2026-6244 (CVSSv3: 5.5): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-6244 *
CVE-2026-6554 (CVSSv3: 5.5): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-6554 *
CVE-2026-16599 (CVSSv4: 5.1): wget https://nvd.nist.gov/vuln/detail/CVE-2026-16599 *
CVE-2026-18238 (CVSSv3: 5.0): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-18238 *
CVE-2026-18313 (CVSSv3: 4.3): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-18313 *
CVE-2026-31911 (CVSSv3: 5.5): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-31911 *
CVE-2026-31912 (CVSSv3: 5.5): libpcap https://nvd.nist.gov/vuln/detail/CVE-2026-31912 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
CVE-2026-64831 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64831 *
CVE-2026-64832 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64832 *
CVE-2026-64833 (CVSSv3: 7.1, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64833 *
CVE-2026-64834 (CVSSv3: 7.5, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64834 *
CVE-2026-64835 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64835 *
CVE-2026-65703 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65703 *
CVE-2026-65704 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65704 *
CVE-2026-65705 (CVSSv3: 7.8, CVSSv4: 7.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65705 *
CVE-2026-65706 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-65706 *
CVE-2026-66036 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66036 *
CVE-2026-66037 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66037 *
CVE-2026-66038 (CVSSv3: 6.5, CVSSv4: 7.1): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66038 *
CVE-2026-66039 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66039 *
CVE-2026-66040 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66040 *
CVE-2026-66041 (CVSSv3: 8.8, CVSSv4: 7.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-66041 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-80824 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80824 *
CVE-2026-80825 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80825 *
CVE-2026-80826 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80826 *
CVE-2026-80827 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80827 *
CVE-2026-80828 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80828 *
CVE-2026-80829 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80829 *
CVE-2026-80830 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80830 *
CVE-2026-80831 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80831 *
CVE-2026-80832 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80832 *
CVE-2026-80833 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80833 *
CVE-2026-80834 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80834 *
CVE-2026-80835 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80835 *
CVE-2026-80836 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80836 *
CVE-2026-80837 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80837 *
CVE-2026-80838 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80838 *
CVE-2026-80839 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80839 *
CVE-2026-80840 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80840 *
CVE-2026-80841 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80841 *
CVE-2026-80842 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80842 *
CVE-2026-80843 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80843 *
CVE-2026-80844 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80844 *
CVE-2026-80845 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80845 *
CVE-2026-80846 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80846 *
CVE-2026-80847 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80847 *
CVE-2026-80848 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80848 *
CVE-2026-80849 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80849 *
CVE-2026-80850 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80850 *
CVE-2026-80851 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80851 *
CVE-2026-80852 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80852 *
CVE-2026-80853 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80853 *
CVE-2026-80854 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80854 *
CVE-2026-80855 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80855 *
CVE-2026-80856 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80856 *
CVE-2026-80857 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80857 *
CVE-2026-80858 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80858 *
CVE-2026-80859 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80859 *
CVE-2026-80860 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80860 *
CVE-2026-80861 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80861 *
CVE-2026-80862 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80862 *
CVE-2026-80863 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80863 *
CVE-2026-80864 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80864 *

Full list: Found 68 unpatched CVEs
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-10774 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10774 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2024-2236 (CVSSv3: 5.9): libgcrypt:libgcrypt-native https://nvd.nist.gov/vuln/detail/CVE-2024-2236 *
CVE-2024-47850 (CVSSv3: 7.5): cups https://nvd.nist.gov/vuln/detail/CVE-2024-47850 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2025-15367 (CVSSv4: 5.9): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-15367 *
CVE-2025-50422 (CVSSv3: 2.9): cairo:cairo-native https://nvd.nist.gov/vuln/detail/CVE-2025-50422 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2026-3099 (CVSSv3: 7.3): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3441 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3441 *
CVE-2026-3442 (CVSSv3: 7.1): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-3442 *
CVE-2026-3632 (CVSSv3: 5.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-5673 (CVSSv3: 7.1): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-15310 (CVSSv4: 2.1): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15310 *
CVE-2026-15534 (CVSSv3: 5.7): perl:perl-native https://nvd.nist.gov/vuln/detail/CVE-2026-15534 *
CVE-2026-15806 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-15806 *
CVE-2026-17084 (CVSSv4: 6.0): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-17084 *
CVE-2026-18374 (CVSSv3: 4.9): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-18374 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18487 (CVSSv3: 5.4): epiphany https://nvd.nist.gov/vuln/detail/CVE-2026-18487 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18739 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18739 *
CVE-2026-18743 (CVSSv3: 2.5): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18743 *
CVE-2026-18839 (CVSSv3: 2.2): popt:popt-native https://nvd.nist.gov/vuln/detail/CVE-2026-18839 *
CVE-2026-19672 (CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-19672 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-38752 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38752 *
CVE-2026-38753 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38753 *
CVE-2026-38755 (CVSSv3: 7.5): busybox https://nvd.nist.gov/vuln/detail/CVE-2026-38755 *
CVE-2026-44950 (CVSSv3: 9.0, CVSSv4: 9.5): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-44950 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 6.1): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-58049 (CVSSv3: 8.6, CVSSv4: 8.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-58049 *
CVE-2026-59679 (CVSSv3: 9.0, CVSSv4: 9.2): libxfont2 https://nvd.nist.gov/vuln/detail/CVE-2026-59679 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 7.2): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-68086 (CVSS: N/A): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-68086 *
CVE-2026-75141 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75141 *
CVE-2026-75142 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75142 *
CVE-2026-75143 (CVSSv3: 9.8, CVSSv4: 9.3): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75143 *
CVE-2026-75144 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75144 *
CVE-2026-75145 (CVSSv3: 5.8, CVSSv4: 5.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75145 *
CVE-2026-75146 (CVSSv3: 8.1, CVSSv4: 7.2): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75146 *
CVE-2026-75147 (CVSSv3: 7.1, CVSSv4: 6.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-75147 *
CVE-2026-78376 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-78376 *
CVE-2026-80926 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-80926 *
CVE-2026-81281 (CVSSv3: 6.5): graphene https://nvd.nist.gov/vuln/detail/CVE-2026-81281 *
CVE-2026-82474 (CVSSv3: 7.8, CVSSv4: 8.5): sudo https://nvd.nist.gov/vuln/detail/CVE-2026-82474 *
CVE-2026-83596 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2026-83596 *
CVE-2026-85091 (CVSSv3: 7.4, CVSSv4: 8.3): zlib:zlib-native https://nvd.nist.gov/vuln/detail/CVE-2026-85091 *
CVE-2026-87910 (CVSSv4: 5.7): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2026-87910 *
CVE-2026-89092 (CVSSv3: 4.2): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-89092 *
CVE-2026-90781 (CVSSv3: 4.4, CVSSv4: 4.8): alsa-lib:alsa-lib-native https://nvd.nist.gov/vuln/detail/CVE-2026-90781 *

Summary of CVE counts by recipe:
  linux-yocto: 11
  libsoup: 9
  ffmpeg: 8
  python3:python3-native: 6
  binutils:binutils-cross-x86_64:binutils-native:binutils-testsuite: 4
  popt:popt-native: 3
  busybox: 3
  libsndfile1: 2
  glibc: 2
  tar: 2
  libxfont2: 2
  openssh: 2
  webkitgtk: 2
  libgcrypt:libgcrypt-native: 1
  cups: 1
  cairo:cairo-native: 1
  libtheora: 1
  perl:perl-native: 1
  epiphany: 1
  cryptodev-linux: 1
  bison:bison-native: 1
  graphene: 1
  sudo: 1
  zlib:zlib-native: 1
  alsa-lib:alsa-lib-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

