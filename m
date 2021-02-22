Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.1419.1614032860030801956
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 14:27:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WGcmMIRz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f44.google.com with SMTP id v1so20680363wrd.6
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Feb 2021 14:27:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=rF4c5yEDn6FzYDsR4BqN4dyONV+qD850nbggBkzQgsU=;
        b=WGcmMIRzUF+k1sobuTXF/cV6SK78U5X4HPOBXMJvXqKx6fU1BrDbY0dzZKEjUvPVpD
         mwxLBfTIMWCNjCugNCWXsFEFT2uzdwxKDbWcaNrw7rSPqDUeRT1riGXA0//D3fqVLdwj
         8msupMn6ReDsV2Xa2g1o3BouN1lN3uLTgMVzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rF4c5yEDn6FzYDsR4BqN4dyONV+qD850nbggBkzQgsU=;
        b=fpvxFJ0gN/Hggd6+QD+WVViU1Epf1A5QnofbGmfAX4ZJ0n145z2tE9dJx0PWd58rEC
         JVUtyIc/bX4Z1AYk1jBPWjci52xaSxD/kTjKDpoAGV6IjbchDVzFhNwOncoyH6IMbSUD
         UIYkeLS9rrjk5qnEkH5XkHJeYGCLscmra5kvsyb17BBWeenHEhzoWjV7+OCxW/RVsRNC
         xtMgm4feR5eMyjZGF6JTu72onQD5dg+/CtafQGU4BTOQf+dVCnMkDO0rx4BGw9RhoHUz
         1bdyuCsza2t8fZUYpotz6VZSTbRB1yN//q5+Co6HUNL7FqiCngJ8dsDfG6pcVohfhjRt
         Idug==
X-Gm-Message-State: AOAM532Crh+lUKkKLthuyWFVsbsJsckbWbOvetUuooGCTS+M+vYSRj2B
	6Ky7bvY2ni1MjEL3yJjuPMTRXg==
X-Google-Smtp-Source: ABdhPJxP7/e4VEOs8Q475Ux+w0pg9GCk5tLf2BO++kZhVR/j5oPRoUDJGW/DSPRPtfZuP25lvL66zw==
X-Received: by 2002:a5d:4b84:: with SMTP id b4mr23815279wrt.50.1614032858536;
        Mon, 22 Feb 2021 14:27:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c? ([2001:8b0:aba:5f3c:9491:94ce:53e1:ca3c])
        by smtp.gmail.com with ESMTPSA id v10sm24756227wrq.22.2021.02.22.14.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Feb 2021 14:27:38 -0800 (PST)
Message-ID: <fe0b8f65658f2cc881f06b1a4120d5f679dfff0d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bitbake.conf: Introduce PSEUDO_LOGFILE and FAKEROOTLOGS variables used by bitbake to print pseudo.log
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: kergoth@gmail.com
Date: Mon, 22 Feb 2021 22:27:37 +0000
In-Reply-To: <20210222203732.9804-1-tomasz.dziendzielski@gmail.com>
References: <20210222203732.9804-1-tomasz.dziendzielski@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2021-02-22 at 21:37 +0100, Tomasz Dziendzielski wrote:
Bitbake depends on these variables while looking for pseudo.log file in
case of fakeroot task failure.

Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
---
 meta/conf/bitbake.conf | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 375467d155..d0d8da6b90 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -681,6 +681,7 @@ SRC_URI = ""
 

 # Use pseudo as the fakeroot implementation
 PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
+PSEUDO_LOGFILE ?= "${WORKDIR}/pseudo/pseudo.log"
 PSEUDO_PASSWD ?= "${STAGING_DIR_TARGET}:${PSEUDO_SYSROOT}"
 PSEUDO_SYSROOT = "${COMPONENTS_DIR}/${BUILD_ARCH}/pseudo-native"
 PSEUDO_IGNORE_PATHS = "/usr/,/etc/,/lib,/dev/,/run/,${T},${WORKDIR}/recipe-sysroot,${SSTATE_DIR},${STAMPS_DIR},${WORKDIR}/pkgdata-sysroot,${TMPDIR}/sstate-control,${DEPLOY_DIR},${WORKDIR}/deploy-,${TMPDIR}/buildstats,${WORKDIR}/sstate-build-package_,${WORKDIR}/sstate-install-package_,${WORKDIR}/sstate-build-image_complete,${TMPDIR}/sysroots-components,${BUILDHISTORY_DIR},${TMPDIR}/pkgdata,${TOPDIR}/cache,${COREBASE}/scripts,${CCACHE_DIR}"
@@ -691,9 +692,10 @@ export PSEUDO_DISABLED = "1"
 #export PSEUDO_LIBDIR = "${STAGING_DIR_NATIVE}$PSEUDOBINDIR/../lib/pseudo/lib
 FAKEROOTBASEENV = "PSEUDO_BINDIR=${PSEUDO_SYSROOT}${bindir_native} PSEUDO_LIBDIR=${PSEUDO_SYSROOT}${prefix_native}/lib/pseudo/lib PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=1 PYTHONDONTWRITEBYTECODE=1"
 FAKEROOTCMD = "${PSEUDO_SYSROOT}${bindir_native}/pseudo"
-FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
+FAKEROOTENV = "PSEUDO_PREFIX=${PSEUDO_SYSROOT}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_LOGFILE=${PSEUDO_LOGFILE} PSEUDO_PASSWD=${PSEUDO_PASSWD} PSEUDO_NOSYMLINKEXP=1 PSEUDO_IGNORE_PATHS=${@oe.path.canonicalize(d.getVar('PSEUDO_IGNORE_PATHS'))} PSEUDO_DISABLED=0"
 FAKEROOTNOENV = "PSEUDO_UNLOAD=1"
 FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
+FAKEROOTLOGS = "${PSEUDO_LOGFILE}"
 PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"

This is horribly confusing since PSEUDO_* variables are usually instructions
to pseudo on what to do but in this case its an OE variable instructing OE 
code and its presumably ignored by pseudo?

I think we may need to rethink the naming if so...

Cheers,

Richard

