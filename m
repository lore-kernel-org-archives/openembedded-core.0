Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 1019772FAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:05:03 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v77so21088730wmv.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 10:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ke6Ao7LNtPEsZKCQagcMKEiLT7IQwdbr4p1vEx4/z1U=;
	b=nF5plyQA4KrZXO0xOUh4RS/yH1MMN+Nw5lre6M1nTSCnFZXtUoDgCbfGcgOmKAJxct
	clapHdUIBTMP2UpYKtvqwILtSzodiQqr/l66j9/CvNNpe3VIk029V4nOAQftjIdZ+h9j
	MsMHZiUt1uaYZXml8mrc01VJB1Wc+2C2DgciQCeIaj/+qEdSpCpSQPSxLx30Iho+cm4Q
	b5G6poMGx4UTbBZub2K5dZsu14yLpIgKDrgmUwYXQGhbakAWJuINZVyfvxM08c36DvZb
	skE3yewYhuaisfExDm/KnpaioIfzrsYWzV1U/t1y+5p7fz6Xs+N1PgNQCsuLbuJXGhC7
	Ak7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ke6Ao7LNtPEsZKCQagcMKEiLT7IQwdbr4p1vEx4/z1U=;
	b=nwelaleYVGAtayE/DhqZc+s6+37DIJjTvtoBzdq9+80ZOHp2kUXskBjB/uUs8xTFRf
	R6maz43HKyJ1csppp7hUm5E3Nv80yToYlPxjHWw5W1LRnUFukbEJywzNO1z4uXiZ8o4+
	8GyyM73hgKeDVPTuAbgtKnbNj9Xc8FdRcYR6L88SrGnug16nQ4e8NufHdvIn4/lsgvgo
	gceYRnxoV8eB9DNpvhAaKFHVZzRZW8S5XBJTO4plK7s95gENXnP9pYerFgsZSVlftxPK
	Ibwbp9hb8BU86heX4v/7UQKQ6tCSDXleBqiKTiRKS7hK2nsEdYhhMB41AhCjTlU2RkgI
	Ieig==
X-Gm-Message-State: AMke39mtSnjNskfAZiQpuJ6E4VKiA0fGcLp4P0C6WXa7GJCAXa1M7WpejOJXw+iKZsb60w==
X-Received: by 10.28.178.142 with SMTP id b136mr15927116wmf.69.1487700304310; 
	Tue, 21 Feb 2017 10:05:04 -0800 (PST)
Received: from localhost.localdomain ([62.179.106.250])
	by smtp.gmail.com with ESMTPSA id
	d75sm14290546wmd.25.2017.02.21.10.05.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Feb 2017 10:05:03 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 10:04:50 -0800
Message-Id: <1487700290-3110-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
References: <1487700290-3110-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2][morty] image_types.bbclass: fix image dependency chain collection
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
X-List-Received-Date: Tue, 21 Feb 2017 18:05:03 -0000

If image type "foo" depends on image type "bar.xz", then dependencies
should be collected from the base image type (ie "IMAGE_DEPENDS_bar")
not from "IMAGE_DEPENDS_bar.xz".

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8a9f249a9166347cc0468191ce130003e3d306e1)
---
 meta/classes/image_types.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 5020a5a..3bfa60b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -33,8 +33,8 @@ def imagetypes_getdepends(d):
 
         for typedepends in (d.getVar("IMAGE_TYPEDEP_%s" % basetype, True) or "").split():
             base, rest = split_types(typedepends)
+            adddep(d.getVar('IMAGE_DEPENDS_%s' % base, True) , deps)
             resttypes += rest
-            adddep(d.getVar('IMAGE_DEPENDS_%s' % typedepends, True) , deps)
 
         for ctype in resttypes:
             adddep(d.getVar("CONVERSION_DEPENDS_%s" % ctype, True), deps)
-- 
1.9.1


