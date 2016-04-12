Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0D7B3607A4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 17:04:25 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id v188so135279221wme.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 10:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=PwFardp1J8r9Ef3yz/4KGh0mA4RFl/I7PHSI0j8phoU=;
	b=S1lLQyfzkRDaV02EByzKEsOlkIlH8HvIIHOoKwnQuzm1gbscFcGjVTFvU/8s5vrDOq
	pha37m2YxqLLaC8sY/kiGjyHcIpK/6gtMUjbnJJeK7I7UJ2S9emHdP83GiN/CbJRIzTg
	5IrAHVTuhmRh7F3FHpDIintNG5B5Tv4XjhRZjYFimOj6JOeuza1D9GHvSqAYQkVaFa77
	xl+Aq+IFdlro2LLrUggkep7Pn9cB5pPy1X2Qp37LmJuqoob+ySxyQSivhehW9djRKblI
	Vn3pYNv921Cu3Ib9m1WUoohJneqMnmCFEwkf4MDooJQNuewDaXHyVdPbKqke1Iybhp1S
	jdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=PwFardp1J8r9Ef3yz/4KGh0mA4RFl/I7PHSI0j8phoU=;
	b=QZ9Mtmdsxdp3Ut0/uvMC+UherrtIc11lmD7xGhdpwpckcl5AH4ahdjOBGwpdZnPEuW
	LdzrV+ORShLTYDzfXz1c+4lA9BZmDk1OeRxhTwmJqHG+wjSylRqoIYWoRgqKg8aTG4F6
	YmfDY2d9678qMYtQIcgoEhXPrf6oBJRxmx/k4aSpijrxlTUAe1FmR/w4MYA4K5pcIU1I
	xtODHFP7rxgTaSCjiHCRhVGA2FlrBf3csqEpayTifMpaf3MecWpmXlWEMXcfYiw2NKI4
	JI6l4GXpZDPx8eWolrX48JqAGRr3nf0OQC6UcTeaBwWrDI5gUNbM1vpzu49v6zjzXVSB
	bvFg==
X-Gm-Message-State: AOPr4FXzL2Uhra+sH6/npv9tiyQR2eyy4cneDVxRrFds5mKdxt/Qau+a9woxXO+GQ7e1v3rY
X-Received: by 10.28.6.140 with SMTP id 134mr5597722wmg.23.1460480665481;
	Tue, 12 Apr 2016 10:04:25 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	w186sm23794020wmd.20.2016.04.12.10.04.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 12 Apr 2016 10:04:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 18:04:22 +0100
Message-Id: <1460480662-14280-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.8.0.rc3
Subject: [PATCH] lib/oe/lsb: sanitise the distro identifier
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
X-List-Received-Date: Tue, 12 Apr 2016 17:04:27 -0000

The distribution identifier is often used to create filenames, so it needs to be
safe to use as a filename.  Whilst most distributions have e.g. Fedora or Debian
as their name, it is possible that the name contains special characters.

To ensure this doesn't cause a problem strip out any non-alphanumerics from the
distribution name before returning it.

[ YOCTO #9443 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oe/lsb.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/lsb.py b/meta/lib/oe/lsb.py
index ddfe71b..e0bdfba 100644
--- a/meta/lib/oe/lsb.py
+++ b/meta/lib/oe/lsb.py
@@ -62,6 +62,8 @@ def distro_identifier(adjust_hook=None):
     """Return a distro identifier string based upon lsb_release -ri,
        with optional adjustment via a hook"""
 
+    import re
+
     lsb_data = release_dict()
     if lsb_data:
         distro_id, release = lsb_data['Distributor ID'], lsb_data['Release']
@@ -76,6 +78,9 @@ def distro_identifier(adjust_hook=None):
         distro_id, release = adjust_hook(distro_id, release)
     if not distro_id:
         return "Unknown"
+    # Filter out any non-alphanumerics
+    distro_id = re.sub(r'\W', '', distro_id)
+
     if release:
         id_str = '{0}-{1}'.format(distro_id, release)
     else:
-- 
2.8.0.rc3


