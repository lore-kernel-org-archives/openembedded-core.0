Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9B8477DF0E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:13 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id l132so8416211pfc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=BSccZykAnyIx9jjZTo2W6mTcY5mjRetGCKF1zHpGC1g=;
	b=uFQh1X+n25E6o5asNJib07RYiKpiLbXeIPWr0TQ850BOapSgdDV0rNd7Up/ux08k1p
	YH1xP/xRTasfoiTIP8olhim+Ae5StsYteNShyS26E0jHb2MdFXXTvuJ+W/YgGtlt11Le
	iqx1iJNx3ozaLAB7bqdy+uOoeZHR4ibD+rNZ3fowTgd8l8tso3RN8v2m7PtDFHHsU7/l
	99kP0/lVNGOa/iV6Q6q1tOmDT6WHFGLeoRndzcPp5J+HHZEuxvueuflQjOzOVpduXhV+
	U8QrP2nA9VkyLeHgRunfjK4+qzvWRbvC5VGp2JWUjixWogwOtgpI7zEk2TohNQBxf7On
	LbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=BSccZykAnyIx9jjZTo2W6mTcY5mjRetGCKF1zHpGC1g=;
	b=qBwO6y/b46wvoCAVsrFVNRVOgHRBMlzNOtLlWbQBuCONzF8XXIPJCOek0wuTL46+af
	+st6DzvKfGDC6wqciO4li/lgyApz+Ohr3EwxBWyVg689izjNamO3Ljtx0A5oxvGw5Kpj
	SmH2lU/DEAf+l2SshUmun496wsB3cRN9IFPpIJer68PrQluLpp+/gW+/MiL2hG4ldDCo
	hA3dcvs30Ux7LuEyWGfza3GnsQy59DWxNhAzvt4HedoJvawqMIm02fZbzGKi1ENsid5k
	ybdcw7ygWJngeU0hvsfS7xQFMve7E99lGAEnacAwNI5kNTiJ5uYIM6skoxvKZMS8R+h0
	EY7A==
X-Gm-Message-State: APjAAAWB70F7Mm6FKLIsR7lx/Z/9UOFvp4IJivXpR6M4V8AjBjeVLxKb
	qHUyhpaJnYkG6OWUgsfS/9A/nLmZ
X-Google-Smtp-Source: APXvYqydbqIq7IWpPsKOx488w6yJHr6JMAY5HrgJTDqnv8x9CUcyorLi3+uP7mXGPdMxJIVGdT8ANA==
X-Received: by 2002:a63:e94e:: with SMTP id q14mr35354207pgj.110.1557809654059;
	Mon, 13 May 2019 21:54:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.13
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:13 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:47 -0700
Message-Id: <326188e1e2424bdabe9cf83a8087b5ee046aa7f6.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 05/23] recipetool: fix unbound variable when fixed SRCREV can't be found
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
X-List-Received-Date: Tue, 14 May 2019 04:54:14 -0000

From: Alex Kiernan <alex.kiernan@gmail.com>

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/recipetool/create.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 1810c70..dbd74a1 100644
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
2.7.4


