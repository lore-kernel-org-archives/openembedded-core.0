Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C08CA9ED5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 04:02:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6420.1791777773106963950
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 21:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=H3giJlWh;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1698ea378so11215625e9.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 21:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791777771; x=1792382571; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HKfNuHkBwF54pzrNOwQ7jhDtMluXo/pS0EyU3GI+9Sg=;
        b=H3giJlWhPVK3bBsfWlGvy9E2PP/KuSIxOCLND8eHgBAjYHHPJQ7lsjiFnR5X9RjZTS
         oSBBPjH11pVLxDQxo0iYMRlvMeYbjuCP26qFyusUFDuaqOWPbrLPCKB4EIZVaJuM/3+R
         r6cYoU8M2/5tx0tDAXMUdldbmJv3n5pINswGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791777771; x=1792382571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=HKfNuHkBwF54pzrNOwQ7jhDtMluXo/pS0EyU3GI+9Sg=;
        b=Q7cvIhnEzlaa/9WG68q6V/e9pEs6HCGyFs+bm2AF9VdwROwnv0H6mS+DnYuFo1fKoM
         Gku8kg4kMx+D4VqmbNzAtC3UCZxP5lpauQB8z0PKt+D5JuRcTrzQiTS0xIxJguirvJsb
         8hHNjtzqUNODiuVjMPA0Hkjoi4vk4Fjez49Lumbc4RylQ2zC6ilTAqXmcMSy7RjCEuIR
         mqAHK7Z46kVdOvsqgvqdTgaQG5MtSr4P8OuS+dC/sBZV0KmNhc0hWy1C/ulMZ+dkJsiX
         5SNx4489CO4V1pIVPqrekQwnPX1WnVb4suBQmNsizBUPLZnwg1LGkOLiWJuyhyBWbdOS
         Q/3g==
X-Gm-Message-State: AFq9FYKGsgVVoK6UxPt/4Eb94Ny2UvTMJ6jHY8MGoWZ8POloZFVF19I2
	R8uVJxXfBUHHfj8IjB1ey7dv+B6CEeP79If9cVe/dkpoDXfc4AvYcd5UE1J4e4Rt6Y4bALBo0p2
	AqNVFUt4=
X-Gm-Gg: AYBFou10hDUYKTkr1ExYgxQ+FR+Dx+3nLiUTTI14UznDrDx/bn1wpMbZmJ14kw+TaZw
	S4cH//QTsZ/nh+lIQVEpEvR73l/vpchd4FZ2xlCSp5hzdmtm48nO1AJ698Fbh/tK5TxJxbiz+xI
	obF80W97xTsheFBmSjdAo/sSvsBV2AdntY2SitMhFDaPgoEt6KHstfuB4/IBlwscX/5tRoFuxSF
	bVDYF6gVj7EHkQeC9Q2nhEVelUFTTrgONsUsYkNaav7AI/8U4yjI7rdTD21wZIOZRvFMTZfGAGN
	Ccv2b5gAyfmRRCbYa70L5vt9oBiL0/hOSMN+yrPPMEydyv5UTYR6t6vwXET2YMuyoVJ1XC2q4Gh
	o8ITlKutr5cQtLjL6xgIEuhJqxNwLyCbShfu5o8sOah3ORRvUgy3gRsOFwcluMcuA77rwbLX82/
	UmjP+u5E7/c1vrVXkJ6+FHSjQtZY5mFBbGEqPCZIviPDCu8dGcWWhRlOAmT6HeAu3GJXF6LJMHU
	PxM0FCXFyDXpizEOxB1PxFZYq2G2MrQ+mhcFbCCYvqqO1V9cnv7gZglwtMpemJgyVMuA0QDTGDo
	vAepGoeMgZjNAQTRhUr1pzD7fbGWzBZBlE1FaFcYQt6K
X-Received: by 2002:a05:600c:4ec9:b0:4a1:8961:78dd with SMTP id 5b1f17b1804b1-4a18e4c9e46mr161636145e9.27.1791777770133;
        Sun, 11 Oct 2026 21:02:50 -0700 (PDT)
Received: from runner-sindu79iq-project-19509-concurrent-0.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a199e5db12sm134104835e9.2.2026.10.11.21.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 21:02:49 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: OE-Core ML <openembedded-core@lists.openembedded.org>,
	Yocto Security ML <yocto-security@lists.yoctoproject.org>
Subject: OE-core CVE metrics for scarthgap on Mon Oct 12 03:04:11 2026
Date: Mon, 12 Oct 2026 04:02:45 +0000
Message-ID: <20261012040246.24-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261012040246.24-1-yoann.congal@smile.fr>
References: <20261012040246.24-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 04:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247596

Branch: scarthgap

