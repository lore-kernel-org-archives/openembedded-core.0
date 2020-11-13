Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.5348.1605279169999669140
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Nov 2020 06:52:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Zat9/rDu;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id x15so6484431pfm.9
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Nov 2020 06:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=N/skjBwmBTWXoMG3osHj2WpImvL5FDRPj8fpR1jXmuU=;
        b=Zat9/rDujShynRefBcotT/If3bzqSCacWICf/r3ngHQD2YRjt4PTIoZYxS9R7OT52O
         PafeDIquyHdQCT+AlzEQ7bo3DjlrZ3C3o3lMs7ve6XEAsVc6H+2RgeOatLbrchJ5V/j4
         SeLRIkq20jLUvZlnavWDBezxvv0MZWiy031RUTZgdjeZ3dihvk28MqmH8Gng9upGERAx
         B9BFYGFiUR4aUFbbigG5oN3O/13NzEKKUAoXyO04rlG++VbtPsi/vUmqS+vskpyrHlkn
         J44FnJg7bcCEcpfCu2mq3LYtJot/R4FWwPdTT8ckE+G5pCaa/9JybKh1MicYVKE624HI
         cbOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=N/skjBwmBTWXoMG3osHj2WpImvL5FDRPj8fpR1jXmuU=;
        b=MUiunJvefTUYf4LBmjd1aTS+OtKyOomBam4MYzpczTFPHiXWw6ixe2QQyYjU9fQdt1
         WGebWVgtZgh6W8cXMgdklZjuZyKon/pgv2HZAxtn5jFMj+vc3jqcSdVFmef6omvDaNss
         w7qZdq1VwB2KhmQsBnkIHM3fWK7jdzcvdiwAFdmxtwBKokZxP1jEqMCsIHw+yntFeBxX
         tsxhxKcc5fRUXWjuxKV6iZ4qm+dBZMDAOItb+liB5D8TQaor+6YqlHXXaoCBAZAnMRXb
         Kzus5KLW6l7G63dPQyYyvIIzyYNKd3AiR5a8MT60h5i1ocBtCAeJhR1/hPSei4T06lw2
         3gbw==
X-Gm-Message-State: AOAM532uspiVeTCp9XfgFwrBraXjO+wk7B6ngZ4ITFdmYO51zk/DF+pA
	r9IRhFwvgvvlhOVkW1EMNxYz1bNtOuKLBBfl
X-Google-Smtp-Source: ABdhPJy2FB/Ke+SuTTpdnaTB4qRSWFtHricktPjO5cXzdbhzMDsPJvyJ9YrTkMWzN3/CgY8NwVUUrA==
X-Received: by 2002:a17:90a:8992:: with SMTP id v18mr3613718pjn.192.1605279169002;
        Fri, 13 Nov 2020 06:52:49 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r134sm10370694pfc.145.2020.11.13.06.52.47
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 06:52:48 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 05/18] kernel-module-split.bbclass: identify kernel modconf files as configuration files
Date: Fri, 13 Nov 2020 04:52:09 -1000
Message-Id: <b5a113273dc4c062a4b734a403a3bb4a5e92c8ee.1605278902.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1605278902.git.steve@sakoman.com>
References: <cover.1605278902.git.steve@sakoman.com>

From: Gratian Crisan <gratian.crisan@ni.com>

Currently the modconf fragments representing the configuration for
kernel modules are written out to appropriate .conf files and added to
the FILES variable. However they are not identified as 'configuration
files' and installing a new version of a kernel module results in a
conflict and a failed installed because the respective .conf file is
already in place from a previous install.

Add the generated .conf files to the CONFFILES variable denoting their
true nature.

Signed-off-by: Gratian Crisan <gratian.crisan@ni.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a70a92d1f1006be115429a4262259c9084f484d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-module-split.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/kernel-module-split.bbclass b/meta/classes/kernel-module-split.bbclass
index 221022b7bc..c8ede26996 100644
--- a/meta/classes/kernel-module-split.bbclass
+++ b/meta/classes/kernel-module-split.bbclass
@@ -120,6 +120,7 @@ python split_kernel_module_packages () {
         files = d.getVar('FILES_%s' % pkg)
         files = "%s /etc/modules-load.d/%s.conf /etc/modprobe.d/%s.conf" % (files, basename, basename)
         d.setVar('FILES_%s' % pkg, files)
+        d.setVar('CONFFILES_%s' % pkg, files)
 
         if "description" in vals:
             old_desc = d.getVar('DESCRIPTION_' + pkg) or ""
-- 
2.17.1

