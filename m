Return-Path: <raulgildons@gmail.com>
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
	[209.85.160.180])
	by mail.openembedded.org (Postfix) with ESMTP id F15396BC86
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 13:42:06 +0000 (UTC)
Received: by mail-qt1-f180.google.com with SMTP id d18so16349900qto.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 05:42:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7+BNVlp+N8hMwCSyuUkTXQZGJlOnWncduz5KQTTfeh0=;
	b=FrNwG0P9oyv/+stJztb5M5+vE4naBo2E9RVUGsMap2wkSV9Na/Tuc1VghfUVNAVunE
	zYF3Wt4iogmSGDmuaHMlA+nA0FzxFl037sjk97eqIPIRte6BsRyKGyMD7OdAkNwfiRkF
	Lo1mAKM23GeUQzl5BvD3hJ2Td5KWSofTT11qKk87gCUU5IWUzxUUwYuf+OEaO4ilxOLz
	Kqu3MH0i1URdL9unoawFKBg7mGu/AwPW1oXEiEohyxVd2yD1hTv1nV37D6lsqSIijjEW
	Sf3QNzRSqTvSWjkjGkCT9TaJ3Es5ffOcejtClWrlPGti2xG6YKCEMYuxyeisGcqKvSAB
	nefg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7+BNVlp+N8hMwCSyuUkTXQZGJlOnWncduz5KQTTfeh0=;
	b=rL5kDMyAiSqu0BV+oaTsJaS6gIjyEDo75ph1p8m63KZK8MIxW862EdFC5yBDEqoePE
	/CPB92935/dKgDfzo7dJsRwGstzXbxsFGIesNv1VRD/nqTubqGP/nWlhCk/NR9EaRoaQ
	X63ghGZzPTKD5wI2WfQIOYSixOUCP+Go0DukHoFEESF2cAWUKYuai7m2e1079+qoqmLL
	2OVzi3UVRKp4+yOmqz6S7Ds2Nvw+U65bpEkauaYRgS90530Nq/56MV/wv3sE8CRDVWGO
	QohGdOXHTxmvJM7MTSAeuYgi1b4Ajzh1rQP3SPWIaEL9mOk7nPh/4+N9x9seqL05Bx1L
	vmSA==
X-Gm-Message-State: AA+aEWYdKECn/INTW64Xq2tnrnA8vKtBh+AMC6pkEktbnEzl40JxErLy
	XAn+CsMxSv+B8NhAiUSXIPbfpJiK
X-Google-Smtp-Source: AFSGD/XlF7RBW5mKwsgH6giGReQeSS8Qv+vgi/0WK6z+MyMZ4Ykh0dT/YxyjaHuiBC9l5O5i/smRfw==
X-Received: by 2002:aed:22c6:: with SMTP id q6mr16451378qtc.145.1544535727564; 
	Tue, 11 Dec 2018 05:42:07 -0800 (PST)
Received: from localhost.localdomain ([131.255.238.50])
	by smtp.gmail.com with ESMTPSA id
	o42sm10391549qtc.90.2018.12.11.05.42.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Dec 2018 05:42:06 -0800 (PST)
From: Raul Martins <raulgildons@gmail.com>
X-Google-Original-From: Raul Martins <raul.martins@alta-rt.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 11:41:59 -0200
Message-Id: <1544535719-15934-1-git-send-email-raul.martins@alta-rt.com>
X-Mailer: git-send-email 2.7.4
Cc: Raul Martins <raul.martins@alta-rt.com>
Subject: [PATCH] oe: Fix opkg status list parse - Missing postinst
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
X-List-Received-Date: Tue, 11 Dec 2018 13:42:07 -0000

While parsing opkg package status, last package status was not
properly handled, resulting in final image without postinst and
pkg depends

Signed-off-by: Raul Martins <raul.martins@alta-rt.com>
---
 meta/lib/oe/rootfs.py | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e5512d0..9bdc72c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -507,9 +507,9 @@ class DpkgOpkgRootfs(Rootfs):
             return pkg_depends_list
 
         pkgs = {}
-        pkg_name = ""
+        pkg_name = None
         pkg_status_match = False
-        pkg_depends = ""
+        pkg_depends = None
 
         with open(status_file) as status:
             data = status.read()
@@ -519,17 +519,29 @@ class DpkgOpkgRootfs(Rootfs):
                 m_status = re.match("^Status:.*unpacked", line)
                 m_depends = re.match("^Depends: (.*)", line)
 
+                #Only one of m_pkg, m_status or m_depends is not None at time
+                #If m_pkg is not None, we started a new package
                 if m_pkg is not None:
-                    if pkg_name and pkg_status_match:
-                        pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
-
+                    #Get Package name
                     pkg_name = m_pkg.group(1)
+                    #Make sure we reset other variables
                     pkg_status_match = False
-                    pkg_depends = ""
+                    pkg_depends = None
                 elif m_status is not None:
+                    #New status matched
                     pkg_status_match = True
                 elif m_depends is not None:
+                    #New depends macthed
                     pkg_depends = m_depends.group(1)
+                else:
+                    pass
+
+                #Now check if we can process package depends and postinst
+                if pkg_name is not None and pkg_status_match:
+                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+                else:
+                    #Not enough information
+                    pass
 
         # remove package dependencies not in postinsts
         pkg_names = list(pkgs.keys())
-- 
2.7.4


