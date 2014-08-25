Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 72EDD70F5A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 22:57:56 +0000 (UTC)
Received: by mail-pa0-f41.google.com with SMTP id rd3so21832809pab.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 15:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=gZn8AS5Jx7J4Bz1hkp3Kg1OfCAni+26J6xiiZP946VI=;
	b=TfHY8nqsQIj6KjEaG6kfNXa9dPHcXjffkHWhmeEOyNQd2DBYgjSRFR5Xwvx5ZbcQXS
	1s62AZ3b2U5cEXIbPLl31CIKgXqA75x1jGJsqxhp9gyI8YKHw7UhG4wEHO/CP1FjURhs
	UFTBaJDscqxUq4GKrj3A0dy9/HByoNbC9BAgmDCdS0wRLDPL3Zr/ecYVxHJMShxnAk+p
	p2q61sctAVGQY5haeHq6RgnaCFxxcKF5pLR3/D1ZN/frRKyDQ1Ptb2gWS2YrBfU4nuoh
	gBAYkqB+hGFgaDlgQmcSbGVpNVGPvfwFCgTew6mmC4MlYFAB4tfZTtkq3VzL720Mncl4
	Oa8A==
X-Received: by 10.68.222.136 with SMTP id qm8mr32793043pbc.92.1409007478122;
	Mon, 25 Aug 2014 15:57:58 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id bv5sm922487pbc.20.2014.08.25.15.57.55
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 25 Aug 2014 15:57:56 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Aug 2014 15:57:43 -0700
Message-Id: <16e99358cf7cef4ee08c4ae328a5e695056c1e35.1409007366.git.chris_larson@mentor.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
In-Reply-To: <cover.1409007366.git.chris_larson@mentor.com>
References: <cover.1409007366.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/3] sanity: fix support for regex schemes in mirrors check
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
X-List-Received-Date: Mon, 25 Aug 2014 22:57:57 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/sanity.bbclass | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7cfc4be..f655d8b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -754,8 +754,9 @@ def check_sanity_everybuild(status, d):
         status.addresult("Error, you have a space in your COREBASE directory path. Please move the installation to a directory which doesn't include a space since autotools doesn't support this.")
 
     # Check the format of MIRRORS, PREMIRRORS and SSTATE_MIRRORS
+    import re
     mir_types = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
-    protocols = ['http://', 'ftp://', 'file://', 'https://', 'https?$://', \
+    protocols = ['http://', 'ftp://', 'file://', 'https://', \
         'git://', 'gitsm://', 'hg://', 'osc://', 'p4://', 'svk://', 'svn://', \
         'bzr://', 'cvs://']
     for mir_type in mir_types:
@@ -767,12 +768,19 @@ def check_sanity_everybuild(status, d):
                 bb.warn('Invalid %s: %s, should be 2 members, but found %s.' \
                     % (mir_type, mir.strip(), len(mir_list)))
             elif len(mir_list) == 2:
+                decoded = bb.fetch2.decodeurl(mir_list[0])
+                try:
+                    pattern_scheme = re.compile(decoded[0])
+                except re.error as exc:
+                    bb.warn('Invalid scheme regex (%s) in %s: %s' % (decoded[0], mir_type, mir.strip()))
+                    continue
+
                 # Each member should start with protocols
                 valid_protocol_0 = False
                 valid_protocol_1 = False
                 file_absolute = True
                 for protocol in protocols:
-                    if not valid_protocol_0 and mir_list[0].startswith(protocol):
+                    if not valid_protocol_0 and pattern_scheme.match(protocol[:-3]):
                         valid_protocol_0 = True
                     if not valid_protocol_1 and mir_list[1].startswith(protocol):
                         valid_protocol_1 = True
-- 
1.8.3.4


