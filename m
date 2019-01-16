Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1B6D07BDC2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 12:01:04 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id g75so2372857ywb.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 04:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=0bbWo0JpR7dzM98fFqanRT7t/D4hAO+Vl6gZuO65ykg=;
	b=numhi0p69ZuxcEBF3M2viDevGyHd/biyWjdRX8B7xMzgVBrugMAm3rdcZrEan6mX3C
	CpQMXtTOPotdLcINnmaaIVuXrXVxeg9KIb8X5+3E/AWT/yQEiYZpnEb68w3XrX50wkum
	x7sNRMOanQG0k/QRsEwuGTx8Dxl2N4ghbyK3FnJY9r0FweCUK0PFmTiXKwS+YvCWV1KI
	qi+zf2fKzNRj5VLYYNoXe6lWyNNpdetUWWg2gaFSpKfQqZY9crmWRqJn158qoR4/WS8y
	NtbidRDAEWFnqdV59+RPVhtRe/XXR+Vh4DtGB4WPJ1QGmriVkoFXrEj61HpE37hDlYHw
	87aw==
X-Gm-Message-State: AJcUukfZO/DuJU3VtRU49LC7AmKRRar7jUdEURVI92f0f8nsIKV19arT
	ncbqzgLtmdE7TIh/Dnhj3xMoiX/L
X-Google-Smtp-Source: ALg8bN5XgB6qCdE+CXl/STXJxNPvxkundiHi0+eYRGOEIt+Mu6JN/Mdm5g81At6bZwLSGp0uiPDqMw==
X-Received: by 2002:a0d:de82:: with SMTP id h124mr6937107ywe.354.1547640065079;
	Wed, 16 Jan 2019 04:01:05 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	o124sm2169655ywe.75.2019.01.16.04.01.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 16 Jan 2019 04:01:04 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jan 2019 12:00:43 +0000
Message-Id: <20190116120051.12182-8-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190116120051.12182-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190116120051.12182-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v3 07/15] update-alternatives: try to update FILES_${PN} when renaming a file
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
X-List-Received-Date: Wed, 16 Jan 2019 12:01:04 -0000
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
 meta/classes/update-alternatives.bbclass | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index 78291e7e45..363f1ae129 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -135,6 +135,8 @@ populate_packages[vardeps] += "${UPDALTVARS} ${@gen_updatealternativesvars(d)}"
 # place for that.
 PACKAGE_PREPROCESS_FUNCS += "${@'apply_update_alternative_renames' if update_alternatives_enabled(d) else ''}"
 python apply_update_alternative_renames () {
+    from re import sub
+
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -174,6 +176,10 @@ python apply_update_alternative_renames () {
                     else:
                         bb.note('%s: Rename %s -> %s' % (pn, alt_target, alt_target_rename))
                         os.rename(src, dest)
+                        f = d.getVar('FILES_' + pkg)
+                        if f:
+                            f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
+                            d.setVar('FILES_' + pkg, f)
                 else:
                     bb.warn("%s: alternative target (%s or %s) does not exist, skipping..." % (pn, alt_target, alt_target_rename))
                     continue
@@ -200,6 +206,11 @@ python apply_update_alternative_renames () {
                     os.unlink(src)
                 else:
                     bb.warn('%s: Unable to resolve dangling symlink: %s' % (pn, alt_target))
+                    continue
+            f = d.getVar('FILES_' + pkg)
+            if f:
+                f = sub(r'(^|\s)%s(\s|$)' % alt_target, r'\1%s\2' % alt_target_rename, f)
+                d.setVar('FILES_' + pkg, f)
 }
 
 PACKAGESPLITFUNCS_prepend = "populate_packages_updatealternatives "
-- 
2.20.1


