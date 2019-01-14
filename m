Return-Path: <andre.draszik@gmail.com>
Received: from mail-yw1-f68.google.com (mail-yw1-f68.google.com
	[209.85.161.68])
	by mail.openembedded.org (Postfix) with ESMTP id 7DE817C049
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 12:56:47 +0000 (UTC)
Received: by mail-yw1-f68.google.com with SMTP id f65so8539107ywc.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jan 2019 04:56:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uWacIkwFaA2U3hLrJHIh2q2us8UJzwxgAj3cEf7AW0c=;
	b=UKSM6EVp4cXg/tcej1AauTYNwTB+gkE9Eh3s+bxcIl8JNlFN9fI+oiLXcugcgbzbAR
	ClW6OTG+UtNGXdIzzyZ/zP8ALHczCsX0U0ujhgLsfZxTJhS9YHThqHGK2wwDJ4e/xN7D
	qF7QgHUoX27UEGuT67yC0YdVZWj7KpmoungOj3Gt/sKphtMH4pfZ44+ESHxFQE1aFLmR
	uFPfxWTZFhDAnjVd6YgHQOpRkpnKKDfHltU6dgTZQQDUCGaim7dxhewGlNxytAJ7Iarb
	cVoOOG7UBxliGsYNxtcd6+aQAZLYsWQSh6DVK89JN+UuUBxlnCbQVaJlcGlgKomM/rix
	8hqQ==
X-Gm-Message-State: AJcUukc/4tYzkw6M3hlhAhpcvo/mIJdf6rok60mFYVwVJMAEnIHaY2AX
	M8/aH7tvLI58bd9llhD16jLt8r87
X-Google-Smtp-Source: ALg8bN6shfFKR9ABxh5ZsZx9F1DstS7TNHnVFV6+a0sCNmQbU1IVN7gZ1oHPJcaOSzX8bMavD+7J1w==
X-Received: by 2002:a81:1c42:: with SMTP id c63mr22407081ywc.89.1547470608374; 
	Mon, 14 Jan 2019 04:56:48 -0800 (PST)
Received: from tfsielt31850.garage.tyco.com ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	h145sm115143ywc.72.2019.01.14.04.56.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 14 Jan 2019 04:56:47 -0800 (PST)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Jan 2019 12:56:27 +0000
Message-Id: <20190114125632.4780-8-git@andred.net>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190114125632.4780-1-git@andred.net>
References: <20190114125632.4780-1-git@andred.net>
MIME-Version: 1.0
Subject: [PATCH 07/12] update-alternatives: try to update FILES_${PN} when renaming a file
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
X-List-Received-Date: Mon, 14 Jan 2019 12:56:47 -0000
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


