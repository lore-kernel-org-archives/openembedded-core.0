Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C668ECAC58C
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 05:08:37 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.9969.1757480907794943967
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Sep 2025 22:08:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U0QhpMWc;
 spf=pass (domain: gmail.com, ip: 209.85.160.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4b5fb2f7295so35201311cf.1
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Sep 2025 22:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757480907; x=1758085707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wUZ4p9ycQ5wBN6DeFJSBRNZ4Z6MZ/6rkSZyh7uv5o88=;
        b=U0QhpMWcGAkKNF3MRjBt9rv43S51EA6MN0hTxJpcIy9N/PfqMKOuAEk0TVzpXdGVKD
         7aJNTW9tNE39+jf6OjO96L/Jv5P9WRAMiu24gbUOsnPd47jJWxIXWguq6TT3EoheRqEF
         t3VfoFxbCwquur5eGdddJOl73g1GMn/Y+3mF0wuTRLQoEY0w4J7U9+nzgDGj2r4hD2jp
         lZpNV91Z39YdFulEmmfaL1UyDDBvuml3JOiIDHPaOPylr9ipShVoEQg4WusHvJqaWjyO
         Bqy8A1hIWxwbzZbhu5qy/L6+LHW8WsPwhuL/q7F6JsdJ8fNseGYN16O1DhqKjRkEt/wx
         lC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757480907; x=1758085707;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wUZ4p9ycQ5wBN6DeFJSBRNZ4Z6MZ/6rkSZyh7uv5o88=;
        b=AhbZl5Z3dj7aF1nPzmV8FgSqixGhlYpD7IIrRs6QLdYQNlxSr8NrQSflZhyS/Id7lS
         RMjw6zODz+1y0mYrZeACarRgWfLYuO8qB7G7XH7RKZqtDg3t5Lq2Tz7Ifm/TYchdl9VC
         iyV6SQZdK+FexAQbbWj4cYOBfIVmsDZugL76iwgq0STVP+ToiOG58265oR7ImJy//OzD
         i5xZ1VfqVs3aD0dv1r93+zIvW+g2wAv8HbFWyXckbYC2F4QVAuA8KsFj9KxKzx5T/H/j
         XBFoXb7YXhOY+pPre8caGiqUR0ymlYx/uNEs/6DBKbDsURjzAPZImhqjuUt+huJci2eB
         lX5A==
X-Gm-Message-State: AOJu0YyvyJMugzhH6W0jnhICOh4Hi5KzJOVt9hQeFO7h3r+rH/qDbJe1
	6yxQ7MKYO8p/HrpsA7YT10p7KjWllsL6Hfuu0UfsQLGaSNXkxJq06O6t
X-Gm-Gg: ASbGnctpcYg2kviEHHzIyLu2Cbysn8JLW0itVBAd6HbsGuGuMvHdeNzCwKPh8uBw55N
	wSyhIB0FNJroz2n9HCf4/ZT5BZ/dEu95lRH/z2DZwtq3On2HcX73M1rC2gxYgn7YI6Gycm0x5hE
	1APM0cPeCTgqIcoEx7gsuaqKGFwag7SSPXOhTaaQAZvefNZIUFBubTn+fIqvYCY1t7IJZD3H94Y
	P4eGXirauwTHYVx9ltQI+NGeM2FFuUH9LBy1Iu+x5AjU3jwg7Sdg3vVMa0L6li9OWOMXijTHB7K
	opdRWbCxaia961+8Y6ngPiJUfK1WK4egB0leLzdVmWByDx07DaF/4tzHakDnkCv79t7BLcKm/LT
	ftDa/ym5BfNtJ+ICjpnMVPFGU6Ndvg+spsBNI9KA/jvyXUTineUpIQOtBAYTTH0IKQ/lxl34Bm9
	PP8Bo+3mmkSSQ+KhUVyNUvHBAwilFoDPpyTeQVtyb8lXxB0OwrHNujgMc=
X-Google-Smtp-Source: AGHT+IE55XAAcUMy9sljdL+O1zFuoS1dRFUSAqouWuI8gAtdpn9eExczo8A4KObdLqx31gPJlq761g==
X-Received: by 2002:a05:622a:428e:b0:4b5:e12b:9cd with SMTP id d75a77b69052e-4b5f85b0a4emr151907201cf.84.1757480906675;
        Tue, 09 Sep 2025 22:08:26 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ed72c49sm227866685a.51.2025.09.09.22.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 22:08:25 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org,
	ross.burton@arm.com,
	mikko.rapeli@linaro.org
Subject: [PATCH 2/4] linux-yocto/6.16: cfg: x86 BIGSMP removal
Date: Wed, 10 Sep 2025 01:08:20 -0400
Message-Id: <20250910050822.3273330-3-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
References: <20250910050822.3273330-1-bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Sep 2025 05:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223144

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to linux-yocto/.:

1/1 [
    Author: Bruce Ashfield
    Email: bruce.ashfield@gmail.com
    Subject: x86: drop CONFIG_BIG_SMP
    Date: Tue, 9 Sep 2025 16:07:38 -0400

    commit 0abf508675c0dbbca6a387842f90db60756c4af5
    Author: Arnd Bergmann <arnd@arndb.de>
    Date:   Wed Feb 26 22:37:06 2025 +0100

        x86/smp: Drop 32-bit "bigsmp" machine support

        The x86-32 kernel used to support multiple platforms with more than eight
        logical CPUs, from the 1999-2003 timeframe: Sequent NUMA-Q, IBM Summit,
        Unisys ES7000 and HP F8. Support for all except the latter was dropped
        back in 2014, leaving only the F8 based DL740 and DL760 G2 machines in
        this catery, with up to eight single-core Socket-603 Xeon-MP processors
        with hyperthreading.

        Like the already removed machines, the HP F8 servers at the time cost
        upwards of $100k in typical configurations, but were quickly obsoleted
        by their 64-bit Socket-604 cousins and the AMD Opteron.

        Earlier servers with up to 8 Pentium Pro or Xeon processors remain
        fully supported as they had no hyperthreading. Similarly, the more
        common 4-socket Xeon-MP machines with hyperthreading using Intel
        or ServerWorks chipsets continue to work without this, and all the
        multi-core Xeon processors also run 64-bit kernels.

        While the "bigsmp" support can also be used to run on later 64-bit
        machines (including VM guests), it seems best to discourage that
        and get any remaining users to update their kernels to 64-bit builds
        on these. As a side-effect of this, there is also no more need to
        support NUMA configurations on 32-bit x86, as all true 32-bit
        NUMA platforms are already gone.

        Signed-off-by: Arnd Bergmann <arnd@arndb.de>
        Signed-off-by: Ingo Molnar <mingo@kernel.org>
        Cc: Linus Torvalds <torvalds@linux-foundation.org>
        Link: https://lore.kernel.org/r/20250226213714.4040853-3-arnd@kernel.org

    Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
]

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_6.16.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
index 76654ff516..1d44936da4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.16.bb
@@ -15,7 +15,7 @@ python () {
 }
 
 SRCREV_machine ?= "c631c6cf05de829937afe048e6ae2fea15634cc8"
-SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
+SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.16;destsuffix=${KMETA};protocol=https"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
index c2953c5619..8764c21490 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.16.bb
@@ -18,7 +18,7 @@ KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
+SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 7bafd22ef4..4bf5fa53c5 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -29,7 +29,7 @@ SRCREV_machine:qemux86 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemux86-64 ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
 SRCREV_machine:qemumips64 ?= "2459c29bf2c3d221fd6d3222c7200b368156986e"
 SRCREV_machine ?= "01bcf423b031a36a070c7a983e45992e634fceb7"
-SRCREV_meta ?= "29767181a0c0a97c8ba4941f6834044d9ffaed86"
+SRCREV_meta ?= "a338639c47e0a260b656415d336aaf599699d491"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
-- 
2.39.2


