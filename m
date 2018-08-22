Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by mail.openembedded.org (Postfix) with ESMTP id 603B1793F7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 15:09:00 +0000 (UTC)
Received: by mail-oi0-f46.google.com with SMTP id z185-v6so3268115oia.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=2dwtxnS/G+E9P8NJ+dybZKV8j1I6t+zInrEIlkfTi5o=;
	b=COev6fMcRKz7FjSz1X4OjOZGULwsk9Jk+UjpNrhRWEv8ZVda6J41FX1X/iMEun/088
	0LJJoRodUvYwM/oWgQ/0ro/cT7HZIzuCIrmkH4xluk0y1mG8xnUCzhVtoG/ZumtHSaGq
	ZXUn252wy0HL1S1EvvtnglIHNC586Uo+wOX69GTbTtU1DP5A7HHU6GZxnV2QjFwLVXcB
	E58I7Q4VMsPrS5njA/yq3dorA0+qfP/zB56wtDWHQRbEw+UCyoN4HN7xELX6eRxI2qE3
	Mf/yDXSzHGkxWaJmsJd4UvYPVCSx34oIrLeB17BA9fp6992bcW1vK2Sl0xxACet1o+XP
	SxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=2dwtxnS/G+E9P8NJ+dybZKV8j1I6t+zInrEIlkfTi5o=;
	b=altsHhEYTI+rig1+yN00vpLFdX6cDnRoEl9ruXIcWN+17LIXVR/xo3oRxcIl373m2a
	HEy7EkhRIUgSHogNVFlg8F5IKkeO1Meanqh7cH95SzAo43WqNW41b5lulM71PHeWm0L2
	Npdc2zNm94Bv0Ul7CbkVnOQMf7lCbg47htV1Gpg3plX3v9Tn4q85i68WdwGm6qilda7x
	SMpoSO9muoDSX8HlOk4bzohCkh3QRl3JietUhA6neTvNhK2H/9hM4s7OzN6rM01sS+EK
	/ez0eZIrOU0viVCD3eB+nC00/JWaS+1pgCo69vTOZZa8myHKmqs4Zn0CqBZj9HExHm2z
	mBFQ==
X-Gm-Message-State: APzg51B/d8ChQox0vZ2lWkZouMHvzAp1m17nLiVT9qdSPKT9NW8roy8T
	aLKPNc12RNYY49vEztn8xv8dVaHpI8g=
X-Google-Smtp-Source: ANB0VdZSzYBQ/mW/3vV5BrglgKvGF5XvXZXxtXNmh0dWsgPbVvXD+ysmpOa/f7IJgGWXp37ddy+iCw==
X-Received: by 2002:aca:d946:: with SMTP id
	q67-v6mr2000999oig.212.1534950541065; 
	Wed, 22 Aug 2018 08:09:01 -0700 (PDT)
Received: from dell-laptop.mvista.com ([157.49.107.222])
	by smtp.gmail.com with ESMTPSA id
	i132-v6sm1024281oif.20.2018.08.22.08.08.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Aug 2018 08:09:00 -0700 (PDT)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Aug 2018 20:38:19 +0530
Message-Id: <1534950532-23850-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 2.7.4
Subject: [ROCKO][PATCH V3 01/34] sqlite3: CVE-2017-15286
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Aug 2018 15:09:00 -0000

CVE-2017-15286: Make sure the tableColumnList() routine of the command-line
shell does not cause a null-pointer dereference in an error condition.

Affects sqlite3 < 3.21

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 .../sqlite/files/CVE-2017-15286.patch              | 34 ++++++++++++++++++++++
 meta/recipes-support/sqlite/sqlite3_3.20.0.bb      |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-support/sqlite/files/CVE-2017-15286.patch

diff --git a/meta/recipes-support/sqlite/files/CVE-2017-15286.patch b/meta/recipes-support/sqlite/files/CVE-2017-15286.patch
new file mode 100644
index 0000000..954f8d5
--- /dev/null
+++ b/meta/recipes-support/sqlite/files/CVE-2017-15286.patch
@@ -0,0 +1,34 @@
+SQLite 3.20.1 has a NULL pointer dereference in tableColumnList in shell.c 
+because it fails to consider certain cases where 
+`sqlite3_step(pStmt)==SQLITE_ROW` is false and a data structure 
+is never initialized.
+
+This CVE patch applies neatly on sqlite v3.20.0, hence applying
+for sqlite v3.20.0.
+
+Also, removed hunk of "src/shell.c.in" present in upstream 
+commit https://www.sqlite.org/src/info/5d0ceb8dcdef92cd; as v3.20.0
+does not have src/shell.c.in file.
+
+CVE: CVE-2017-15286
+Upstream-Status: Backport from v3.21
+
+Signed-off-by: drh <name@hidden-address>
+Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
+
+Index: src/shell.c
+==================================================================
+--- src/shell.c
++++ src/shell.c
+@@ -3799,10 +3799,11 @@
+         isIPK = 0;
+       }
+     }
+   }
+   sqlite3_finalize(pStmt);
++  if( azCol==0 ) return 0;
+   azCol[0] = 0;
+   azCol[nCol+1] = 0;
+ 
+   /* The decision of whether or not a rowid really needs to be preserved
+   ** is tricky.  We never need to preserve a rowid for a WITHOUT ROWID table
diff --git a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
index e508258..1b82289 100644
--- a/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
+++ b/meta/recipes-support/sqlite/sqlite3_3.20.0.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed0
 SRC_URI = "\
   http://www.sqlite.org/2017/sqlite-autoconf-${SQLITE_PV}.tar.gz \
   file://sqlite3-fix-CVE-2017-13685.patch \
+  file://CVE-2017-15286.patch \
   "
 SRC_URI[md5sum] = "e262a28b73cc330e7e83520c8ce14e4d"
 SRC_URI[sha256sum] = "3814c6f629ff93968b2b37a70497cfe98b366bf587a2261a56a5f750af6ae6a0"
-- 
2.7.4


