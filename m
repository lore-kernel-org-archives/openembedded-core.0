Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2807A77B07
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 17:58:18 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id w124so30988807itb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Mar 2017 10:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=OBQaKWaCnjYwznOswnIOeAhWjQvUwvwJ/2m0H/6TXDE=;
	b=Go2c53IM9XlryYW+QjwEuECNpdzZpUbpJbxAPMYjfKMgEZxem5TQPrqNjrOIz3CcyU
	2PIsIIxQELVl+v5IiM5T/FcQveam6t63WwiHeqIZZeDBDZEzif7ChrGOTo4mIYNhE0gL
	ZMtiu3eKMIF3lJGjBgp6LPh76U0z5/0e4DLb89uN9nXx98cJXW6G55qj3QJm+PAYVSoy
	hma3bVYSuD7SsPYw34WH4oM1dOK36yq8xy08zZRfX3K9cAX/zU65ynL32W1e+CXnalVR
	wu9/uX5g7Wv16JN74gBWmygjW/R85sPDT+1HThycntYR1um63ijjCOlqHcqMrla7zxdd
	f1kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=OBQaKWaCnjYwznOswnIOeAhWjQvUwvwJ/2m0H/6TXDE=;
	b=aeNppdcIIcB2b0Al0xEM98KHAmeqKd4DKAxAyP2/EaBM5dwIRpurFaKCLAo8FA4c4i
	Jsje0WD/ujvzXdj+NyR2bMU/k/UJ87XPlY2ar2b5+M3DxQQT0ascDfs6Dv8NQbci3Drl
	ips/lNfI47IIINKgQ4SVyQx4LoxZbyZtD2OYRGAm97RXkZxEQe8PUnz1fjS7AJMofkYq
	EGjBn9vxzxNWkG6bVxJUw75//4Ul+d60EqEDr3GyMFyMtyTsb6/dbSIDmyVMFC/YJvne
	ey7frpXc94xNGEM5qGuQimOKC9JAVdig1vYo4CkQSb0I6+y3XGa7hPQrbH99HPxycQ1w
	pxcQ==
X-Gm-Message-State: AFeK/H2NYibZ2b2mYsspdWYxIj1HDkC/gAuKJhyPWJaJvbdHe5WXTHvM6E2yOsRZrQaTcEN9
X-Received: by 10.36.33.135 with SMTP id e129mr3828364ita.9.1489773429016;
	Fri, 17 Mar 2017 10:57:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8C17C.dip0.t-ipconnect.de.
	[93.232.193.124]) by smtp.gmail.com with ESMTPSA id
	o134sm985996ite.23.2017.03.17.10.57.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Mar 2017 10:57:07 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Mar 2017 18:56:59 +0100
Message-Id: <20170317175659.7734-1-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] image_types_wic.bbclass: tighten dependency to help do_rm_work_all
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
X-List-Received-Date: Fri, 17 Mar 2017 17:58:19 -0000

Depending on wic-tools:do_build pulls a lot of additional, indirect
dependencies into the image sysroot during do_image_wic as soon as
rm_work.bbclass is active, because then we have
do_build->do_rm_work_all->[all dependencies]. One of those
dependencies is libgcc-initial, which clashes with libgcc itself,
leading to errors in extend_recipe_sysroot like this:

   Exception: FileExistsError: [Errno 17] File exists: '.../tmp/sysroots-components/corei7-64/glibc-initial/usr/include/fstab.h' -> '.../tmp/work/intel_corei7_64-poky-linux/core-image-minimal/1.0-r0/recipe-sysroot/usr/include/fstab.h'

As the image recipe only needs the sysroot of wic-tools and does not
need to wait for the build of wic-tools to finish, depending on
do_populate_sysroot is the better choice and happens to avoid
the problem above.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/image_types_wic.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index 500c8c5653e..4711c24593b 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -39,7 +39,7 @@ IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES"
 USING_WIC = "${@bb.utils.contains_any('IMAGE_FSTYPES', 'wic ' + ' '.join('wic.%s' % c for c in '${CONVERSIONTYPES}'.split()), '1', '', d)}"
 WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' % os.path.exists('${WKS_FULL_PATH}') if '${USING_WIC}' else ''}"
 do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
-do_image_wic[depends] += "wic-tools:do_build"
+do_image_wic[depends] += "wic-tools:do_populate_sysroot"
 WKS_FILE_DEPENDS ??= ''
 DEPENDS += "${@ '${WKS_FILE_DEPENDS}' if d.getVar('USING_WIC') else '' }"
 
-- 
2.11.0


