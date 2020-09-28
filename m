Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.36706.1601300302694509929
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:38:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CS5HnoI9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id t10so1409430wrv.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UAigaHmjsfGDzNfv4ItoPhohLO/wIDI6QJ9Gag9rey8=;
        b=CS5HnoI9AqAJSxMBUDsaelZAHFB35IkBY9zsuSeoiOfuMYrLzVmj8MzR9WiDbifOVw
         pgvMz3WwST4rnHLcwPA8u/1cEcjFg43yY4shqFieqc2o2L7hz1XlK4kXaXTjnhvsuhm6
         2OnNvSyhGu5Qg28YF84Xgo/66P41uSvRMkOH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UAigaHmjsfGDzNfv4ItoPhohLO/wIDI6QJ9Gag9rey8=;
        b=t0JWBRHuT9SH0U/RzIlH4XNNncsdsdlykkBeANc6aPUaQOPKOT1NljOteKUkN9Pyj+
         O5wEKbXE9hMBpcIQXroRXAWaRSpH/HJg3DO3ms0stnCkYvOP2185JSFHTLnhZpidPyiu
         Hn9APuptoUdwxR5tyD82txiyVsIOVIs26NU+L7AnzAMwNbNfg//dt3ki+kN8+uB4A3hZ
         ztrS+jUQaG7bBxA+KNbufkF8VmKw5rZf1LUOGxwaQuPHkoAlrGngP4FYBCgCwWHp933w
         ef67JtSmMKkd+ptuVcjac7uWnr8YJT8GuO9YBJYbnQSCLZLwqwkooqe6rpnYD9qcUEne
         5OqA==
X-Gm-Message-State: AOAM533CLyuq9TeG5mZK86q/EyhZnFL/qAZIUxVtqalcDvZVYcj2ArcH
	aiC3BfkHbQxZuMz5hP9+X2vnDZdmSrb6hg==
X-Google-Smtp-Source: ABdhPJzyJ4kOQPguPm0Ye5yknuGCGeiGdB2ZateiirY6KOegVs9Pu354DHQx3nC9kOajE9VD6l0f4g==
X-Received: by 2002:a5d:40c4:: with SMTP id b4mr1787678wrq.151.1601300300694;
        Mon, 28 Sep 2020 06:38:20 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net (1.d.f.d.8.7.4.c.e.3.5.3.c.6.0.0.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:6c:353e:c478:dfd1])
        by smtp.gmail.com with ESMTPSA id k6sm1314345wmf.30.2020.09.28.06.38.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:38:12 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] pseudo: Ignore mismatched inodes from the db
Date: Mon, 28 Sep 2020 14:38:01 +0100
Message-Id: <20200928133803.2741507-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
References: <20200928133803.2741507-1-richard.purdie@linuxfoundation.org>
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

