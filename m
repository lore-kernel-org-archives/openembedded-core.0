Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18A2BC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 16:17:47 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web10.27554.1677860261318179499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Mar 2023 08:17:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=Mf7P8wqK;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id x20-20020a17090a8a9400b00233ba727724so5923370pjn.1
        for <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 08:17:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1677860260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1cmO1kHUBsFsNzWF/t4LfA6W5w0qoCpN0ZKgCvhflIU=;
        b=Mf7P8wqKX0YSB09jWlsgN+GRtwh0k+SEF5RbFT3u+Sq1Hm1N8/S8OfgLDhT31o6qQj
         nqU7N3ADYRT0bsqqOnh8yD8H+mKMHH2EzyQWQUjXqvev324EdSQPLbxZg4YIEfPEDy9o
         T/lgS+P3arlkt41JrPPttBn+PRsxLb5NUrQNrOO9Z3/p+rhVdhwMImXUUhfvwhwAJKRS
         btgrnOrruHqG0Prj+Dfl6zWjnNy6aR+MrNQWEqjHlGXeBmZ6pYK/ZXfd340ltz1RazCN
         j6JUy4n7csyETDiSM+3d5p9Jczgo+HxkiNwblzTWUyW6A4BGm4VPRW1kz9QNMPyi00lB
         J4yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677860260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cmO1kHUBsFsNzWF/t4LfA6W5w0qoCpN0ZKgCvhflIU=;
        b=1MgvzGrSBzkC8geCp1mqLvaYTOZgPrvCDj/W+iCeaAEqeUfzNAQdnkqmPm97naiENA
         8JLUTrX3EBF4LtImUiB0jgguiw6R6F8Rn9fL9qRf59P8Yuq5+idHp62tiaKgaIMAYUvH
         jvC6szin4jg7aNFZ0eNI3QiSD+Oa2dLUp73BBEE9k1Q/PeNsgQpiy+tYzN3EXA+9Mf56
         lKPb8o9D9pJD1IAl3g1UzLX4dPk0pKoDlTG4QOgbNrq/sZzS5kvYd1kdiZVLlzMsVzir
         0rmltoNqJRseRBMWWCPexiGlHuX1F4X3NcsxoJLFTWV13hCUD5fPqZuV0YkkZXXqWUGL
         z2ow==
X-Gm-Message-State: AO0yUKW2piM0CMIpRUYYv7FZx/3YJbBidIA43/kboN16ucIR/BrWHupX
	ryc2xGi4VtTT3b4+2Pwi0NPDzPj3349Kh6NJTpE=
X-Google-Smtp-Source: AK7set9kBSJbcCLR8w+NiS5ugvBAxDFwpHbMx/RD2uzCE6M2lMTiVQHpE0nSPTTXoBDIO2O0m0vlRA==
X-Received: by 2002:a17:90a:1d1:b0:237:5834:294b with SMTP id 17-20020a17090a01d100b002375834294bmr2230845pjd.41.1677860260177;
        Fri, 03 Mar 2023 08:17:40 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id ko4-20020a17090307c400b00186b7443082sm1702474plb.195.2023.03.03.08.17.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 08:17:39 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/29] package.bbclase: Add check for /build in copydebugsources()
Date: Fri,  3 Mar 2023 06:17:03 -1000
Message-Id: <02f4dd52a0a8e91636e44e1611abfedac3176106.1677859897.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677859897.git.steve@sakoman.com>
References: <cover.1677859897.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 16:17:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177994

From: Saul Wold <saul.wold@windriver.com>

This is needed when the SDK or eSDK is installed in a /build top level
directory as it conflicts with the build directory within the existing
/usr/src/debug/build (which is really a link). Rename it and then do the
copy, this is not an issue with master currently due to some other
changes that occurred in master.

Fixes: [YOCTO #15026]

Signed-off-by: Saul Wold <saul.wold@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/package.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 8b11fdd155..2950218145 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -636,6 +636,13 @@ def copydebugsources(debugsrcdir, sources, d):
         # Same check as above for externalsrc
         if workdir not in sdir:
             if os.path.exists(dvar + debugsrcdir + sdir):
+                # Special case for /build since we need to move into
+                # /usr/src/debug/build so rename sdir to build.build
+                if sdir.find("/build") == 0:
+                    cmd = "mv %s%s%s %s%s%s" % (dvar, debugsrcdir, "/build", dvar, debugsrcdir, "/build.build")
+                    subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
+                    sdir = sdir.replace("/build", "/build.build", 1)
+
                 cmd = "mv %s%s%s/* %s%s" % (dvar, debugsrcdir, sdir, dvar,debugsrcdir)
                 subprocess.check_output(cmd, shell=True, stderr=subprocess.STDOUT)
 
-- 
2.34.1


