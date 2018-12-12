Return-Path: <raulgildons@gmail.com>
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
	[209.85.160.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1207B6C46D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 07:26:54 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id d18so19430307qto.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Tp8JckXV0ZYlJ6GBNP6zwiQji6PoNE97mpwWmFepdMU=;
	b=oINuqg7YNlU0PF9F1IXEUqSI5gjbEc4E5p0HB2l6hSCQ3x/AalgbLfJGU1VAb03Oa4
	YTxCyNrmLmg/njD/VwB7Q1HkkUm2xKE+Ll2AzSywSF8VphZJ8QcEHtVbprXSkMUi63D9
	vNPX8bOEk4B2BT8QSMa6OKz92OxLgok3g4fMm7WknKEGgakgW0HgE/xhkBvYuj1JFtWC
	ITWiLmztvWVY0eUPEIFrNZNu0HPwuFNriiYgA2UlWTMwnZcWBF3YY0pX6TREepun7UUj
	5RyEFJEuUV+9dLw5m8aZqg7Q9+KFrgBGXmf5dOBK5vpKrRAK02D0uyQtUmkd4TY5VxoO
	kJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Tp8JckXV0ZYlJ6GBNP6zwiQji6PoNE97mpwWmFepdMU=;
	b=RKr6n/miDhSBCDFAely/FueqnBvpaywV/vHcoeYRJYjf/lcQj8bsTiMCRBIkRCkwRh
	DtZr5yGsaJS/RF8LxyQa3bundWg98KPqDh4OiVTVkkJ9owLRsSPZeiBCHwl3KMY7tUK/
	6xPZMFhF1bx1ptVDCtdMlNLcxYABtjfVz2iUoOoAzGzQw+31HPuYHtWqVFg70aLDh/9i
	PdgPBkKsdrcpe3MsmyMfvCdoWppIBEV/+XSMsxuefb6yUyWpPKIErz94C3FEKRhJgB2/
	HbazdTkfmVVOSnE8X89OW+5XoTQLD7FGksIj3jGDBBfciZ/5hua50f7rBcL4TniQ76/n
	4bxg==
X-Gm-Message-State: AA+aEWZ9zXjLGoDyvosMvbVN7DlGcPhHWcys66R6B8lku1wkhXy4kbA9
	aZNmcpwf66VKBQbZMErsl4/E0/4M
X-Google-Smtp-Source: AFSGD/WdM+Ng1Gz6eKLbtOWBubCV4KAf+YVuL5uWm5NNVz0d09e+xS8FsbVSXJgrVU97ed02E8/JKQ==
X-Received: by 2002:aed:306c:: with SMTP id 99mr18311007qte.61.1544599615554; 
	Tue, 11 Dec 2018 23:26:55 -0800 (PST)
Received: from localhost.localdomain ([131.255.238.50])
	by smtp.gmail.com with ESMTPSA id
	z20sm8597633qkb.41.2018.12.11.23.26.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Dec 2018 23:26:54 -0800 (PST)
From: Raul Martins <raulgildons@gmail.com>
X-Google-Original-From: Raul Martins <raul.martins@alta-rt.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2018 05:26:47 -0200
Message-Id: <1544599607-13206-1-git-send-email-raul.martins@alta-rt.com>
X-Mailer: git-send-email 2.7.4
Cc: Raul Martins <raul.martins@alta-rt.com>
Subject: [PATCH v2] oe: Fix opkg status list parse - Missing postinst
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
X-List-Received-Date: Wed, 12 Dec 2018 07:26:55 -0000

While parsing opkg package status, last package status was not
properly handled, resulting in final image without postinst and
pkg depends

Signed-off-by: Raul Martins <raul.martins@alta-rt.com>
---
 meta/lib/oe/rootfs.py | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index 9bdc72c..4273891 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -507,9 +507,9 @@ class DpkgOpkgRootfs(Rootfs):
             return pkg_depends_list
 
         pkgs = {}
-        pkg_name = None
+        pkg_name = ""
         pkg_status_match = False
-        pkg_depends = None
+        pkg_depends = ""
 
         with open(status_file) as status:
             data = status.read()
@@ -526,7 +526,7 @@ class DpkgOpkgRootfs(Rootfs):
                     pkg_name = m_pkg.group(1)
                     #Make sure we reset other variables
                     pkg_status_match = False
-                    pkg_depends = None
+                    pkg_depends = ""
                 elif m_status is not None:
                     #New status matched
                     pkg_status_match = True
@@ -537,7 +537,7 @@ class DpkgOpkgRootfs(Rootfs):
                     pass
 
                 #Now check if we can process package depends and postinst
-                if pkg_name is not None and pkg_status_match:
+                if "" != pkg_name and pkg_status_match:
                     pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
                 else:
                     #Not enough information
-- 
2.7.4


