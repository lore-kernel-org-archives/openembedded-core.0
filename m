Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D579C0502A
	for <webhook@archiver.kernel.org>; Sun, 28 Aug 2022 12:02:49 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.58492.1661688160823507456
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 05:02:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=U6ZWgOps;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.46,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f46.google.com with SMTP id
 c16-20020a17090aa61000b001fb3286d9f7so10575507pjq.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Aug 2022 05:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc;
        bh=MD19QFciEpoWCW9vPQJ11Mq8CFuf8qMNgSK/KLrOWr4=;
        b=U6ZWgOps47ljp9+RT5A03ENksDTnMbH32zmh+jeCoVK0Fg5teGr+4zw+fac2cOJd41
         jyc544EmBJ0Opow+bJYEhlaUCQi4mVMoqv5Vc7nXtWOS28syaJCP/FNMh063g8NLfo+l
         8chQnyHgUYJ9ZBkvY48UkNiSsINh9qxVP6bFToqQU+BbzYk6Ca04nKT+M3k/KRD1QJx9
         aJS8CDd0vG6OVFBFeIXazdh74F1yDk2fXjH1hi6sK3eOE3Cmah+CT9fQ5x9d8cCmOnao
         z9bmKvse/bHIIS4jBihwToi2Aypzo5b4nCI0F1Lb8Tf/Cnr86p5gUR9GkzXk3Z54MS1G
         fU6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc;
        bh=MD19QFciEpoWCW9vPQJ11Mq8CFuf8qMNgSK/KLrOWr4=;
        b=IwlUqqq/KG4B9Qb0Q9uzxEfWE4Jz7DWtJOh23nDFplZFQqoC3sRaec8YUcssfUfVtP
         qL2VjkX8UR5YuvJ7FGDJRDzzb+w7CbY0EkTuXc1mfA4CcY0KQTsTU4joFFlrgIn9aBLC
         Mi8ias24Jyl2QRz4pOSL3TOv5s3l6CXp1ADRHsiTpzZkrKEmlXUmHWQc4dg4u6GaX+TR
         x3gQEthHV+MkvrqRmNNBlp+GypHHydy9UbLFFx7hXmMaJHuT/k/HkFlr5uw+c4itF2cS
         Tv/aaxrjZKg9iKk9Uv5oP2K+D0FvRWfWW07Iaqllyn838zmVFDt/3bbsboJzVlVSEyHY
         ikYg==
X-Gm-Message-State: ACgBeo3hQNWoCEE48Hh/Bcsx0HaAZ1J9PnJdTwUkiDBABqIeL+0mvt5j
	JPfwr3INct0Ubzw4LMIxamH6AcrTf8zq/QNz
X-Google-Smtp-Source: 
 AA6agR5xlrmQH+5h0DpOvtRQxVFgRHEpXs2YJDDUDWah9WY8ZlxtaIKvLYGArPD2e+4WTsKQFGxEfA==
X-Received: by 2002:a17:902:e88c:b0:174:c448:11a2 with SMTP id
 w12-20020a170902e88c00b00174c44811a2mr467976plg.8.1661688159672;
        Sun, 28 Aug 2022 05:02:39 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 w1-20020a170902ca0100b00174be817124sm450783pld.221.2022.08.28.05.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Aug 2022 05:02:39 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 1121A9623B1; Sun, 28 Aug 2022 02:02:37 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 28 Aug 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220828120237.1121A9623B1@nuc.router0800d9.com>
Date: Sun, 28 Aug 2022 02:02:37 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Aug 2022 12:02:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169981

Branch: master

New this week: 4 CVEs
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *

Removed this week: 12 CVEs
CVE-2021-46828 (CVSS3: 7.5 HIGH): libtirpc:libtirpc-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46828 *
CVE-2022-2816 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2816 *
CVE-2022-2817 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2817 *
CVE-2022-2819 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2819 *
CVE-2022-2845 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2845 *
CVE-2022-2849 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2849 *
CVE-2022-2862 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2862 *
CVE-2022-2867 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2867 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2869 (CVSS3: 8.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2869 *
CVE-2022-2874 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2874 *
CVE-2022-2889 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2889 *

Full list:  Found 4 unpatched CVEs
CVE-2021-3521 (CVSS3: 4.7 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3521 *
CVE-2022-2946 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2946 *
CVE-2022-2980 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2980 *
CVE-2022-2982 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2982 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

