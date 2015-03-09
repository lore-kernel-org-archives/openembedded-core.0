Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 1667A6AC33
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2015 09:22:41 +0000 (UTC)
Received: by iecrd18 with SMTP id rd18so10425250iec.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Mar 2015 02:22:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gMd/ZTsrqyEnS7Tpe/npb7sWry1/Hz27+hKtRc+e7/4=;
	b=KCpHnDPu4tavtlT3f0e/5f96VhmFSP2WlFmb2hyVqpqEbThbsoN/Q/x/v/BhHKW6iD
	jHh3zgV/at1sngoV1Qv53HpDy1x/73sSxTSG1CF4+NPhUR04KFCK4fxWTiQwcgNQWrDV
	OJuZBX+hBbTD1ogdW2YSVUBbHcw892t1n7HHTuXKO3mmIDb10JZTgenll6UKoGsTBsXr
	JiBdTM+EGJLIb6YDG+K5Cw40XWM2LlJUrMRj4v/sF/AK2Cdgieqoo4PTg6WTYfEe5PFv
	eAJJn4/0iKOvof9DECk+gfxhJjSLAg+WCn8Cjx8nyFcnqNRnKYz8d/jmfB7GfiYVm/wQ
	C7ww==
X-Gm-Message-State: ALoCoQmnkbMYlz2v7UeebHV9X9QiuQi4RpMHs2qR4fX5WVaea1sRXaQahDoKAjZ/3XAZ42RVtbHi
X-Received: by 10.50.56.82 with SMTP id y18mr72282900igp.25.1425892962597;
	Mon, 09 Mar 2015 02:22:42 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8D980.dip0.t-ipconnect.de.
	[93.232.217.128])
	by mx.google.com with ESMTPSA id i1sm5836681igh.5.2015.03.09.02.22.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 09 Mar 2015 02:22:41 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2015 10:22:21 +0100
Message-Id: <1425892941-30980-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] combo-layer: let user choose where properties get updated
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
X-List-Received-Date: Mon, 09 Mar 2015 09:22:42 -0000

When updating a property (at the moment, only 'last_revision'),
first check whether the user already added it to the main config.
If so, update there even if there is a local config.

This way, 'last_revision' can be shared between developers
as part of the repository while still configuring per-developer
repo paths outside of the git repository in a local config.

An example of a repository which is set up like that is tizen-distro,
with instructions for such a collaborative maintenance found here:
https://review.tizen.org/git/?p=scm/bb/tizen-distro.git;a=blob;f=README;hb=refs/heads/tizen-ivi

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 19d64e6..489d180 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -108,7 +108,9 @@ class Configuration(object):
                         readsection(self.localparser, section, repo)
 
     def update(self, repo, option, value, initmode=False):
-        if self.localparser:
+        # If the main config has the option already, that is what we
+        # are expected to modify.
+        if self.localparser and not self.parser.has_option(repo, option):
             parser = self.localparser
             section = "%s|%s" % (repo, self.combobranch)
             conffile = self.localconffile
-- 
2.1.4


