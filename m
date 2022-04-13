Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB350C4321E
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:52 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web09.641.1649867652425856165
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:34:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DKPO+4Ol;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id m14so3434564wrb.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 09:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJ0qYg+x+ULqGOJE/9DY3LK/8vnEMwIzy9Db36WAnCs=;
        b=DKPO+4OlQ8qkcpB0hdnvFnEJbfAOMcBaptQC7cYMpjNWaWKeVRzkN6vEuQZJ0wt/1m
         FoVhTicScKuFHTRwuM45woEf/1vkeMl0+yZ4pzsI0I9iPsu1JolDHmdKqEZqTzvlBVyZ
         OuXePF5AuyPbc52Iy4JDgMwDX1PaOi+3kE3jM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rJ0qYg+x+ULqGOJE/9DY3LK/8vnEMwIzy9Db36WAnCs=;
        b=Ai16eW0cEWqux9TTwleMjcyUqcTJWw9CjTzwPWHggaoyitZV9x9LyJyPn6vJz9qJ7t
         8cRpXd4oTUleNvyCWPzJB6hhdHTMjynWuEq3L5TUHEfqxpq0z4Jim5SDITqw5bpqTXE6
         syCSL0VSwSQwGR35Jbx9UmPvPwODLyuMDLVslN8Kte4MuqCWVWUMeSF589dNmNpBu6+f
         woLc0hUaL89TP8sJUB8pB/EvxHSV1fhOzD4J4LCeREEOYQGXSsjoc/LUUp6PXBBkmPuQ
         BoxoQWJE0rdtWeN4tzDNP8GPRgDih98swGDVeLrsNesRkRi3XvNmdzBtUD0y1iWmUTEQ
         DkdA==
X-Gm-Message-State: AOAM530wORj86yBNm2u+rL1G+CCXqPUaeolxi4rChCXp6GIT0FkoSNT5
	vxlLI9MJkMADtJIedDp5N6MVK+IFkWtfNA==
X-Google-Smtp-Source: 
 ABdhPJwvAZoU7qI2Ei5RnEjEH6L+DFc3L1hgInQbbAvC/TSbPv66Z8WMLH7BAs25zt1icYdjsPjt3A==
X-Received: by 2002:adf:d081:0:b0:203:e209:7def with SMTP id
 y1-20020adfd081000000b00203e2097defmr32605235wrh.388.1649867650487;
        Wed, 13 Apr 2022 09:34:10 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:5cc2:b4ab:4d4b:907d])
        by smtp.gmail.com with ESMTPSA id
 s7-20020a5d6a87000000b00207aad420c4sm6632904wru.101.2022.04.13.09.34.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 09:34:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] sanity: Show a warning that make 4.2.1 is buggy on non-ubuntu
 systems
Date: Wed, 13 Apr 2022 17:34:08 +0100
Message-Id: <20220413163408.2181683-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Apr 2022 16:03:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164340

We keep seeing hangs on the autobuilder with make 4.2.1 on Centos8, Alma8
and OpenSuse workers. The hang occurs in perl and kernel builds in particular.
The issue is fixed in 4.3 and has been patched on Ubuntu systems:

https://git.savannah.gnu.org/cgit/make.git/commit/?id=78b5fec6898c26956d00548427cda1101cb80f8a
https://savannah.gnu.org/bugs/?51400

Add a sanity test for make 4.2.1 and error for non-ubuntu systems. We're
making a buildtools-make-tarball available which can be used to
allow systems with the broken version to use the project.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sanity.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index be956fbcd6c..c385d92e8b0 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -467,6 +467,12 @@ def check_make_version(sanity_data):
                 os.remove("makefile_test_b.c")
             if os.path.exists("makefile_test.a"):
                 os.remove("makefile_test.a")
+
+    if bb.utils.vercmp_string_op(version, "4.2.1", "=="):
+        distro = oe.lsb.distro_identifier()
+        if "ubuntu" in distro:
+            return None
+        return "make version 4.2.1 is known to have issues on Centos/OpenSUSE and other non-Ubuntu systems. Please use a buildtools-make-tarball or a newer version of make.\n"
     return None
 
 
-- 
2.32.0


