Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35EB7EF48E6
	for <webhook@archiver.kernel.org>; Fri, 13 Feb 2026 08:10:41 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.67233.1770970231883074209
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Feb 2026 00:10:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bnYxZmq9;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-437711e9195so422467f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 00:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770970230; x=1771575030; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ln3fnaViUiP7tzK7Z2yo/jTaw8T+TGIma32cp6H0pT0=;
        b=bnYxZmq9yQefZPyY4Qslb4B/PPOCJrjkaYPkj6uq3nJofu7DEf82/r51IEHWFJMTuz
         9f4/utyz8Wn5swcNfrH7WSE8/G7QTDM2iZ9uM4qgydCxIuCJ4U/pZ7GAM6uBblSY+/bm
         4eZoK68kBp/UtO4QW21dZp2tuVRVwsavuDNHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770970230; x=1771575030;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ln3fnaViUiP7tzK7Z2yo/jTaw8T+TGIma32cp6H0pT0=;
        b=Kq4nSTS0bSlt7VCkyg68HmAZq/yVFbfXmwFZM2wirrkn9JaVVCw822IuYGvGolAEoz
         u19Zq8Rf9iAfliA3O6a27rMn9mpO3lVlD0J5NbzkVTjoFcR4Tc6PjLjl+e3MilpNyrlV
         VpsEheakKP7HKSFwHGinqZvDE99B0KYe9cXaa0VfTMaKZKERzeg7IagZv4IYwiq1zz+8
         X8HJng9aErAJUeas/eyLUXUveo2uLVFpGGqbh9PNN2GowORJRClEQIhiGptV1yIM0cgR
         kSqsBxyTuCHDEb2Rs41ipT8ddzTBq7ESin4+qn+Kmbe4+IzrbhxGNnwFyfxHGP3Rae0T
         /O/g==
X-Gm-Message-State: AOJu0Yw0a8VncR0O8nrIVoH/hpHBL0Vjyvv/dUruOW66gnnPAcLCEjWx
	wmTmT4PkkSCGJshq4AeWsip3qach8kNPII2KN/Se0DCuHpSDUxve8rcLJ4cqLwGuwnuQiYdubde
	+stlt
X-Gm-Gg: AZuq6aIPPHE0hfa7KkKqGSFtZT1KZ1NlGfKk1eRL7Y4FXB2n+vM0zCYKl1FoDuqIUHa
	x1VIj+jQxz37zy/VvZL75zECrZ8Ckrht5Ek89SNBPtnDTi57cxe6gryuOhh8vJ//vbV3WdaxS8U
	1COdEIHa8uTPFDPj5uaofNGIptoSebeV7J+5B/9IH3TKIJyCk/MO1PRq77gE6m9sfOFPSh2AEQk
	2jqwEzmTCy6NzLBOn9lpOnGDhYQciMppqzch6mmqIYN7j1mwxiBKc70LPAtwCGnJNZk2Ss/B4wm
	5hT53gXg3lfUuckLoFPbBjVOrd6DbT7mHeHl8IXegZIgslSmik7gsi+Bb6Ic+CpWv1LYiJKoTHZ
	L+ssV0QktclBL5L1uFHMMO5U+liGB76IHhJiB5DRcMSbtpbpFiwoucA2ucyPTuoFFSC0xQwpXFC
	HGe9tGRVAtIwHokske233OQmNb9ajdjqR6gB4veVf1Mw47/FD5JglBbpyNF6R7PC8wiBGrS/HrV
	SJm31rUEqfBdtQwrYFEEb0zjZY=
X-Received: by 2002:a5d:5f48:0:b0:432:5c43:53 with SMTP id ffacd0b85a97d-43796aeff1emr2707521f8f.36.1770970229962;
        Fri, 13 Feb 2026 00:10:29 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00d6f202ec534aee64.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:d6f2:2ec:534a:ee64])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-437969fd36dsm3590815f8f.0.2026.02.13.00.10.29
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 00:10:29 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][whinlatter 19/19] devtool: deploy: Reset PATH after strip_execs
Date: Fri, 13 Feb 2026 09:08:37 +0100
Message-ID: <ea633ee08638624e18ec14ca69ace3a72b498a31.1770968514.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770968514.git.yoann.congal@smile.fr>
References: <cover.1770968514.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Feb 2026 08:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231102

From: Paul Barker <paul@pbarker.dev>

We need to modify os.environ so that strip_execs() finds the correct
binaries to run. We shouldn't leave this modification in place for the
rest of the program execution though.

Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c77f0b29b1983e143ffc7ab4bb869514d7afd601)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 scripts/lib/devtool/deploy.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index 2bf693d165a..270e9104b25 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -188,8 +188,11 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdir, base_libdir, max_proce
         if os.path.isdir(recipe_outdir):
             exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "rm -rf %s" % recipe_outdir, shell=True)
         exec_fakeroot_no_d(fakerootcmd, fakerootenv, path, "cp -af %s %s" % (os.path.join(srcdir, '.'), recipe_outdir), shell=True)
+
+        oldpath = os.environ['PATH']
         os.environ['PATH'] = ':'.join([os.environ['PATH'], path or ''])
         oe.package.strip_execs(args.recipename, recipe_outdir, strip_cmd, libdir, base_libdir, max_process)
+        os.environ['PATH'] = oldpath
 
     filelist = []
     inodes = set({})

