Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBB5D711A1
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 20:22:53 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2016.1766089369396839900
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 12:22:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aqli/Y8Z;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-889a865bc1dso8315316d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 12:22:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766089368; x=1766694168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/qB2tdPsproDCIn7p10SFAAqSpqPVp1E+S5MXPbdRH0=;
        b=aqli/Y8Zg6+BKjimv4eU7r3sBIwxP/lR7pzPYS685IK9nVDjldUVFT5FPxQlDSaUDV
         OouLP1Zd8bBhiAHR6j03Q4iScv+jgQGpkuW3uGtvk060QT5NjBbrXuGi6zqdWDWp+/fh
         SRoGkbEKD9wd97xjmfDBPJ/qoVkc7EwwGIK1NbSHYRWdoLBxkZ0Ab1E26sROHzFcP9LC
         gKmtwypH2eUU4HfrEhYaksRUeVt0nvYCLwDNBDWOhywqZzQhUyrF6MiwYGcv7VndW73S
         Z6jGg2brVzAr2whgDXVcu2RqqelQZ4kr7oDRsQPK4X6pybMYIDsTolGfTpbq2l+8/eWN
         R1zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766089368; x=1766694168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/qB2tdPsproDCIn7p10SFAAqSpqPVp1E+S5MXPbdRH0=;
        b=TQ3sMbZBncRqLcVwXHlWiSeuf3WDehpA4p49EZ3oSwaGTCZQCGt1oWHlXE3p4+5rDF
         dvP4qh/c49xDFHgCeDTNvJeSq4bIOQd0ELkIHBWh7meyzYirZJBOzqQABZdV4P8+z9Q5
         lzQGgk12FIa5XrAekPV/p6TxcIMETqPHoWsOHo9naWs/V3Q6GrP5l3oAlX9DVElPofio
         fVuXBkjJPy1WN6u+oGn6ejCVQQQXFrlhVjXaG8S1nYVYbnll/oz2OQH0B+n93UtuJMba
         vtc5xksD+EEPcpGj5bA2bDqGoJajpFlvgG6vL4Fca58XhYwF3RCmmZLI9VrpcWfqyCwm
         1jBQ==
X-Gm-Message-State: AOJu0Yw7uLYhpLO8qsHwgKx6IsQ7PSbGkY3r8MfUImjGKO2u6827M1we
	pbL/U41U+Qp5IyuqjWnVSgIy6V49RBzhP4OS2eGWEE4H+WlCKlMYXAq+YJa4TRehgsk=
X-Gm-Gg: AY/fxX4sEXNHb4oiVbHe77Q7EAyl3bUwgWSHHNpXjlRvmGtuEs/mTF9VBHZ59iACYLL
	aYsmtenSzL3982b7UOJynGY1VUd8Ygu4K3y575uwQ9ZTXwmZqGUIVI0smTwUYPefFqQsotezX7Z
	ne64C1IfjEmx5U0W3igdZvLp/kC0sXxEfRY1vmV/QQP6Sg5cBdfe2FV9kaGaKrkr0k1mqGyaaEL
	Wb6zL1VgY85XsOS89eSTxudBSFICgYS1fiHKApKla5KMneGp8zL0l2fWZcoz8hsSMG2DsXrfZdV
	KPuIA5RtFS/CBu9smatsQHsPj+JHy1Bo4NWihWFjpQ6VOYc5eEBWxLfxNSIM9hvARvNjOfDJBZ8
	hSvv88nWw9yW8PfVJ7Nuoj04RYUKynkdeFERDS6TjoG278BL9BsvI+v3L/6JBbiMusjXVNUzSB1
	VALGwnmXWa+GmOPrJtkpQMy4uD34GB0y6EXzI1t9vW2TEG7UINNufJ8WGSLufjxw5CzESm3RD/1
	mS/Nsx5I2hclGg=
X-Google-Smtp-Source: AGHT+IETcRvidXKZ4yhX48HBXy6NN2GPm+gnEXmUF0aSO5FcInkO30dxaWGFktpnEky3S0ZmTe6Y3w==
X-Received: by 2002:a05:6214:4306:b0:888:7c7e:fce1 with SMTP id 6a1803df08f44-88d81667a1fmr16680096d6.4.1766089368278;
        Thu, 18 Dec 2025 12:22:48 -0800 (PST)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7dbdcsm3226456d6.43.2025.12.18.12.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 12:22:47 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/21] linux-yocto: combined and consolidated pull request
Date: Thu, 18 Dec 2025 15:22:25 -0500
Message-Id: <cover.1766087617.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 20:22:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228143

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Hi all,

As discussed in the weekly engineering call, I'm sending this as
single series even though it crossed boundaries of the repositories.

I don't have access to meta-yocto-contrib yet, so I haven't pushed
the component parts to contrib branches yet, but will do that for
future pull requests.

