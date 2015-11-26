Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 294116012A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 11:16:00 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so84425440pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Nov 2015 03:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=XmTnd3DHIYTPZnM4/uI2MPeqWX6Tk23wBDwtnHjgCD4=;
	b=sMZV1KA178pfKOGkmzwBmDMV1ZpnXhM9wqyUDUmoZf+yvdxnN8o5XoRHbNAMajpRps
	V1vSImVAVcGqrWLcBtasR+QoqC5aXEWXWtrzu13iF7cGq8pXaOTyhIOpmJO6e0v8BV2A
	fJNVLSpekg0dMN7up7LYN2djdXBp8/xvJjZmlfrrAlI1KOCxuasvMwDnaaaOnLaI7Ghy
	KPzHT9BJgIiEGS/UpkMqHoq7iXW0MwqLorVu2q+9UuNwPbrYwKUrdRuBOAKhQ82LAkFh
	w9a4c/aeg1baQ7UHDpoqpooUnGDsHRNH06jHVjsC7ZvfPPjMwwluGTsO+QVSyJrpvQEN
	CpRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XmTnd3DHIYTPZnM4/uI2MPeqWX6Tk23wBDwtnHjgCD4=;
	b=cZ6/Sbvkpc9xwDgKRHBT7jdPVRN0m09klcwJirqp7RRy2O8xbO+5Hy/3HiAjQ3XX61
	4fS/5GW1oeVxgtrZaIwtjWTkwEdmTsW9pPjFAks21al5Icn3e1YXdBEFF6TI2VPs0cy3
	eKzdMAo6DDd9YAdpzwrjr5vIi9dRh+qCeEnzr5Fqn3K9WmYP0vdvhsx7DT1VJLVIkAEz
	XsYBMsAMa+RA6aqAVdN/BO4Xi4Dl4XvuQxZ5lA9EdLZKfXKqG3LwhsYQ3wYyAH9QdGj8
	SdG4HbQSu6JrbDq8dbyO96zBzxAp9Nctlk1R80wEem7jL5lKSBo3Q4IoJUuXiXwqWT0e
	9F3w==
X-Gm-Message-State: ALoCoQmEEzpWUZR/n3nuGkkCfh8Ff68/wEBcYaRIxS0WAOTCypf4u49Z7iLenemcKBH/8hsy3Lu0
X-Received: by 10.98.0.138 with SMTP id 132mr38965130pfa.131.1448536560810;
	Thu, 26 Nov 2015 03:16:00 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	71sm26886886pfj.28.2015.11.26.03.15.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 Nov 2015 03:15:59 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 Nov 2015 16:45:54 +0530
Message-Id: <1448536554-18349-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH v2] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Thu, 26 Nov 2015 11:16:03 -0000

We get below host contamination warnings of license files for
each recipe, when we try to create a separate ${PN}-lic package (which
contains license files), by setting LICENSE_CREATE_PACKAGE equal to "1"
in local.conf.

-- snip --
WARNING: QA Issue: libcgroup: /libcgroup-lic/usr/share/licenses/libcgroup/generic_LGPLv2.1 is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: attr: /attr-lic/usr/share/licenses/attr/libattr.c is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
WARNING: QA Issue: bash: /bash-lic/usr/share/licenses/bash/COPYING is owned by uid 5001, which is the same as the user running bitbake. This may be due to host contamination [host-user-contaminated]
-- CUT --

Since the license files from source and OE-core, are populated in a normal
shell environment rather in pseudo environment (fakeroot); the ownership of
these files will be same as host user running bitbake. During the do_package
task (which runs in pseudo environment (fakeroot)), os.link preserves the
ownership of these license files as host user instead of root user.
This causes license files to have UID same as host user id and resulting in
above warnings during do_package_qa task.

Changing ownership of license files to root user (which has UID and GID as 0)
under fakeroot environment will solve above warnings, and on exiting fakeroot
environment the license files will continue to be owned by host user.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c616a20..6aa654c 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -185,6 +185,7 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
                 os.link(src, dst)
+                os.chown(dst,0,0)
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-- 
1.9.1


