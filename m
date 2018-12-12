Return-Path: <raulgildons@gmail.com>
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
	[209.85.160.175])
	by mail.openembedded.org (Postfix) with ESMTP id D33C760043
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 07:38:27 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id k12so19455455qtf.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 23:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Xa7m57UTbsvbFYL/1NfM9YxzYkcCQQ152XwxzXFkcbQ=;
	b=LGKUJ6Du9uhbeBMxZC+YXZ6oEfbfxIT3Tz8cjZORDORcWd93mHNZwDNlkkzJKu/bf/
	D4+L+6X05VVOQmZEJ9LR9KK24T4+EMp743JrTbsuTOjumaA2qIgc2uA60JBHSttD+Myh
	yGjl+FAFtjkSR8DvYkbHqrlycIntlVh881FyXLNzMwN3PuwCLJnX+36rY6So9S+IAePh
	tPq8BC9oL/omHh/F7CckA3q4g8a87dj7NkXdQrd4cT/hZbK/RFZjk4vqMRpEqO4fzdhJ
	u9mVgje7i2zP0CFg+3vduLQzD4peKP9eSR7jmMxeF4hXq4FwucZ0IcqdOGIXk/iGOeOk
	1AJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Xa7m57UTbsvbFYL/1NfM9YxzYkcCQQ152XwxzXFkcbQ=;
	b=eRqnGqlyPKgCNP2JLenbHe9fRYAGvKkrSGNdY3hLP8jPHUswbW1rmOs3/NPwrhmXor
	uG8YvsnuzBzk71CscOzpz4EHEuVz/Rj/zcJ90Cxzq1TUsHNqhoVSUj6Iq26Ao6ZCHEhX
	P3ALvlk983G/+3ebGAYLz4dW3B2/56IFDTJsjPcJh4kfNMUh2O1bLbaFj3i9lrm5IQxd
	HMw+BllJIwvvI5HNc8+n7yiZJhVqg3sj+jAMKCzCfbUZXckuTrrIEYzrSnLSk8v0a1I9
	12Vi56C3JvEaZ0oWwlZMSQK9qtVKjupHvwcjtqoAvbJlfpcPEB56WmZfI6CGgnjhVPhM
	JKUg==
X-Gm-Message-State: AA+aEWZMx3iIkFw6+GLGYiLWPEyK2LO46J6w8PddJZaZCf+NJusuzfYL
	CBOgbYfLtat7kOPrsbGatcc98C63
X-Google-Smtp-Source: AFSGD/WQ09ExlpyCZkR3Ukxs1i2gVtZs5q9A5GXzHkR2Hodx0aXxwYn7gD5/jCO3f2t+Tr7kqrhpDg==
X-Received: by 2002:aed:3aa7:: with SMTP id o36mr18822696qte.240.1544600308413;
	Tue, 11 Dec 2018 23:38:28 -0800 (PST)
Received: from localhost.localdomain ([131.255.238.50])
	by smtp.gmail.com with ESMTPSA id
	n193sm8110153qke.33.2018.12.11.23.38.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Dec 2018 23:38:27 -0800 (PST)
From: Raul Martins <raulgildons@gmail.com>
X-Google-Original-From: Raul Martins <raul.martins@alta-rt.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2018 05:38:19 -0200
Message-Id: <1544600299-14992-1-git-send-email-raul.martins@alta-rt.com>
X-Mailer: git-send-email 2.7.4
Cc: Raul Martins <raul.martins@alta-rt.com>
Subject: [PATCH v3] oe: Fix opkg status list parse - Missing postinst
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
X-List-Received-Date: Wed, 12 Dec 2018 07:38:28 -0000

While parsing opkg package status, last package status was not
properly handled, resulting in final image without postinst and
pkg depends

Signed-off-by: Raul Martins <raul.martins@alta-rt.com>
---
 meta/lib/oe/rootfs.py | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index e5512d0..4273891 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
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
                     pkg_depends = ""
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
+                if "" != pkg_name and pkg_status_match:
+                    pkgs[pkg_name] = _get_pkg_depends_list(pkg_depends)
+                else:
+                    #Not enough information
+                    pass
 
         # remove package dependencies not in postinsts
         pkg_names = list(pkgs.keys())
-- 
2.7.4


