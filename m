Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E824C3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 16:33:06 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.80819.1746549184649504885
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 May 2025 09:33:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZh7d56M;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c9677cd6d7so669053885a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 09:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746549184; x=1747153984; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T4qEotOmSAy6cz2hcR8RtvjCDriK0UWBTmHD6gW696k=;
        b=kZh7d56McpqTloOzDp/+u0GxxP+myFQRhJpU66Lot+tqhw9itRTsCIdOUrNrywBq+M
         JOPwTWor9fjdGMXyzOo5I/Thw2j1XROBBXarhDQgiEOf5RKtXFFsO8r+Was7RbImXELt
         M7tIvpDpUKs2sC2EpJJI2/6u/OgtQ7uLYyl+fTKYmY/wbrF21TQteCVTKgUqcXzBkVUP
         vMBukS8qPqv7l9qot6+uvEpaTaOCq3pt6heu/JSlfkrNh/us05rPSqfoFA3/xC05QNy5
         0+VVQ/hy/Gxm9kmKobkH+sLuM0UNtLYohPv4aADq3zQaSUucc02MVnJmcyAbJoSzgu5Q
         cxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746549184; x=1747153984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4qEotOmSAy6cz2hcR8RtvjCDriK0UWBTmHD6gW696k=;
        b=gOxwrgqkg9nUCZ/emKysD2GhaX/2P6zeGsBNXnBdg1om1+kn9tdVBN/ZZYGTKNkB7a
         EtlHDTiITvpWCt1e/6yUaW3UQK5VzjdXM+5D/BZwq1OFYKl+ssfQ2hER+jp3MG3O181r
         4WGJyZof+3Ina74Q2Ko8CFh5lEOQZ11YM+tfvErZ8fpAmnlSImrweAlHz1dHbRxFvJvI
         XMvjrmjYUlYd5g+CcZvbflkuJUL4xAJSwzhphk3SEKEvptorbG7DnwGuuvS1VuiCBS8p
         E6DVa8QXUK5TLFmOohzyLBHXtfGVlBtm3TRn1cMN9/sSx6SOog0W+NJBDWKZlD2/P3a0
         n4qQ==
X-Gm-Message-State: AOJu0YzqrJ8R9BTOr+jzUnoKKXG3NjqrVO8yVA1U8DmIkBqtdjd+xp7J
	WSqdjaGy2ICOuW5+izfTBFKzl4wxS5Y0GJ0Lz1YI1Pa7bAmZqzOr
X-Gm-Gg: ASbGncu+tLxQ9zjnl1UjGTqgQSu+h2Tfi1fMcI1Qg8D9dBDUWkyNeQ8KgBzsy/O3Y5s
	ZSCC3Q2YHga3MEYY8loYjveTmdzGk1vRoXazuxwuo42tRSEL/h4x/U8DcaOUjswFjd+aIzlDfxT
	gA26OU4CGxUVIZpvKbXubGMQJGlr3nSpGAycODQXdj2aWbr+ZOsOgStb7UvHpZNW6aGUmOcUJX6
	Uu2dPLWYLPTchQvL/TrD2ANffFLnUo8Yt8m60TRZgjRZldUQXBTojHVNPnpK9+/VKkQ1O5COEKS
	NjlEjCUu8T6ku+x3lclKdofldWcQBzd/QHFm0hN7EAyOllkvya+xHK0iRdz0Xja0y7XCIKUj+p3
	Ar1jgp20oIFsKRIKroAQirb4UwJRcAo7xjaJwGkqnKQ==
X-Google-Smtp-Source: AGHT+IGft27hjDEeH0Q5pEYSJWdvZcTdP4e+sLVTtNpgzJKRj2uRQavcU4UnhpW0Y9LocIMCK3fIlQ==
X-Received: by 2002:a05:620a:1998:b0:7c5:6a35:81c1 with SMTP id af79cd13be357-7cae3b01fa4mr1685918285a.48.1746549183335;
        Tue, 06 May 2025 09:33:03 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cad23c48ffsm735977085a.45.2025.05.06.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 09:33:02 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] kernel-yocto: allow annotated options to be modified
