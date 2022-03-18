Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9C7C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 10:03:59 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.7779.1647597837755820634
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fD0oBNiA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id h23so10408705wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADMhfc9w3S8mY/Ik5rVQ1WB2U+eLj1DrLsh0IccNLOk=;
        b=fD0oBNiAAKjoGVcmp5sxQWWDmD11o2XFt8ePVxZKBsrRppFag/BLp2dDslQwVbLiH7
         QdctFOPAj8UEHnaEyDFGVutBPAwT7Vxb3hjHCJYFt+2aAWmOExAsNI2IJPSaEES7dJxv
         4wCXMkcBr/TW1n419Kmx8rSiv1vWs4s6UqI64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ADMhfc9w3S8mY/Ik5rVQ1WB2U+eLj1DrLsh0IccNLOk=;
        b=5HyPmfkjO2Ioi9I5f3u/2j02WNA4FGEkiccO7/rcW3j7ZM2JmJG4JnGEseXlKJcSUj
         32fi01UDaJZOAvDuWnYoVX5i3jD2adf2nNZcMolp9P0gsQWH0mhJ2w/IMOo8GXmmiiH0
         TwKpn3Zg5K06zRg/acs2FFBnNxOMBcuVqGToJgnvsIT5RdL7u/430Oxw/Gb0sCHz3RY4
         o8DLMmbfUBWvHlbUpSjhO8ZmjWH+P6p/8vbL9DrNjaY6m1b7tDuruQ5uMvNuN2zkoOSg
         vB20Z4EXwTeF1HxW8Jc9eFOwns/r6GLE1m4IyU/WBqHtqKMLoEGekI0+Y/VBKPO+mVvT
         lT6Q==
X-Gm-Message-State: AOAM533pP13c1G4JmKber5YZi86+8W+W6pSy6zeCm2+bFBH0zBloJvEW
	MOdAaBB3c3zaJSsk+p32LdES98Ev6HEcHvwI
X-Google-Smtp-Source: 
 ABdhPJw1jzLtWWi1itsgjy+CT7YbsBDav6RublDIfGU63hLFdP+vYj5GBXuG/uehr5vtmRY3lP7pSg==
X-Received: by 2002:a05:6000:2a5:b0:203:8c98:a9f1 with SMTP id
 l5-20020a05600002a500b002038c98a9f1mr7483547wry.681.1647597835745;
        Fri, 18 Mar 2022 03:03:55 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 l13-20020a05600002ad00b00203d64c5289sm6668161wry.112.2022.03.18.03.03.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 03:03:55 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Add patch to workaround insane path lengths
Date: Fri, 18 Mar 2022 10:03:54 +0000
Message-Id: <20220318100354.1057607-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 10:03:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163444

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/pathlength.patch             | 38 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/pathlength.patch

diff --git a/meta/recipes-devtools/pseudo/files/pathlength.patch b/meta/recipes-devtools/pseudo/files/pathlength.patch
new file mode 100644
index 00000000000..8507b0144cd
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/pathlength.patch
@@ -0,0 +1,38 @@
+Crazy shell code (e.g. libtool) can pass in a command pipeline as a path which exceeds the max path
+length the system can support (6000+ chars). This will fail in libc or the syscall but if we don't
+do something here, we'd segfault before it can do that. Leave path unchanged and let libc deal 
+with it.
+
+This was observed with segfaults in libfm:do_install after the libtool upgrade. It does depend on
+the length of the local build path too.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: git/pseudo_util.c
+===================================================================
+--- git.orig/pseudo_util.c
++++ git/pseudo_util.c
+@@ -810,12 +810,21 @@ pseudo_fix_path(const char *base, const
+ 		return 0;
+ 	}
+ 	newpathlen = pseudo_path_max();
++	pathlen = strlen(path);
++	/* Crazy shell code (e.g. libtool) can pass in a command pipeline as a path which exceeds the max path
++	 * length the system can support (6000+ chars). This will fail in libc or the syscall but if we don't
++	 * do something here, we'd segfault before it can do that. Leave path unchanged and let libc deal 
++	 * with it. 
++	 */
++	if ((pathlen + baselen) >= newpathlen) {
++		return path;
++	}
+ 	if (!pathbufs[pathbuf]) {
+ 		pathbufs[pathbuf] = malloc(newpathlen);
+ 	}
+ 	newpath = pathbufs[pathbuf];
+ 	pathbuf = (pathbuf + 1) % PATHBUFS;
+-	pathlen = strlen(path);
++
+ 	/* a trailing slash has special meaning, but processing
+ 	 * trailing slashes is expensive.
+ 	 */
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index f9e3b469104..f6fa9010c26 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://pathlength.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.32.0