I'm using this as a first run through some things I've cooked up
to coordinate the patches across the repos. The formatting is my
own, so apologies if it isn't clear .. and we'll see if it all 

Now to the series for OE-core:

 - We have stable updates to 6.12
 - A kern-tools fix
 - Updates to 6.17
 - Removal of 6.17
 - Introduction of 6.18
 - Bump to libc-headers to 6.18

I've built and booted what I can locally, and I know that the
major architectures work, and are functional with respect to
core features.

I have more libc-headers testing running against meta-oe and
muslc, so there may be some breakage there and I'll help deal
with that if it happens.

The update and then removal of 6.17 is on purpose. In case any
one was using it, they should get the latest tested before it
starts to be removed.

For meta-yocto:

  - removal of any remaining 6.17 references
  - introduction of 6.18

The meta-yocto default changes are obviously REALLY RFC/RFT
there will be issues, but I've provided them anyway to make it
clear that we are going to 6.18 as the new default for all the
variants.

Once we get 6.18 fully green and the h/w references udpated,
I'll remove 6.12 and 6.16 from master. That isn't in this series
by design.

Cheers,

Bruce

Aggregate summary of exported patches:

 - openembedded-core branch=master : 15 patches
 - meta-yocto branch=master : 6 patches

Changes:
  [01/15][openembedded-core] kern-tools: fix commit SHA reproducibility 
  [02/15][openembedded-core] linux-yocto/6.12: update to v6.12.61       
  [03/15][openembedded-core] linux-yocto/6.12: update CVE exclusions    
  [04/15][openembedded-core] linux-yocto/6.12: update to v6.12.62       
  [05/15][openembedded-core] linux-yocto/6.12: update CVE exclusions    
  [06/15][openembedded-core] linux-yocto/6.16: rust kernel configs      
  [07/15][openembedded-core] linux-yocto/6.17: update to v6.17.11       
  [08/15][openembedded-core] linux-yocto/6.17: update CVE exclusions    
  [09/15][openembedded-core] linux-yocto/6.17: rust kernel configs      
  [10/15][openembedded-core] linux-yocto/6.17: drop recipes             
  [11/15][openembedded-core] linux-yocto/6.18: introduce reference      
  [12/15][openembedded-core] linux-libc-headers: update to 6.18         
  [13/15][openembedded-core] linux-yocto/6.18: rust kernel configs      
  [14/15][openembedded-core] linux-yocto/6.18: update to v6.18.1        
  [15/15][openembedded-core] linux-yocto/6.18: update CVE exclusions    
  [01/06][meta-yocto] yocto-bsp: introduce 6.18 h/w reference           
  [02/06][meta-yocto] yocto-bsp/6.17: drop bbappend                     
  [03/06][meta-yocto] poky-tiny: make 6.18 preferred kernel version     
  [04/06][meta-yocto] poky: make 6.18 preferred kernel version          
  [05/06][meta-yocto] poky-alt: make default kernel 6.18                
  [06/06][meta-yocto] yocto-bsp: genericx86: bump default kernel to 6.18

---
Diffstat:
  openembedded-core:
    .../kern-tools/kern-tools-native_git.bb            |    2 +-
    ...-headers_6.17.bb => linux-libc-headers_6.18.bb} |    3 +-
    meta/recipes-kernel/linux/cve-exclusion_6.12.inc   |  632 +++++++++++-
    ...e-exclusion_6.17.inc => cve-exclusion_6.18.inc} | 1040 ++++++++++++++++----
    meta/recipes-kernel/linux/linux-yocto-rt_6.12.bb   |    6 +-
    meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   |    2 +-
    ...nux-yocto-rt_6.17.bb => linux-yocto-rt_6.18.bb} |   12 +-
    meta/recipes-kernel/linux/linux-yocto-tiny_6.12.bb |    6 +-
    meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb |    2 +-
    ...yocto-tiny_6.17.bb => linux-yocto-tiny_6.18.bb} |   12 +-
    meta/recipes-kernel/linux/linux-yocto_6.12.bb      |   28 +-
    meta/recipes-kernel/linux/linux-yocto_6.16.bb      |    4 +-
    .../{linux-yocto_6.17.bb => linux-yocto_6.18.bb}   |   52 +-
    13 files changed, 1526 insertions(+), 275 deletions(-)

  meta-yocto:
    meta-poky/conf/distro/include/poky-distro-alt-test-config.inc         | 2 +-
    meta-poky/conf/distro/poky-tiny.conf                                  | 2 +-
    meta-poky/conf/distro/poky.conf                                       | 4 ++--
    meta-yocto-bsp/conf/machine/include/genericx86-common.inc             | 2 +-
    .../linux/{linux-yocto_6.17.bbappend => linux-yocto_6.18.bbappend}    | 4 ++--
    5 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.39.2

