Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.9480.1612361047731721318
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Feb 2021 06:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jHWDJjFQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: idadelm@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id u14so2571342wri.3
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Feb 2021 06:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=7M4TrJJkNvv1NctnIn0bBBIlz1raCUWiSMDuQW5dBM8=;
        b=jHWDJjFQawHb0T85TTYPGRG5MsOARtStea+8HmqoKhLQlsWoHyzLg26/1tsF7u62LQ
         mVYJirifcbqV5hm77EO5ZpAGNFw0oA9B20mElZXn0GndruTDj1ilauTN7Figzp9emaQn
         Lqa22LgQynvrNVbQM4Lnb+dLMCnVDqFi62UbBzLCrN2YFHsSMSezrfum6npmYP9x43ib
         SyALEF5owoLag2bJI/Oj+q5MtHIORMHUJNnSpifsL3SpZ0j+uvpATGbf7Bc2kEHsZYk6
         uoLrYGkdoea9UIU7mGd9PfuScrLNCd1j7dWUahOEnO66vFcUOynEt2Y/opTv8hkpCoux
         F/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7M4TrJJkNvv1NctnIn0bBBIlz1raCUWiSMDuQW5dBM8=;
        b=phvH1AdOv3HuEuDF1r/04IXog9Ve+Zyz6RtXAl5vjB8Ez7qo+Ts/QR8ot6XAJBCY8a
         SiclLkY2GshvUfSdvOODbBq//esFxFYFBmIuoU3JaIzwbHne5xjpieuFZAk0ByGYd5xi
         LbWWUpdJS647qy08csRDG5PGROTVXzCGKW6FOanjAby66Lau/kzwgP6B+URoG68iS/mV
         /Lj+JOdEZFofZ91foYra7xW1tv41KObxd342J2hiCLXxOmZSbu/846kZa5x5xw66K3pe
         d2q22bD5JYETw89XiO2sKs+PJvl67KEuNIudOHMjXXBe+qxWJ0c+04IB9JGgCH/ciqQ1
         rUdg==
X-Gm-Message-State: AOAM530P2S/HOS6jBwdpuA/YsdRSKhXS/OjpLWjZANhrgyG2nQkt1rqx
	WCbi8VBz9Hy9s++o0nXuwDt61/DnERR4eA==
X-Google-Smtp-Source: ABdhPJzSj5mDidKtg8Tc12MDdwR3b+4X02zudvOqDScoF1ROHv9UX0TNfosFoKnlSgC5IY5asx5P2g==
X-Received: by 2002:adf:f40d:: with SMTP id g13mr3726409wro.142.1612361046202;
        Wed, 03 Feb 2021 06:04:06 -0800 (PST)
Return-Path: <idadelm@gmail.com>
Received: from ida-pc.lan ([41.202.219.240])
        by smtp.gmail.com with ESMTPSA id m10sm3903005wro.7.2021.02.03.06.04.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 06:04:05 -0800 (PST)
From: "Meh Mbeh Ida Delphine" <idadelm@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta][RFC PATCH 2/3] package: Remove false positive lic warnings
Date: Wed,  3 Feb 2021 15:03:40 +0100
Message-Id: <20210203140341.130251-2-idadelm@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210203140341.130251-1-idadelm@gmail.com>
References: <20210203140341.130251-1-idadelm@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With the IGNOREWITHLINUXSYSCALLNOTE variable set to "1" in local.conf, it removes the "WITH Linux syscall note" string attached to the license value for sources before comparism.
This is to get more recipe LICENSES to match with those of the sources and reduce the number of warnings outputed.

Signed-off-by: Ida Delphine <idadelm@gmail.com>
---
 meta/classes/package.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index c3259146b6..14c8475cfa 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -1774,6 +1774,10 @@ fi
                     if l.endswith('-or-later'):
                         lic_ = l.replace('-or-later', '+')
                         computedpkglicsperpkg.add(lic_)
+                    elif l.endswith(' WITH Linux-syscall-note'):
+                        if d.getVar("IGNOREWITHLINUXSYSCALLNOTE") == "1":
+                            lic_ = l.replace(' WITH Linux-syscall-note', '')
+                            computedpkglicsperpkg.add(lic_)
                     else:
                         computedpkglicsperpkg.add(l)
             if spdx_lic - computedpkglicsperpkg:
-- 
2.25.1

