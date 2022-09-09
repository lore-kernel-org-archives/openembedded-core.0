Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CB28ECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:42:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.107.1662741763706288638
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pW3HZGb2;
 spf=pass (domain: gmail.com, ip: 209.85.214.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id x1so2318515plv.5
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=/4DEIe95zkucqWu0ApOjPsp7trjXAhtvRNTLRasyp78=;
        b=pW3HZGb2FMAxNfdFlpo4UEYKbDDLFUq9iDrYu4C2KQAtR50nwt+mMQXnPuzjf3h8fo
         1zykNYWj0vxZy0bQZMQ6RiaLotSB3B+kpNMDNxc/3RrP5IpccAynJ+kHQ4ibmWY5Egpr
         etn2JbogFstRdfhpdK4uLxY7niSo603e7Eg+grUFGaVkoCH8VTCuR4KkbKX2fC+TXShs
         XvnqUaTVDL2RnZeTe4oNUxRy/Hyer7i8gRADBRu5xZbgO0DkfAN8PC4Y5DnL7ia12b9h
         +Obhh7FtGYyYUd2O4a92TcpM/vel7xNRrrlStUugz+GvuqiCsuG1gzHwvXG6USrs7ZvV
         Ft+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=/4DEIe95zkucqWu0ApOjPsp7trjXAhtvRNTLRasyp78=;
        b=wg+oejdQWXpdUcjm1Cscs8GY6FPHR3dk+yfd0D/nFdYOWyzmOMs1oo1nN2IAJlec06
         9cDBtFyRzarZHz3aRvI1YreRuFD73965BRRwxxHYjhkTNVALVZcQODBnXbeyK8RSw3aX
         9EYQuUU6eSez9SHTVEiw0URrPZRtbkHWIsZBKGrykOUZxfsGHMf1K3YyBIZe5edA/RyO
         hD8s+vqlcaX7y6mnPI0HmeC3SJLqVTjFwl/8mayEt+54eQvnOee00amHq9usTAZANhOl
         tnxgWSVql54r0Aw/vAn+XAhdFGSemF5F/FVdJdVV23gqGuhWTYL+nBkvO2r+bWCm4g+l
         i9tA==
X-Gm-Message-State: ACgBeo3u1fDKBPVOtY1pxEElpdQ/xUHvN5JZClXSpxhLzytuF55xYU/H
	+K5Gx0QUl3JmFgzl0D5boifCMN2XvWFVaw==
X-Google-Smtp-Source: 
 AA6agR7a3e0clRI3x6Dil1NpWC44aE53Zmz1iCScQ8gRz2Gmx756Ta/MSEcSW/R1O3dYUqha534+ig==
X-Received: by 2002:a17:903:2104:b0:176:a9ef:418b with SMTP id
 o4-20020a170903210400b00176a9ef418bmr14404802ple.134.1662741762769;
        Fri, 09 Sep 2022 09:42:42 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::1761])
        by smtp.gmail.com with ESMTPSA id
 i10-20020a17090a4b8a00b001f510175984sm623408pjh.41.2022.09.09.09.42.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 09:42:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] bitbake.conf: Define TCXXRUNTIME
Date: Fri,  9 Sep 2022 09:42:40 -0700
Message-Id: <20220909164240.3890113-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:42:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170497

This variable is used to denote the C/C++ compiler runtime to use.
Right now there are few alternatives out of the core which could
use this variable to define this property, the values it can take
are 'gnu' for gcc runtime. 'llvm' for using compiler-rt+libc++ and
'android' to use android runtime. Default settings is to use gnu
which is current silent default also.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Document the variable

 documentation/ref-manual/variables.rst | 6 ++++++
 meta/conf/bitbake.conf                 | 1 +
 2 files changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index cf817e9540..926b8010e0 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7973,6 +7973,12 @@ system and gives an overview of their function and contents.
       toolchain. You can use ``meta-sourcery`` as a template for adding
       support for other external toolchains.
 
+   :term:`TCXXRUNTIME`
+      Specifies the C/C++ STL and runtime variant to use during
+      the build process. Default value is 'gnu'
+
+      You can select "gnu", "llvm", or "android".
+
    :term:`TEMPLATECONF`
       Specifies the directory used by the build system to find templates
       from which to build the ``bblayers.conf`` and ``local.conf`` files.
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 52a36d788b..e88dc2b5bf 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -389,6 +389,7 @@ FILESYSTEM_PERMS_TABLES ?= "${@'files/fs-perms.txt' if oe.types.boolean(d.getVar
 
 TCMODE ??= "default"
 TCLIBC ??= "glibc"
+TCXXRUNTIME ??= "gnu"
 TMPDIR ?= "${TOPDIR}/tmp"
 
 CACHE = "${TMPDIR}/cache/${TCMODE}-${TCLIBC}${@['', '/' + str(d.getVar('MACHINE'))][bool(d.getVar('MACHINE'))]}${@['', '/' + str(d.getVar('SDKMACHINE'))][bool(d.getVar('SDKMACHINE'))]}"
-- 
2.37.3


