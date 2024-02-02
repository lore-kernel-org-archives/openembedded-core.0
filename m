Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 512CDC4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 18:57:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.540.1706900263464081396
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 10:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Z3uvlvPq;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-55fe4534e9bso1700065a12.0
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 10:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706900262; x=1707505062; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/xUR3Tac+xHH56dnFiVCic8ZlvEz+tWEWvwjxttfVU=;
        b=Z3uvlvPqYGqk/AGpRhTtsSOAHmbBT9ujmYgapFnVQpMjHAX6wRJtMgojxdPXbPVrZ/
         U4pdcsqJyCalWlVKzK9UcaBkNCYLruLqpS8Mb/IvIJz1CJmHncD2s0YobbXI2vVxUhPn
         YTcw1rnotkYxl77zKcTTurliINU/IbOC0EerZu9mSv2aRQPotgWbXddgojw9nRho4UiS
         keFCLJ0SxsFGRdjBOVykp4PiEqKPFbFr6zc8equzFHEqH1kCNgxdp8aLhDHVHe3rm20S
         MK3Jr5Aqb4KRQr2NyvJHpdtAP2P5HZ/O+hS0IENooCsWIWJY0dm+Nb5Qm+s2M4MsDjP8
         fkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706900262; x=1707505062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/xUR3Tac+xHH56dnFiVCic8ZlvEz+tWEWvwjxttfVU=;
        b=tOMm2UtC9qVJLq2pbT03rFWlQOauUa4CvjmEI9C/6A23IYR+MV9Evo7hm7N2rrJLaj
         j6h3Gm3sm6M+Bt/Yomd1WL0f6504FJymOcAHW19IIA9nwkUd4gDQTIRRKcRvq7wDBX91
         8tLd1R9JoZwGQVOVa2QB1G75vWf/TdOHW6h1prUkrZNxNTzyruSBTco3H1+hCsSEK4lj
         1QGHQ/4l5CTUPcdPBPRR6kEBb8MeoF2MYFnEk1TTLIB3STDOdF4HO1riOSg+GeojJgOd
         OZxByqthP+XXzMISfCRDfDN9JNUXet8KdbZUTG7DAlHlnM1kOF+oFCS/TDro0BQUo3hv
         CDAg==
X-Gm-Message-State: AOJu0YzzmS2p/xH0mqIPb1ju8G43JTarZmTVjAVL2pYKR7IprPW6TDPa
	i/uJ3xI/5N5ORwhgKHRmCIb0b00Pt0DIvGVwQBW4N26e2aKaw4mY1rX5FrU6
X-Google-Smtp-Source: AGHT+IEzyq7IwMdQauLJpSJZadhzQbBf/vqgV96elE7hTJvyEneDwiCN2gc9o8WB5YOpcle6pSN7hw==
X-Received: by 2002:a05:6402:7cc:b0:560:5fc:4c9e with SMTP id u12-20020a05640207cc00b0056005fc4c9emr325987edy.41.1706900261710;
        Fri, 02 Feb 2024 10:57:41 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id l15-20020a056402124f00b0055f0de1166csm1038695edw.26.2024.02.02.10.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 10:57:41 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCHv2 2/2] package_rpm: add RPMBUILD_EXTRA_PARAMS variable
Date: Fri,  2 Feb 2024 19:57:34 +0100
Message-ID: <20240202185734.3209021-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240202185734.3209021-1-martin.jansa@gmail.com>
References: <20240202185734.3209021-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 18:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194814

* e.g. for DISTROs which define extra user-defined fields with
  PACKAGE_ADD_METADATA/PACKAGE_ADD_METADATA_RPM
  as undefined fields in packagedata are fatal error for rpmbuild:
  "error: line 9: Unknown tag: Author: Unspecified"
  as shown in:
  http://errors.yoctoproject.org/Errors/Details/751706/
  with "Author" field added with:

  PACKAGE_CLASSES = "package_rpm"
  PACKAGE_ADD_AUTHOR_METADATA = "test-author"
  PACKAGE_ADD_METADATA = "Author: ${PACKAGE_ADD_AUTHOR_METADATA}"

  to fix rpm build you can use:
  RPMBUILD_EXTRA_PARAMS = " --define '_Author Author'"
  keep in mind that this doesn't cause this Author field to be
  added in .rpm, it just avoids the BUILDSPEC failure.

  and for ipk build:
  OPKG_MAKE_INDEX_EXTRA_PARAMS = "-f"

  alternatively you can avoid additional packagedata fields ending
  in the package manager (if you use them only with buildhistory
  or packagedata) with:
  PACKAGE_ADD_METADATA_RPM = ""
  PACKAGE_ADD_METADATA_IPK = ""
  PACKAGE_ADD_METADATA_DEP = ""

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
v2: fix build when RPMBUILD_EXTRA_PARAMS isn't set

 meta/classes-global/package_rpm.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes-global/package_rpm.bbclass b/meta/classes-global/package_rpm.bbclass
index 819ee50278..5c346447e8 100644
--- a/meta/classes-global/package_rpm.bbclass
+++ b/meta/classes-global/package_rpm.bbclass
@@ -683,6 +683,7 @@ python do_package_rpm () {
     # Setup the rpmbuild arguments...
     rpmbuild = d.getVar('RPMBUILD')
     rpmbuild_compmode = d.getVar('RPMBUILD_COMPMODE')
+    rpmbuild_extra_params = d.getVar('RPMBUILD_EXTRA_PARAMS') or ""
 
     # Too many places in dnf stack assume that arch-independent packages are "noarch".
     # Let's not fight against this.
@@ -724,6 +725,7 @@ python do_package_rpm () {
     cmd = cmd + " --define '_use_weak_usergroup_deps 1'"
     cmd = cmd + " --define '_passwd_path " + "/completely/bogus/path" + "'"
     cmd = cmd + " --define '_group_path " + "/completely/bogus/path" + "'"
+    cmd = cmd + rpmbuild_extra_params
     if d.getVarFlag('ARCHIVER_MODE', 'srpm') == '1' and bb.data.inherits_class('archiver', d):
         cmd = cmd + " --define '_sourcedir " + d.getVar('ARCHIVER_OUTDIR') + "'"
         cmdsrpm = cmd + " --define '_srcrpmdir " + d.getVar('ARCHIVER_RPMOUTDIR') + "'"
-- 
2.43.0


