Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f171.google.com (mail-ie0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id 104526013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 13:30:03 +0000 (UTC)
Received: by ieclw3 with SMTP id lw3so105555606iec.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Mar 2015 06:30:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=h+1yFqO8SAiyM4okYkVBJPYzZkBAdODPKpnr+4Ucl6s=;
	b=M/0oWJkvh9mJhHW6ZsotMQuL8Hpu6NbJGLYOtB86wZ9soXL5pNT1dp8J5JrAE9+VVf
	J+5fOIGkBuOhWTKuaaQaXcBU9U3nhkCk4drh9m1V8Nf53LontW0g4RXK2BYmKKhgvsys
	BVaVtNGoBwxwmqbaT8uzumyDXA/fCIfodTX7hwBTrpcKmcJx0kS7kgSnjvf8B0aBxUMV
	6Lq6HbzL5now0xdlc5qB13BtFhuaxWHanub16ifzWAnEhrSLPWBt6xfmalkhW8eOoNHh
	QRDFbd2sAFpuZgpF0oPConBTjNTVzovZAsRnnF8s4mzaAdQtbglmmYngMkJc49rhSDSL
	m4aw==
X-Gm-Message-State: ALoCoQnLnbJKF/GlVXY9VCRc3nIgagTDLDRoGPMFFccDCG4nzBU3zxrxm3Mc4qUG44KtZTZe2Vy5
X-Received: by 10.50.36.103 with SMTP id p7mr111054215igj.20.1426253404482;
	Fri, 13 Mar 2015 06:30:04 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8C8C2.dip0.t-ipconnect.de.
	[93.232.200.194])
	by mx.google.com with ESMTPSA id h15sm1257487ioh.27.2015.03.13.06.30.02
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Mar 2015 06:30:03 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Date: Fri, 13 Mar 2015 14:29:31 +0100
Message-Id: <987d508936059ce26d2474cd7d9639c9fab32275.1426252888.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
References: <a9fe203d338f966d5afe631bd7956ee8232a6bf4.1426252888.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1426252888.git.patrick.ohly@intel.com>
References: <cover.1426252888.git.patrick.ohly@intel.com>
Subject: [PATCH 02/11] combo-layer: make Signed-off-by optional
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
X-List-Received-Date: Fri, 13 Mar 2015 13:30:04 -0000

It depends on the diligence of the person running the combo-layer tool
whether the Signed-off-by line added to each commit actually indicates
that the person was involved in validating the change.

When the import is purely automatic, it is better to not add the line,
because the history is more useful without it (searching for the person
really only lists changes he or she was involved with) and it would
be a false statement.

The 'signoff' property can be set per repository, like every
other property. But setting it in the special [DEFAULT] section
is more useful, so that is what the example shows.
---
 scripts/combo-layer              |  7 ++++++-
 scripts/combo-layer.conf.example | 10 ++++++++++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 71fa7b127..62f2cf8 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -68,6 +68,11 @@ class Configuration(object):
                 if value.startswith("@"):
                     self.repos[repo][name] = eval(value.strip("@"))
                 else:
+                    # Apply special type transformations for some properties.
+                    # Type matches the RawConfigParser.get*() methods.
+                    types = {'signoff': 'boolean'}
+                    if name in types:
+                        value = getattr(parser, 'get' + types[name])(section, name)
                     self.repos[repo][name] = value
 
         logger.debug("Loading config file %s" % self.conffile)
@@ -482,7 +487,7 @@ def apply_patchlist(conf, repos):
                 if os.path.getsize(patchfile) == 0:
                     logger.info("(skipping %d/%d %s - no changes)" % (i, linecount, patchdisp))
                 else:
-                    cmd = "git am --keep-cr -s -p1 %s" % patchfile
+                    cmd = "git am --keep-cr %s-p1 %s" % ('-s ' if repo.get('signoff', True) else '', patchfile)
                     logger.info("Applying %d/%d: %s" % (i, linecount, patchdisp))
                     try:
                         runcmd(cmd)
diff --git a/scripts/combo-layer.conf.example b/scripts/combo-layer.conf.example
index 010a692..427c1b3 100644
--- a/scripts/combo-layer.conf.example
+++ b/scripts/combo-layer.conf.example
@@ -1,7 +1,17 @@
 # combo-layer example configuration file
 
+# Default values for all sections.
+[DEFAULT]
+
+# Add 'Signed-off-by' to all commits that get imported automatically.
+signoff = True
+
 # component name
 [bitbake]
+
+# Override signedoff default above (not very useful, but possible).
+signoff = False
+
 # mandatory options
 # git upstream uri
 src_uri = git://git.openembedded.org/bitbake
-- 
2.1.4


