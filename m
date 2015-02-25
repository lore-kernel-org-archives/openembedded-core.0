Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id C118771F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 14:53:37 +0000 (UTC)
Received: by iecar1 with SMTP id ar1so5516816iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 06:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=o9wITnDNtror1nmxTpf3V7T4vx05q4iU64ZpwoBSGSU=;
	b=cJWC0rtR59leXDDupYq8NOkgIuvaoLXMILV3EbzMfjKlpIgdWlAem+a4ULD7VePmyy
	9cb/6EHkV1vgyG+I+vi4DvCGt3JmxX2GbewutJj8VhtCVsWEzAQcIyBy8hNRc4usxzGx
	oKfKPKPTluQRJQGCrONuUINk2YpXoKJzsKqXl5909V2CiGUsDfZ17H6Jho7kc7RWv0aj
	aXOusy/bsbPk+1M9iN1TEtFh0JdJn3peTQ+QGIn1xs8FnO6CPjoqLDPrR6re5RvbWYpI
	cZX3uwUHFhFlR3cLaHvwb8yErHPcHEhsnnPCxZFPn7pah+a1vd8W+jQcp24di8YsOOEE
	s8kw==
X-Gm-Message-State: ALoCoQncO+qTn7qCgG0f1BY5O5WUVvCpyjo9bKABdHYZLzLzfvFtfQFl6+re0JfLrqN3LWBtpQBS
X-Received: by 10.107.17.89 with SMTP id z86mr5081209ioi.52.1424876018419;
	Wed, 25 Feb 2015 06:53:38 -0800 (PST)
Received: from syncev.vlan14.01.org (p5DE8E43A.dip0.t-ipconnect.de.
	[93.232.228.58])
	by mx.google.com with ESMTPSA id n4sm9862410igr.3.2015.02.25.06.53.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Feb 2015 06:53:37 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 06:53:29 -0800
Message-Id: <1424876009-8583-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH v3] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 25 Feb 2015 14:53:39 -0000

os.walk() returns symlinks to directories in the "dirs" lists, but then never
enters them by default. As a result, the old code applied neither the
directory handling (because that is active once a directory gets entered) nor
the file handling, and thus never packaged such symlinks.

The fix is simple: find such special directory entries and move them to the
"files" list. However, one has to be careful about the undefined behavior of
modifying a list while iterating over it.

This fix was required for packaging a modified base-files that created
symlinks into /usr for /sbin /lib and /sbin.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/package_rpm.bbclass | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b87e634..e305e8b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -197,6 +197,16 @@ python write_specfile () {
             if path.endswith("DEBIAN") or path.endswith("CONTROL"):
                 continue
 
+            # Treat all symlinks to directories as normal files.
+            # os.walk() lists them as directories.
+            def move_to_files(dir):
+                if os.path.islink(os.path.join(rootpath, dir)):
+                    files.append(dir)
+                    return True
+                else:
+                    return False
+            dirs[:] = [dir for dir in dirs if not move_to_files(dir)]
+
             # Directory handling can happen in two ways, either DIRFILES is not set at all
             # in which case we fall back to the older behaviour of packages owning all their
             # directories
-- 
1.8.4.5


