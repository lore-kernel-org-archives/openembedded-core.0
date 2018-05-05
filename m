Return-Path: <ptsneves@gmail.com>
Received: from mail-lf0-f54.google.com (mail-lf0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF6374828
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 09:58:29 +0000 (UTC)
Received: by mail-lf0-f54.google.com with SMTP id h197-v6so34173037lfg.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 05 May 2018 02:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=h/w0CrklzfTRIpToarC+PjPGwCBXmDBC2+UFwPNjsKw=;
	b=ZoGfGCFMJC2PAili64ETDWt/SlikzePClLKtlnfU4oM9Ydz3aNHEuwIugAnYtDGGYE
	N9RxLoIE9WRLtmR8aAZRQqlxXp3+/4YQCu4nbz1lxnpWAWdcYLwDzM/g1UWkYDDBDlqO
	yTxddjmV9NpOb6WKYS+esQ6537BBqYTYuHz73azmRg4QSABY4VOfS2tdFQmmOvwnrsXu
	9JXRQmu0RhsEb5V/HU3n/5M/0PYH+uRBEyokJhJRaDJtYJrYgCAIYGBPNQsPRmiHUMeU
	AwtjcUcsu4/aYgLA4R8nDBFTi/mOuzGM8pFCtkbg9AEY8UY7O0mvJ4pNjdhg5iU22WkT
	S7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=h/w0CrklzfTRIpToarC+PjPGwCBXmDBC2+UFwPNjsKw=;
	b=dbQzAHvTIge+/qpVue3CI7hdYoXV2KJ2Jj8ieUWYWkLBxrQq6TWe1UFmpAT3OHVTzx
	IuErqDX3MNc7iWaRVnPXx3gvg39NwA7pTERtmLKr9HrgpWXSPDJseACbWcjDp85FNhGQ
	SS3FDIQfJHKrkPFDQgYPzVaUCO1Nau6iBDTX0aa4DyZIt9vMC+jSjdbghjUiUAz92Vba
	01g2WlMta68LfidvF/Je2anH5KUeKgPUEWRY6NmLLAIcQi4xHjE+T/C5UxbKugqbV+4S
	fyw+Fw838RW2BIIrJbM7gnQIJdjBae04IMRpI5OuXsH0KlQYPewOSveBn05lWbyQvlIV
	qO+w==
X-Gm-Message-State: ALKqPwdGHGXDG9d2D80Z8UIOmTIc5tUrE4MI7Z4Ms1x9ychAFr9vWKfJ
	bAYAwNjnYaWoYFva96Bha3xNWqwFUw==
X-Google-Smtp-Source: AB8JxZrXjc46yVPE9L+IVfpC4x3OyRfm49DXbnwvfTjlMKbb+oD+ZZtHLBr6xfyK1Ue5PQ+ouiL/3A==
X-Received: by 2002:a19:e99b:: with SMTP id j27-v6mr385235lfk.93.1525514309725;
	Sat, 05 May 2018 02:58:29 -0700 (PDT)
Received: from pneves.home ([78.10.208.153]) by smtp.gmail.com with ESMTPSA id
	u2-v6sm3740447lfu.3.2018.05.05.02.58.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 05 May 2018 02:58:29 -0700 (PDT)
From: Paulo Neves <ptsneves@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  5 May 2018 11:58:20 +0200
Message-Id: <20180505095820.23538-1-ptsneves@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH] package_manager.py: set dnf always debug verbosity
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
X-List-Received-Date: Sat, 05 May 2018 09:58:30 -0000

Removed an undocumented configuration
variable called ROOTFS_RPM_DEBUG. This configuration
toggled the verbosity of the dnf command. We now have
verbosity permanently turned on and instead of
directing this verbosity to bb.note we direct it
to bb.debug.

Having the verbosity enabled will allow to watch
the progress of the dnf package manager during the
do_rootfs task with the debug enabled in bitbake.

An example of the impact from enabling the
verbose output.

bitbake core-image-minimal
rm -rf tmp
bitbake core-image-minimal

Before patch 4m39,403s
After patch 4m42,441s
---
 meta/lib/oe/package_manager.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 2d8aeba037..8b6cd2aee0 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -884,7 +884,7 @@ class RpmPM(PackageManager):
         os.environ['RPM_ETCCONFIGDIR'] = self.target_rootfs
 
         dnf_cmd = bb.utils.which(os.getenv('PATH'), "dnf")
-        standard_dnf_args = (["-v", "--rpmverbosity=debug"] if self.d.getVar('ROOTFS_RPM_DEBUG') else []) + ["-y",
+        standard_dnf_args = ["-v", "--rpmverbosity=debug", "-y",
                              "-c", oe.path.join(self.target_rootfs, "etc/dnf/dnf.conf"),
                              "--setopt=reposdir=%s" %(oe.path.join(self.target_rootfs, "etc/yum.repos.d")),
                              "--repofrompath=oe-repo,%s" % (self.rpm_repo_dir),
@@ -892,7 +892,7 @@ class RpmPM(PackageManager):
                              "--setopt=logdir=%s" % (self.d.getVar('T'))
                             ]
         cmd = [dnf_cmd] + standard_dnf_args + dnf_args
-        bb.note('Running %s' % ' '.join(cmd))
+        bb.debug(1, 'Running %s' % ' '.join(cmd))
         try:
             output = subprocess.check_output(cmd,stderr=subprocess.STDOUT).decode("utf-8")
             if print_output:
-- 
2.14.1


