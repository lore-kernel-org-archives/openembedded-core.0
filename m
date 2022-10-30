Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAD33C38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 13:02:54 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web10.8058.1667134965048671172
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 06:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jBNlsGnO;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id f193so8640999pgc.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 06:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ty/4bc8bAlWP3vjx9Hg7fqVFvoIrz+5amc6FQ13S6s4=;
        b=jBNlsGnOHE4/0qU/7nn3VBXNI3UQmdaoddgfcVXaX8PO/vtzaR6sXz8Q5FfQyUkzFf
         llXm0LWOnmzPMpo6536rAgNMbAuKdMLpT2AxGpRwMF+7FP/7iDL96gfkW+92FDjhJZ2j
         BRMW1xIyzM/IaVMKdUq0A5BhOI+U5hEW0XBkAgBf2gb4zPjRg3yyLKU0Wuz0dAiaUrEQ
         YpZf8isamwNFv+s3Qq5ADeT3dlNHO10Hau2Mmg2bvlHYsImMXGNgQ0kDRiTOJpMoPwCS
         xAz29JZv64ztwmzlklGpVCaLqV3r+N8TAcEVwd+7iRbvaBv+xcWJHYykbx7m4FSN/EW+
         Vg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ty/4bc8bAlWP3vjx9Hg7fqVFvoIrz+5amc6FQ13S6s4=;
        b=o0gI6M27ROHkuOuVJJ6R6u3iPj1v5M/Tkk5OMitfywSd1nql2HJZ0ZENMrdukQB5aT
         eu5+B6d6tAY2dndjKsLL6DnKjlJU5ngoT94eYBdbDTA3hXlxc+ujGLxg+zRO3JjwnYww
         wWt/Dk5oe83GTjU/9+TnZsg4s1DpLV0o37uQC06U5FpvaZKVtGjZt7pq3dZZAym2byxW
         T9FOuXR7EDR2m9c9M9s4gjKbginADz+bi/Zdd6VwDpavmJW3XOCJBsBVCKcabcymu6sQ
         BW1V71B+AoL62ojCdPjwG1Wyc+gLpSr5L4SuFIw6AdPFZAaZZMKGssPALrCAjEgzRkFQ
         Gxzw==
X-Gm-Message-State: ACrzQf3XT035n+GxGFGD8mYg0/+uppL4Ic9yIdN4T60algNfGDNPtJyK
	Sm6TqXIE9m9l+juI5q/d9MXjp1FvXd2EyyqG
X-Google-Smtp-Source: AMsMyM6vJo4A652QS+9rWu7A385i8Z92PkWSPx8DTVShKoyr9MA6r2awMcEBxrrTWdkcNFOIRFSEoA==
X-Received: by 2002:a63:5352:0:b0:46f:be60:ae55 with SMTP id t18-20020a635352000000b0046fbe60ae55mr326595pgl.615.1667134964096;
        Sun, 30 Oct 2022 06:02:44 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id qe13-20020a17090b4f8d00b001fe39bda429sm2365026pjb.38.2022.10.30.06.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:02:43 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9C6B396219F; Sun, 30 Oct 2022 03:02:41 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 30 Oct 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221030130241.9C6B396219F@nuc.router0800d9.com>
Date: Sun, 30 Oct 2022 03:02:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 13:02:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172280

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *

Removed this week: 1 CVEs
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *

Full list:  Found 27 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2021-3782 (CVSS3: 9.8 CRITICAL): wayland:wayland-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3782 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-2953 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2953 *
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3554 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
CVE-2022-3555 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3555 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-41556 (CVSS3: 7.5 HIGH): lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41556 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