New this week: 25 CVEs
CVE-2026-35189 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35189 *
CVE-2026-35191 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35191 *
CVE-2026-42772 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-42772 *
CVE-2026-54872 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54872 *
CVE-2026-54873 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54873 *
CVE-2026-54875 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54875 *
CVE-2026-63999 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63999 *
CVE-2026-72897 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-72897 *
CVE-2026-73076 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73076 *
CVE-2026-75804 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75804 *
CVE-2026-75805 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75805 *
CVE-2026-75806 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75806 *
CVE-2026-76956 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76956 *
CVE-2026-77696 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-77696 *
CVE-2026-84782 (CVSSv3: 8.2): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84782 *
CVE-2026-84784 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84784 *
CVE-2026-98051 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98051 *
CVE-2026-98052 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98052 *
CVE-2026-98078 (CVSSv3: 4.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98078 *
CVE-2026-98080 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98080 *
CVE-2026-98082 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98082 *
CVE-2026-98083 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98083 *
CVE-2026-98131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-98134 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98134 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *

Removed this week: 10 CVEs
CVE-2023-3079 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3079 *
CVE-2023-39176 (CVSSv3: 5.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-39176 *
CVE-2025-66382 (CVSSv3: 2.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2025-66382 *
CVE-2026-6238 (CVSSv3: 6.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-6238 *
CVE-2026-30922 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-30922 *
CVE-2026-50219 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-50219 *
CVE-2026-56116 (CVSSv3: 6.5, CVSSv4: 7.1): dhcpcd https://nvd.nist.gov/vuln/detail/CVE-2026-56116 *
CVE-2026-56131 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56131 *
CVE-2026-56412 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-56412 *
CVE-2026-59885 (CVSSv3: 7.5): python3-pyasn1 https://nvd.nist.gov/vuln/detail/CVE-2026-59885 *

Full list: Found 835 unpatched CVEs
CVE-2014-8171 (CVSSv2: 4.9, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2014-8171 *
CVE-2017-1000255 (CVSSv2: 6.6, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2017-1000255 *
CVE-2018-10840 (CVSSv2: 7.2, CVSSv3: 5.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10840 *
CVE-2018-10876 (CVSSv2: 4.9, CVSSv3: 5.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10876 *
CVE-2018-10882 (CVSSv2: 4.9, CVSSv3: 4.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10882 *
CVE-2018-10902 (CVSSv2: 4.6, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-10902 *
CVE-2018-14625 (CVSSv2: 4.4, CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2018-14625 *
CVE-2019-3016 (CVSSv2: 1.9, CVSSv3: 6.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3016 *
CVE-2019-3819 (CVSSv2: 4.9, CVSSv3: 4.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3819 *
CVE-2019-3887 (CVSSv2: 4.7, CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-3887 *
CVE-2019-14899 (CVSSv2: 4.9, CVSSv3: 7.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2019-14899 *
CVE-2020-1749 (CVSSv2: 5.0, CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-1749 *
CVE-2020-8834 (CVSSv2: 4.9, CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-8834 *
CVE-2020-10742 (CVSSv2: 3.6, CVSSv3: 6.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-10742 *
CVE-2020-16119 (CVSSv2: 4.6, CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-16119 *
CVE-2020-25672 (CVSSv2: 5.0, CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-25672 *
CVE-2020-27815 (CVSSv2: 6.1, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2020-27815 *
CVE-2021-3564 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3564 *
CVE-2021-3669 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3669 *
CVE-2021-3714 (CVSSv3: 5.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3714 *
CVE-2021-3759 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3759 *
CVE-2021-3864 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-3864 *
CVE-2021-4218 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-4218 *
CVE-2021-20194 (CVSSv2: 4.6, CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-20194 *
CVE-2021-20265 (CVSSv2: 4.9, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2021-20265 *
CVE-2022-0286 (CVSSv2: 2.1, CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0286 *
CVE-2022-0400 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-0400 *
CVE-2022-1247 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1247 *
CVE-2022-1462 (CVSSv2: 3.3, CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-1462 *
CVE-2022-2308 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-2308 *
CVE-2022-2663 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-2663 *
CVE-2022-3435 (CVSSv3: 4.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3435 *
CVE-2022-3523 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3523 *
CVE-2022-3567 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3567 *
CVE-2022-3619 (CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3619 *
CVE-2022-3621 (CVSSv3: 4.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3621 *
CVE-2022-3624 (CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3624 *
CVE-2022-3629 (CVSSv2: 1.4, CVSSv3: 2.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3629 *
CVE-2022-3630 (CVSSv3: 3.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3630 *
CVE-2022-3633 (CVSSv2: 2.7, CVSSv3: 3.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3633 *
CVE-2022-3636 (CVSSv2: 4.9, CVSSv3: 5.5, CVSSv4: 5.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3636 *
CVE-2022-3646 (CVSSv3: 3.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-3646 *
CVE-2022-4382 (CVSSv3: 6.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4382 *
CVE-2022-4543 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-4543 *
CVE-2022-36402 (CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-36402 *
CVE-2022-38096 (CVSSv3: 6.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-38096 *
CVE-2022-42895 (CVSSv3: 5.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2022-42895 *
CVE-2022-42969 (CVSSv3: 5.3): python3-py:python3-py-native https://nvd.nist.gov/vuln/detail/CVE-2022-42969 *
CVE-2023-1073 (CVSSv3: 6.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1073 *
CVE-2023-1074 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1074 *
CVE-2023-1075 (CVSSv3: 3.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1075 *
CVE-2023-1076 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-1076 *
CVE-2023-2898 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-2898 *
CVE-2023-3397 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3397 *
CVE-2023-3640 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3640 *
CVE-2023-3772 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3772 *
CVE-2023-3773 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-3773 *
CVE-2023-4155 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-4155 *
CVE-2023-6176 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6176 *
CVE-2023-6200 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6200 *
CVE-2023-6238 (CVSSv3: 6.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6238 *
CVE-2023-6240 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6240 *
CVE-2023-6270 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6270 *
CVE-2023-6531 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6531 *
CVE-2023-6535 (CVSSv3: 6.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6535 *
CVE-2023-6606 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6606 *
CVE-2023-6610 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6610 *
CVE-2023-6679 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6679 *
CVE-2023-6915 (CVSSv3: 6.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6915 *
CVE-2023-6931 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-6931 *
CVE-2023-7042 (CVSSv3: 4.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-7042 *
CVE-2023-39179 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-39179 *
CVE-2023-39180 (CVSSv3: 4.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-39180 *
CVE-2023-50431 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-50431 *
CVE-2023-52586 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52586 *
CVE-2023-52590 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52590 *
CVE-2023-52624 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52624 *
CVE-2023-52625 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2023-52625 *
CVE-2024-0565 (CVSSv3: 6.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-0565 *
CVE-2024-0607 (CVSSv3: 6.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-0607 *
CVE-2024-1151 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-1151 *
CVE-2024-23848 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23848 *
CVE-2024-23849 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23849 *
CVE-2024-23850 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23850 *
CVE-2024-23851 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-23851 *
CVE-2024-24859 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24859 *
CVE-2024-24860 (CVSSv3: 4.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24860 *
CVE-2024-24861 (CVSSv3: 3.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24861 *
CVE-2024-24864 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-24864 *
CVE-2024-25739 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25739 *
CVE-2024-25740 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25740 *
CVE-2024-25741 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-25741 *
CVE-2024-26672 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26672 *
CVE-2024-26756 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26756 *
CVE-2024-26757 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26757 *
CVE-2024-26758 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26758 *
CVE-2024-26944 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26944 *
CVE-2024-26948 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26948 *
CVE-2024-26962 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-26962 *
CVE-2024-27010 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-27010 *
CVE-2024-27012 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-27012 *
CVE-2024-27079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-27079 *
CVE-2024-35794 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35794 *
CVE-2024-35808 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35808 *
CVE-2024-35843 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35843 *
CVE-2024-35931 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-35931 *
CVE-2024-36024 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-36024 *
CVE-2024-38608 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-38608 *
CVE-2024-40979 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-40979 *
CVE-2024-40999 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-40999 *
CVE-2024-41008 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41008 *
CVE-2024-41023 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41023 *
CVE-2024-41045 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41045 *
CVE-2024-41082 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41082 *
CVE-2024-41085 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41085 *
CVE-2024-41932 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-41932 *
CVE-2024-42040 (CVSSv3: 8.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-42040 *
CVE-2024-42107 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42107 *
CVE-2024-42118 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42118 *
CVE-2024-42123 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42123 *
CVE-2024-42139 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42139 *
CVE-2024-42155 (CVSSv3: 1.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42155 *
CVE-2024-42158 (CVSSv3: 4.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42158 *
CVE-2024-42162 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42162 *
CVE-2024-42317 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-42317 *
CVE-2024-43819 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43819 *
CVE-2024-43824 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43824 *
CVE-2024-43872 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43872 *
CVE-2024-43901 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-43901 *
CVE-2024-44951 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-44951 *
CVE-2024-46681 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46681 *
CVE-2024-46698 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46698 *
CVE-2024-46701 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46701 *
CVE-2024-46727 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46727 *
CVE-2024-46729 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46729 *
CVE-2024-46730 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46730 *
CVE-2024-46754 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46754 *
CVE-2024-46775 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46775 *
CVE-2024-46808 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46808 *
CVE-2024-46834 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46834 *
CVE-2024-46842 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-46842 *
CVE-2024-47661 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47661 *
CVE-2024-47662 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47662 *
CVE-2024-47702 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47702 *
CVE-2024-47703 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47703 *
CVE-2024-47794 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-47794 *
CVE-2024-49885 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49885 *
CVE-2024-49888 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49888 *
CVE-2024-49893 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49893 *
CVE-2024-49908 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49908 *
CVE-2024-49910 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49910 *
CVE-2024-49916 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49916 *
CVE-2024-49918 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49918 *
CVE-2024-49920 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49920 *
CVE-2024-49921 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49921 *
CVE-2024-49922 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49922 *
CVE-2024-49940 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49940 *
CVE-2024-49945 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49945 *
CVE-2024-49970 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-49970 *
CVE-2024-50028 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50028 *
CVE-2024-50102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50102 *
CVE-2024-50217 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50217 *
CVE-2024-50225 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50225 *
CVE-2024-50289 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-50289 *
CVE-2024-50613 (CVSSv3: 6.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2024-50613 *
CVE-2024-52560 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-52560 *
CVE-2024-53051 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53051 *
CVE-2024-53056 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53056 *
CVE-2024-53089 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53089 *
CVE-2024-53090 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53090 *
CVE-2024-53114 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53114 *
CVE-2024-53147 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53147 *
CVE-2024-53187 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53187 *
CVE-2024-53219 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-53219 *
CVE-2024-56544 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56544 *
CVE-2024-56591 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56591 *
CVE-2024-56702 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56702 *
CVE-2024-56712 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56712 *
CVE-2024-56742 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56742 *
CVE-2024-56775 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-56775 *
CVE-2024-57254 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57254 *
CVE-2024-57255 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57255 *
CVE-2024-57256 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57256 *
CVE-2024-57257 (CVSSv3: 2.0): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57257 *
CVE-2024-57258 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57258 *
CVE-2024-57259 (CVSSv3: 7.1): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2024-57259 *
CVE-2024-57804 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57804 *
CVE-2024-57809 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57809 *
CVE-2024-57857 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57857 *
CVE-2024-57872 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57872 *
CVE-2024-57974 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57974 *
CVE-2024-57975 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57975 *
CVE-2024-57976 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57976 *
CVE-2024-57999 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-57999 *
CVE-2024-58006 (CVSSv3: 9.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58006 *
CVE-2024-58012 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58012 *
CVE-2024-58015 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58015 *
CVE-2024-58089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58089 *
CVE-2024-58094 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58094 *
CVE-2024-58095 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58095 *
CVE-2024-58241 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2024-58241 *
CVE-2025-4598 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-4598 *
CVE-2025-4674 (CVSSv3: 8.6): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-4674 *
CVE-2025-6558 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-6558 *
CVE-2025-12781 (CVSSv3: 5.3, CVSSv4: 6.3): python3:python3-native https://nvd.nist.gov/vuln/detail/CVE-2025-12781 *
CVE-2025-21634 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21634 *
CVE-2025-21635 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21635 *
CVE-2025-21649 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21649 *
CVE-2025-21650 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21650 *
CVE-2025-21651 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21651 *
CVE-2025-21693 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21693 *
CVE-2025-21696 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21696 *
CVE-2025-21714 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21714 *
CVE-2025-21722 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21722 *
CVE-2025-21723 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21723 *
CVE-2025-21729 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21729 *
CVE-2025-21732 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21732 *
CVE-2025-21768 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21768 *
CVE-2025-21801 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21801 *
CVE-2025-21825 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21825 *
CVE-2025-21870 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21870 *
CVE-2025-21885 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21885 *
CVE-2025-21888 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21888 *
CVE-2025-21892 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21892 *
CVE-2025-21907 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21907 *
CVE-2025-21927 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21927 *
CVE-2025-21949 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21949 *
CVE-2025-21961 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21961 *
CVE-2025-21972 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21972 *
CVE-2025-21976 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21976 *
CVE-2025-21985 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-21985 *
CVE-2025-22039 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22039 *
CVE-2025-22070 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22070 *
CVE-2025-22101 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22101 *
CVE-2025-22104 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22104 *
CVE-2025-22108 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22108 *
CVE-2025-22109 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22109 *
CVE-2025-22113 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22113 *
CVE-2025-22115 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22115 *
CVE-2025-22124 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22124 *
CVE-2025-22127 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-22127 *
CVE-2025-22873 (CVSSv3: 3.8): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2025-22873 *
CVE-2025-23129 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23129 *
CVE-2025-23130 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23130 *
CVE-2025-23132 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23132 *
CVE-2025-23133 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23133 *
CVE-2025-23135 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-23135 *
CVE-2025-31277 (CVSSv3: 8.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-31277 *
CVE-2025-37743 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37743 *
CVE-2025-37747 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37747 *
CVE-2025-37750 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37750 *
CVE-2025-37759 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37759 *
CVE-2025-37802 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37802 *
CVE-2025-37806 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37806 *
CVE-2025-37807 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37807 *
CVE-2025-37826 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37826 *
CVE-2025-37833 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37833 *
CVE-2025-37834 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37834 *
CVE-2025-37856 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37856 *
CVE-2025-37860 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37860 *
CVE-2025-37861 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37861 *
CVE-2025-37870 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37870 *
CVE-2025-37880 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37880 *
CVE-2025-37907 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37907 *
CVE-2025-37977 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-37977 *
CVE-2025-38029 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38029 *
CVE-2025-38038 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38038 *
CVE-2025-38041 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38041 *
CVE-2025-38042 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38042 *
CVE-2025-38060 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38060 *
CVE-2025-38064 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38064 *
CVE-2025-38069 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38069 *
CVE-2025-38096 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38096 *
CVE-2025-38132 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38132 *
CVE-2025-38140 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38140 *
CVE-2025-38199 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38199 *
CVE-2025-38203 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38203 *
CVE-2025-38204 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38204 *
CVE-2025-38206 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38206 *
CVE-2025-38207 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38207 *
CVE-2025-38237 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38237 *
CVE-2025-38261 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38261 *
CVE-2025-38264 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38264 *
CVE-2025-38272 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38272 *
CVE-2025-38279 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38279 *
CVE-2025-38292 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38292 *
CVE-2025-38303 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38303 *
CVE-2025-38311 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38311 *
CVE-2025-38333 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38333 *
CVE-2025-38359 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38359 *
CVE-2025-38414 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38414 *
CVE-2025-38438 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38438 *
CVE-2025-38507 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38507 *
CVE-2025-38582 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38582 *
CVE-2025-38585 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38585 *
CVE-2025-38591 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38591 *
CVE-2025-38595 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38595 *
CVE-2025-38597 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38597 *
CVE-2025-38605 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38605 *
CVE-2025-38636 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38636 *
CVE-2025-38656 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38656 *
CVE-2025-38660 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38660 *
CVE-2025-38705 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38705 *
CVE-2025-38717 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38717 *
CVE-2025-38722 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-38722 *
CVE-2025-39677 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39677 *
CVE-2025-39705 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39705 *
CVE-2025-39707 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39707 *
CVE-2025-39732 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39732 *
CVE-2025-39746 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39746 *
CVE-2025-39747 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39747 *
CVE-2025-39754 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39754 *
CVE-2025-39762 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39762 *
CVE-2025-39779 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39779 *
CVE-2025-39789 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39789 *
CVE-2025-39810 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39810 *
CVE-2025-39829 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39829 *
CVE-2025-39833 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39833 *
CVE-2025-39850 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39850 *
CVE-2025-39851 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39851 *
CVE-2025-39859 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39859 *
CVE-2025-39862 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39862 *
CVE-2025-39910 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39910 *
CVE-2025-39925 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39925 *
CVE-2025-39927 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39927 *
CVE-2025-39932 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39932 *
CVE-2025-39933 (CVSSv3: 9.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39933 *
CVE-2025-39940 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39940 *
CVE-2025-39958 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-39958 *
CVE-2025-40325 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-40325 *
CVE-2025-43342 (CVSSv3: 9.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-43342 *
CVE-2025-43343 (CVSSv3: 9.8): webkitgtk https://nvd.nist.gov/vuln/detail/CVE-2025-43343 *
CVE-2025-47906 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47906 *
CVE-2025-47907 (CVSSv3: 7.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47907 *
CVE-2025-47912 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-47912 *
CVE-2025-49506 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2025-49506 *
CVE-2025-50182 (CVSSv3: 5.3): python3-urllib3 https://nvd.nist.gov/vuln/detail/CVE-2025-50182 *
CVE-2025-52194 (CVSSv3: 7.5): libsndfile1 https://nvd.nist.gov/vuln/detail/CVE-2025-52194 *
CVE-2025-58185 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58185 *
CVE-2025-58187 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58187 *
CVE-2025-58188 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58188 *
CVE-2025-58189 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-58189 *
CVE-2025-59529 (CVSSv3: 5.5): avahi https://nvd.nist.gov/vuln/detail/CVE-2025-59529 *
CVE-2025-61723 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61723 *
CVE-2025-61724 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61724 *
CVE-2025-61726 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61726 *
CVE-2025-61727 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61727 *
CVE-2025-61728 (CVSSv3: 6.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61728 *
CVE-2025-61729 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61729 *
CVE-2025-61730 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61730 *
CVE-2025-61731 (CVSSv3: 7.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61731 *
CVE-2025-61732 (CVSSv3: 8.6): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-61732 *
CVE-2025-68119 (CVSSv3: 7.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-68119 *
CVE-2025-68121 (CVSSv3: 10.0): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2025-68121 *
CVE-2025-71072 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71072 *
CVE-2025-71073 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71073 *
CVE-2025-71074 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71074 *
CVE-2025-71109 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71109 *
CVE-2025-71202 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71202 *
CVE-2025-71225 (CVSSv3: 5.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71225 *
CVE-2025-71227 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71227 *
CVE-2025-71272 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71272 *
CVE-2025-71273 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71273 *
CVE-2025-71285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71285 *
CVE-2025-71313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71313 *
CVE-2025-71315 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2025-71315 *
CVE-2026-1467 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1467 *
CVE-2026-1536 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1536 *
CVE-2026-1539 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1539 *
CVE-2026-1801 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-1801 *
CVE-2026-1940 (CVSSv3: 5.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-1940 *
CVE-2026-2100 (CVSSv3: 5.3): p11-kit https://nvd.nist.gov/vuln/detail/CVE-2026-2100 *
CVE-2026-2369 (CVSSv3: 6.5): libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2369 *
CVE-2026-2436 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2436 *
CVE-2026-2443 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2443 *
CVE-2026-2708 (CVSSv3: 3.7): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-2708 *
CVE-2026-2920 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2920 *
CVE-2026-2921 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2921 *
CVE-2026-2922 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2922 *
CVE-2026-2923 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-2923 *
CVE-2026-3081 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3081 *
CVE-2026-3082 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3082 *
CVE-2026-3083 (CVSSv3: 8.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3083 *
CVE-2026-3084 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3084 *
CVE-2026-3085 (CVSSv3: 8.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3085 *
CVE-2026-3086 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-3086 *
CVE-2026-3099 (CVSSv3: 5.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3099 *
CVE-2026-3632 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3632 *
CVE-2026-3633 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3633 *
CVE-2026-3634 (CVSSv3: 3.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-3634 *
CVE-2026-4271 (CVSSv3: 5.3): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-4271 *
CVE-2026-5119 (CVSSv3: 5.9): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-5119 *
CVE-2026-5450 (CVSSv3: 9.8): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5450 *
CVE-2026-5673 (CVSSv3: 5.6): libtheora https://nvd.nist.gov/vuln/detail/CVE-2026-5673 *
CVE-2026-5928 (CVSSv3: 7.5): glibc https://nvd.nist.gov/vuln/detail/CVE-2026-5928 *
CVE-2026-6429 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-6429 *
CVE-2026-6844 (CVSSv3: 5.5): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-6844 *
CVE-2026-6845 (CVSSv3: 5.0): binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://nvd.nist.gov/vuln/detail/CVE-2026-6845 *
CVE-2026-7168 (CVSSv3: 5.3): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-7168 *
CVE-2026-7246 (CVSSv3: 7.2): python3-click https://nvd.nist.gov/vuln/detail/CVE-2026-7246 *
CVE-2026-8286 (CVSSv3: 8.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8286 *
CVE-2026-8924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8924 *
CVE-2026-8927 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8927 *
CVE-2026-8932 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-8932 *
CVE-2026-9547 (CVSSv3: 7.4): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-9547 *
CVE-2026-11856 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-11856 *
CVE-2026-12064 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-12064 *
CVE-2026-12548 (CVSSv3: 4.2): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-12548 *
CVE-2026-12549 (CVSSv3: 4.8): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-12549 *
CVE-2026-12891 (CVSSv3: 4.3): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12891 *
CVE-2026-12892 (CVSSv3: 4.4): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-12892 *
CVE-2026-18295 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18295 *
CVE-2026-18296 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18296 *
CVE-2026-18297 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18297 *
CVE-2026-18298 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18298 *
CVE-2026-18299 (CVSSv3: 7.8): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-18299 *
CVE-2026-18477 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18477 *
CVE-2026-18508 (CVSSv3: 4.4): tar https://nvd.nist.gov/vuln/detail/CVE-2026-18508 *
CVE-2026-18924 (CVSSv3: 9.1): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-18924 *
CVE-2026-19931 (CVSSv3: 9.8): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-19931 *
CVE-2026-22996 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-22996 *
CVE-2026-23000 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23000 *
CVE-2026-23137 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23137 *
CVE-2026-23191 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23191 *
CVE-2026-23207 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23207 *
CVE-2026-23208 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23208 *
CVE-2026-23213 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23213 *
CVE-2026-23214 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23214 *
CVE-2026-23226 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23226 *
CVE-2026-23239 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23239 *
CVE-2026-23240 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23240 *
CVE-2026-23247 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23247 *
CVE-2026-23265 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23265 *
CVE-2026-23276 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23276 *
CVE-2026-23327 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23327 *
CVE-2026-23348 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23348 *
CVE-2026-23361 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23361 *
CVE-2026-23371 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23371 *
CVE-2026-23377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23377 *
CVE-2026-23383 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23383 *
CVE-2026-23393 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23393 *
CVE-2026-23472 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-23472 *
CVE-2026-25679 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-25679 *
CVE-2026-27139 (CVSSv3: 2.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-27139 *
CVE-2026-27140 (CVSSv3: 8.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27140 *
CVE-2026-27142 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27142 *
CVE-2026-27143 (CVSSv3: 9.8): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27143 *
CVE-2026-27144 (CVSSv3: 7.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-27144 *
CVE-2026-28529 (CVSSv3: 7.8, CVSSv4: 8.5): cryptodev-linux https://nvd.nist.gov/vuln/detail/CVE-2026-28529 *
CVE-2026-29007 (CVSSv3: 5.3, CVSSv4: 6.9): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29007 *
CVE-2026-29008 (CVSSv3: 7.5, CVSSv4: 8.7): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29008 *
CVE-2026-29009 (CVSSv3: 8.2, CVSSv4: 8.8): u-boot-tools https://nvd.nist.gov/vuln/detail/CVE-2026-29009 *
CVE-2026-29518 (CVSSv3: 7.0, CVSSv4: 7.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-29518 *
CVE-2026-30997 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30997 *
CVE-2026-30998 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30998 *
CVE-2026-30999 (CVSSv3: 7.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-30999 *
CVE-2026-31410 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31410 *
CVE-2026-31420 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31420 *
CVE-2026-31462 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31462 *
CVE-2026-31487 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31487 *
CVE-2026-31493 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31493 *
CVE-2026-31505 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31505 *
CVE-2026-31506 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31506 *
CVE-2026-31516 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31516 *
CVE-2026-31530 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31530 *
CVE-2026-31531 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31531 *
CVE-2026-31536 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31536 *
CVE-2026-31537 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31537 *
CVE-2026-31557 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31557 *
CVE-2026-31560 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31560 *
CVE-2026-31568 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31568 *
CVE-2026-31579 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31579 *
CVE-2026-31592 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31592 *
CVE-2026-31606 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31606 *
CVE-2026-31630 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31630 *
CVE-2026-31645 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31645 *
CVE-2026-31663 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31663 *
CVE-2026-31677 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31677 *
CVE-2026-31692 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31692 *
CVE-2026-31706 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31706 *
CVE-2026-31722 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31722 *
CVE-2026-31723 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31723 *
CVE-2026-31724 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31724 *
CVE-2026-31725 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31725 *
CVE-2026-31729 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31729 *
CVE-2026-31767 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31767 *
CVE-2026-31771 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31771 *
CVE-2026-31777 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-31777 *
CVE-2026-32280 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32280 *
CVE-2026-32281 (CVSSv3: 7.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-32281 *
CVE-2026-32282 (CVSSv3: 6.4): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-32282 *
CVE-2026-32283 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32283 *
CVE-2026-32288 (CVSSv3: 5.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32288 *
CVE-2026-32289 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-32289 *
CVE-2026-32327 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-32327 *
CVE-2026-33811 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-33811 *
CVE-2026-33814 (CVSSv3: 7.5): go:go-binary-native:go-cross-core2-64:go-runtime https://nvd.nist.gov/vuln/detail/CVE-2026-33814 *
CVE-2026-34191 (CVSSv3: 9.1): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34191 *
CVE-2026-34501 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34501 *
CVE-2026-34502 (CVSSv3: 7.5): apr-util https://nvd.nist.gov/vuln/detail/CVE-2026-34502 *
CVE-2026-35093 (CVSSv3: 8.8): libinput https://nvd.nist.gov/vuln/detail/CVE-2026-35093 *
CVE-2026-35094 (CVSSv3: 3.3): libinput https://nvd.nist.gov/vuln/detail/CVE-2026-35094 *
CVE-2026-35189 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35189 *
CVE-2026-35191 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-35191 *
CVE-2026-39817 (CVSSv3: 5.9): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39817 *
CVE-2026-39819 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39819 *
CVE-2026-39820 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39820 *
CVE-2026-39823 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39823 *
CVE-2026-39825 (CVSSv3: 5.3): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39825 *
CVE-2026-39826 (CVSSv3: 6.1): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-39826 *
CVE-2026-40393 (CVSSv3: 8.1): mesa:mesa-native https://nvd.nist.gov/vuln/detail/CVE-2026-40393 *
CVE-2026-40962 (CVSSv3: 4.9): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-40962 *
CVE-2026-42499 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-42499 *
CVE-2026-42501 (CVSSv3: 7.5): go-binary-native https://nvd.nist.gov/vuln/detail/CVE-2026-42501 *
CVE-2026-42772 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-42772 *
CVE-2026-43009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43009 *
CVE-2026-43036 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43036 *
CVE-2026-43042 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43042 *
CVE-2026-43048 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43048 *
CVE-2026-43049 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43049 *
CVE-2026-43053 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43053 *
CVE-2026-43073 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43073 *
CVE-2026-43083 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43083 *
CVE-2026-43101 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43101 *
CVE-2026-43107 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43107 *
CVE-2026-43115 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43115 *
CVE-2026-43118 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43118 *
CVE-2026-43125 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43125 *
CVE-2026-43126 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43126 *
CVE-2026-43127 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43127 *
CVE-2026-43153 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43153 *
CVE-2026-43161 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43161 *
CVE-2026-43172 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43172 *
CVE-2026-43185 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43185 *
CVE-2026-43197 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43197 *
CVE-2026-43198 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43198 *
CVE-2026-43199 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43199 *
CVE-2026-43204 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43204 *
CVE-2026-43213 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43213 *
CVE-2026-43234 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43234 *
CVE-2026-43244 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43244 *
CVE-2026-43248 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43248 *
CVE-2026-43249 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43249 *
CVE-2026-43250 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43250 *
CVE-2026-43258 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43258 *
CVE-2026-43294 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43294 *
CVE-2026-43298 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43298 *
CVE-2026-43299 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43299 *
CVE-2026-43308 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43308 *
CVE-2026-43309 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43309 *
CVE-2026-43310 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43310 *
CVE-2026-43317 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43317 *
CVE-2026-43318 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43318 *
CVE-2026-43338 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43338 *
CVE-2026-43344 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43344 *
CVE-2026-43352 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43352 *
CVE-2026-43353 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43353 *
CVE-2026-43414 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43414 *
CVE-2026-43416 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43416 *
CVE-2026-43443 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43443 *
CVE-2026-43464 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43464 *
CVE-2026-43465 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-43465 *
CVE-2026-43617 (CVSSv3: 4.8, CVSSv4: 6.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43617 *
CVE-2026-43618 (CVSSv3: 8.1, CVSSv4: 6.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43618 *
CVE-2026-43619 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43619 *
CVE-2026-43620 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-43620 *
CVE-2026-45232 (CVSSv3: 3.1, CVSSv4: 2.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-45232 *
CVE-2026-45855 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45855 *
CVE-2026-45859 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45859 *
CVE-2026-45861 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45861 *
CVE-2026-45877 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45877 *
CVE-2026-45893 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45893 *
CVE-2026-45894 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45894 *
CVE-2026-45897 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45897 *
CVE-2026-45901 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45901 *
CVE-2026-45917 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45917 *
CVE-2026-45932 (CVSSv3: 7.3): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45932 *
CVE-2026-45934 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45934 *
CVE-2026-45940 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45940 *
CVE-2026-45943 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45943 *
CVE-2026-45944 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45944 *
CVE-2026-45949 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45949 *
CVE-2026-45961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45961 *
CVE-2026-45963 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-45963 *
CVE-2026-46014 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46014 *
CVE-2026-46017 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46017 *
CVE-2026-46032 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46032 *
CVE-2026-46044 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46044 *
CVE-2026-46059 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46059 *
CVE-2026-46066 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46066 *
CVE-2026-46071 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46071 *
CVE-2026-46076 (CVSSv3: 7.9): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46076 *
CVE-2026-46090 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46090 *
CVE-2026-46130 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46130 *
CVE-2026-46147 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46147 *
CVE-2026-46148 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46148 *
CVE-2026-46153 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46153 *
CVE-2026-46157 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46157 *
CVE-2026-46171 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46171 *
CVE-2026-46175 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46175 *
CVE-2026-46181 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46181 *
CVE-2026-46200 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46200 *
CVE-2026-46241 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46241 *
CVE-2026-46245 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46245 *
CVE-2026-46254 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46254 *
CVE-2026-46272 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46272 *
CVE-2026-46282 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46282 *
CVE-2026-46302 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46302 *
CVE-2026-46314 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46314 *
CVE-2026-46324 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46324 *
CVE-2026-46325 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46325 *
CVE-2026-46330 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-46330 *
CVE-2026-50256 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50256 *
CVE-2026-50257 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50257 *
CVE-2026-50258 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50258 *
CVE-2026-50259 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50259 *
CVE-2026-50260 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50260 *
CVE-2026-50261 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50261 *
CVE-2026-50262 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50262 *
CVE-2026-50263 (CVSSv3: 5.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50263 *
CVE-2026-50264 (CVSSv3: 7.8): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-50264 *
CVE-2026-51400 (CVSSv3: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-51400 *
CVE-2026-51401 (CVSSv3: 7.7): vim https://nvd.nist.gov/vuln/detail/CVE-2026-51401 *
CVE-2026-52937 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52937 *
CVE-2026-52953 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52953 *
CVE-2026-52956 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52956 *
CVE-2026-52961 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52961 *
CVE-2026-52988 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52988 *
CVE-2026-52990 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52990 *
CVE-2026-52991 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-52991 *
CVE-2026-53000 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53000 *
CVE-2026-53005 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53005 *
CVE-2026-53009 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53009 *
CVE-2026-53010 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53010 *
CVE-2026-53015 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53015 *
CVE-2026-53017 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53017 *
CVE-2026-53018 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53018 *
CVE-2026-53024 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53024 *
CVE-2026-53025 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53025 *
CVE-2026-53053 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53053 *
CVE-2026-53070 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53070 *
CVE-2026-53078 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53078 *
CVE-2026-53089 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53089 *
CVE-2026-53091 (CVSSv3: 8.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53091 *
CVE-2026-53097 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53097 *
CVE-2026-53102 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53102 *
CVE-2026-53106 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53106 *
CVE-2026-53108 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53108 *
CVE-2026-53109 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53109 *
CVE-2026-53113 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53113 *
CVE-2026-53115 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53115 *
CVE-2026-53118 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53118 *
CVE-2026-53120 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53120 *
CVE-2026-53122 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53122 *
CVE-2026-53129 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53129 *
CVE-2026-53132 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53132 *
CVE-2026-53156 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53156 *
CVE-2026-53178 (CVSSv3: 8.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53178 *
CVE-2026-53179 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53179 *
CVE-2026-53220 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53220 *
CVE-2026-53224 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53224 *
CVE-2026-53226 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53226 *
CVE-2026-53229 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53229 *
CVE-2026-53246 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53246 *
CVE-2026-53258 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53258 *
CVE-2026-53262 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53262 *
CVE-2026-53272 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53272 *
CVE-2026-53284 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53284 *
CVE-2026-53285 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53285 *
CVE-2026-53292 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53292 *
CVE-2026-53297 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53297 *
CVE-2026-53313 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53313 *
CVE-2026-53317 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53317 *
CVE-2026-53330 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53330 *
CVE-2026-53368 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53368 *
CVE-2026-53377 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53377 *
CVE-2026-53401 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-53401 *
CVE-2026-53784 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53784 *
CVE-2026-53786 (CVSSv3: 6.5, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53786 *
CVE-2026-53789 (CVSSv3: 6.5, CVSSv4: 7.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53789 *
CVE-2026-53791 (CVSSv3: 9.1, CVSSv4: 9.1): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53791 *
CVE-2026-53795 (CVSSv3: 8.1, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53795 *
CVE-2026-53797 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53797 *
CVE-2026-53798 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53798 *
CVE-2026-53799 (CVSSv3: 6.3, CVSSv4: 7.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53799 *
CVE-2026-53800 (CVSSv3: 4.7, CVSSv4: 5.7): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53800 *
CVE-2026-53801 (CVSSv3: 5.9, CVSSv4: 8.2): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53801 *
CVE-2026-53802 (CVSSv3: 7.1, CVSSv4: 8.4): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53802 *
CVE-2026-53803 (CVSSv3: 7.8, CVSSv4: 8.5): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-53803 *
CVE-2026-54872 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54872 *
CVE-2026-54873 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54873 *
CVE-2026-54875 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-54875 *
CVE-2026-55653 (CVSSv3: 4.3): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55653 *
CVE-2026-55654 (CVSSv3: 3.7): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55654 *
CVE-2026-55655 (CVSSv3: 5.0): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-55655 *
CVE-2026-55999 (CVSSv3: 8.5): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-55999 *
CVE-2026-56000 (CVSSv3: 7.8, CVSSv4: 9.0): xserver-xorg:xwayland https://nvd.nist.gov/vuln/detail/CVE-2026-56000 *
CVE-2026-56390 (CVSSv3: 6.3, CVSSv4: 4.6): bison:bison-native https://nvd.nist.gov/vuln/detail/CVE-2026-56390 *
CVE-2026-57451 (CVSSv3: 5.3): vim https://nvd.nist.gov/vuln/detail/CVE-2026-57451 *
CVE-2026-63805 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63805 *
CVE-2026-63999 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-63999 *
CVE-2026-64001 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64001 *
CVE-2026-64060 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64060 *
CVE-2026-64070 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64070 *
CVE-2026-64076 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64076 *
CVE-2026-64077 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64077 *
CVE-2026-64078 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64078 *
CVE-2026-64079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64079 *
CVE-2026-64082 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64082 *
CVE-2026-64112 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64112 *
CVE-2026-64117 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64117 *
CVE-2026-64138 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64138 *
CVE-2026-64146 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64146 *
CVE-2026-64154 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64154 *
CVE-2026-64160 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64160 *
CVE-2026-64190 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64190 *
CVE-2026-64210 (CVSSv3: 7.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64210 *
CVE-2026-64212 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64212 *
CVE-2026-64213 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64213 *
CVE-2026-64241 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64241 *
CVE-2026-64255 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64255 *
CVE-2026-64305 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64305 *
CVE-2026-64320 (CVSSv3: 9.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64320 *
CVE-2026-64341 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64341 *
CVE-2026-64377 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64377 *
CVE-2026-64388 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64388 *
CVE-2026-64389 (CVSSv3: 8.2): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64389 *
CVE-2026-64391 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64391 *
CVE-2026-64400 (CVSSv3: 8.6): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64400 *
CVE-2026-64424 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-64424 *
CVE-2026-64830 (CVSSv3: 8.8, CVSSv4: 8.7): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-64830 *
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
CVE-2026-66046 (CVSSv3: 7.5, CVSSv4: 8.7): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-66046 *
CVE-2026-66337 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66337 *
CVE-2026-66338 (CVSSv3: 5.4): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66338 *
CVE-2026-66339 (CVSSv3: 6.5): libsoup:libsoup-2.4 https://nvd.nist.gov/vuln/detail/CVE-2026-66339 *
CVE-2026-67322 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67322 *
CVE-2026-67323 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67323 *
CVE-2026-67324 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67324 *
CVE-2026-67325 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67325 *
CVE-2026-67326 (CVSSv3: 7.0, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-67326 *
CVE-2026-69097 (CVSSv3: 7.0, CVSSv4: 7.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-69097 *
CVE-2026-70457 (CVSSv3: 6.5, CVSSv4: 8.3): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70457 *
CVE-2026-70459 (CVSSv3: 5.3, CVSSv4: 6.9): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70459 *
CVE-2026-70461 (CVSSv3: 8.2, CVSSv4: 8.8): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70461 *
CVE-2026-70463 (CVSSv3: 8.1, CVSSv4: 8.6): rsync:rsync-native https://nvd.nist.gov/vuln/detail/CVE-2026-70463 *
CVE-2026-70628 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70628 *
CVE-2026-70629 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70629 *
CVE-2026-70630 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70630 *
CVE-2026-70631 (CVSSv3: 5.5, CVSSv4: 6.8): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70631 *
CVE-2026-70632 (CVSSv3: 7.8, CVSSv4: 8.5): ffmpeg https://nvd.nist.gov/vuln/detail/CVE-2026-70632 *
CVE-2026-72897 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-72897 *
CVE-2026-73070 (CVSSv3: 5.5, CVSSv4: 6.8): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73070 *
CVE-2026-73076 (CVSSv3: 7.8, CVSSv4: 8.4): vim https://nvd.nist.gov/vuln/detail/CVE-2026-73076 *
CVE-2026-73281 (CVSSv3: 3.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73281 *
CVE-2026-73282 (CVSSv3: 4.8): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73282 *
CVE-2026-73283 (CVSSv3: 2.5): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-73283 *
CVE-2026-73433 (CVSSv3: 6.6): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73433 *
CVE-2026-73434 (CVSSv3: 6.1): gstreamer1.0 https://nvd.nist.gov/vuln/detail/CVE-2026-73434 *
CVE-2026-73619 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73619 *
CVE-2026-73620 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73620 *
CVE-2026-73621 (CVSSv3: 5.4, CVSSv4: 5.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73621 *
CVE-2026-73622 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73622 *
CVE-2026-73623 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73623 *
CVE-2026-73624 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73624 *
CVE-2026-73625 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-73625 *
CVE-2026-75804 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75804 *
CVE-2026-75805 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75805 *
CVE-2026-75806 (CVSSv3: 5.3): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-75806 *
CVE-2026-76217 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76217 *
CVE-2026-76218 (CVSSv3: 7.5, CVSSv4: 7.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76218 *
CVE-2026-76219 (CVSSv3: 8.1, CVSSv4: 7.2): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76219 *
CVE-2026-76220 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76220 *
CVE-2026-76221 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76221 *
CVE-2026-76222 (CVSSv3: 8.2, CVSSv4: 8.4): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-76222 *
CVE-2026-76956 (CVSSv3: 5.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76956 *
CVE-2026-76957 (CVSSv3: 4.9): expat:expat-native https://nvd.nist.gov/vuln/detail/CVE-2026-76957 *
CVE-2026-77696 (CVSSv3: 3.7): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-77696 *
CVE-2026-78675 (CVSSv3: 8.4, CVSSv4: 8.6): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78675 *
CVE-2026-78676 (CVSSv3: 9.8, CVSSv4: 9.3): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78676 *
CVE-2026-78677 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78677 *
CVE-2026-78678 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-78678 *
CVE-2026-80230 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80230 *
CVE-2026-80231 (CVSSv3: 7.5): curl:curl-native https://nvd.nist.gov/vuln/detail/CVE-2026-80231 *
CVE-2026-84782 (CVSSv3: 8.2): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84782 *
CVE-2026-84784 (CVSSv3: 7.5): openssl:openssl-native https://nvd.nist.gov/vuln/detail/CVE-2026-84784 *
CVE-2026-86137 (CVSSv3: 2.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86137 *
CVE-2026-86138 (CVSSv3: 6.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86138 *
CVE-2026-86139 (CVSSv3: 6.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86139 *
CVE-2026-86140 (CVSSv3: 8.0): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86140 *
CVE-2026-86141 (CVSSv3: 2.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86141 *
CVE-2026-86142 (CVSSv3: 6.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86142 *
CVE-2026-86143 (CVSSv3: 6.9): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86143 *
CVE-2026-86144 (CVSSv3: 5.6): libxml2:libxml2-native https://nvd.nist.gov/vuln/detail/CVE-2026-86144 *
CVE-2026-87817 (CVSSv3: 8.8, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87817 *
CVE-2026-87818 (CVSSv3: 6.5, CVSSv4: 7.1): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87818 *
CVE-2026-87819 (CVSSv3: 7.5, CVSSv4: 8.7): python3-git https://nvd.nist.gov/vuln/detail/CVE-2026-87819 *
CVE-2026-89156 (CVSSv3: 2.9): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89156 *
CVE-2026-89157 (CVSSv3: 5.7): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89157 *
CVE-2026-89158 (CVSSv3: 6.5): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89158 *
CVE-2026-89160 (CVSSv3: 3.7): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89160 *
CVE-2026-89161 (CVSSv3: 7.4): libpcre2:libpcre2-native https://nvd.nist.gov/vuln/detail/CVE-2026-89161 *
CVE-2026-98051 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98051 *
CVE-2026-98052 (CVSSv3: 7.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98052 *
CVE-2026-98078 (CVSSv3: 4.4): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98078 *
CVE-2026-98080 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98080 *
CVE-2026-98082 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98082 *
CVE-2026-98083 (CVSSv3: 7.0): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98083 *
CVE-2026-98109 (CVSSv3: 4.7): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98109 *
CVE-2026-98115 (CVSSv3: 8.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98115 *
CVE-2026-98131 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98131 *
CVE-2026-98134 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98134 *
CVE-2026-98160 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98160 *
CVE-2026-98161 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98161 *
CVE-2026-98162 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98162 *
CVE-2026-98164 (CVSSv3: 7.1): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-98164 *
CVE-2026-100074 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100074 *
CVE-2026-100075 (CVSSv3: 9.8): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100075 *
CVE-2026-100076 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100076 *
CVE-2026-100077 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100077 *
CVE-2026-100078 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100078 *
CVE-2026-100079 (CVSSv3: 5.5): linux-yocto https://nvd.nist.gov/vuln/detail/CVE-2026-100079 *
CVE-2026-106587 (CVSSv3: 3.6): openssh https://nvd.nist.gov/vuln/detail/CVE-2026-106587 *

Summary of CVE counts by recipe:
  linux-yocto: 579
  go-binary-native: 37
  python3-git: 26
  ffmpeg: 23
  rsync:rsync-native: 22
  gstreamer1.0: 20
  libsoup:libsoup-2.4: 18
  curl:curl-native: 13
  openssl:openssl-native: 13
  xserver-xorg:xwayland: 11
  u-boot-tools: 10
  libxml2:libxml2-native: 8
  openssh: 7
  go:go-binary-native:go-cross-core2-64:go-runtime: 5
  apr-util: 5
  vim: 5
  libpcre2:libpcre2-native: 5
  webkitgtk: 4
  expat:expat-native: 3
  libsndfile1: 2
  glibc: 2
  binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native: 2
  tar: 2
  libinput: 2
  python3-py:python3-py-native: 1
  python3:python3-native: 1
  python3-urllib3: 1
  avahi: 1
  p11-kit: 1
  libsoup-2.4: 1
  libtheora: 1
  python3-click: 1
  cryptodev-linux: 1
  mesa:mesa-native: 1
  bison:bison-native: 1

For further information see: https://valkyrie.yocto.io/pub/non-release/patchmetrics/

