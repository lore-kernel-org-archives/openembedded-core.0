Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id ED83178170
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jun 2017 15:31:47 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id m62so112982149itc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jun 2017 08:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ef4USexcG8OatbspGr5PGlbeYpfBtvqdQs+nZX/BcQg=;
	b=rWt7X8AwTkJDUk6bHRGPLy5cDUxZ820B0ykh5HXw3e8OZFK5JajtJvEVmqMMIDYlw9
	DMvICwMCAx80debZVh5ZqgMYi8trM4Kh0pVLf2ZrImhx6ljXYlsdE7vNPkfc6Sivo5Nq
	Ll3yNAt0BB8u8tcKFHBoSbLQ/YouOKwkiFWOExXHM2Exuy7pg5KFyTIOP2bfrNoj2vjF
	JXKMhB5lIjSZ3lIkiJnI6XDobm0yeCDCOUpZKXHq1D906bid8D+ZCaVnwbvE2BqxNxpV
	6hk2YUDvTl3vBP/FWH33jTHMYqsIzEOnnX2Wz4dQBQjAUUpaCKi8p9sKBsupJ8HeOGZC
	3Gvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ef4USexcG8OatbspGr5PGlbeYpfBtvqdQs+nZX/BcQg=;
	b=rNRUZ4lkiJPZU0YN7FL3LsSNt0ptNJPc0LXWOK+im++56cprrBC6yMZCi1lJMMax0W
	rS2q8KySHLesxagdwuOXCNTvv6i9ZLFbpMb7Av/OcSiL2lEPVMPMWtI7MILCx1wrV8PI
	N/xFY2G9NEnR9PcS53Uc2IfxEi1eqAOAdpq4zFyLwCFg2MxQgnPvq3m44hahV5SZFKAG
	ZdTHr3UKX+Y2g9Le79gkymQ39AMJqAb2jI6LCHdADz/ThrpDZu/jNXGTHG4ZOZFfidoj
	wagIDNjHhC+jMzYW16aUyv+H2Wgli6mIBH2fdIXziF9Hfk+MwDpC7rteX5a6cc9wq+TM
	LAuA==
X-Gm-Message-State: AODbwcCR8dNxKpWsFop4WltISTTILiV+R2U0cDaZvI1PipLjA1KR2cCG
	bvlTsGMTppliAyWHZ1w=
X-Received: by 10.36.36.193 with SMTP id f184mr279709ita.111.1496849508466;
	Wed, 07 Jun 2017 08:31:48 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FFF1.dip0.t-ipconnect.de.
	[93.232.255.241])
	by smtp.gmail.com with ESMTPSA id y93sm1115855ita.9.2017.06.07.08.31.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 07 Jun 2017 08:31:47 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Jun 2017 17:31:33 +0200
Message-Id: <4e9ae0188740bcab90705399321c8db4631ecbc0.1496849345.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
References: <cover.8ea05a588020117b72a57015f699c7acd76b93e6.1496849345.git-series.patrick.ohly@intel.com>
Subject: [PATCH 2/2] utils.py: helper function for optional include files
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
X-List-Received-Date: Wed, 07 Jun 2017 15:31:48 -0000

By using oe.utils.optional_includes(), developers can simplify the
code which selects which additional include files need to be included
in a .bbappend.

In the simple case (one distro feature and one include file) the code
is not shorter, but the intent is clearer than corresponding code
using bb.utils.contains():

   require ${@ oe.utils.optional_includes(d, 'foo-feature:bar.inc') }

More complex cases are also supported, in particular include files
that are required for one of several distro features or multiple
different include files.

To keep the common use case simple, DISTRO_FEATURES are checked by
default. Checking IMAGE_FEATURES might also be useful.

The DISTRO_FEATURES default and the intended usage make this more
suitable for OE-core than bitbake.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/lib/oe/utils.py | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/meta/lib/oe/utils.py b/meta/lib/oe/utils.py
index 330a5ff..a6c6199 100644
--- a/meta/lib/oe/utils.py
+++ b/meta/lib/oe/utils.py
@@ -126,6 +126,35 @@ def features_backfill(var,d):
     if addfeatures:
         d.appendVar(var, " " + " ".join(addfeatures))
 
+def optional_includes(d, mapping, key_var="DISTRO_FEATURES"):
+    """
+    This can be used to generate a list of files to include depending on
+    the distro features that are selected. key_var contains the features
+    that are set, mapping_var a space-separated set of <feature(s)>:<file(s)>
+    entries. Features and files are separated by comma. Each file on the
+    right-hand side is included in the result once if any of the features one
+    the left-hand side is set.
+
+    Example:
+       require ${@ oe.utils.optional_includes(d, "foo,bar:foo-or-bar.inc xyz:x.inc,y.inc,z.inc")}
+
+    For DISTRO_FEATURES = "foo xyz" that will include four .inc files in the
+    order in which they are listed.
+    """
+    key = set((d.getVar(key_var) or "").split())
+    mapping = mapping.split()
+    includes = []
+    for entry in mapping:
+        parts = entry.split(":", 1)
+        if len(parts) != 2:
+            bb.fatal("%s must contain entries of the form <feature(s)>:<file(s)>, not %s" % (mapping_var, entry))
+        features, files = parts
+        for feature in features.split(","):
+            if feature in key:
+                for file in files.split(","):
+                    if file not in includes:
+                        includes.append(file)
+    return " ".join(includes)
 
 def packages_filter_out_system(d):
     """
-- 
git-series 0.9.1

