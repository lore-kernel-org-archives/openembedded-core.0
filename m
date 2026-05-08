Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21E82CD37B2
	for <webhook@archiver.kernel.org>; Fri,  8 May 2026 07:12:29 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8231.1778224341302204890
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 May 2026 00:12:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QA1AKnsw;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44c4cc7c1cfso1342517f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 00:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1778224339; x=1778829139; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uUpVITxsVx+yFU9OHe9YXS/dXKWyqjIcXCOipi64QVs=;
        b=QA1AKnswVbkSFtG81slSo7qsOruoW4y1KP0WDXK/GhP7y9Qoa84N4g7WGtdOiRRXDW
         ZQ5GBXDgdfnfHGRFZKFpixo/jcd34ETM9XbH4sFeg0lVQp+cS7ebi9FMoRF0XYXfBqZo
         49JZkE0wVoqTJrTO76B9LFWYxlvxldwk5V+8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778224339; x=1778829139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uUpVITxsVx+yFU9OHe9YXS/dXKWyqjIcXCOipi64QVs=;
        b=nFtDLHnJrE+fD1HwwuPo5ni21l7rqg4ur+vXCCOZ5tVRer0vgBAfeRVVr/rybN1b7/
         mv4zPCj0tVrhcWLsauSnoIePd2PeeyzsWlbggiHWE1ULYorNOxHA/A1u2hEpohPUmRl3
         dS+NFU0i/ePbObHcMj+LaggKi2pKGsOuB+0HdFa7QIozqt0Er4jGvdxWLj2cOYc+xrWn
         ioiZ507Kpv/n1Vpf3BMUfQsEzbKw0sex3V14H++w8ynR2HpXZJU6m5StEZ6yIBzGwe/G
         VK7XUh0TNs+tCgyBUyic2/5dQyRRJn7PjZwP5yKvB7V3bf4Xy2SAXcrcbXGLBnW8Apq6
         9wcg==
X-Gm-Message-State: AOJu0Yyq+xbrv62ps18bVRc2xYXtqWhd3lIY0SFIM29vgfQa94ZbA7rk
	gRPl+6s/gO85LeNb7zmvKpdEgtBvvIRRvD4psUKlE5D6xkpR/ZajSVBOStgTltcqLW5DLJYjL0n
	mg5GzZW0=
X-Gm-Gg: Acq92OGhA09LRIkH4Su+6w8VuAskAKz1OBZ9F30fahOur17LuMbcc793qz5fKJSQK1N
	4vSulC8ms7oNoTk0gZXM7gd0r+/i5SzygIy4N/TeAiSDs7HDKJ1/4BIgkVdsPWxYLDv4Q3PW1Jb
	Ss18StxJnwacQpiBXMVpmmNRhfMi1SEtWVp7MvYncYVcvH4ZA2C3E2q0ybnPovgswxbnuDBdyf4
	0UX+7mCbiM85Q98qQwrfStdP28a7h/5ljnfTnH4JQAt9DbNGNiifpX/tJsD2/MoQFMLh4GcNBOu
	X3RDt8cl79wnZsLheC1T/aKRUQWGNHFI8HUqUaB4ngmy6oTnkaDlfgB/0bOHFVyAh1KNgYuDHuE
	Rmm2XXgIwDx6JQnkWPTOVZ7z16loMRSQd17N583yr7ucx+pZqe4nGvIyw2Y+H5G/QPBXL+52tuN
	OFJiZL6k/lhn6uRwIK1xC6qjD8BWSExh+wGtRmdZqMHnzu20Az58DukRbDW4paQpxq6rRrme5Th
	ZU38Qr/+s14pX//FIHtCFGyJvo=
X-Received: by 2002:a05:6000:26c9:b0:44b:d88e:7ceb with SMTP id ffacd0b85a97d-4515d3dc4e0mr17980405f8f.32.1778224339392;
        Fri, 08 May 2026 00:12:19 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4548ec6be40sm2415545f8f.12.2026.05.08.00.12.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 00:12:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 14/52] git: set status of 5 CVEs
Date: Fri,  8 May 2026 09:11:07 +0200
Message-ID: <2b29078c8794250118b5b30576baa74f69ec77ad.1778198557.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1778198557.git.yoann.congal@smile.fr>
References: <cover.1778198557.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 May 2026 07:12:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236656

From: Peter Marko <peter.marko@siemens.com>

It is unclear why entries in cvelistV5 cause these CVEs to appear in CVE
reports.
There is one which should also not be shown per listed CPEs, however it
does not have a patch, so it's not added to the list - CVE-2024-52005.
The others are set to fixed with version based on which .0 release
included patch mentioned in Debian security tracker for respective CVE.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 139e4e6f17da181eee029c81ea17b847e9cc559e)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-devtools/git/git_2.53.0.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/git/git_2.53.0.bb b/meta/recipes-devtools/git/git_2.53.0.bb
index 5fe1767e285..8d71905f419 100644
--- a/meta/recipes-devtools/git/git_2.53.0.bb
+++ b/meta/recipes-devtools/git/git_2.53.0.bb
@@ -171,3 +171,9 @@ EXTRA_OECONF += "ac_cv_snprintf_returns_bogus=no \
 EXTRA_OEMAKE += "NO_GETTEXT=1"
 
 SRC_URI[tarball.sha256sum] = "429dc0f5fe5f14109930cdbbb588c5d6ef5b8528910f0d738040744bebdc6275"
+
+CVE_STATUS[CVE-2024-32002] = "fixed-version: fixed since v2.46.0"
+CVE_STATUS[CVE-2024-50349] = "fixed-version: fixed since v2.49.0"
+CVE_STATUS[CVE-2024-52006] = "fixed-version: fixed since v2.49.0"
+CVE_STATUS[CVE-2025-48385] = "fixed-version: fixed since v2.51.0"
+CVE_STATUS[CVE-2025-48386] = "fixed-version: fixed since v2.51.0"

