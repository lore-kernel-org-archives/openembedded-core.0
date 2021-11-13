Return-Path: <claus.stovgaard@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B386C433EF
	for <webhook@archiver.kernel.org>; Sat, 13 Nov 2021 21:37:24 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web09.2245.1636839442642510684
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 13:37:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JSVLrPCb;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: claus.stovgaard@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id bi37so26972138lfb.5
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Nov 2021 13:37:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kV35My1Nfoy/YCt+rJnBdwG0691LGE+Hpb4QIiJ1eFY=;
        b=JSVLrPCbNFwP4BbEIPGPyeUWtDhGAtmPnz91+tiE6QrZzEpL1H+HDpBlYZU9O+iRD3
         hHhuKFFbGUUZ1LoetcQeeg8Z9TFULp37cLov7FEqzbxcJGnp0UyVZPTT7F1bDE9fapbv
         5V1gcSLaMAQUwXUQxDE5UCr0gTYhk4RcmaF5JISXZwNlMSeCgkLXIchRx87+iiaZWegS
         vi2zgiHft09SqxZzhPc3FtuQkYiqKlygsdnri4pHMRvv6KliEhz3AUVGQpGRxHqDzSSW
         POfIOSn6+S1aKTKk/fJPcCwDrzVno2zukIwT78Cec3Hl5AqY7AhgCrhbutV6oUIuijXx
         Hbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kV35My1Nfoy/YCt+rJnBdwG0691LGE+Hpb4QIiJ1eFY=;
        b=Zu3WfPGHf4zWLK77l/ERWoiRKz0wcJgNsrJyWdLQM6XF2TmEDRVTp35Eet/h52ic39
         LVJQUpeBgHDrvKgKUE5wgjST9yCWvhFbFUrhzgmoeSHi3WMCeJsJtEzhc72oqtzA6LWy
         Lu5GhtsgyzuSqPf/4IC46Xi+8brQPV8hA8VURDfr99Ft7xDKndCHCMneLBNDAQ/wcRnm
         ROoUXXx3W1wZtmEslwDMr6etxgv9mGIaVCYYWyvsnCOMNQ78cSSUTOWYymC0/WnkKEb1
         E08zDoUqCSQk/f+GBP2r7/OorhmMcC/GzcVUDTqndMRxKKLkUsUilWdIQuCEHm9PNM5d
         yneg==
X-Gm-Message-State: AOAM530C4YXsVka2+DabPYaSVqrSWtK55cfYgE17fNp7G99mB4c4HeGE
	ouvvRAjp+s1oBIPJFfUyiwfqcI9PzsqjbA==
X-Google-Smtp-Source: 
 ABdhPJx/EJ8fO3x0G84WM0OzMCX3Pd7B3C2Jtu93uvSELu+LtYWFU6bn2ApjoMfWUYsg/adUtUM8UA==
X-Received: by 2002:a05:6512:3745:: with SMTP id
 a5mr24379926lfs.666.1636839440683;
        Sat, 13 Nov 2021 13:37:20 -0800 (PST)
Received: from nova.home (2-108-107-206-static.dk.customer.tdc.net.
 [2.108.107.206])
        by smtp.gmail.com with ESMTPSA id
 e17sm953492lfr.296.2021.11.13.13.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Nov 2021 13:37:20 -0800 (PST)
From: Claus Stovgaard <claus.stovgaard@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Claus Stovgaard <clst@ambu.com>
Subject: [PATCH] Fix missing installation of cups sysv init scripts
Date: Sat, 13 Nov 2021 22:37:13 +0100
Message-Id: <20211113213713.1330399-1-claus.stovgaard@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Nov 2021 21:37:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158252

From: Claus Stovgaard <clst@ambu.com>

The packageconfig needs to be --disable-systemd as documented in
configure file for cups. With the current value "--without-systemd" the
SYSTEM_DIR variable ends up being set to "no"

It is caused by the --without-* section in configure file resulting in
eval with_$ac_useropt=no ;;

$ac_useropt is "systemd" causing the variable $with_systemd to be set
to "no", because of below test

if test ${with_systemd+y}
then :
  withval=$with_systemd; SYSTEMD_DIR="$withval"
else $as_nop
  SYSTEMD_DIR=""
fi

cups configure test for i if SYSTEMD_DIR is empty to decide if the init
scripts need to be installed. A value of "no" results in that no init
scripts is installed.

With --disable-systemd it works as expected - installing the init files.
Though cups should properly improve their configure script.

Signed-off-by: Claus Stovgaard <clst@ambu.com>
---
 meta/recipes-extended/cups/cups.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index 2994973b8c..ba9bc6c6a6 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -44,7 +44,7 @@ PACKAGECONFIG[avahi] = "--enable-avahi,--disable-avahi,avahi"
 PACKAGECONFIG[acl] = "--enable-acl,--disable-acl,acl"
 PACKAGECONFIG[gnutls] = "--enable-gnutls,--disable-gnutls,gnutls"
 PACKAGECONFIG[pam] = "--enable-pam --with-pam-module=unix, --disable-pam, libpam"
-PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--without-systemd,systemd"
+PACKAGECONFIG[systemd] = "--with-systemd=${systemd_system_unitdir},--disable-systemd,systemd"
 PACKAGECONFIG[xinetd] = "--with-xinetd=${sysconfdir}/xinetd.d,--without-xinetd,xinetd"
 
 EXTRA_OECONF = " \
-- 
2.25.1


