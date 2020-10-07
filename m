Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9870.1602065693144667261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Oct 2020 03:14:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gDJLT6wK;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id d81so1704319wmc.1
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2020 03:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAigaHmjsfGDzNfv4ItoPhohLO/wIDI6QJ9Gag9rey8=;
        b=gDJLT6wKQ0+55DS3sl0njxv0+W7z2KgD6bnWptw2KsIZ707P15rI6dVkOBJz0++rKl
         WglBVpsd8DknbM6t05PZgqRydLaNONzaebWMOFD8AT2f6MFiJzaOVTRXGOv3UsULQir4
         DD9/ospSYFCOIRJRrTrx3DBPdU8P6fwyrQTfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UAigaHmjsfGDzNfv4ItoPhohLO/wIDI6QJ9Gag9rey8=;
        b=fC011H5ZcKH31VlXBqIxV7StKRPWwCOr5BarkIYxKLQcxvEmjkK6lDd3mcblzM3CJF
         kfQm7rLyqAhsSIX8oD3J1Nwz5rj4b9rnlsiGKKikReWwznwB+r+Thp8bdly0ejN3fQun
         okxwLGoRHXiWaLE/yvnS5u7cj84U+0KhzgzFRcEd5Q9dAeNvKzheUIYgnqg/b59StHB7
         977wnRJkoT2oqjgzXDri0iovxFMiHql/I3I9cogdeG45AQYhRWGOIvUd/MbdH1/UxYML
         CxKaUIuQvdzGk8GGoaU861DqSMM6PYZ81Kbi4NcF1v8QnBvXy2/iGsgqRWBtHkwmbNib
         5jUA==
X-Gm-Message-State: AOAM5330d1o5a47bwgZenvxyx2Ywf1SUj6W0F3Q34JFcOzMILMk87QyM
	VCsrcdnIgYCuIHvBjqRYLLeWDLSeE9h2YQ==
X-Google-Smtp-Source: ABdhPJw/XgVkPMeJhSQM5H6kHB9xb3do6XVA9FAHCWJrmKVUqXWIBKbsJhTcM/RgztHar+udEJu5JQ==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr2447846wme.172.1602065690995;
        Wed, 07 Oct 2020 03:14:50 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (f.c.8.7.1.0.8.4.a.6.c.a.3.f.8.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f8f3:ac6a:4801:78cf])
        by smtp.gmail.com with ESMTPSA id v2sm2183956wme.19.2020.10.07.03.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2020 03:14:50 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH 1/9] pseudo: Ignore mismatched inodes from the db
Date: Wed,  7 Oct 2020 11:14:41 +0100
Message-Id: <20201007101449.3132127-1-richard.purdie@linuxfoundation.org>
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
pseuo to reuse these attributes though so this code should be safer
and avoid bugs like the above.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../pseudo/files/delete_mismatches.patch      | 51 +++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |  1 +
 2 files changed, 52 insertions(+)
 create mode 100644 meta/recipes-devtools/pseudo/files/delete_mismatches.patch

diff --git a/meta/recipes-devtools/pseudo/files/delete_mismatches.patch b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
new file mode 100644
index 00000000000..6c78d787c78
--- /dev/null
+++ b/meta/recipes-devtools/pseudo/files/delete_mismatches.patch
@@ -0,0 +1,51 @@
+When we see cases where the inode no longer matches the file path, pseudo 
+notices but currently reuses the database entry. This can happen where for
+example, a file is deleted and a new file created outside of pseudo where
+the inode number is reused.
+
+Change this to ignore the likely stale database entry instead. We're
+seeing bugs where inode reuse for deleted files causes permission corruption.
+(See bug #14057 for example). We don't want to delete the database entry
+as the permissions may need to be applied to that file (and testing shows
+we do need the path matching code which handles that).
+
+I appreciate this should never happen under the original design of pseudo
+where all file accesses are monitored by pseudo. The reality is to do that,
+we'd have to run pseudo:
+
+a) for all tasks
+b) as one pseudo database for all of TMPDIR
+
+Neither of these is realistically possible for performance reasons.
+
+I believe pseudo to be much better at catching all accesses than it
+might once have been. As such, these "fixups" are in the cases I've
+seen in the logs, always incorrect.
+
+It therefore makes more sense to ignore the database data rather than
+corrupt the file permissions or worse. Looking at the pseudo logs
+in my heavily reused build directories, the number of these
+errors is staggering. This issue would explain many weird bugs we've
+seen over the years.
+
+There is a risk that we could not map permissions in some case where
+we currently would. I have not seen evidence of this in any logs I've
+read though. This change, whilst going against the original design,
+is in my view the safer option for the project at this point given we
+don't use pseudo as originally designed and never will be able to.
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Pending
+
+Index: git/pseudo.c
+===================================================================
+--- git.orig/pseudo.c
++++ git/pseudo.c
+@@ -699,6 +701,7 @@ pseudo_op(pseudo_msg_t *msg, const char
+ 						(unsigned long long) msg_header.ino,
+ 						path_by_ino ? path_by_ino : "no path",
+ 						msg->path);
++					found_ino = 0;
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

