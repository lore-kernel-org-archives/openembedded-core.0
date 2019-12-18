Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 98FF77FA27
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 14:38:15 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d139so4796877wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 06:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nt2WcZ8rK+zNGLhOpJ7X8y6kdEFj+aWLW0gXh5GZ3PQ=;
	b=uUXiHVbzaBcYAYSJ2daTcCkf6L4GnQFV/LynKmnG+LrTC7f+gB/FZoZR9FHBXrwOvT
	pwJwm49J+FOjajfXpwADrayhoP2MGRqr2UMxGnfnbZ7YX8/H1U7kjcR+8xY6uCeM+mRG
	1do0yfFBGz2qaheqNLnJtdchGIy50Dl8K5v5B9CRo9GMZkkJgeIIQEE5qSfAQtLwKaf0
	yrcRFQslC3zmAWQ9aXyf2GIJtWCsP54Djdh6OpbZAvbJCavvg1hc9gRSdw7pLSG+/taf
	p+HeOm3+Lv2oIMqv410ZJEVFgIVX1xRkItEUhF/pl4FniMQCUhYz1b2MiQt4gbh9V2ME
	ZSjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nt2WcZ8rK+zNGLhOpJ7X8y6kdEFj+aWLW0gXh5GZ3PQ=;
	b=EK24sYWc7p0fEUBv7keb7Gfz32Gk/QPkBCwZVxjKgmYRCX8VeePvEgMyZ7Q5Ad4LGw
	V2chQ3xu3WgSVp0HSjaDkG8Mx09QvnI6cCSRxY2gmTaOM0ARnypO4Aw+h3VQ05O+qBm2
	fUSJfCD6T/LP9K8Baq6KZHlN9VNw+2Lruvgw2lZuZgdlYYKHbxhwCMoKGu8F7xjtDYLs
	Jm/s/Npr7TwhYteJf0+amKBHbgxhteg6f7DObFu+RkllNBh0g3uqB8bc+ie+NrTTDQoK
	Pd8vPdolwH6QGnGgcN/05So+8gk2bzMqndoGcO3XTaeWisXZEU0dtfQyXhtlhw5KTfP8
	J/SA==
X-Gm-Message-State: APjAAAWTO0vabGx9pm8ihPqQePBPCwlj9WEPrYNnxXUXl4T+aSCke2GJ
	J9i4aNn0uacrdCkVIxfzYTDQwKYhYSg=
X-Google-Smtp-Source: APXvYqzXLRYexjXuWKW/cBy2frGS9lWbG8dnUAQfhsKYNRWT/VaJw4TU7sMK76iOje6KV3u5G7yGmg==
X-Received: by 2002:a1c:960c:: with SMTP id y12mr841464wmd.9.1576679896069;
	Wed, 18 Dec 2019 06:38:16 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	d10sm2747313wrw.64.2019.12.18.06.38.15
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Dec 2019 06:38:15 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 15:37:47 +0100
Message-Id: <20191218143758.129308-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191218143758.129308-1-alex.kanavin@gmail.com>
References: <20191218143758.129308-1-alex.kanavin@gmail.com>
Subject: [PATCH 14/25] recipeutils: set SRCPV for devupstream variant
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
X-List-Received-Date: Wed, 18 Dec 2019 14:38:15 -0000

Otherwise bitbake is unable to expand it if the main
variant is not using a SCM fetcher.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/lib/oe/recipeutils.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 630ae967af4..f53c2b71267 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -421,6 +421,8 @@ def copy_recipe_files(d, tgt_dir, whole_dir=False, download=True, all_variants=F
             # Ensure we handle class-target if we're dealing with one of the variants
             variants.append('target')
             for variant in variants:
+                if variant.startswith("devupstream"):
+                    localdata.setVar('SRCPV', 'git')
                 localdata.setVar('CLASSOVERRIDE', 'class-%s' % variant)
                 fetch_urls(localdata)
 
-- 
2.17.1


