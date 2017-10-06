Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 89AB7780B5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 12:13:16 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id q124so7270392wmb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Oct 2017 05:13:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=35ClttbvAer/Rdu407nHXY2YJofX1sssolbbAoPn/3E=;
	b=q+azOqrXvAXoQ/jEagCBYL1CRvbgjZAkueXfK56fPd3aWxJ3ZFIay9TLzeGzeVfzYl
	kwrUIZWCe/AY+d5xaoKm3cTdg7rOgRxVtwldANYbQCThXRdqiDAte352Fixn9udOpjBJ
	0lApEaZL5EWFPDBH7PZIfeIDPo1ZuHWsB8PvCq/nM2JbMo0qX0UDxYbBgAU6Wxo5fBwa
	RvOzcm/BS9ymYsItWc/Gn5pnzAvJrw0Fvm/Kn8y7LDT6Je1PaaWh+bCJ215Rr4KvIcOY
	LQ99LTYSEmoQVVRaUBWEgRdz/+b2Cd2EG3h43BlsE9aUelEYDlfoOh+sT5VWsKyk3L5A
	+fng==
X-Gm-Message-State: AMCzsaVTJwjiUCO1a+iXUBb3/xE1WCnxjHDV+GVyub429exvj+HaNGF6
	l00xnpbJreR7XohmSHd0NENX6chj
X-Google-Smtp-Source: AOwi7QASsE2qHN0TJMAXmnWNPc1ik3KIECtrdfjP9E37U4EwgQeb4MvDE04mSVafQKLhTk06E2jX+w==
X-Received: by 10.28.8.212 with SMTP id 203mr1149328wmi.43.1507291997070;
	Fri, 06 Oct 2017 05:13:17 -0700 (PDT)
Received: from tfsielt31850.tycofs.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id r15sm994045wrc.30.2017.10.06.05.13.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 05:13:16 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Oct 2017 13:12:48 +0100
Message-Id: <20171006121259.5817-7-git@andred.net>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006121259.5817-1-git@andred.net>
References: <20171006121259.5817-1-git@andred.net>
MIME-Version: 1.0
Subject: [pyro][PATCH 06/17] selftest/archiver: only execute deploy_archives task
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
X-List-Received-Date: Fri, 06 Oct 2017 12:13:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <adraszik@tycoint.com>

There should be no reason to execute a full build, as we're
just interested in the deployment of the archives.

The newly added tests already do the same.

Signed-off-by: André Draszik <adraszik@tycoint.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>

(cherry picked from commit 78c2897dff7cd9fe2cab511549cb146d5231e573)
Signed-off-by: André Draszik <adraszik@tycoint.com>
---
 meta/lib/oeqa/selftest/archiver.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/archiver.py b/meta/lib/oeqa/selftest/archiver.py
index 06b2597050..7f01c36d4e 100644
--- a/meta/lib/oeqa/selftest/archiver.py
+++ b/meta/lib/oeqa/selftest/archiver.py
@@ -29,7 +29,7 @@ class Archiver(oeSelfTest):
         self.write_config(features)
 
         bitbake('-c clean %s %s' % (include_recipe, exclude_recipe))
-        bitbake("%s %s" % (include_recipe, exclude_recipe))
+        bitbake("-c deploy_archives %s %s" % (include_recipe, exclude_recipe))
 
         bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
         src_path = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'])
-- 
2.14.2


