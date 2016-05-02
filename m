Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id C5608606D1
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:24:13 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id i5so18361088pag.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=N0bA0W3oMb48KmYWlsVGYSY1ZruvYV7aWIPeICQEzw4=;
	b=ARqu6TiXf1Ocrn8xrtqMFlEI/RTpL8kVYy1m132zHdvMZHpKDxnaPCZ4/ZwaZV+dqM
	SzSqCxnjUWL9dla+NZMvzyDm6JHHx4EROSAFw4Kututs8lW/Ahq8IhN05upsvgCUa5cY
	/y39mEfbZBVKjmJQoWbufTxsQEJNT72fchKC6gkcKCl4/pOpHKw77lX7pJ4FNzl/2+G6
	QC6gC1uwl10jXX71Z0H9X5PPF5jGPXuorh/xOOjCuezBGpWIelPzY7QLEhrODdQ1v1gL
	WEWjPYSXfNz4seIsfcooGZ8/M/wybTmqU+FJ9R4rTvtosNmc+93H0L8h33ffYDEoJ7Xd
	9FCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=N0bA0W3oMb48KmYWlsVGYSY1ZruvYV7aWIPeICQEzw4=;
	b=Fw9V0YoFgFvqOlkvlmr+JaSmPjtInwQl/AmxFvfu/7EFgif4H+ORj9Ok3xd4Ur4o/Z
	4gCd1abLCQCMlr7a+rM1NWSrad6RWe0xEE3SdLBm8p63AteFVjYGYr6DvD8Qr/+1/3Vm
	YMsjDTCHKfiDdwWgd6ITlfGfhs0greRGvaK/QbinswEvbbovfiv6DqIQ0F6hOj/CI/rz
	rqFlb9O7ZtjL3MFZR8BspF74YSrFlqWlTP0GgDHwimI4PWxoVLktvMsjongY3BJ0ASGH
	nOuAQM4pvPiq7MqUJWxUrDzRRgnYB43GI2Yeqll8QyumjfkB5viTd+9jmwr0LWjKaEZY
	PFMg==
X-Gm-Message-State: AOPr4FUhDizyFD+K9TsMeazKfF/05v8W4ffgGIUKUgpob0AxiN3RznyA77PEtbnGyzvpog==
X-Received: by 10.66.41.107 with SMTP id e11mr54362443pal.15.1462217054349;
	Mon, 02 May 2016 12:24:14 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	rw2sm47630613pab.30.2016.05.02.12.24.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 May 2016 12:24:12 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 May 2016 12:24:04 -0700
Message-Id: <923e29abfcf835e2a4749ec7eb3dfe6389b2df39.1462216694.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <082b1dc91bca7617570284bc7f46511ffc037ddd.1462216694.git.chris_larson@mentor.com>
References: <082b1dc91bca7617570284bc7f46511ffc037ddd.1462216694.git.chris_larson@mentor.com>
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [for-master][RFC PATCH 3/3] image_types.bbclass: support template .wks.in files for wic
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
X-List-Received-Date: Mon, 02 May 2016 19:24:14 -0000

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
 meta/classes/image_types.bbclass | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index eed0373..90b5a46 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -206,6 +206,16 @@ IMAGE_CMD_wic () {
 }
 IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 
+python process_wks_template () {
+    """Write out expanded template contents to WKS_FULL_PATH."""
+    template_body = d.getVar('_WKS_TEMPLATE', True)
+    if template_body:
+        wks_file = d.getVar('WKS_FULL_PATH', True)
+        with open(wks_file, 'w') as f:
+            f.write(template_body)
+}
+do_image_wic[prefuncs] += 'process_wks_template'
+
 # Rebuild when the wks file or vars in WICVARS change
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${COMPRESSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
@@ -298,3 +308,28 @@ IMAGE_TYPES_MASKED ?= ""
 # The WICVARS variable is used to define list of bitbake variables used in wic code
 # variables from this list is written to <image>.env file
 WICVARS ?= "BBLAYERS DEPLOY_DIR_IMAGE HDDDIR IMAGE_BASENAME IMAGE_BOOT_FILES IMAGE_LINK_NAME IMAGE_ROOTFS INITRAMFS_FSTYPES INITRD ISODIR MACHINE_ARCH ROOTFS_SIZE STAGING_DATADIR STAGING_DIR_NATIVE STAGING_LIBDIR TARGET_SYS"
+
+python () {
+    """Read in and set up wks file template for wic."""
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
+}
-- 
2.8.0


