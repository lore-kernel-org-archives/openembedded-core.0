Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.428.1606848738921580585
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=X5Ew9cIE;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id r20so1791759pjp.1
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=wk3jdejG4lXbp0o9v/HJ/epqAB+hjtr18jPXQA1P67k=;
        b=X5Ew9cIEMWkBbZJnHCZ/m0W4+W0vUDRl5Q/i0/uln1nyunhRO1WUZYrs6T8sOJJR4f
         32x+4+ahkQrUkywKdQeLn9ojj7hGqbdhjqI+DOHyz9fT99/koGQcUe5L8OjlPnk5Qtdu
         Dn1WoML0Be+VeDiWH9a3c8NdMW1GwgSEke2JICyBl8liIsKj5/9ZIiHiRXiv/UxRnpZg
         jlR7FJw4c7luK2moWtLr6QJyKPl+QTnow5Vclh/vA++TBDJe5NRznKCzj+cHFRE8H1R9
         wtPSbG5yChrk6ZnWuxbJWLXh56Xh/cqPwllRU+xIIayPOGVfQr3NjqKJ/WvC/6xfdsgL
         3MRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=wk3jdejG4lXbp0o9v/HJ/epqAB+hjtr18jPXQA1P67k=;
        b=S/sUlOzrwHTjnMO6nax1Z312sWhtPnARLQ5hPbAD2T4MlVWYIeNXIUNklrmW0OWrWo
         sutHcSYQAsf0K9YQGelYDVGwIvgexwF1zP48cSKN7SjuoqMefVyPwAgfjwd9Ig/FVD3+
         v2npt/5/+vzCF/TyNnuQBCM/u6NHAvPt4HuDUrrffRXX2BH/Kyp9mtQGW0mRfQXvDG5O
         GQfbPxGmMT8HV9vsO2ZuuaBdy0OtgR+lYK6POka5fsMIV2PsNg2E/1zQnas4G8pQpvYz
         MZ4LOHN1ktnTgDQS6RdrV5bb6GW/RkW33riUST2hdiNPqTxXjAGisLouc/Q33QjaT9Ud
         2fHw==
X-Gm-Message-State: AOAM533Zh5x0cvNlCVJ6xr9Fu0YJGbzPVGVOnnXcUls7x46BCJBDmziF
	gpljuljIEI18bWlmFSiskkcdXxkNQGb4TJez
X-Google-Smtp-Source: ABdhPJzGc31TUDMCWHCURktjtKxHFz/sRrWIApVWGES4ViboChnEp/ZwKRskc8uCviZglTQqmzbCLg==
X-Received: by 2002:a17:90a:7b86:: with SMTP id z6mr4215582pjc.34.1606848737812;
        Tue, 01 Dec 2020 10:52:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:17 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 01/16] kernel: provide module.lds for out of tree builds in v5.10+
Date: Tue,  1 Dec 2020 08:51:44 -1000
Message-Id: <46bc7719ea5ddf4342921c1b2721c73c1a3694a6.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The upstream commit 596b0474d3d [kbuild: preprocess module linker
script], adds a dependency on module.lds for external module
building.

Since module.lds is generated as part of 'modules_prepare', we
must make it available with the other kernel artifacts in the
kernel shared workdir, otherwise out of tree builds fail.

This fixes errors like:

    | make[4]: *** No rule to make target 'scripts/module.lds', needed by
        'build/tmp/work/qemuarm64-poky-linux/cryptodev-module/1.11-r0/git/cryptodev.ko'.
        Stop.
    | make[4]: *** Waiting for unfinished jobs....

We also ensure that kernel-devsrc has a copy to support on
target module builds that are often prepared with 'make scripts
prepare'. Those targets won't regenerate it, so the build fails.
If 'make modules_prepare' is used, the file will be regenerated
and overwrite our copy (as expected).

Signed-off-by: Pan, Kris <kris.pan@intel.com>
Signed-off-by: Lili Li <lili.li@intel.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0fc66a0b64953aae38d0124b57615fffaec8de52)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel.bbclass                | 1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++++
 2 files changed, 7 insertions(+)

diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
index 9e3c34ad48..58c9f171dc 100644
--- a/meta/classes/kernel.bbclass
+++ b/meta/classes/kernel.bbclass
@@ -465,6 +465,7 @@ do_shared_workdir () {
 	# Copy files required for module builds
 	cp System.map $kerneldir/System.map-${KERNEL_VERSION}
 	[ -e Module.symvers ] && cp Module.symvers $kerneldir/
+	[ -e scripts/module.lds ] && install -Dm 0644 scripts/module.lds $kerneldir/scripts/module.lds
 	cp .config $kerneldir/
 	mkdir -p $kerneldir/include/config
 	cp include/config/kernel.release $kerneldir/include/config/kernel.release
diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 5940cc90ea..951e7635cc 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -86,6 +86,12 @@ do_install() {
 	# be dealt with.
 	# cp -a scripts $kerneldir/build
 
+	# although module.lds can be regenerated on target via 'make modules_prepare'
+	# there are several places where 'makes scripts prepare' is done, and that won't
+	# regenerate the file. So we copy it onto the target as a migration to using
+	# modules_prepare
+	cp -a --parents scripts/module.lds $kerneldir/build/ 2>/dev/null || :
+
         if [ -d arch/${ARCH}/scripts ]; then
 	    cp -a arch/${ARCH}/scripts $kerneldir/build/arch/${ARCH}
 	fi
-- 
2.17.1

