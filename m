Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by mail.openembedded.org (Postfix) with ESMTP id 67A0173170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 18:19:23 +0000 (UTC)
Received: by mail-lb0-f178.google.com with SMTP id x1so77644905lbj.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 10:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wjUmAin9wyyLMGxBoxrJVQQWK3hPvdosRddoby9U9R0=;
	b=XS2xPwKUUls3zdIzybssFOgNKzv2bIL+REk6YLc8xOgTI9NSbiaAJUCRocxYqVWBLw
	AzOrVVwbsoloa3ZtZDSsZJ8jeQ499EAXe4JPRXOq3y4oNeGLrllFvyqDR0ThO1hWa5ga
	SY0NbCax0yYygVyTf7ETuN/S/ZEsTbePqLD1LCLcrx2gHIBwNo8TjvkwTP3dlub62/ow
	S2+bT4/rtJfCIH886nbBFcniUc135o5uTDUAfuL4VzbPweDXdFQ9iMmg88MU6ihqzkCb
	6UZPnXlzZUX6kV2Xb8R+IHzh4hrI9/JnUxa6BcBEKbYCQpU9no5lqckuP1Eq+ChXwDQa
	k4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wjUmAin9wyyLMGxBoxrJVQQWK3hPvdosRddoby9U9R0=;
	b=my1h7J5KapiPzc58ZsJsyEzb2arJxYPVZXdpUchJQNRMsSpxZyiFrANyFtPY5hgc+T
	bMdx9wvyIwlXCkFdF3WLw+JX6228in8/Y8UQtYeyeNdVOsCz3QwRT49ksXgvpOjpVgDS
	2jU+Fww8WvzI6quIxZgvldKf8tLsEFdxwxWZVt9HHpIbw9tlaXvPR6X2mV7a2Vwzdxgs
	wxU5is7+2B7yIWHbwKzK213OwTCNQXcNXPqpX/2isGADys6ngtODiP0sedqYOi2623z7
	XbsPsXE4HPkCncTVn8qi2uQCioVUTERTkfAmIaR5k6M3FHz7Jvr5MEvP5pHC96EjvnqF
	qKKg==
X-Gm-Message-State: AD7BkJKB896S23YXDZ96Z9vkFOVE4kLs0/tUoZ2zu3cMYLzMQjifnFUV1LlOJOfzHLetcw==
X-Received: by 10.25.146.197 with SMTP id u188mr11909437lfd.139.1457547562671; 
	Wed, 09 Mar 2016 10:19:22 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	z194sm1449965lfd.20.2016.03.09.10.19.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Mar 2016 10:19:21 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 19:19:20 +0100
Message-Id: <1457547560-21542-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Wed, 09 Mar 2016 18:19:27 -0000

If a package depends on itself apt-get fails to install it with the
error attached to this patch.

This patch checks for this conditions and notifies the user so the
recipe maintainer can fix his RDEPENDS variable.

root@qt5022:~# apt-get install perl-module-cpan
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
  perl-module-cpan
0 upgraded, 640 newly installed, 0 to remove and 0 not upgraded.
Need to get 0 B/5964 kB of archives.
After this operation, 0 B of additional disk space will be used.
Do you want to continue? [Y/n]
E: Internal error: MaxLoopCount reached in SmartUnPack (2) for
perl-module-cpan:amd64, aborting
E: Internal error, packages left unconfigured. perl-module-cpan:amd64
root@qt5022:~# apt-get install perl-modules

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index 6ecea0e1824e..2eee083cc130 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -235,6 +235,9 @@ python do_package_deb () {
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
         for dep in rdepends.keys():
+                if dep == pkg:
+                        bb.warn("Package %s rdepends on itself. Ignoring this dependency" % pkg)
+                        del rdepends[dep]
                 if '*' in dep:
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
-- 
2.7.0


