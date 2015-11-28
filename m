Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 55A966011F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 08:10:05 +0000 (UTC)
Received: by pabfh17 with SMTP id fh17so137502661pab.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 00:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=o7vk7HYxoRSqYZ1PakoFCXrPH7/ehGhHfJGWuCCuKGE=;
	b=1McSGgMaIAOrmpsUr6Xd/OJTnPPOQUNPrRzDZpXICqHaMnzDugLa8J26kbnPH+A77O
	UIrfK4PQnQUFmKOqsFtYah3jAMZRAvc64X03A/CtxNPfPeHZ2NLVBzLZyWiSbpyKudT7
	oDt1kNT4Q8Hrf8Szq+N3PWK1iqh684am0OGZLIFa4CkyFNeTlYbeZHZeVjLAaceVbAgG
	t6nvaRMzVQmMOefgEdwj/tH8mMTf71JYCHuQbwmReB8XHffyh4sy7tXaRxVbNQi5rL07
	PYDrGyp5+7C6aWyTdNeSn/5AKAgwJAu7xy+BI1jr2yjwcvVR/vfuZRbnDTeRZqOwyR+L
	Ge3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=o7vk7HYxoRSqYZ1PakoFCXrPH7/ehGhHfJGWuCCuKGE=;
	b=CuFWePr/9L1TJJqZK4C0pPSbn7PjcNIPcul8LPPDliPLMOFlZow0miekI7eQiyvyHb
	sqixzRRQNnOPU5XSItux6r33f7EBg9voLxq4eZDDWPWxar/78rUxIO2rgRIklHIJmvBp
	1DP+FSSBnMqRA91MW1E+6/Sn9+efU9E8FVkYJWpCMqP4hU8Ru2uz/Nkvw6NuuBkuTXPE
	CviKKJNLW2xFA1n34gjiB4/2ubuszduLEeIHoV6rhCR3yWrl0esYuEmUHTalGm3nVImB
	r2VMOXx2XSL8wl9kiX6sZLnxet6nT8AnUfgn5LhKVgU4AuKzmtbc09WTuM2foFgJcPqj
	Ltew==
X-Gm-Message-State: ALoCoQn8MNsMolMJeA757sU80E4YDgX8uDiNLmZ5lJ3Ydeo9vmSzkVh59ZE1zb35rAAKmXOBy4Ks
X-Received: by 10.98.70.81 with SMTP id t78mr54019393pfa.27.1448698206297;
	Sat, 28 Nov 2015 00:10:06 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	u76sm38331385pfa.88.2015.11.28.00.10.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 28 Nov 2015 00:10:05 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Nov 2015 13:39:54 +0530
Message-Id: <1448698194-14390-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH v3] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Sat, 28 Nov 2015 08:10:07 -0000

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
under pseudo environment will solve above warnings, and on exiting pseudo
environment the license files will continue to be owned by host user. Perform
this manipulation within try/except statements, as tasks which are not exected
under pseudo (such as do_populate_lic) result in OSError when trying to
change ownership of license files.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/classes/license.bbclass | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c616a20..8fff156 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -185,6 +185,15 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
                 os.link(src, dst)
+                try:
+                    os.chown(dst,0,0)
+                except OSError as err:
+                    if err.errno == 1:
+                        # suppress "Operation not permitted" error, as 
+                        # sometimes this function is not executed under pseudo
+                        pass
+                    else:
+                        raise
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-- 
1.9.1


