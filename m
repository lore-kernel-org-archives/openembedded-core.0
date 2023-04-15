Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE47CC7619A
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 15:27:17 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.10389.1681572430161420102
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 08:27:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=uaTmu3IG;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id kx14so1274174pjb.1
        for <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 08:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1681572429; x=1684164429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yQG5QkkdxzMWaiywD+45WoZhYKSQYl/RBmgG4tXiWro=;
        b=uaTmu3IGeDLcg7tZKZ9ui78G51yJMz7qA/NDli6rS0W1tzIaSnumUtjQPF1wF42xZq
         phIJrb8Q8KpPNLtM/JD+Ts13hetV1C7XLHAPYZy7VdIYzonZrYT+QF3EC/ACt7Qk1kgW
         0ifs3dUJCL7tsxjxOjImVet1UFr1f9RreA3j3IyNkZpJwAiAw6XRPPJULHurHkNs8Ju0
         S+M+AySpks687G/3pbOlHnRgdJQJKn7CcBG76a0+iC0/9veA/C8h80oI4/0AW6rjxqfe
         AhO7fORXeuF8IfpaBGPxCp+OmgsZmb6FyHF0igZvo4IEC3hsewbylM6nYEdJPrruZ9f0
         6R2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681572429; x=1684164429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQG5QkkdxzMWaiywD+45WoZhYKSQYl/RBmgG4tXiWro=;
        b=hDXaPezLa1DajwhBalumf4c4Fwu26OdHuwOseq5U0pY8p9yV15kz6bg2QQDFSGqD45
         KX1lvJK5iQs7l3GrUDQw6GNF0dK8ops/mIFsLu+0MZOL/qOtdwjhPZwd2XuNYtrQIALY
         TX/3vlHkB32wgk4g55uaeMNCP1sKinvBLohSntT1KHSFKoaBAw1UIi/5uh1AR/3X6hG/
         tvhqw8klHd+Um/sNgCdZGXT3RreJRrLIuQCkJQNwN+cR9cfZA135Z26Q1mkXAD2oOY3Z
         +G4Is+1mG6zmUh8aAy61cLI7mlewGR4TPW4MjoPGUmXWxd1E6T3HDAxH5iw9MG56sUO+
         P2pA==
X-Gm-Message-State: AAQBX9ePuGrbtWRD/c6I7uFjOav7SBhAATja2kVjU2DswY4UYb/UZmSO
	JHUtd03kNrvhi42cZgz1R+UZRvPjiPINqXdwxmU=
X-Google-Smtp-Source: AKy350ai8hobaXQ1/wVJWi834oF9isAJfJJz1l4xduMpLo3wiJneW5qMoUpNUxrhV0LZTUnbAko2jg==
X-Received: by 2002:a05:6a20:4927:b0:ea:e535:ce2c with SMTP id ft39-20020a056a20492700b000eae535ce2cmr8896838pzb.0.1681572429242;
        Sat, 15 Apr 2023 08:27:09 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id u22-20020aa78496000000b0063b1e7ffc5fsm4824410pfn.39.2023.04.15.08.27.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 08:27:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 7/7] package.bbclass: correct check for /build in copydebugsources()
Date: Sat, 15 Apr 2023 05:26:44 -1000
Message-Id: <b67e714b367a08fdeeeff68c2d9495ec9bc07304.1681572283.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1681572283.git.steve@sakoman.com>
References: <cover.1681572283.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 15:27:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180017

From: Peter Marko <peter.marko@siemens.com>

Newly introduced kirkstone-only commit
https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=80839835ec9fcb63069289225a3c1af257ffdef7
broke builds with externalsrc in Gitlab-CI.
This is yocto-4.0.9 regression.

It checks if directory starts with "build" instead of
if checking if it equals to "build".
Gitlab-CI uses directory "/builds" which matches the check
but directory /build does not exist, only /builds.
After successful check it tries to move this non-existent
directory which does not exists and thus do_package fails.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 2950218145..67acc278d1 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -638,7 +638,7 @@ def copydebugsources(debugsrcdir, sources, d):
             if os.path.exists(dvar + debugsrcdir + sdir):
                 # Special case for /build since we need to move into
                 # /usr/src/debug/build so rename sdir to build.build
-                if sdir.find("/build") == 0:
+                if sdir == "/build" or sdir.find("/build/") == 0:
                     cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
                     subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
                     sdir = sdir.replace("/build", "/build.build", 1)
-- 
2.34.1


