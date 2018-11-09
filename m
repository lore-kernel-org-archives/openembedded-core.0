Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id C36446C211
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 14:29:19 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id p2-v6so2111510wmc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Nov 2018 06:29:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3SvvdY7r2RO3y4JNYBRSRDsDE0eFHbW/AyNiMTLoshI=;
	b=VUpoRU9zIWRWRnDyMpD/N2ISff9xQQOk/UOz61s0mbSS1IVGa7KCewqC3M80AqbFYE
	MS1iE+fcXtfBEtY7lBx1WJyIF+9D8Zep7i3OUmInbgphlcw+Y6OXRSiIh9vHnDUJ5CwS
	QH7kV/1FWKfTt5AK0ZkUoAUWBwVfg/9Ul8XPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3SvvdY7r2RO3y4JNYBRSRDsDE0eFHbW/AyNiMTLoshI=;
	b=As9Whlsg8TJ+Yc7kkiQT70Rz156l43Ro9Kn73KavanHrs9j/Mk22g1B7NU3OZoh0LT
	6FpW6Ut+XZqBZ7jGhMvUgwbbIRb0koW3nIi1Sv/PTXMhjDJv4GmmCirVnkavE0i1qEJo
	wC5wDuoNnRUhreo1VsPiiOyamIKyLcxFOM4TskEAKonQVQiUgYGKBWUQxsMGBxl0kPr0
	SHyiyyVA+ZSvgK7lIYqrzRB/1dWc0nNtxVK2E0nEwIoww+dtw1IU6JEWc3p5x4B3wpAs
	TdpQEGaVsj/t7Bpi9gQQpG1JC1uPsGZtMCN37dXKgUXofwUxEAQxavQb5ELVldbnwuUx
	k1fg==
X-Gm-Message-State: AGRZ1gIlU2d0fO6BZBWyPIqjC4RDip5BR94vOG1lxjX3B3kUv1hvEoTu
	xo4cyXkjLMjOH7U0VOslntkFOnSWHC8=
X-Google-Smtp-Source: AJdET5dVJQXU7+37NS2DPT9s7y556FBUyleMbl/CGxl9o4PKVKY/j+4OYIzi/vA4mOG6rOlIZ9d59w==
X-Received: by 2002:a1c:d78e:: with SMTP id
	o136-v6mr4903723wmg.124.1541773760007; 
	Fri, 09 Nov 2018 06:29:20 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	h16-v6sm7713764wrb.73.2018.11.09.06.29.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Nov 2018 06:29:19 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Nov 2018 14:29:06 +0000
Message-Id: <20181109142912.23102-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
References: <20181109142912.23102-1-richard.purdie@linuxfoundation.org>
Subject: [PATCH 06/12] oeqa/utils/buildproject: Only clean files if we've done something
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
X-List-Received-Date: Fri, 09 Nov 2018 14:29:20 -0000

We should only be wiping out things on target if the tests have
actually run.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/utils/buildproject.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oeqa/utils/buildproject.py b/meta/lib/oeqa/utils/buildproject.py
index 721f35d996e..7e9b84955f5 100644
--- a/meta/lib/oeqa/utils/buildproject.py
+++ b/meta/lib/oeqa/utils/buildproject.py
@@ -24,9 +24,12 @@ class BuildProject(metaclass=ABCMeta):
             self.fname = foldername
         else:
             self.fname = re.sub(r'\.tar\.bz2$|\.tar\.gz$|\.tar\.xz$', '', self.archive)
+        self.needclean = False
 
     # Download self.archive to self.localarchive
     def _download_archive(self):
+
+        self.needclean = True
         if self.dl_dir and os.path.exists(os.path.join(self.dl_dir, self.archive)):
             shutil.copyfile(os.path.join(self.dl_dir, self.archive), self.localarchive)
             return
@@ -51,5 +54,7 @@ class BuildProject(metaclass=ABCMeta):
         return self._run('cd %s; make install %s' % (self.targetdir, install_args))
 
     def clean(self):
+        if not self.needclean:
+             return
         self._run('rm -rf %s' % self.targetdir)
         subprocess.check_call('rm -f %s' % self.localarchive, shell=True)
-- 
2.17.1


