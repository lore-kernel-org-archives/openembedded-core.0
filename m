Return-Path: <jkrishnanjanappa@mvista.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 593306011F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 06:54:49 +0000 (UTC)
Received: by padhx2 with SMTP id hx2so48139073pad.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Nov 2015 22:54:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=iIK/qcNhQi+1wpNidoplyEjbsJqecyERTSNBLXgkyf0=;
	b=p79y+JJaWNFW6/V1PsG+HrcmQjzGTr1LtYu8aTGofVbc/QlGNqSGylhXc3OwxDDj78
	0aIbUi3SYh6aEcgy9OsN2C8KaPAL1AzsOR1ysNTqxCUlj4IQyL3BO0yvrssOCAA+SKH0
	TcZs92gfR53VzDHUxaFaOmc3KZLXZPUgdXCIE0HpOgJucXY2jWQymUdpdZtIQN1QCdew
	Cb/PU0iKbfRGil7VNy6tL5M/CuSoizcK8wsr2Kc7W6pe+Wj/P+QDMsz2s0GggCi2X4mV
	SApz3zpP8eLfGSVU9oDhBCkueG5SUsj49FRJo5tkbGcb0J6FV4Jp4NE7E6YdiW/2OEjy
	7DqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=iIK/qcNhQi+1wpNidoplyEjbsJqecyERTSNBLXgkyf0=;
	b=lUQIvQAkgPFpl8yR7fCMr1Z+0+GoEfZ7G1pir0f63Hhq7bC2fGNcCIcaAldeSCrMXm
	6d7kAkbHxhmxzsB9CP6jJyQPQCG+JS/IP8oFafxPOsRk1aCRxVuAdxzqyetsG14/d/Dv
	b6lYAohRPTa0zKO4hE22zvUpBqCNVBi0rZAmahWXn2RapszKXOWGF/MtmDOMlx3WQC+V
	tPhsr5f6TNJRAxpVkbM7B7JXI74P090Y+GY44AGN9xeNd2lKFjbfJv5h7DrVFg8n9EOM
	HBHVefy+ruxtzV/HZ2FygtNuOmHH22yZz+NyWdaT7iEdW3JCdNB5vpeVF4rHgPqRlHQq
	fVBA==
X-Gm-Message-State: ALoCoQmsrpVpgmvWyGG5v8GzXUQRuJPSSMEeaOz7mnCXOboW2Ew4KDHvF/BHj9BvPb1DqvH12uTM
X-Received: by 10.98.73.13 with SMTP id w13mr28657326pfa.72.1448434490298;
	Tue, 24 Nov 2015 22:54:50 -0800 (PST)
Received: from ubuntu64.mvista.com ([111.93.218.67])
	by smtp.gmail.com with ESMTPSA id
	s15sm14124873pfs.31.2015.11.24.22.54.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 24 Nov 2015 22:54:49 -0800 (PST)
From: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 12:24:39 +0530
Message-Id: <1448434479-29558-1-git-send-email-jkrishnanjanappa@mvista.com>
X-Mailer: git-send-email 1.9.1
Subject: [jethro][PATCH] license.bbclass: fix host contamination warnings for license files
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
X-List-Received-Date: Wed, 25 Nov 2015 06:54:51 -0000

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

Changing ownership of license files to root user under fakeroot environment
will solve above warnings, and on exiting fakeroot environment the license
files will continue to be owned by host user.

Signed-off-by: Jagadeesh Krishnanjanappa <jkrishnanjanappa@mvista.com>
---
 meta/classes/license.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/license.bbclass b/meta/classes/license.bbclass
index c616a20..d400ac0 100644
--- a/meta/classes/license.bbclass
+++ b/meta/classes/license.bbclass
@@ -185,6 +185,7 @@ def copy_license_files(lic_files_paths, destdir):
                 os.remove(dst)
             if os.access(src, os.W_OK) and (os.stat(src).st_dev == os.stat(destdir).st_dev):
                 os.link(src, dst)
+                os.chown(dst,os.getuid(),os.getgid())
             else:
                 shutil.copyfile(src, dst)
         except Exception as e:
-- 
1.9.1


