Return-Path: <alex.kiernan@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 8281F7D699
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 May 2019 05:24:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id q15so11720194wmf.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 04 May 2019 22:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=szhb4R+7VsNA/Srlc+DJ+zloJSV9LpVTjBCFcIk4Rbw=;
	b=gym3vRA5IFu1gL/54y3kmyCBvTTGF0DT77VLd+cUJNjJ4BoySHSFTI12Wu1rseZjV6
	zJqo0Rnp+bk7IyeAnyQ41LnSv6r50+FjdJpYkuhvJdM9bQOALK5Aj6w7NW5mOpL0mdcm
	+nVB2ysANBgVPm92k0dePhRojNXHIGZJ8znoMN9x/gjeeutbMSWM1441/VywpS6RduaZ
	w2oZQc0j2OiZAQhejxd04l8aPGCztllJzEzNc6fa2kW+B5l6DeiUNiBdsc+43QJBFrEb
	Z7oxeGhOSyhcVArAS+ltD0XEqzu3r0qrB+CJ3Oe6+noHXF/iXMGCcGH9xOmQi3udqqZC
	UgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=szhb4R+7VsNA/Srlc+DJ+zloJSV9LpVTjBCFcIk4Rbw=;
	b=IGARmXOXGw/EY5UnKIQcqX63wBLZP8ONbIGtnhj15K9q9C26Z1equA32BdjLSLCYuL
	ada7kRsBp9weqsUl755V4RvkSMRPPzNulnKQ9NQXdFfmietFdgrODO9RlezaZg//JvqF
	Qy9ZzBhJgqj/abGwigkXwuqRg7dfXAsPpFnOa+juuUUaaFzBvEHOsUM0LTNy/DGxdMTX
	NftwZLRh51UJRgNLm9dvNihOX4QUWZQSkJ61PY0vXuLoTRinTkJc6RPrXnWplnyYNqWv
	L0CGVlBikfWO/xOaPB4z+SP6nL852v/+E1KOlUel41OQZ19T5OnZWpzkxn4Qm7/9FXfL
	yNRw==
X-Gm-Message-State: APjAAAWiG1DVwHNz3RZTuXFPGYchVVoFykHxT20i8BmKUAE6NYi+xZsi
	b5RADO9ch0ecYdI/J4BNBbNtFHtP
X-Google-Smtp-Source: APXvYqysAOvU5jie6qavj3WgCC8KV5w58ZZWrpCUU7leUtrO5qzfrKJvIVfp85rAdcqrwlnKUQaYhg==
X-Received: by 2002:a1c:f70e:: with SMTP id v14mr12573748wmh.74.1557033870022; 
	Sat, 04 May 2019 22:24:30 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
	[91.135.6.246]) by smtp.gmail.com with ESMTPSA id
	q26sm5231489wmq.25.2019.05.04.22.24.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 04 May 2019 22:24:29 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  5 May 2019 06:24:27 +0100
Message-Id: <20190505052427.21922-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] recipetool: fix unbound variable when fixed SRCREV can't be found
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
X-List-Received-Date: Sun, 05 May 2019 05:24:29 -0000

If attempting to find a fixed SRCREV fails because the directory doesn't exit,
avoid failing with:

  Traceback (most recent call last):
    File "/home/vagrant/poky/scripts/recipetool", line 121, in <module>
      ret = main()
    File "/home/vagrant/poky/scripts/recipetool", line 110, in main
      ret = args.func(args)
    File "/home/vagrant/poky/scripts/lib/recipetool/create.py", line 707, in create_recipe
      srcrev = stdout.rstrip()
  UnboundLocalError: local variable 'stdout' referenced before assignment

Fixes: 000480c42797 ("recipetool / devtool: set a fixed SRCREV by default when fetching from git")
Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1810c70ae2bf..dbd74a1ca3df 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -704,7 +704,7 @@ def create_recipe(args):
         if not args.autorev and srcrev == '${AUTOREV}':
             if os.path.exists(os.path.join(srctree, '.git')):
                 (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
-            srcrev = stdout.rstrip()
+                srcrev = stdout.rstrip()
         lines_before.append('SRCREV = "%s"' % srcrev)
     if args.provides:
         lines_before.append('PROVIDES = "%s"' % args.provides)
-- 
2.17.1


