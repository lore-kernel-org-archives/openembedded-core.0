Return-Path: <kergoth@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 6F1E960132
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Jul 2016 21:27:17 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id i30so7821755qtd.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2016 14:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=t7ZhuNe5xTZH+U6QcaIXl3XW4WbDBSVpVQmaDz3wopM=;
	b=CQZBPAhpBHK5bJU8c+u+ija0HsNdkrV+M7lPBfa7V7kGxLromv1esfJtGvQ/Op+Cqt
	aNLf1cQz4SH0NpVUMLPtutgOlwU8fvKS7+HTSjsG9NM2h1Izeftk/uJT0BkTvHSbx8cL
	ocysVeyDkroBhgy8cTM9wW7qvPKOzWWkNuEd+Ag3CQI3fPNXfbJCSHxxJpZLkYQQSPKq
	KvU1UAdfiEoIQF1lSrMVE5u2dENMwtAhppcmIHPJDG5ShW39KS9tslV4N5RfKtOVbAoL
	rgJ4UH6uTY9sTgNCFY8NHMilIeP/QRP6UZtdjmVYLwQXUVofxqlRgOcVI9Fd1lwfutSI
	Y2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=t7ZhuNe5xTZH+U6QcaIXl3XW4WbDBSVpVQmaDz3wopM=;
	b=PvaxDUx3OL/oz5SqyCeY/zBZ7uOLB999jwm6oh+bptV1ODcrtOzC26d5mxt66swAhN
	ulEnO4hJD/wj+m2TeoC6nMn+XaSGMNhN7/z//SvFmwT3IW9wYLsaN6r89LhK6b+e3P76
	1mkgWCZpUQMYEy3PSHvv9w8eG8UVb9GPXwlLg2DPQOV69Me8qPNozXqWvncoTehBkFpa
	BJN8yNZJ7FxZnPSXhqgICiCq1fWK7CJFKoMgpprxojpGa2r72f8AqyIUWuoh3lhi4pkr
	5/QcjDMrvgwrIFB7aUtx6Ex8zaD+UcUuStXlSkGfFSYkGTiFAx0+x9mzXgpU9i4qW89a
	DeiQ==
X-Gm-Message-State: ALyK8tJZrqsADD96OenELeL1Q7tlZ9k7v2s03V8ZimskiKiw/FVzh73K1/eOjDauuGacTQ==
X-Received: by 10.200.46.155 with SMTP id h27mr605092qta.59.1467408437755;
	Fri, 01 Jul 2016 14:27:17 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id l2sm1660633qkb.45.2016.07.01.14.27.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 01 Jul 2016 14:27:16 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2016 14:27:09 -0700
Message-Id: <39520830292e5415e3883e0ba90c02259ddc570c.1467408317.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <ce4d11cf2caf0fa17dc28a71df76ab9bea7d107b.1467408317.git.chris_larson@mentor.com>
References: <ce4d11cf2caf0fa17dc28a71df76ab9bea7d107b.1467408317.git.chris_larson@mentor.com>
In-Reply-To: <cover.1467408317.git.chris_larson@mentor.com>
References: <cover.1467408317.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 2/2] image_types.bbclass: support template .wks.in files for wic
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
X-List-Received-Date: Fri, 01 Jul 2016 21:27:17 -0000

From: Christopher Larson <chris_larson@mentor.com>

These files are treated as the contents of a bitbake variable, so usual
bitbake variable references are supported. I considered using another
templating mechanism, for example the one used by yocto-layer, but then we'd
end up largely mapping metadata variables to template fields anyway, which is
a pointless indirection. Let bitbake expand the variables directly instead.

This feature lets us, for example, reference ${APPEND} in --append, and avoid
hardcoding the serial console tty in the wks file, and let the user's changes
to APPEND affect wic the way they do the other image construction mechanisms.

The template is read in and set in a variable at parse time, so changes to the
variables referenced by the template will result in rebuilding the image.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image_types.bbclass | 46 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index f7de756..2b97397 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -218,6 +218,52 @@ USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
 
+python do_write_wks_template () {
+    """Write out expanded template contents to WKS_FULL_PATH."""
+    import re
+
+    template_body = d.getVar('_WKS_TEMPLATE', True)
+
+    # Remove any remnant variable references left behind by the expansion
+    # due to undefined variables
+    expand_var_regexp = re.compile(r"\${[^{}@\n\t :]+}")
+    while True:
+        new_body = re.sub(expand_var_regexp, '', template_body)
+        if new_body == template_body:
+            break
+        else:
+            template_body = new_body
+
+    wks_file = d.getVar('WKS_FULL_PATH', True)
+    with open(wks_file, 'w') as f:
+        f.write(template_body)
+}
+
+python () {
+    if d.getVar('USING_WIC', True):
+        wks_file_u = d.getVar('WKS_FULL_PATH', False)
+        wks_file = d.expand(wks_file_u)
+        base, ext = os.path.splitext(wks_file)
+        if ext == '.in' and os.path.exists(wks_file):
+            wks_out_file = os.path.join(d.getVar('WORKDIR', True), os.path.basename(base))
+            d.setVar('WKS_FULL_PATH', wks_out_file)
+            d.setVar('WKS_TEMPLATE_PATH', wks_file_u)
+            d.setVar('WKS_FILE_CHECKSUM', '${WKS_TEMPLATE_PATH}:True')
+
+            try:
+                with open(wks_file, 'r') as f:
+                    body = f.read()
+            except (IOError, OSError) as exc:
+                pass
+            else:
+                # Previously, I used expandWithRefs to get the dependency list
+                # and add it to WICVARS, but there's no point re-parsing the
+                # file in process_wks_template as well, so just put it in
+                # a variable and let the metadata deal with the deps.
+                d.setVar('_WKS_TEMPLATE', body)
+                bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
+}
+
 EXTRA_IMAGECMD = ""
 
 inherit siteinfo
-- 
2.8.0


