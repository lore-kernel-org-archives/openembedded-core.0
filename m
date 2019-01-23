Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED8A460402
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 16:17:51 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id d15so2589854wmb.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 08:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=S99H7hi0/OJwgI5U92E59M1+vco6poAziOfCvRoJYe4=;
	b=sX75LDaDgZfayU6mEyzrp2bsMG4yBxw2zoRl7YvIfkmue55bKaPYT0OER9vfEAskUA
	3YCmZMFtKziV30z81aU/URKe7fGNfXMLvYmQra8/qSUeYK5XqDzOLL3Moq5VwKyORqMf
	CqDU22PvXqgE5H6ehqkcbFshoPd8iwDyCS+kd6dlPuYKPnhETL31VJiE/u086vbYm30J
	5eXaTY3MuwZ0shyAENl3yI2swYmbeX/PCjPFTbLtWUL6/aoxQ506dmD7Xkx0fVsBlCZ9
	IcISaLH5J7dhPfP0gaPdkosQnCe6i0Pt6qI+NUtRY3Cq7+hK1R3Ra0WMTiKxGJsSPcPC
	CROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=S99H7hi0/OJwgI5U92E59M1+vco6poAziOfCvRoJYe4=;
	b=oNQ5N+2iJ3Obc+5fsHTkKAdGLmP3klIC88+ktaQZlF2XvxtgEzcp2fPdFPXLYRProR
	qJ1rvKyT32afGEunHUcIcljncj1rgHYUArO5wysQG730B9ThXxBUWQY94KDygidu3wl3
	re9UqOLHCitXUH/SpZz0OfhLPs81ORD/2B9ESyOPBPAmHJ06j0UBjj4JlJ9zagmAQajG
	L1v16ImT+H8+k1quY2MOSvg74jPH9KbvjSx0QnP/B9Bew7igBnHmBLWNpmnIu+cef+NM
	e9J7n2IKdfsI4N0PzZ5vEIcejcu9P4qINxQnfJnb4pLEyUnROFHBf+6iG64hHbnSr4V2
	BFNw==
X-Gm-Message-State: AJcUukeq5KQlKaTq+4MK4TiuBTWSe+olM2zc9lBowoG+Sun8rbR4VxdE
	q+bPvda7YkOYHc2Vo97sjnCas04D
X-Google-Smtp-Source: ALg8bN62ylmC8h+RJnuFHlHyoCeATHtZhULBVM52kNt31RF12pxbyX7br+b++mFUFj7W7KNbYFtLzQ==
X-Received: by 2002:a1c:7eca:: with SMTP id z193mr3198185wmc.5.1548260272353; 
	Wed, 23 Jan 2019 08:17:52 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm161192189wre.91.2019.01.23.08.17.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jan 2019 08:17:51 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jan 2019 17:17:35 +0100
Message-Id: <20190123161744.45763-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH 01/10] sstate.bbclass: make sure changes to SSTATE_SCAN_FILES are not ignored
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
X-List-Received-Date: Wed, 23 Jan 2019 16:17:52 -0000

When changing the SSTATE_SCAN_FILES variable in a recipe it doesn't cause a rebuild,
so if there's a sstate-cache available with "bad" sstate data in it that will still
be used even though the recipe is updated to address this.

[YOCTO #13144]

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/classes/sstate.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
index 2f0bbd2d7df..6f51d9c1879 100644
--- a/meta/classes/sstate.bbclass
+++ b/meta/classes/sstate.bbclass
@@ -62,6 +62,7 @@ SSTATE_ARCHS = " \
 SSTATE_MANMACH ?= "${SSTATE_PKGARCH}"
 
 SSTATECREATEFUNCS = "sstate_hardcode_path"
+SSTATECREATEFUNCS[vardeps] = "SSTATE_SCAN_FILES"
 SSTATEPOSTCREATEFUNCS = ""
 SSTATEPREINSTFUNCS = ""
 SSTATEPOSTUNPACKFUNCS = "sstate_hardcode_path_unpack"
-- 
2.17.1


