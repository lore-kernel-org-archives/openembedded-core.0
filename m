Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 984E76013D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 13:53:34 +0000 (UTC)
Received: by igcau2 with SMTP id au2so20704849igc.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Mar 2015 06:53:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=i0xestltP5e3Ytt8SqGgjEBtqL6EbIMfhtlet+KesXU=;
	b=b5Qpyq4KO9r5oWYW4LOll6cmSbPeerentJriDHt/1sfG2EG3juM9uI+/Hf0xkCxdHR
	tjPwGHy7MSRolc8mzR7j+5BaP5bpOkWnV4bLw84wSQ4wpJKe1cWwb040B8m1AXyRab13
	pKO9TtHvVShyz8+NT5xsOMQ8ZquJVzhEWlznqeviB/aEGnMC48zucfw5jVTzEq+xVlny
	a+46ZJJtNngL+6dpjnPVEvruuex2Edog8B+PZ9rYgT0gSDs5n1ehkjb60H4N3LYTXEVS
	YqQrZS6WfZeqe2cbtqw9QsnxVxZqSHzHio9JqrghhCY5LI/6DtYWjan3QlSU/+/CLS0o
	F0og==
X-Gm-Message-State: ALoCoQkFXO1eTl7WepiZm0YI28WCwB/O9ZRkm8ACvrAOCw9X64WS/GQdokquhDrvpvZj/qMZ9qOB
X-Received: by 10.43.55.145 with SMTP id vy17mr45645219icb.60.1427464415245;
	Fri, 27 Mar 2015 06:53:35 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56214.dip0.t-ipconnect.de.
	[87.165.98.20])
	by mx.google.com with ESMTPSA id k82sm1366606ioi.5.2015.03.27.06.53.33
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 27 Mar 2015 06:53:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Mar 2015 14:53:11 +0100
Message-Id: <f78e2b03467a8aa1fb020cae7586a5803d056e8a.1427463906.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1427463906.git.patrick.ohly@intel.com>
References: <cover.1427463906.git.patrick.ohly@intel.com>
Subject: [PATCH 2/3] combo-layer: fix file_exclude for dest_dir = .
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
X-List-Received-Date: Fri, 27 Mar 2015 13:53:36 -0000

"filterdiff -x ./some/file" does not remove changes for some/file.
We must be more careful about constructing the path name and
only add the prefix when it really means a directory.

While at it, also better normalize the path in copy_selected_files()
early on, to handle double slashes. Useful should the function ever
gets used for something other that dest_dir (which gets normalized in
sanity_check()).

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 4aed072..a1fc6ac 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -249,13 +249,16 @@ def action_init(conf, args):
                 # files already moved, we need to prepend the
                 # subdirectory to all filters, otherwise they would
                 # not match.
-                if subdir:
+                if subdir == '.':
+                    subdir = ''
+                elif subdir:
+                    subdir = os.path.normpath(subdir)
                     file_filter = ' '.join([subdir + '/' + x for x in file_filter.split()])
                     exclude_patterns = [subdir + '/' + x for x in exclude_patterns]
                 # To handle both cases, we cd into the target
                 # directory and optionally tell tar to strip the path
                 # prefix when the files were already moved.
-                subdir_components = len(os.path.normpath(subdir).split(os.path.sep)) if subdir else 0
+                subdir_components = len(subdir.split(os.path.sep)) if subdir else 0
                 strip=('--strip-components=%d' % subdir_components) if subdir else ''
                 # TODO: file_filter wild cards do not work (and haven't worked before either), because
                 # a) GNU tar requires a --wildcards parameter before turning on wild card matching.
@@ -375,7 +378,7 @@ tail -c +18 $tmpname | head -c -4
                     if not os.path.exists(extract_dir):
                         os.makedirs(extract_dir)
                     copy_selected_files('HEAD', extract_dir, file_filter, exclude_patterns, '.',
-                                        subdir=dest_dir if dest_dir != '.' else '')
+                                        subdir=dest_dir)
                     runcmd('git add --all --force .')
                     if runcmd('git status --porcelain'):
                         # Something to commit.
@@ -648,7 +651,7 @@ def action_update(conf, args):
             filter = ['filterdiff', '-p1']
             for path in exclude.split():
                 filter.append('-x')
-                filter.append('%s/%s' % (dest_dir, path) if dest_dir else path)
+                filter.append('%s/%s' % (dest_dir, path) if dest_dir != '.' else path)
             for patch in patchlist[:]:
                 filtered = patch + '.tmp'
                 with open(filtered, 'w') as f:
-- 
2.1.4


