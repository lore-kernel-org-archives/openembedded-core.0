Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30E06744F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 07:33:00 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id o123-v6so1181237lfe.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 00:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5xWT6inER5VkC8aQCZ8DUn1nMyJVh+bUSwLv+6z8xgo=;
	b=NNZvFw64XeOcuOnPFAxFS6wPW32iBVaNF1xOaxCs7HqzeKsbQEkk+PzwWZakERWg9I
	obl59FDiMSWLHRmndo697pCePvusJ2ZNKG6+dIpSS26hxXrAvxsFDX793EB6H5i9Iy9c
	HF16nKcEIUPl+VzFhxCy/gWnh/1yJirsT4/ydrVYxGLDKqY/zrkzYje2PnoCGfAMC2VS
	ZXl9oTIwTLAAuNopqv1gZDKJTimuc64bOXRiwCMFjPqwzzgbKltxPiFIV8NgiQ0Aymtw
	7s0Knn/pKniky+1bfgLYX6TUXo0a/uQa30+pvApnUEECurIaEDGLpI1Z9R5DcVK9EPDT
	l6/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5xWT6inER5VkC8aQCZ8DUn1nMyJVh+bUSwLv+6z8xgo=;
	b=ATPigD4Z3h72JqOdzzZL7d6uv0J6w4TjjdfdHptezz4XecPnDVVGiPT1s+JjPKjJxc
	39slaB0eihwzewIgUGztyyN5pA0cXi30qb/yoCAV/31MvBWsuEOWCa5rUnNv9CzSQ22z
	VNJqm2jq+2vjaS+YoIDcNkKeYQ4RaTHe2j0lXJ7He0o9K8DkChjfzm64NTR3VAwToVdq
	3weA2Q34YjHue3HLjKMVtZUOZAO64iNtxk47edXHrs6kJTNZ29TQRDAboOePZuwGklO2
	9Lr0CkRS/NvWpYHGgA41nj7cDNep1mFs+cVS6ovLakec+Nj/g0uen8HGAWcvJkHmciaW
	8HFA==
X-Gm-Message-State: ALQs6tCkCkjy9aJgzGsh42UEd8syAz2Yq2SBWCnNMEWOcSy7cIN0AC9n
	Oono7lboG/rvI8/LRq2ypaZcL/0X
X-Google-Smtp-Source: AB8JxZorWH4dQwPf0k2r3fEBoCy6v0XsTEdoaUpMDwyyangopGspgRMzfywG3gjB8B4NGPG9PYFCAw==
X-Received: by 2002:a19:1b81:: with SMTP id
	b123-v6mr1726275lfb.64.1524209581125; 
	Fri, 20 Apr 2018 00:33:01 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	(m77-218-253-67.cust.tele2.se. [77.218.253.67])
	by smtp.gmail.com with ESMTPSA id n76sm952494lja.31.2018.04.20.00.32.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Apr 2018 00:33:00 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:32:56 +0200
Message-Id: <1524209576-10344-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <liu.ming50@gmail.com>
Subject: [PATCH] image_types_wic: add do_image_wic before do_image_complete
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
X-List-Received-Date: Fri, 20 Apr 2018 07:33:01 -0000

From: Ming Liu <liu.ming50@gmail.com>

We have some tasks depending on image's do_image_complete task, and we
are also using WKS files to generate partitioned images, but now there
is lacking a inter dependency between do_image_wic and
do_image_complete, so we have to depend on both of them.

Fixed by adding the dependency.

Signed-off-by: Ming Liu <liu.ming50@gmail.com>
---
 meta/classes/image_types_wic.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
index dcf620c..5b40a9e 100644
--- a/meta/classes/image_types_wic.bbclass
+++ b/meta/classes/image_types_wic.bbclass
@@ -102,6 +102,7 @@ python () {
                 # a variable and let the metadata deal with the deps.
                 d.setVar('_WKS_TEMPLATE', body)
                 bb.build.addtask('do_write_wks_template', 'do_image_wic', None, d)
+        bb.build.addtask('do_image_wic', 'do_image_complete', None, d)
 }
 
 #
-- 
2.7.4


