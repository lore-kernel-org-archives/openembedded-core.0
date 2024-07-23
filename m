Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27CC4C3DA7F
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 13:13:52 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.43680.1721740430404745647
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 06:13:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=xY1Em4BZ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.48, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2cb63ceff6dso2963188a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 06:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1721740430; x=1722345230; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nUy4AaPFDN/HLo2doRoeKXIpsidR3zIQ3AzwHsazlhg=;
        b=xY1Em4BZT0fZVo1cV+XdUY8Dsq7TAbxdqmjUhoqOqoZXbmzCqqD9S7dFCa4QZtJqb9
         rr+ns4K24M/2rJpZOzgtXYQgk2/BQoM8efVFY+FvPPg6VwSQQMzMw0D0Ramw+9XIBnqW
         BigZVcSqQj+qWvaBqzL7oc8b5JXN7LFAk1wVVZ1q5FswlCpeCGJOTKoXEg7gksSfgCLI
         o2+5yUhZzBQdnlsvDrjGH3YPz39gdUrpJtGU42ZzI1kA2AHVLpFGKyNmryyDuyXCrAEF
         z7g8GC5qBHHXgJW1tXhRev+rMozC3tw2bU17mW63JfXlQZ8kz8O738obxkIwEjnpkhPu
         U3FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721740430; x=1722345230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nUy4AaPFDN/HLo2doRoeKXIpsidR3zIQ3AzwHsazlhg=;
        b=sEyQqQ/NKQ8sfwnZ+9xN/QNlPazTb3L1gK6+YCjmRUQ6BFkS8AoSGr7oICeltgPBGU
         RJuvPQlRAn2hjaQ3qQO+wfGOWiEY5aH4UmK38PwTjfh/CSjVfXRm1RaQ59lPw5TmIlXy
         zVeuc+xeAfwi0Hmoy7L5SfLWH9C2scZAB/2Ftplz50CRHtNnib3dlSK5pLX1ukTclPT8
         bo40bFqcdlsbRNBD64Ijimw5XIzEfGs3HQpxeuPzeuDwm7ohCZXNVwnpG3h3S5qaPlYb
         uWAelrzYtxX+qnWRpugswXt5FlAM09EAMec6UnOqTGWB5JcRtoEEwBggwnFQroj2sQ2b
         VgLg==
X-Gm-Message-State: AOJu0Yz8YY+hliUSjrBmQ1U10EuyFYilu+oSiQc867BQFhEWN1c8Gord
	Q04LOq3AMs7MIvlj3IHx82e+AwN6JeFkKRMhG81QdPa+/HyFm2V/SPnWphICW0z5TNj5ctfOnl+
	zfvU=
X-Google-Smtp-Source: AGHT+IGSqOp2qBXeUFq25KSih5sd2tHBAsHiT7u1xM7pxHYZbdDOuGX26T0NZj9VHIeTWfMuBvnIag==
X-Received: by 2002:a17:90a:f2c5:b0:2bf:8824:c043 with SMTP id 98e67ed59e1d1-2cd274123a1mr6428336a91.18.1721740429521;
        Tue, 23 Jul 2024 06:13:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2cb7754a888sm10091540a91.57.2024.07.23.06.13.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 06:13:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/17] sanity: Check if tar is gnutar
Date: Tue, 23 Jul 2024 06:13:13 -0700
Message-Id: <49edd9e5d48abe66135391617c6b901a5f454dab.1721740245.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721740245.git.steve@sakoman.com>
References: <cover.1721740245.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 13:13:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202359

From: Simone Weiß <simone.p.weiss@posteo.com>

In sanity.bbclass the tar version is checked as tar needs to be recent enough
for reproducible builds. Tar could also be provided by other means then gnutar,
but we mean the version of gnutar in the check. Hence we also should ensure
that the installed tar is gnutar.

[YOCTO #14205]

Signed-off-by: Simone Weiß <simone.p.weiss@posteo.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit bdef30bd887cd208d7822dd7853d33e24a6b7a4c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-global/sanity.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 180c6b77d8..1d242f0f0a 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -495,12 +495,15 @@ def check_gcc_version(sanity_data):
 # Tar version 1.24 and onwards handle overwriting symlinks correctly
 # but earlier versions do not; this needs to work properly for sstate
 # Version 1.28 is needed so opkg-build works correctly when reproducible builds are enabled
+# Gtar is assumed at to be used as tar in poky
 def check_tar_version(sanity_data):
     import subprocess
     try:
         result = subprocess.check_output(["tar", "--version"], stderr=subprocess.STDOUT).decode('utf-8')
     except subprocess.CalledProcessError as e:
         return "Unable to execute tar --version, exit code %d\n%s\n" % (e.returncode, e.output)
+    if not "GNU" in result:
+        return "Your version of tar is not gtar. Please install gtar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
     version = result.split()[3]
     if bb.utils.vercmp_string_op(version, "1.28", "<"):
         return "Your version of tar is older than 1.28 and does not have the support needed to enable reproducible builds. Please install a newer version of tar (you could use the project's buildtools-tarball from our last release or use scripts/install-buildtools).\n"
-- 
2.34.1


