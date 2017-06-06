Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f178.google.com (mail-wr0-f178.google.com
	[209.85.128.178])
	by mail.openembedded.org (Postfix) with ESMTP id 0A51E77E40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Jun 2017 15:03:17 +0000 (UTC)
Received: by mail-wr0-f178.google.com with SMTP id v111so48919207wrc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 Jun 2017 08:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=Q3j3NdNOHpmCVoBrTlJdfvyw4FFq0S3W9FWlEFEQs9o=;
	b=1dKe5IKGrHo21MZ0cy4MtFaSM3z3fbUe8ZH7RQUEJeP9EPRD0kP6b0iWrgklgKRT9H
	bt4NB1B6GLbWpPJtBB0TjwezaEmKDWoeCJLKQoPUemYzr8h2q+eE8cuWsTzUenwGZykp
	wjMNeb35Zn4XDXFkHjAgox3pD+3YJhEVEW4BHSMVXUOoGJBkwl8PV79BUzelyTxibWgg
	rrPbZ+NCZH2JoFLIBdHdX/uia0OL6P/bQbLh1r3N3JyDcNVgpnD8aPYBMl1xEdrCWYBM
	+BXyx43YYRYclO8CXm6RKqE7q1WlL14W3/XC3TyBT1gomaz20am/oiBwbLx55Xs15q58
	TRXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Q3j3NdNOHpmCVoBrTlJdfvyw4FFq0S3W9FWlEFEQs9o=;
	b=Fzt23WyZ0JrIAv5NLtMTvHpr3v0CdwHyxilTA6cGXNvF/f8VqcNNHV5TZyaVYKh6Rj
	C9jENVrmIh+1+SK0JgusUta07CkM21eSRMkEjuEqRNydkG1V5BNZzDUmWkOeBGIriAYX
	Byu0hVVaXBm7gpN3EbGKeOfGRSJ0THgPbf1DDUbbSc0FFurx1v+QnLc6bgrU2MmQAzjD
	lSR1zvXuaW79gjYW8VgWKfLKajOPiHxuXgbyxczfwK5NqxRzVHvVPOXzi8GAYH6MuFxu
	78EsfLr9XldU9oxa/8Lg3RGqg5bHey/XtHUl55JFVMlCitgkaeWrs6QeV+tF/U85pIUA
	9Dmw==
X-Gm-Message-State: AODbwcB47PJY6DNvnQy+B/wsXwbQdnKmmdO8hLTQlAHJfObKr9dTDngg
	hYH2vDSuwvipEv67hgc=
X-Received: by 10.223.138.188 with SMTP id y57mr17944700wry.93.1496761398227; 
	Tue, 06 Jun 2017 08:03:18 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id f3sm27305015wrf.2.2017.06.06.08.03.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 06 Jun 2017 08:03:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Jun 2017 16:03:15 +0100
Message-Id: <1496761395-4499-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH] archiver: preserve sysroot paths in configured mode
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
X-List-Received-Date: Tue, 06 Jun 2017 15:03:18 -0000

do_ar_configured alters WORKDIR but also expects to be able to run do_configure,
so forcibly expand the paths to the sysroots as otherwise they'll point to a
non-existant directory in the temporary WORKDIR.

[ YOCTO #11584 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/archiver.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 82f0b16..18c5b96 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -222,6 +222,10 @@ python do_ar_patched() {
 python do_ar_configured() {
     import shutil
 
+    # Forcibly expand the sysroot paths as we're about to change WORKDIR
+    d.setVar('RECIPE_SYSROOT', d.getVar('RECIPE_SYSROOT'))
+    d.setVar('RECIPE_SYSROOT_NATIVE', d.getVar('RECIPE_SYSROOT_NATIVE'))
+
     ar_outdir = d.getVar('ARCHIVER_OUTDIR')
     if d.getVarFlag('ARCHIVER_MODE', 'src') == 'configured':
         bb.note('Archiving the configured source...')
-- 
2.8.1


