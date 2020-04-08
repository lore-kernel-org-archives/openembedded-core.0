Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
 by mx.groups.io with SMTP id smtpd.web12.1584.1586387892508045025
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 16:18:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bzxEOdhk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.68, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f68.google.com with SMTP id h9so9511896wrc.8
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 16:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2re1XwO65V7JuuV2RPEnPkFiX5l9YodCDwe0SdOZ6fk=;
        b=bzxEOdhkDaVEQCGlSJsXoWLc8mb2A2naEeMv0dQiPGmmWfNxzHGu8fcy7M8XZqdDky
         Vapin1dQrOQI5FiYKvOriAZZ6w8JxzQpltwD0QDKJztEho97eDDEJE7scCmLHuUhmw/u
         2slvF5s8xE1Q1r+UjEofaRJmbe+WuautO4jw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2re1XwO65V7JuuV2RPEnPkFiX5l9YodCDwe0SdOZ6fk=;
        b=cbTXWU1AtfKTlMMqgFjyIQxZUSaWKcy3DhpWa5EDY2Gh+GUa+VlMalCTXJT3zcAKgo
         IA38hgJnzQxL6WieqKE5H+5Wfm1imIpHwKmgk8J7ure7MrVUsxyCyc5sJFc0mWouTOeN
         +zARVl4jEIshrygR0acElanv6iMWWS+8Q8ShFnJ8tkD+5tLHWMMyyNlnCZaG4lxbi0nZ
         AXh4/XkczT4ojenZxQGaCHfTwTqIbGL1DPmto2CptUPeSYLqob3ml1IIZVrKU5TOGFGm
         Hm7gdBEpuXfABBuVD12p8EQSL8AlI8thwduCmJi+ut02RrJDQYOE0yReLGIBzYopYWs4
         99HA==
X-Gm-Message-State: AGi0Puacpby2oXm8FPqKKNrdiKKI43BRcE8cyqvKjfq2NiqR90IPeq+N
	CL7knbICnHaurN6eGlD9TUUmGadAEw4=
X-Google-Smtp-Source: APiQypJycEw7zuVsuyS095uhv3KvgRjaM0bnSgOs/HbOIZhOSp3ZyV5d6PC/qI5I2XD2lB8Hfu87Og==
X-Received: by 2002:a5d:5688:: with SMTP id f8mr2068602wrv.245.1586387890367;
        Wed, 08 Apr 2020 16:18:10 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id k23sm697557wmi.46.2020.04.08.16.18.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2020 16:18:09 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] musl: Show error when used with multilibs
Date: Thu,  9 Apr 2020 00:18:08 +0100
Message-Id: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As discussed in the bugzilla entry, musl is not compatible with multilibs
and has no plans to support this. Therefore tell users this from the
recipe rather than letting them run into build failures.

[YOCTO #13122]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-core/musl/musl.inc | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
index bdce412162c..f2f3d3d054b 100644
--- a/meta/recipes-core/musl/musl.inc
+++ b/meta/recipes-core/musl/musl.inc
@@ -29,3 +29,9 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
 B = "${WORKDIR}/build"
 
 do_configure[cleandirs] = "${B}"
+
+python () {
+    multilibs = d.getVar("MULTILIBS")
+    if multilibs:
+        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
+}
-- 
2.25.1

