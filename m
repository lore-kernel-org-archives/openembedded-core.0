Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id 64CBE6013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 13:53:36 +0000 (UTC)
Received: by igbqf9 with SMTP id qf9so20254976igb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 06:53:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=oWLUMYSYPM/a7dqqpcN0LBgWNqbIlmo73IjAHQZb0DI=;
	b=NMWMFfc+jLZKB/gQm1qbvD3LCIqPO8UF97LgZLyBWCljAIOSLnGwyrD8P7d6myilGt
	80423c5g9HGy/nBEOprXvd3SrPmWXBBx046gUj4qoOBfMMFjM62W+oJs/tcixlk96RiF
	YraSeHXJPoKvhW7QtRtoiSufZehJjUtZtettS8KVg8+WFYBFoS3QUADOO5QVe8+yN3wH
	3RTwpQFcDTJpmCZf5ChH5boM240nrNi7a6VfX42VyWnzCY+WKgZVAfr/+f4g2D5aEUvr
	dTVtlXHiJ87aSvOFbdp3MiFvQAXMB4EzwJ/9oS+ctK8192ElGSt/HSDmBCTlqtnpbseJ
	dhjw==
X-Gm-Message-State: ALoCoQli4doJQ9ZFjHwZNOAFcreMwvtkUIzOOO7N/WpjHkAkn7xrfNECyvy4wQuPk/A4/GNAN3Ok
X-Received: by 10.107.128.226 with SMTP id k95mr29346098ioi.73.1427464418161; 
	Fri, 27 Mar 2015 06:53:38 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56214.dip0.t-ipconnect.de.
	[87.165.98.20])
	by mx.google.com with ESMTPSA id k82sm1366606ioi.5.2015.03.27.06.53.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Mar 2015 06:53:37 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 14:53:12 +0100
Message-Id: <45a34e1ef485fb6af0912a664dc2ff5856d72fae.1427463906.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
Subject: [PATCH 3/3] combo-layer: fix file_exclude for empty commits
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
X-List-Received-Date: Fri, 27 Mar 2015 13:53:37 -0000

The code detecting empty patches after removing files with
file_exclude failed for commits which were already empty before (like
the initial commit in some repos): such patches are completely empty
files, without a From line.

Detect that case and just let the normal empty patch detection deal
with it.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index a1fc6ac..1dce4a6 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -665,6 +665,10 @@ def action_update(conf, args):
                     # Empty, ignore it. Must also remove from revlist.
                     with open(patch, 'r') as f:
                         fromline = f.readline()
+                    if not fromline:
+                        # Patch must have been empty to start with. No need
+                        # to remove it.
+                        continue
                     m = re.match(r'''^From ([0-9a-fA-F]+) .*\n''', fromline)
                     rev = m.group(1)
                     logger.debug('skipping empty patch %s = %s' % (patch, rev))
-- 
2.1.4


