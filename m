Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD3D8C433F5
	for <webhook@archiver.kernel.org>; Thu,  7 Oct 2021 14:07:04 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.12093.1633615623448800774
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:07:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=f6iFH6pI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id v17so19479426wrv.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Oct 2021 07:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmXr7U7qH2L8SJJhwgwGzukT8jGVoTmrCEL0sis3ap8=;
        b=f6iFH6pIW6aqUEdlh8tEHQ4KWYD5aArkABNahUQt0+mS/x5giBUICxzoUSMeT9A3m3
         NHF63CqRG7Dc1tKyoNTZ+X/3jUDi4YM8lU3E5RZasu0ysPnXt2VafVy4c4D4eFgOYOLN
         6SGQgy50wLaALAckGBnnIqmFO95CeqO0n63+s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fmXr7U7qH2L8SJJhwgwGzukT8jGVoTmrCEL0sis3ap8=;
        b=YQEDx16O0+ZZBKZwdnHFTAkEL9u05t1/iNLgRjqPw6BlyBHnySRzR6i7oeolzJdp/A
         Jzb99aePNqcHg3EYTszsSJ2sX744TWVS8/yX4EUZdCy+/pXd7WlgKvomh6tkhtObwK2X
         fnUEHd/RWHbqz5F+nsNS/ex+tDeeMIfNlDOYV3fqQYoq07LrAO2IP0yilIpEvfhwc5Hw
         uvjt7e52APbvKhMf7gKiK605nb/wWloUX9BPD9k8Obw1PeYpVb5dv/2LBbnx5snrdi24
         QrJlPGE4iHWyHYdqdzkjbSBJPkicjlNaX8K6LSNFMnHWUhkm7M0iUeQKVMWd8qGt7dIS
         ld5w==
X-Gm-Message-State: AOAM532uKZXjtuZ7W3125nutLE918ojQprkoVuhYk7BTgVsPs3/yZoKx
	l3gK2GC18z+7HDHZBG9fYiVjJEPkUZkeTA==
X-Google-Smtp-Source: 
 ABdhPJwXE9NZWRuQsfX24EGI+1f536UycDtv/q0czmEuY9fOyteWjNSZ09SKyjLw9FULUeSIWG6MBQ==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr5681937wrz.29.1633615621509;
        Thu, 07 Oct 2021 07:07:01 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:4ef0:3e29:718c:a98a])
        by smtp.gmail.com with ESMTPSA id
 d3sm27441979wrb.36.2021.10.07.07.07.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 07:07:01 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] sstatesig: Only apply group/other permissions to pseudo
 files
Date: Thu,  7 Oct 2021 15:06:58 +0100
Message-Id: <20211007140659.2419135-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Oct 2021 14:07:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156725

We hardlink some files into the build, such as licence files in
do_populate_lic tasks. Depending on the umask that the source tree
was checked out with, the group permissions would vary. This
results in inconsistent task outhashes.

Avoid this by ignoring the group/other bits unless we're under
pseudo context.

Bump the ABI numbers to ensure we don't see cache corruption from
earlier builds.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/sstate.bbclass |  2 +-
 meta/conf/abi_version.conf  |  2 +-
 meta/lib/oe/sstatesig.py    | 27 ++++++++++++++-------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 7f4b1f6804c..860122a0cdf 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -1,4 +1,4 @@
-SSTATE_VERSION = "5"
+SSTATE_VERSION = "6"
 
 SSTATE_MANIFESTS ?= "${TMPDIR}/sstate-control"
 SSTATE_MANFILEPREFIX = "${SSTATE_MANIFESTS}/manifest-${SSTATE_MANMACH}-${PN}"
diff --git a/meta/conf/abi_version.conf b/meta/conf/abi_version.conf
index e84cad1019a..62714f5e613 100644
--- a/meta/conf/abi_version.conf
+++ b/meta/conf/abi_version.conf
@@ -12,4 +12,4 @@ OELAYOUT_ABI = "14"
 # a reset of the equivalence, for example when reproducibility issues break the
 # existing match data. Distros can also append to this value for the same effect.
 #
-HASHEQUIV_HASH_VERSION  = "8"
+HASHEQUIV_HASH_VERSION  = "9"
diff --git a/meta/lib/oe/sstatesig.py b/meta/lib/oe/sstatesig.py
index 0c3b4589c57..c2e3e2f4f58 100644
--- a/meta/lib/oe/sstatesig.py
+++ b/meta/lib/oe/sstatesig.py
@@ -552,21 +552,22 @@ def OEOuthashBasic(path, sigfile, task, d):
                 else:
                     add_perm(stat.S_IXUSR, 'x')
 
-                add_perm(stat.S_IRGRP, 'r')
-                add_perm(stat.S_IWGRP, 'w')
-                if stat.S_ISGID & s.st_mode:
-                    add_perm(stat.S_IXGRP, 's', 'S')
-                else:
-                    add_perm(stat.S_IXGRP, 'x')
+                if include_owners:
+                    # Group/other permissions are only relevant in pseudo context
+                    add_perm(stat.S_IRGRP, 'r')
+                    add_perm(stat.S_IWGRP, 'w')
+                    if stat.S_ISGID & s.st_mode:
+                        add_perm(stat.S_IXGRP, 's', 'S')
+                    else:
+                        add_perm(stat.S_IXGRP, 'x')
 
-                add_perm(stat.S_IROTH, 'r')
-                add_perm(stat.S_IWOTH, 'w')
-                if stat.S_ISVTX & s.st_mode:
-                    update_hash('t')
-                else:
-                    add_perm(stat.S_IXOTH, 'x')
+                    add_perm(stat.S_IROTH, 'r')
+                    add_perm(stat.S_IWOTH, 'w')
+                    if stat.S_ISVTX & s.st_mode:
+                        update_hash('t')
+                    else:
+                        add_perm(stat.S_IXOTH, 'x')
 
-                if include_owners:
                     try:
                         update_hash(" %10s" % pwd.getpwuid(s.st_uid).pw_name)
                         update_hash(" %10s" % grp.getgrgid(s.st_gid).gr_name)
-- 
2.32.0


