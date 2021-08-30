Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web11.1231.1630349292519254752
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Aug 2021 11:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qb2c7gp3;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id u16so23846550wrn.5
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Aug 2021 11:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wBFm0DXa3Iu0nIvz4kocTdlz0oBdLVrkFii6TGXuxc8=;
        b=qb2c7gp3dC/zOxDDnI51ROVA3dx2paw+lux4MDrLxGUBmePadms2rugDS7r+277ha/
         cm1iITV+EIkMAWX+PgA1gSuq3kHSpUa0usPNCIk42dxz+VsKvvN6IYwnpK1wgYrGL8Me
         ih8QD3eV9PGGmzxZjolJrr5kEXAo4SA6iOCtEfqemW4KKuf+xX5lh2DYL7thUF5KYW7s
         65rUKLv71sUH89X8hk7V1vGojyoFzhsa6V1AbZ6D8QIU2aa2fEp3VcS0trDUBgBUynT+
         /EuZlUcYAuN5NKo4umb1b9dyhNElkXez/b38+NBQgx1vKZVoQfLG0FrSu9MYGqdTo8/r
         GPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wBFm0DXa3Iu0nIvz4kocTdlz0oBdLVrkFii6TGXuxc8=;
        b=CjN+WDcq2swse9ZCszLFID8raQCgOVTwoDWpjEPTSU6o2byyetnn2joC15PSnohs/7
         BmDxigtC1edb6VjOSLr2rLuv5IjyTrhQzvYtbSukistlg1rlMszOw1gAfIZe39dwWiOk
         EZWJM6RuwVP0iuZjLYAO5GRiuUYe4js8ToawKXNiOm3ZmaRKJMTk7zglPHrspT7PV05f
         ErgYHvL4/dRnZPvsh3q6yyDLzccWwXk+XNDZkmCG43OI7k+EybMuPtmeGScBKmozXtpE
         81lLZWk30RW92MsxRkzZGLM8VQVq+vRc3FyToHwBIrQ8LLkpjM9b/gfDWlnkfDLM1/EM
         /5Hg==
X-Gm-Message-State: AOAM530MCDyEWQh+assnPItqRbqnByp32G7WGXP7lx5NQQzH++TASVn0
	ae7nGkH4OmEuLip1GWkezMdL/uxXa+LQcQ==
X-Google-Smtp-Source: ABdhPJy8KbBWQ2dRwuGmJCbtWyP1OWYxRdM5FM2GVZRw6pMHcwdlax56iY6nTQ6zicmJYxwsJGasmQ==
X-Received: by 2002:adf:c411:: with SMTP id v17mr26799438wrf.160.1630349291169;
        Mon, 30 Aug 2021 11:48:11 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a1:9900:5e06:8d90:670b:86c8])
        by smtp.gmail.com with ESMTPSA id e2sm18141487wrq.56.2021.08.30.11.48.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 11:48:10 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [RFC PATCH 6/7] perl: do not build berkeley db module by default
Date: Mon, 30 Aug 2021 20:47:59 +0200
Message-Id: <20210830184800.954770-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210830184800.954770-1-alex.kanavin@gmail.com>
References: <20210830184800.954770-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bdb is unmaintained and altogether obsolete, the less dependencies
we have on it, the better.

This leaves only apt (specifically, apt-ftparchive) in core as a bdb consumer,
sadly it has a hard dependency that isn't easy to patch out. Maybe apt
upstream will get to it at some point.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index ab19a8d0be..a12a0be2f2 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -35,7 +35,7 @@ DEPENDS += "perlcross-native zlib virtual/crypt"
 
 PERL_LIB_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}.0"
 
-PACKAGECONFIG ??= "bdb gdbm"
+PACKAGECONFIG ??= "gdbm"
 PACKAGECONFIG[bdb] = ",-Ui_db,db"
 PACKAGECONFIG[gdbm] = ",-Ui_gdbm,gdbm"
 
-- 
2.31.1

