Return-Path: <patrick.ohly@intel.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6A13F71F1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 14:51:34 +0000 (UTC)
Received: by iecvy18 with SMTP id vy18so5358430iec.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Feb 2015 06:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=lmkqy36x6iNicvdxyo2jXHZJbQmwS9lfmUASdZqQSB4=;
	b=e379Lwy2QxUzVEWGhdYAARrujE9YCH9vj867AZD+GumS5T6bN31h7Cl5GaAjNsXDfl
	ZPXy1k9Mnv9s2NKygOOLRM7EfWtPJfuBUrtDFxEZkniir8WJCayNEqyaNmXaUx12T2NT
	DgIRwFiUGTCdLoTkb7i2U+0S7qE//Fqa+AIzM+bHgyfsJ/l5qrJ/dAb8cMHPU7YmC1Pi
	G+XPstXo2/QnvEsnxovGTdHxkIGTBM5ZczpRbUr5R47bFKbBpx5M9Ivu/HeRj5BQYMAn
	7QiYRHzG9mA7l3krRvnhXNzelnjV3gpTFbR2wMKikKfl47xp6D/0Z2uTlHquqp65YSk9
	6DOw==
X-Gm-Message-State: ALoCoQmQUhMq5DqcP7VLzcOuJh6pr9cwsdN9h9AMxiMhvJVdJztIsn6nOSt9lu9ZK4rMW+8LOOZj
X-Received: by 10.43.182.69 with SMTP id pl5mr4103824icc.55.1424875895291;
	Wed, 25 Feb 2015 06:51:35 -0800 (PST)
Received: from syncev.vlan14.01.org (p5DE8E43A.dip0.t-ipconnect.de.
	[93.232.228.58]) by mx.google.com with ESMTPSA id
	r78sm20758338ioi.22.2015.02.25.06.51.31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 Feb 2015 06:51:33 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Feb 2015 06:51:15 -0800
Message-Id: <1424875875-1061-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 1.8.4.5
In-Reply-To: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
References: <1424180525-4138-1-git-send-email-patrick.ohly@intel.com>
Subject: [PATCH v2] package_rpm.bbclass: support packaging of symlinks to directories
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
X-List-Received-Date: Wed, 25 Feb 2015 14:51:35 -0000

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
 meta/classes/package_rpm.bbclass | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 4f9f813..e305e8b 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -199,10 +199,13 @@ python write_specfile () {
 
             # Treat all symlinks to directories as normal files.
             # os.walk() lists them as directories.
-            for i, entry in enumerate(dirs):
-                if os.path.islink(os.path.join(rootpath, entry)):
-                    del dirs[i]
-                    files.append(entry)
+            def move_to_files(dir):
+                if os.path.islink(os.path.join(rootpath, dir)):
+                    files.append(dir)
+                    return True
+                else:
+                    return False
+            dirs[:] = [dir for dir in dirs if not move_to_files(dir)]
 
             # Directory handling can happen in two ways, either DIRFILES is not set at all
             # in which case we fall back to the older behaviour of packages owning all their
-- 
1.8.4.5


