Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 11ACD60124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 13:47:20 +0000 (UTC)
Received: by mail-lb0-f171.google.com with SMTP id bc4so112365010lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 05:47:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=MBzJ+oZF3d0YuZ5ttTPm1wQCdvO+xS5P9kSfcrAMSpk=;
	b=CCWECAlYC7mF2MLt4g0FtcY+IKTmxgzv+SP6j2FcsyV2pqyxQ1LR5+qiWOObfTzMBw
	uHrHVp6AiQfCvhjj2ImW+cPHS78O+jwRktVlFQBK9Vdqjz3dBnxsVrw1/9Ccw8Cdi2Zo
	u589YNxvXBxpaqq1W9e+qKcaCIXjLFpPvwGzyZRzuP3LF2pu13WV8ZMT/RHJ4oHAsL/S
	idNfy1SIdKs8OhQb5/vhpNfMFVaCyfJH3p874rjjS4sJPvIMehZ2yF3GJKS4TPUB8eLW
	pWU/uujKlah5z0YQ43h+7OhUGU5cm9KxdOsHVp1pWOrCz1MehsCASva2YjhXz6jSXJb/
	8vVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=MBzJ+oZF3d0YuZ5ttTPm1wQCdvO+xS5P9kSfcrAMSpk=;
	b=ckB4BdxW16nw7yco0AEd841wNgUVaMKmqaL5yOd+T1OrOBoLVSnfuVPPob4hNhU39u
	FOzUF4VmzHxssoDolvFTsywPJXiEhc8/+Ovn7oIhf1nbZftq25wnmajkJyABvVkvpGOE
	QLneIuKyV5Q5R1RMPK7e/nrRtVkeMHY7CNs6osDNHQPfzpXr9TCu6ayDuaG3OZtNivIW
	LRWAvRgUQblvfosczSQWhmNx7J4pbr7nkj9zlo6imEqci1Ie6tR1bytxBMxJZBH2fsmJ
	hCXDzJHsvi98TM2cLtdF6i84xhNyvVIwf0LM+XNC4Vxw9CgAiSlCNdioF4WeutT9UWlA
	cbTg==
X-Gm-Message-State: AD7BkJKQrma5nUimm5VHtz7GWeMd29MtrH5RWXLpOMNk7FSPgETWE6MErY7LaMynB6vR9A==
X-Received: by 10.25.147.209 with SMTP id v200mr1273399lfd.154.1457617633498; 
	Thu, 10 Mar 2016 05:47:13 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id tm4sm529094lbb.42.2016.03.10.05.47.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Mar 2016 05:47:12 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Matt Madison <matt@madison.systems>, Ross <ross.burton@intel.com>,
	Mark Hatle <mark.hatle@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2016 14:47:09 +0100
Message-Id: <1457617629-9255-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <1457617629-9255-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1457617629-9255-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH v2 2/2] package-deb: Ignore circular dependencies
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
X-List-Received-Date: Thu, 10 Mar 2016 13:47:21 -0000

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
index 6ecea0e1824e..e1d05a74c215 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -235,6 +235,9 @@ python do_package_deb () {
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
         for dep in rdepends.keys():
+                if dep == pkg:
+                        del rdepends[dep]
+                        continue
                 if '*' in dep:
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
-- 
2.7.0


