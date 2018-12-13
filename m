Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
	[209.85.210.169])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8FB6D494
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:08 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id b7so1727301pfi.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=l6bGBWkM/IggHRyOyq9oH+lfdQHLegXCDhmTjL/02xg=;
	b=KfgrgEtE6mH0p6TExX1sy7mGI8GhKVvvTq4y5PJ7hr4cBqRjXldKjua4FJij5h09MI
	0nEKqS1e8KvmxQRUmTnKYoneQXzUty8TbiIWrGh5xVi71HaJI/CK9nwqCZbz99gdI3E/
	E5GAL9Vy0K8jUw8y/VvJX/AkbsROZzh2C3PLfFQmOr/cLsw6mT4hur62zaLfPFwVPL2Y
	x1rcga5Tnw9BszRBaaz3pV92PU2A/WEBWQCo19eBftZQWFplzN+v5xEnSAhPVkoJq+gE
	fBuTIzzK4Ovx7yKzWSrv5ztxBVV5JO5kdaspBXil81pIh87HbOO/ZSQNKJRTtTGzCwUB
	rDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=l6bGBWkM/IggHRyOyq9oH+lfdQHLegXCDhmTjL/02xg=;
	b=p6H5dv/gHykgyMsAFveDyoV+t2Ms+bj/TAzspvGiewKM5+buPLP11UQGP69nmEBLhT
	4DFgMnYx7hjJmss1djicpdntYF1NSCJ/BVjJh/CYRpjrJ0YURHaEK5pdFha3t+2+38F6
	Kk217yhf0YSmCmokr3sRdiuKpNopMQUOfWKIbOEg7JtKt/1V/4HGrFWQihJ+jfD6rT/O
	n/T01D7mPeHW8F9xETCnXpaeUElT1gzHJGTQA5ZiVvY/aqFUAqlMV/Mg9MZ8Umz5xF0N
	KmV9FhbhJrL65oOOR20/M6hbypW2hhuyyyMYZe6uk/g8bEOYAfpVBIS+k+EXq5ws0LQQ
	MBOQ==
X-Gm-Message-State: AA+aEWbaG/AuMJcytta8XEOPx6MSQzUYWuHbF+Yfa6NCh4rnIRF7dlGF
	KF06lPfppTUwHMZebfjqks+O3XQ/
X-Google-Smtp-Source: AFSGD/UhJEubtds2NGWPT1NMAeuMb53fQvsjKkzDVDr4pVrVyU1YAeXwvIJe9REigCKyJY0aGGCoKA==
X-Received: by 2002:a63:4b25:: with SMTP id y37mr404090pga.181.1544737149441; 
	Thu, 13 Dec 2018 13:39:09 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:08 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:15 -0800
Message-Id: <ed4b508e889e4cd97246da04b14619e502ba7d37.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 07/45] oeqa/selftest/case: Use bb.utils.remove() instead of shutil.remove()
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:08 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

This avoids problems where shutil.remove will error with:

  File "/usr/lib/python3.5/shutil.py", line 436, in _rmtree_safe_fd
    os.unlink(name, dir_fd=topfd)
FileNotFoundError: [Errno 2] No such file or directory: 'S.gpg-agent.extra'

when there are races over file deletion (gpg agent may be slow to exit).

We already worked around speed and race issues in bb.utils.

(From OE-Core rev: 00a8fd5b93a5c19ce0b7498e2bc653ce8ad58aaf)

(From OE-Core rev: e7c0d29e063d1a47004acdc07a63996be98c74ef)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/selftest/case.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index e09915b..2e446b0 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -12,6 +12,8 @@ import oeqa.utils.ftools as ftools
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.core.case import OETestCase
 
+import bb.utils
+
 class OESelftestTestCase(OETestCase):
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
@@ -167,7 +169,7 @@ to ensure accurate results.")
         if self._track_for_cleanup:
             for path in self._track_for_cleanup:
                 if os.path.isdir(path):
-                    shutil.rmtree(path)
+                    bb.utils.remove(path, recurse=True)
                 if os.path.isfile(path):
                     os.remove(path)
             self._track_for_cleanup = []
-- 
2.7.4


