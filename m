Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29100D30CEE
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 23:36:06 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.73238.1768347357486177460
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Jan 2026 15:35:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KjT++0tR;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-47ee0291921so6662055e9.3
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1768347355; x=1768952155; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=QO3yeGkqNKgtnl7ExuF9ZDTza+Z0JSrLgD628dWU/Wg=;
        b=KjT++0tRq9WlyqzAnhcQ2fi6ZAbS6MzQ97v6C59hvlTp+ZZ/lvGfz8U3mvjY1OytSR
         qYF8OaqMUCgCSykwP2LJopcSGsX0eMidaCTCYPmfQBBfzLYV6RzwII24qDR8kCFrcIzF
         coSBqRpPSMPVA6E04iS8P6c/Lz3O1pE1hTeYo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768347355; x=1768952155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QO3yeGkqNKgtnl7ExuF9ZDTza+Z0JSrLgD628dWU/Wg=;
        b=fhaGbAj+Y7dCb0yQ4dgLJZdHWi6/lbz161mH0m6BzrzQL+JPfaAWrfBvTWpf3qdihM
         3R5sixguOOpy1qWXUs7sFO5NiRpH3CiP5aYUzMRt81Apz4rhxm3mfXVMIp5s55bIYi64
         9tLYGTvrkLSI8pmwnYXPWhdgkH4wCl78jYOWPVA7ZVOXQxYmVUGMkPAFrjcAI43clPP5
         e6cPGfWssNSvTvDewJNIrc75w7B2xs+vtGpZ1NcTHVO2uO1cKc8NwzziNbEGD4twNXGg
         ztq++lsLqVi6qcpyr5a2+rG5ZYpQd+auNdbMXWXm5U/m7tdWjKq2hX1i9WkD/NR/edyW
         5cyQ==
X-Gm-Message-State: AOJu0Yw0j6hHJC6Zc1zhr+2VU6HBgQ2hqnfiTkCKPZlwohONUdwTyRGw
	NRDnfZLa4W+c2x40WBXu+AZMt/c1cKfs6AttTORS0jtVO50xO73BhsUF0BDLG6113NeylObs0zk
	35y1kygE=
X-Gm-Gg: AY/fxX5lUpHk0dCj8YR4T3VmkDrAE/ARiXgyC3aL7lSX50zH7DvCO3RjUAa/F6Q2MLj
	K0Mel0dh3tAQhuxixTl7eSVdlortjN84S4zTrppuIR6GaCgFMwC4s8a/4+6gask7Xf/s9jEIIft
	mBowhNaAoU5SwljZb/+d98cPyeC8JwAfwQpqBAOJCS9EUW10k9iHcYf/iVO/NMRIq/baqwuDxE9
	VzvJN8eSBgHG5Gt1IlIUfPu8DwgBZzhSJ6jR6xkXUoiKmDWV4lfC/CgzPjrRo8Jksqk1LgqCuOS
	PcsI7trurZT6v6+xGaYyK8aHs/t+OqElbu4kKEgjsaSQP6SNqXpkiUQcr/EvAfdEPsYYihtbf97
	UIM+M3oUHdHYMlaMLIZGrcpFEd4oBGW506Znmp0nTxZXpbKsO7vakpIJUBnqXUY3htNAZYiL9sl
	oCu/kdAcgRgDYbiZzm6MDsLMKaH11lYPb/WmTIZA==
X-Received: by 2002:a05:600c:4e55:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47ee33948c6mr8997465e9.19.1768347355265;
        Tue, 13 Jan 2026 15:35:55 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:143:ebd4:ccef:c4b7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47ee27dffcdsm8188955e9.6.2026.01.13.15.35.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 15:35:54 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] Reapply "glibc: Enable NFS local file locking for glibc tests"
Date: Tue, 13 Jan 2026 23:35:53 +0000
Message-ID: <20260113233553.2709617-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Jan 2026 23:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229296

This reverts commit 0ed4776533145c901611d7f4f942490e33481335.

The change was not causing the glibc test hangs.
---
 meta/lib/oeqa/selftest/cases/glibc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/glibc.py b/meta/lib/oeqa/selftest/cases/glibc.py
index 15ba5a83525..b2b115972ff 100644
--- a/meta/lib/oeqa/selftest/cases/glibc.py
+++ b/meta/lib/oeqa/selftest/cases/glibc.py
@@ -79,7 +79,7 @@ class GlibcSelfTestBase(OESelftestTestCase, OEPTestResultTestCase):
             # setup nfs mount
             if qemu.run("mkdir -p \"{0}\"".format(tmpdir))[0] != 0:
                 raise Exception("Failed to setup NFS mount directory on target")
-            mountcmd = "mount -o noac,nfsvers=3,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
+            mountcmd = "mount -o noac,nfsvers=3,local_lock=all,port={0},mountport={1} \"{2}:{3}\" \"{3}\"".format(nfsport, mountport, qemu.server_ip, tmpdir)
             status, output = qemu.run(mountcmd)
             if status != 0:
                 raise Exception("Failed to setup NFS mount on target ({})".format(repr(output)))

