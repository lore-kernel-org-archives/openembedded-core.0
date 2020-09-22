Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.web11.8109.1600780708341754862
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 06:18:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZXHq6HZc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f66.google.com with SMTP id s13so3296523wmh.4
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 06:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=acza1Pn4wctmfUiUV0UMKa/4v9EbjYjW4De5gKCyO2I=;
        b=ZXHq6HZclxgtolksxDaw2hWjGk/wYZPRRIg85IhTStc9rT82bFfhF7sojKcTpuOsLG
         UwDMmpIuMQGeTjmFbGU+YCuNAZxrsRw9vZLaourF4SHgkbmpAL/TTemTMMntYHoZreba
         KmZNi16kANDk+bGQzizNeRGlCJP9tY1ZNxb5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=acza1Pn4wctmfUiUV0UMKa/4v9EbjYjW4De5gKCyO2I=;
        b=JZWM68+6fsRnLGixluhI/gp03joKL7oongEUncpj8sPxOmAcN/CUQns8ZS2JY7jIVA
         kin4JNbjx3y2VDEOTl2WmZETrZNAMp7kl0FIlcfyXBALScneR6Fu424inHbr7hL1lvyh
         QCHxkk2QTio/FTUPCIph0FQtkIP2KpJMyqzLWRT5kW8AuZOVApnjSse9qs1lMi0PErUM
         hVflVulSX3LAD38X/hKrMlZ4fWmpdEvFsJ1OuKkK9xw+9u7TT7pL5oLHuJIQMl9lLjON
         B6y3FgRt5R9C84la6U0/Z9LgiwrjFAx24SP9nryPa9qWLzTUS6+kLGakzX40q+rR+8t5
         NUKg==
X-Gm-Message-State: AOAM530D+7a0w0z/9fkPC99L70i2Q37/s6wGzfhgF8tHC0KlbBijobs5
	pZQLOVP24kgR7rYgbk1ylYt5l99pMT8SWg==
X-Google-Smtp-Source: ABdhPJym26AEraSfplW+4rQmmK4OhGgdbPUJw/FeuGNurYNbu2+xK+J6XL4Idk2K1BpiaR42FM7O1g==
X-Received: by 2002:a1c:1983:: with SMTP id 125mr977274wmz.29.1600780706344;
        Tue, 22 Sep 2020 06:18:26 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (d.4.9.1.b.0.3.3.1.2.9.4.4.4.0.b.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:b044:4921:330b:194d])
        by smtp.gmail.com with ESMTPSA id d23sm4418222wmb.6.2020.09.22.06.18.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2020 06:18:25 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] pseudo: Remove mismatched inodes from the db
Date: Tue, 22 Sep 2020 14:18:24 +0100
Message-Id: <20200922131825.2496981-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, where pseudo finds a database entry for an inode but the path
doesn't match, it reuses that database entry metadata. This is causing
real world "corruption" of file attributes.

See [YOCTO #14057] for an example of this.

This can happen when files are deleted outside of pseudo context and the
inode is reused by a new file which pseduo then "sees".

Its possible the opposite could happen, it needs to reuse attributes
but this change would prevent it. As far as I can tell, we don't want
pseuod to reuse these attributes though so this code should be safer
and avoid bugs like the above.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/delete_mismatches.patch      | 25 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/delete_mismatches.patch

diff --git a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
new file mode 100644
index 00000000000..59241671767
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
@@ -0,0 +1,25 @@
+When we see cases where the inode no longer matches the file path, pseudo notices
+but currently reuses the database entry for the file.
+
+Change this to delete the likely stale database entry instead. We're
+seeing bugs where inode reuse for deleted files causes permission corruption.
+(See bug #14057 for example).
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -705,6 +705,10 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 						(unsigned long long) msg_header.ino,
+ 						path_by_ino ? path_by_ino : "no path",
+ 						msg->path);
++					if (msg->nlink == 1) {
++						pdb_unlink_file_dev(msg);
++						found_ino = 0;
++					}
+ 				}
+ 			}
+ 		} else {
diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 3b623d8bd77..7eb72f0eab3 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -2,6 +2,7 @@ require pseudo.inc
 
 SRC_URI = "git://git.yoctoproject.org/pseudo;branch=oe-core \
            file://0001-configure-Prune-PIE-flags.patch \
+           file://delete_mismatches.patch \
            file://fallback-passwd \
            file://fallback-group \
            "
-- 
2.25.1