Date: Tue,  6 May 2025 12:32:55 -0400
Message-Id: <a189bc17538f3bf7f0353d7a861fa58bf2f434e7.1746548780.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1746548780.git.bruce.ashfield@gmail.com>
References: <cover.1746548780.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 16:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216074

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Bumping the kern-tools SRCREV to pickup the following commits:

    tools: allow fixups to conditionally change options

    Sometimes we have options that should either be =y or =m depending
    on the use case.

    Rather than force the options into multiple parallel and very similar
    fragments (which is error prone and labour intensive), we can allow
    an annotation in the configuration fragment that allows the default
    value to be overriden by a variable.

    The variable in question comes from a -D<var>=<value> on the scc
    or spp command line. If the define evaluates to a non-zero value
    a fixup is created that will modify the value when scc finishes
    gathering meta-data.

    An example of a notation would be:

      CONFIG_INET_TUNNEL=y # OVERRIDE:$MODULE_OR_Y

    CONFIG_INET_TUNNEL will be =y when standard tools (like merge-config)
    are used. But when scc/spp see this notation, they check the value
    of the variable MODULE_OR_Y, if that variable evalutes to a non-zero
    value, a fixup is created that will change CONFIG_INET_TUNNEL to
    that value before the kernel is configured.

To use the annotations, scc needs to be passed a value that is used
in the override expression. This has always been possible with defines
(-Dx=y), so we leverage that to control these conditional overrides.

In kernel-yocto, we now have a variable: KMETA_CONFIG_FEATURES

  KMETA_CONFIG_FEATURES ?= ""

Which defaults to empty, the only feature that is currently
implemented is "prefer-modules". When prefer-modules is detected
in the kmeta config features, the following define is passed to
scc:

   -DMODULE_OR_Y=m

Which as you can see from the above INET_TUNNEL example, will
evaluate to "m" and will override the default of "y".

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/classes-recipe/kernel-yocto.bbclass                | 7 ++++++-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cef6b9ec3f..ba93145fd3 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -25,6 +25,7 @@ KCONF_AUDIT_LEVEL ?= "1"
 KCONF_BSP_AUDIT_LEVEL ?= "0"
 KMETA_AUDIT ?= "yes"
 KMETA_AUDIT_WERROR ?= ""
+KMETA_CONFIG_FEATURES ?= ""
 
 # returns local (absolute) path names for all valid patches in the
 # src_uri
@@ -298,7 +299,11 @@ do_kernel_metadata() {
 		elements="`echo -n ${bsp_definition} $sccs_defconfig ${sccs} ${patches} $KERNEL_FEATURES_FINAL`"
 		if [ -n "${elements}" ]; then
 			echo "${bsp_definition}" > ${S}/${meta_dir}/bsp_definition
-			scc --force -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
+			echo "${KMETA_CONFIG_FEATURES}" | grep -q "prefer-modules"
+			if [ $? -eq 0 ]; then
+				scc_defines="-DMODULE_OR_Y=m"
+			fi
+			scc --force $scc_defines -o ${S}/${meta_dir}:cfg,merge,meta ${includes} $sccs_defconfig $bsp_definition $sccs $patches $KERNEL_FEATURES_FINAL
 			if [ $? -ne 0 ]; then
 				bbfatal_log "Could not generate configuration queue for ${KMACHINE}."
 			fi
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index 6dd19f1f09..20b1bcaf37 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS += "git-replacement-native"
 
-SRCREV = "c8c1f17867d0cc7d04be225ba4901f2373428be2"
+SRCREV = "fe67c98d2e9b74af44d0c4b660fa18e3a95e7edd"
 PV = "0.3+git"
 
 inherit native
-- 
2.39.2


