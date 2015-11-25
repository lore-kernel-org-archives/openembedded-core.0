Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 9F7AB60797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 08:30:58 +0000 (UTC)
Received: by iofh3 with SMTP id h3so46879904iof.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 00:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7Fdqg/cH+tIeFHKeyW1QzvRvd4V4mmOdH0hzuBoFyeo=;
	b=sb9iij6I6DQwDeaRGdZLuoISSpc464sA09BWU57q29ATJZU1iXTcKiivyOdZnzQzY1
	0GlqaISAKXtSi3Q1D+Y2cWdoJAbDWoZIgXF6DYkQWU5DtJ1imNled+xHLfJldsoEHSLA
	9sKav7K8b6SLrQ0/HdWRov6QwrO1L2vnKPp8O7FxC9nw+5nMuKYd187Gd1tPxfqMZVNb
	SpI8mpqRcjz8vQ/iiMZi9h2W7aUpbnHjLCzdjQvZLh0vuz4Z9KpCc5gH/3h0YLkq+JAt
	rAdFOrvReiGHrNtqGSEFz+SsdTbWEjNboOFyeB4crp/eoBKku9FwVjMSVr3KsnRqgQuc
	kmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=7Fdqg/cH+tIeFHKeyW1QzvRvd4V4mmOdH0hzuBoFyeo=;
	b=bsH8IZ7qVrgRN/qc2OtN/5e1Cuh1WKiSchAOJbzNFQ8XrhhCSmByEJ9+4TsUbLzQGn
	8AmMrg93ems68F0pAUQyFcy9kDvjQaIfaHAYq40ZeBtoKK+k2DCsx2+HoPmjYwSUu/d9
	XpgRdBCjw5Xx/n4MZccY1rxfTQJOvCdATVYS4sd6cxfVBHZUjTprE2b0jozu6GiZNS8P
	g95vAB1O9dPIvI5NY4aAhy/gsseE8ZCuW7VDSvKf4V0TiKHnpgr3gJ02ZAxam7cOYzxd
	dB5l5+ED3bNqWu1opGN74RZjsI7sGv2fODvp88qDd1Nrpi/sg+yv8GWFXGt6hUGGMtO6
	SSCg==
X-Gm-Message-State: ALoCoQncxPAVZDVniSHKjJeyv1C2R9tvTRvVZ7rNSV+PPz6q2+V4GAxBb7SuAH2FoTIIl7m2PGDv
X-Received: by 10.107.136.217 with SMTP id s86mr33217607ioi.142.1448440258932; 
	Wed, 25 Nov 2015 00:30:58 -0800 (PST)
Received: from pohly-desktop.fritz.box (p57A56CC0.dip0.t-ipconnect.de.
	[87.165.108.192]) by smtp.gmail.com with ESMTPSA id
	i69sm8398302iod.27.2015.11.25.00.30.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 25 Nov 2015 00:30:58 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 10:30:30 +0100
Message-Id: <8da679502ac205e3ba845f69b6b37647b520f66a.1448442869.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1448442869.git.patrick.ohly@intel.com>
References: <cover.1448442869.git.patrick.ohly@intel.com>
Cc: paul.eggleton@linux.intel.com, alexander.kanevskiy@intel.com
Subject: [PATCH 2/4] buildhistory.bbclass: support extending the content of the build history
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
X-List-Received-Date: Wed, 25 Nov 2015 08:30:58 -0000

The idea behind the implementation of Yocto #8138 was that an
additional class can write additional files in the recipe directories,
for example by hooking into the functions of buildhistory.bbclass or
by implementing its own SSTATEPOSTINSTFUNCS function.

However, when these additional files get created before
buildhistory_emit_pkghistory(), they get removed again by that
function because it contains code which removes everything it does
not know about. The reason for that is that these unknown items
are probably obsolete.

This logic is the reason why the additional "kconfig" file from
buildhistory-extra.bbclass never showed up in the final build history.

To fix this, the hard-coded list of known files in
buildhistory_emit_pkghistory() must be turned into a variable which
derived classes can extend.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/buildhistory.bbclass | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 729dcd4..6023e5d 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -23,6 +23,16 @@ sstate_install[vardepsexclude] += "buildhistory_emit_pkghistory"
 # then the value added to SSTATEPOSTINSTFUNCS:
 SSTATEPOSTINSTFUNCS[vardepvalueexclude] .= "| buildhistory_emit_pkghistory"
 
+# All items excepts those listed here will be removed from a recipe's
+# build history directory by buildhistory_emit_pkghistory(). This is
+# necessary because some of these items (package directories, files that
+# we no longer emit) might be obsolete.
+#
+# When extending build history, derive your class from buildhistory.bbclass
+# and extend this list here with the additional files created by the derived
+# class.
+BUILDHISTORY_PRESERVE = "latest latest_srcrev"
+
 #
 # Write out metadata about this package for comparison when writing future packages
 #
@@ -165,12 +175,13 @@ python buildhistory_emit_pkghistory() {
             raise
 
     packagelist = packages.split()
+    preserve = d.getVar('BUILDHISTORY_PRESERVE', True).split()
     if not os.path.exists(pkghistdir):
         bb.utils.mkdirhier(pkghistdir)
     else:
         # Remove files for packages that no longer exist
         for item in os.listdir(pkghistdir):
-            if item != "latest" and item != "latest_srcrev":
+            if item not in preserve:
                 if item not in packagelist:
                     itempath = os.path.join(pkghistdir, item)
                     if os.path.isdir(itempath):
-- 
2.1.4


