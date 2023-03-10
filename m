Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0421AC64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 04:12:47 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.11978.1678421561148623336
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Mar 2023 20:12:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fIOQGiPF;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id l13so4550629qtv.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Mar 2023 20:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678421560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XLVKOxeY08iSd9W/YafFtmr3z2ER3CCXebtWQ6vbKj8=;
        b=fIOQGiPFw6mQrAbJ/KCnOGr04TT/I5DsTuvWzXC+dk6FmaCqR1dBU3O8HanUClml1O
         QkkRMb2ywbFw7TSd3NjGKjqkT8DIpTAuQm5vL3fv7TJKOhe1gDKlSozDQcilB/tMDnNt
         efgPA3htjrCVa17L/x11gKJxM1Gv18pVbiC0OgndUI4jEYqnU0v8zIxO9afSJMF2p5nE
         PEkE75ms9sRCepOLQtc9Qsbf9VJSTrTCtlP7WOVmPQATjDZtBNobN5LyBkNV+5sA4e/O
         UtUDaBaCCzLVN3ptK1Ab4RJnUnyI3/GlpNIHIzN/fQXNTuhKLvAmBQ87ZDGl1Q0OzoKe
         P5kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678421560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XLVKOxeY08iSd9W/YafFtmr3z2ER3CCXebtWQ6vbKj8=;
        b=ebEKwB4QBNKdTwLkaXtR1e2nhXOFSHZdWsfIxW4/dukDM76qQDDekBuuKDe2entPsT
         5EXWR3oHTo65w3O7i8QX8LHrvN8kx2Rtch1+sTsSuUe7HMv/N+RvA12zl+BD3rLxbdpa
         ZJ5k3bH9XUhjOFaYqxfAWnz7d+JhkVqg8T779ON+kyKTp2cVNXF+a4egInqtsQI7NvUq
         Lq/SXXMWWBlOV79qXgpwh8rOW3tRiM2SrbOGIBduKH5LuSZrUCxNjxcRyq3uNUXCgfnc
         vOe+bnFXp08/ZU2loMpoIjkwHzCTPBR4dJzFwUIurrcqPlJM3ofzKE1YlZTbweIEBHKP
         GD2A==
X-Gm-Message-State: AO0yUKW4y3G8LJBfXQIK6Ci1kB/Ky5VDH8VrvWZ15UN65+FH7wHa2+0z
	IUbzldPCzgyRHO0SR0E6Zpc=
X-Google-Smtp-Source: AK7set84ESPPN6A/T6Vhlv2XPJckr5mlJIK6yfZzi7CZviI0jPKdw1Ts4s3I928wGWy3APpErfUfwA==
X-Received: by 2002:a05:622a:14e:b0:3bf:c407:10ca with SMTP id v14-20020a05622a014e00b003bfc40710camr40379267qtw.10.1678421560175;
        Thu, 09 Mar 2023 20:12:40 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id a3-20020ac84d83000000b003bd01b232dbsm677918qtw.43.2023.03.09.20.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 20:12:39 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH] perf: fix buildpaths QA warning
Date: Thu,  9 Mar 2023 23:12:37 -0500
Message-Id: <20230310041237.3384266-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Mar 2023 04:12:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178306

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In the 6.2+ kernel, arm64 perf has a buildpaths QA warning as
a syscall table is now being dynamically generated. That generated
table includes unistd.h by absolute path, which in turn triggers
the buildpaths QA warning.

This could easily be patched in linux-yocto, but that would
leave the QA issue in perf built from other kernel trees.

So we instead to the following:

 - Add the perf tools directory to the include path
 - Modify the Makefile to have a relative path to unistd.h and
   pass both the relative and absolute path to the generation
   script
 - Modify the generation script to take the relative location
   of unistd.h as a new parameter, and use that in the generated
   sycalls.c file

At build, the added include path of the perf source allows the
relative path file to be included, and no buildpaths warning is
generated.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---

Ross reported that the ARM CI was showing a buildpaths issue
with perf and the -dev kernel.

I was able to reproduce the issue with qemuarm64, and came up
with this fix.

This was build tested against 6.2, 6.1 and 5.15 kernels, no
issues were found.

Bruce

 meta/recipes-kernel/perf/perf.bb | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 2f28d16fba..e41fcc4798 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -81,7 +81,7 @@ EXTRA_OEMAKE = '\
     LDSHARED="${CC} -shared" \
     AR="${AR}" \
     LD="${LD}" \
-    EXTRA_CFLAGS="-ldw" \
+    EXTRA_CFLAGS="-ldw -I${S}" \
     YFLAGS='-y --file-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}' \
     EXTRA_LDFLAGS="${PERF_EXTRA_LDFLAGS}" \
     perfexecdir=${libexecdir} \
@@ -280,6 +280,16 @@ do_configure:prepend () {
         sed -i -e "s#os.scandir(path)#sorted(os.scandir(path), key=lambda e: e.name)#g" \
                        "${S}/tools/perf/pmu-events/jevents.py"
     fi
+    if [ -e "${S}/tools/perf/arch/arm64/Makefile" ]; then
+	sed -i 's,sysdef := $(srctree)/,sysdef := ,' ${S}/tools/perf/arch/arm64/Makefile
+	sed -i 's,$(incpath) $(sysdef),$(incpath) $(srctree)/$(sysdef) $(sysdef),' ${S}/tools/perf/arch/arm64/Makefile
+    fi
+    if [ -e "${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl" ]; then
+	if ! grep -q input_rel ${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl; then
+	    sed -i 's,input=$4,input=$4\ninput_rel=$5,' ${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
+	fi
+	sed -i 's,#include \\"\$input\\",#include \\"\$input_rel\\",'  ${S}/tools/perf/arch/arm64/entry/syscalls/mksyscalltbl
+    fi
     # end reproducibility substitutions
 
     # We need to ensure the --sysroot option in CC is preserved
-- 
2.34.1


