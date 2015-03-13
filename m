Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 16B9171F1B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:29:50 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so105544418iec.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:29:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mgGVMCQ0XRM1TlrfBGeXwWFLEms9zhZ7qwWJiw+mZX4=;
	b=W00IqQ1juXhl9WBbkEJui3XEKH2aTMj1l6Pd3ggqpKZfwaw4PsZcxMsmHy5Uw3o3df
	87waG2HFPU2NZ0Q2H65S3tQiVbVprkjNyKEo36YmgsaiK4wEVULZ+yuzhNHKWJ41nQJ+
	AMmuGLkNVKY4Na8Byyx/zyYfsgIkn8NVYuwwhlC4iFPhHeMFDQEZR/Uw4Zjv5Eu+5iJB
	fqSvyEce6hI7KYazKivLzwc5PV9XpoxmloSve3TLXKzek7IM+FCquk03igIomwcdVQJR
	DHPLAEibmHhAwJHKeWUZSlwW/Sv0hbJrPqeOsHfnlrUJ6G+PvqT6BIaosKY9KpbAJRAC
	hkNQ==
X-Gm-Message-State: ALoCoQmf0FOWmni/o9m0Lsgm10b/KGlAPa4tEZY9mPEfv3j6VR++iE1jyhOquj86glb9MTvoKq4z
X-Received: by 10.42.47.8 with SMTP id m8mr55834848icf.27.1426253391429;
	Fri, 13 Mar 2015 06:29:51 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.29.48
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:29:50 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:30 +0100
Message-Id: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 01/11] combo-layer: let user choose where properties get updated
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
X-List-Received-Date: Fri, 13 Mar 2015 13:29:51 -0000

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
index 851003d..71fa7b127 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -109,7 +109,9 @@ class Configuration(object):
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


