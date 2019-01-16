Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f195.google.com (mail-yb1-f195.google.com
	[209.85.219.195])
	by mail.openembedded.org (Postfix) with ESMTP id 126077C19B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:51:35 +0000 (UTC)
Received: by mail-yb1-f195.google.com with SMTP id j10so2447936ybj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=aHLVaKZqwi+R9uBLZYoCBG6qI2q/RVtB+lGC/Zvhk78=;
	b=XW1JN3J4N72vsAatkLVaEmowBul6NLGQ+80cKPjbnUub/xZaJJTqfCnbCmSo7BspHW
	H6lSrOSmErBcRxQtfXettMlJ6vc+FaQaCSEgoUUPEapb9XMLtOElTray6rpALdJlFZH4
	LI0qpzsKTSqZvSLeGiI1sRU2R6S/woCdiSguJi3oCvRSlSBOB4w+dywDsqmWHfRrCTlJ
	vQOS1WW/Oue/hJtJ+cyLGguxYhV/eL8SHqS7VA/8y3C2RbOWfbRiKSzkoy88wF8hGwgS
	rWlxNyNtJXRs7lBymWJgGe1JHYESY9fYwOtPE/k4G9QJN7LrOzEm6tiZJ7Kc45AYQsys
	mKtw==
X-Gm-Message-State: AJcUukdkHUyrDefr9FR4+NFSXaUBz7lfp0+57CCMFGH9mWzEIu6tmBVz
	xMR+nyhempqGDpJoWID/rEyMBfIS
X-Google-Smtp-Source: ALg8bN5+XAoansBt44NdckBaC15ORdkpQZo3UzTJGpJBDdnZcj2NcKf2QIhAzmURuIjurlU0fsR90Q==
X-Received: by 2002:a25:3786:: with SMTP id e128mr7288140yba.124.1547643096945;
	Wed, 16 Jan 2019 04:51:36 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id y63sm6194558ywy.1.2019.01.16.04.51.35
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:51:36 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:51:16 +0000
Message-Id: <20190116125124.20177-8-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116125124.20177-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116125124.20177-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v4 07/15] update-alternatives: try to update FILES_${PN} when renaming a file
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
X-List-Received-Date: Wed, 16 Jan 2019 12:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: André Draszik <andre.draszik@jci.com>

When using update-alternatives, FILES_${PN} must be
referencing the new name after update-alternatives has
renamed files.

This is more or less OK when having static lists of files to
be packaged into a package, but makes it quite hard to
dynamically generate FILES_${PN}, e.g. using do_split_packages(),
as in that case we can not easily modify what goes into
FILES_${PN}, because that list is based on filenames as seen
at the time do_split_packages() is executing.

Of couse one could explicitly specify the (renamed) file(s)
in the recipe, but that contradicts the intended usage of
do_split_packages().

Instead, if FILES_${PN} contains the file name as it was pre
renaming, we here modify this to reflect the new name.

This will allow usage of do_split_packages() to populate
FILES_${PN}.

[YOCTO #13058]

Signed-off-by: André Draszik <andre.draszik@jci.com>

---
v4: * introduce update_files() helper function
---
 meta/classes/update-alternatives.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index f3c014a5fc..e252651128 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -138,6 +138,14 @@ python apply_update_alternative_renames () {
     if not update_alternatives_enabled(d):
        return
 
+    from re import sub
+
+    def update_files(alt_target, alt_target_rename, pkg, d):
+        f = d.getVar('FILES_' + pkg)
+        if f:
+            f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
+            d.setVar('FILES_' + pkg, f)
+
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -177,6 +185,7 @@ python apply_update_alternative_renames () {
                     else:
                         bb.note('%s: Rename %s -> %s' % (pn, alt_target, alt_target_rename))
                         os.rename(src, dest)
+                        update_files(alt_target, alt_target_rename, pkg, d)
                 else:
                     bb.warn("%s: alternative target (%s or %s) does not exist, skipping..." % (pn, alt_target, alt_target_rename))
                     continue
@@ -203,6 +212,8 @@ python apply_update_alternative_renames () {
                     os.unlink(src)
                 else:
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
+                    continue
+            update_files(alt_target, alt_target_rename, pkg, d)
 }
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
-- 
2.20.1


