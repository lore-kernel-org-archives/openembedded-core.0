Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22B01C54EE9
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:32 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.20275.1664133508591386640
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=y6zBcUWl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.171,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f171.google.com with SMTP id b75so4741091pfb.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=1QaJoAY5w3DSPqghCwWRmwAPyJKh3+rVpBSEU2DVp08=;
        b=y6zBcUWlN7R+3MGkNKzI6XCfRjDSNFTfWYTeUTutnMGCJX9ESkVOTsTqclwUQBDvv/
         A+yp/PBAgIV4/GPcnqhKaaSaiISO8NTv9W6pg14M5PvkpcKmDDIjRvVekzzAqdlxrm7z
         2dhQgta4CwCKooemBdXHllBqbVTpVmElR6XnLwvi5QBFBU8Mzk8F8AP9KaadHQtP3U6x
         FgWPChvu0HaaJ7rJsT+OQ1eeUUDL6gVOGaPFCR9X8GsKOlVxw32cxUV+YJ1ZRN+8HpdK
         vvQZJDejFJuNDbFvTyH+xV+rbJkB5ULJ+ZWdft3fvIQDXZMyyvYYA7F+unnr35WABTCl
         JG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=1QaJoAY5w3DSPqghCwWRmwAPyJKh3+rVpBSEU2DVp08=;
        b=FIbCxdrx/bCK02MhHDNUx/NI1liq4v28kEpqvwJDUk5SobNfJ64LfWf6LRtYlEARnP
         axnwZx0kF9qiyK8w51pjDzoj0h4emm9uWa/G7nIm2plcLaejWzeG5IMUS/n19kimSpSI
         wKCCQlN2sGYJ126KAs70cDmRNU9zDk0sdf2zFXBSAU1ADyM7tjkOcVaIW+tJs08xZ0rl
         6ACHDrxttFcaJ2sn68Bm8ocJd82wffeDbrdjNHNPme0M5VRULCrqJiyJc4O3XcSFjvcH
         9/VZNVGjoYu4vH46iAtErHwBDmp9h84SGjcBhYdIah2vreQsMP0xI7gDQthYKy9IsSS2
         umKg==
X-Gm-Message-State: ACrzQf10OsvqF9aXjtESHOKKGNSiWu/fBYwy+T07SrfE7Dit8ZDbSTKQ
	FkQKcaDIYF/1lOewbVdaWu52FF3ciF/ZZzYc
X-Google-Smtp-Source: 
 AMsMyM7RiXVNxOZz7qdln4RlUqsWmFhYjnYxtNxNAPnFsH8hn9NbL3q9rJT3jwJH4CxixwpRYgZTug==
X-Received: by 2002:a63:ff59:0:b0:439:db5:5da9 with SMTP id
 s25-20020a63ff59000000b004390db55da9mr16673378pgk.88.1664133507592;
        Sun, 25 Sep 2022 12:18:27 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.18.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:18:27 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/33] kernel-yocto: allow patch author date to
 be commit date
Date: Sun, 25 Sep 2022 09:17:26 -1000
Message-Id: 
 <8dbce9b13960acfd6889567c11456e3c73a783b5.1664133309.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1664133308.git.steve@sakoman.com>
References: <cover.1664133308.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171029

From: Bruce Ashfield <bruce.ashfield@gmail.com>

In situations where a buid needs to be reproducible, it is
sometimes desireable to use a patches author date, versus the
time when it is applied. This generates a consistent hash
between different patch applications.

We leverage the existing KERNEL_DEBUG_TIMESTAMPS to trigger
the use of a new option to kgit-s2q. This allows us to use
the author date in a reproducible configuration, but disable
it if we need the current time/date.

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ebe2411ce78d5e4ea49b9b4cb732b461ecc32ca6)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/kernel-yocto.bbclass                       | 6 +++++-
 meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 2 +-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index afccffcf17..e8046bb8f6 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -322,7 +322,11 @@ do_patch() {
 	meta_dir=$(kgit --meta)
 	(cd ${meta_dir}; ln -sf patch.queue series)
 	if [ -f "${meta_dir}/series" ]; then
-		kgit-s2q --gen -v --patches .kernel-meta/
+		kgit_extra_args=""
+		if [ "${KERNEL_DEBUG_TIMESTAMPS}" != "1" ]; then
+		    kgit_extra_args="--commit-sha author"
+		fi
+		kgit-s2q --gen -v $kgit_extra_args --patches .kernel-meta/
 		if [ $? -ne 0 ]; then
 			bberror "Could not apply patches for ${KMACHINE}."
 			bbfatal_log "Patch failures can be resolved in the linux source directory ${S})"
diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
index a6ab9ca56d..11613ab3b6 100644
--- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
+++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "\
 
 DEPENDS = "git-native"
 
-SRCREV = "90598a5fae1172e3f7782a1b02f7b7518efd32c8"
+SRCREV = "f70b1d52f4706a263ae22e2c61039ccd875e97b6"
 PV = "0.3+git${SRCPV}"
 
 inherit native
-- 
2.25.1


