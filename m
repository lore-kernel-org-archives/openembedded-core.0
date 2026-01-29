Return-Path: <valentin.boudevin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BB1BD73E91
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 21:10:22 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.25818.1769721020748676146
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jan 2026 13:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jmGh6htq;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: valentin.boudevin@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8887d6d237fso2119646d6.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 13:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769721020; x=1770325820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=jmGh6htqez6Iz496DDZCTD3lBc+h4XNraNpRneTqlt77xkpzNqryV5VPf57ftPXSAe
         cojAwukHH02L2ao7qvGponhzmJ4UFTAjHK5uVJH2qo7YCVNlmQ5gvSn6tAGCJ8KbOsEU
         fdV4Zdr3rI83VTQ/99deTjSSqpF5+8AcETadJPgNxHv1hzINceRDiODGJot/XOWgwj+f
         r6HA+vvMr3XKPsIw4TrUefw9qPjd1j/caomtrMg2L2UJrNWOIhh5ZcDu6DIhOx7+4zMF
         7MZa5ZfB+z/nYh2oyeudotKWbVjb8ovsWDGqiSoGZh9S1OomLlvYpP0Nazhacxa78iGU
         bJKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769721020; x=1770325820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjxYzvvWf4Cu4hPx/VkxvgapdI94Oxv2FhCFriptyZY=;
        b=iko7eGKhyrEix7ggpGUq/vEJtus6eMXLcHA1e+7KtzfF7AFbGuJES2nTugpFRI/8y1
         wHCc9nsdQLBghjIc2cQzFLQLJ5t/9J7DojGWZVkhNdKJYxNAYo35mwqtQtzfcdTGoxjT
         cglabsiYWSJQB4yPg+roHSBX57is4g3aBLtxGE77Mk8RJimT5ewsNzpxHIIJF1Aa033Y
         eIti1ASNVAb7E7lrkWxuMqnPFE0dmS6f4e98/dP5EkjNyyHPyzkXXyurfplLAjZDCcDD
         Kqq1toLHd7lAVbOQF5VsM43/DXhTo4jzQGolL8BYKD9YjCnI8nl1AsgakViCdD9r0x7k
         yVrg==
X-Gm-Message-State: AOJu0YxwdPCkYYxE4E24/J04U6/bCSyRY7KptAWxRaJ8y1BuFIrm5+/i
	p1vdA+IJ77zFUcVMgS9pc0dT7NJGPx9zLJsyhnOUr+B2A0i3UqUfk0E/JQxvL7Wt+x4=
X-Gm-Gg: AZuq6aL0h4TpQu+DttzKbcm8zxVdd0GESmv4HMhBO4Nkj6EYuYdczuSjXzMk6b1hEbf
	uM8hv/Jwjv0BzaQYFd7fy2/3g8BuIshLj8lJmi5gX5s4z3ZSOeVHyDtH6v/nSA0K8kxHnka1scs
	Njf9zfLXg3DoYmiq4ITfbwzRz317ndZ/3B/Ns826SmbE7PN7SzdV7JOgt+BNZhQnJPiesTqekOn
	bt5qPjmnFZ6HMN0Lx6H8OdalYL4HsbJD4m6vh1ACPltyE8roh2anCUNvbbsrD6cyUIkXZFYZbpz
	ZETXtP384Ri0wDK3sT0o8iK/JwWJCDizHjKol29IxUDAR0lQTIzdv38zRXKJ/RGA6gWDg5UaaAH
	858x/bGoFwDDU4FLKd7kVaH4mtu+9/TBrLl+M8bz53jHXK9tqMFnfqlQAIbwRYuUJl2+I+RTfU0
	OEAhnQoDDSloMzcyRzn3wsJCfRPcv/+3uG5UpsfFhbGqh+RDCzl8J33kA=
X-Received: by 2002:a0c:e008:0:b0:894:9617:d527 with SMTP id 6a1803df08f44-894e9db2dcemr9255356d6.0.1769721019788;
        Thu, 29 Jan 2026 13:10:19 -0800 (PST)
Received: from vboudevin-pc.mtl.sfl (mtl.savoirfairelinux.net. [208.88.110.46])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-894d36a5fb1sm45251326d6.9.2026.01.29.13.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 13:10:19 -0800 (PST)
From: ValentinBoudevin <valentin.boudevin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: daniel.turull@ericsson.com,
	jerome.oufella@savoirfairelinux.com,
	ValentinBoudevin <valentin.boudevin@gmail.com>
Subject: [PATCH v6 4/4] generate-cve-exclusions: Move python script
Date: Thu, 29 Jan 2026 16:10:12 -0500
Message-ID: <20260129211012.623827-5-valentin.boudevin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260129211012.623827-1-valentin.boudevin@gmail.com>
References: <188AFCD98EA3E578.3200434@lists.openembedded.org>
 <20260129211012.623827-1-valentin.boudevin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Jan 2026 21:10:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230163

The script should be located with other scripts in scripts/contrib
instead of staying in meta/classes/.

Update the new .bbclass to match this modification

Signed-off-by: Valentin Boudevin <valentin.boudevin@gmail.com>
---
 .../linux => scripts/contrib}/generate-cve-exclusions.py          | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta/recipes-kernel/linux => scripts/contrib}/generate-cve-exclusions.py (100%)

diff --git a/meta/recipes-kernel/linux/generate-cve-exclusions.py b/scripts/contrib/generate-cve-exclusions.py
similarity index 100%
rename from meta/recipes-kernel/linux/generate-cve-exclusions.py
rename to scripts/contrib/generate-cve-exclusions.py

