Return-Path: <andre.draszik@gmail.com>
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
	[209.85.219.175])
	by mail.openembedded.org (Postfix) with ESMTP id 49DFB7C0F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 14:45:38 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id e1so1114037ybn.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2019 06:45:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uWacIkwFaA2U3hLrJHIh2q2us8UJzwxgAj3cEf7AW0c=;
	b=joIJJjITvNRUiR5sKldz1O+Hf6QUAOUW2BkNxZBFujS1DrLB6oSA9iLD9Y4VHU2HkV
	biA+ayiA4qgdCrtEIRKJhEec0B/Rb/sA8Nnf0z+YJzOICity71+HbDSEF9GaVf1CrF0k
	cFx7+tfKk6TSv5GDje7+61ZMYDuScFonJc7882nKrz5ZJ2kVLf3DT78REpMLR/KNVY1Q
	+yFjiruMGCzuxQg5gxgh9fkcRZdEiO0wt7P6XZ6yTAPjcNIZ/jfYlNxNTmYUH8ER+ALG
	Ma7V7Q86JuQs3RIQjkvZlW2wRyd4ixk5d6lOpgyeDBFwiCtr2HdeKYv7FrmSgqIMebTX
	6BLQ==
X-Gm-Message-State: AJcUukd5IR+fih2W1bv69oABgzq54uQrRp7Tvag+iXazBPFZmRUj0LH9
	7T4M26eDCKT0omcNZSxcaivFvSEQ
X-Google-Smtp-Source: ALg8bN4FB09iAOj2S67kvx3KE8Rur9aWAqqJ0k9zxrjosueYBW8yG4u8QOaYs7lXyA5v0y1iEwMuDA==
X-Received: by 2002:a25:77cc:: with SMTP id s195mr3194603ybc.167.1547563539114;
	Tue, 15 Jan 2019 06:45:39 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	i13sm1261220ywe.53.2019.01.15.06.45.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 Jan 2019 06:45:38 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2019 14:45:17 +0000
Message-Id: <20190115144525.29388-8-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190115144525.29388-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
	<20190115144525.29388-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH v2 07/15] update-alternatives: try to update FILES_${PN} when renaming a file
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
X-List-Received-Date: Tue, 15 Jan 2019 14:45:38 -0000
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
index ffedada2f6..a204afb060 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -139,6 +139,8 @@ python perform_packagecopy_append () {
 }
 
 python apply_update_alternative_renames () {
+    from re import sub
+
     # Check for deprecated usage...
     pn = d.getVar('BPN')
     if d.getVar('ALTERNATIVE_LINKS') != None:
@@ -178,6 +180,10 @@ python apply_update_alternative_renames () {
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
@@ -204,6 +210,11 @@ python apply_update_alternative_renames () {
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


