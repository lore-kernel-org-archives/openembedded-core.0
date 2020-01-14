Return-Path: <tuomas.salokanto@gmail.com>
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by mail.openembedded.org (Postfix) with ESMTP id E8DD17D27B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 10:49:22 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id 15so9463883lfr.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 02:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wiKDL4eNLrQvPIWhc7LQyU4LQkp6zcvltZSpVCFcFPU=;
	b=VKmQWvGEah+jDa8oXMFiu/CGK+IPDgFxWiukhmnUYFgpfaiRdNrRFdkdSSS5DJwrc6
	NlbKsGMbsbSoILSy5RD5aupAQwsMaG7GQqIuxO5cj1TZfxDUP1BLF2p8tLKNC1yD/BgH
	Iy8uCrgvEGEPAH2sk0aJKHYmiZfr8Sg8OYVUYyOuR7PBgnpFzEBqiBrYZ+nA1/Up4hty
	kXa/q7vaTgvY6r+80fhKkge/yATZjMSkQwJ2sKGGrfBGWXJdIraSnkVhBlZpiXIm0haW
	+PlVz70N6Zo4KIMrs8hD3e5IO3RBxzYm/GPSdX790/S2fIyUgk8GYkjo2IV337TXkvCD
	GhEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wiKDL4eNLrQvPIWhc7LQyU4LQkp6zcvltZSpVCFcFPU=;
	b=QG4JIrNzDJgiiOf5LRjFiP0MShXaYJ9/MfPUxeP8Zcb1HYyplW08xNdE2I55KgQqDd
	TB+wqWSxKlZDdfjw04Lm43p5cGim1Lr8GSrJm2zDqLNrlCiWZbEQG2Je7nVXZzgbQorB
	87x9br9i3UK9ZU/xLmgzUukxGLiBiTkzL8y6dIertzxU/VrxqcqysMHd8pgbs2O0PU7Q
	GpbcdMBQMk7+PRrn39up6L4nFZKA2wchubFXTdBNxDofI9q8FeDzN0wV7wxgpr1VR3rq
	w4ZTxEWKpjgQSvAZrPsObk7r9EawhN1I+GGfCr7CTSbgfP1LkMyrDDLKPZ1L4rkoEmhl
	1NbA==
X-Gm-Message-State: APjAAAW2HN5c1Yi5FCg2B5As3UkuGYp6MN1fHRQktZb7aQ+vg/bdcExE
	qaO+R8wI2IU/e/zDoLJs9MCpM7Wrels=
X-Google-Smtp-Source: APXvYqwOXYf+tqVsbr2VQlNrbr/4zTTnMAfjpJUuD5WhbhCk8/2Dg6hQ4G0TlvsUVvfjFq2MonmoOQ==
X-Received: by 2002:ac2:5635:: with SMTP id b21mr1270189lff.127.1578998963050; 
	Tue, 14 Jan 2020 02:49:23 -0800 (PST)
Received: from L-HHAFI-59034.emea.hitachi.net ([62.236.216.29])
	by smtp.gmail.com with ESMTPSA id
	p15sm6981360lfo.88.2020.01.14.02.49.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jan 2020 02:49:22 -0800 (PST)
From: Tuomas Salokanto <tuomas.salokanto@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 12:49:17 +0200
Message-Id: <20200114104917.243-1-tuomas.salokanto@gmail.com>
X-Mailer: git-send-email 2.24.0.windows.2
MIME-Version: 1.0
Subject: [PATCH] recipetool: create: fix SRCBRANCH not being passed to params
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
X-List-Received-Date: Tue, 14 Jan 2020 10:49:23 -0000
Content-Transfer-Encoding: 8bit

When explicitly passing a branch using --srcbranch in 'devtool add' or
'recipetool create', the branch name is not included in the params of
bb.fetch2.encodeurl and default 'master' branch is used instead.

Signed-off-by: Tuomas Salokanto <tuomas.salokanto@gmail.com>
---
 scripts/lib/recipetool/create.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/lib/recipetool/create.py b/scripts/lib/recipetool/create.py
index 4c4bbadb4c..cc0b4f0e53 100644
--- a/scripts/lib/recipetool/create.py
+++ b/scripts/lib/recipetool/create.py
@@ -460,6 +460,7 @@ def create_recipe(args):
                 logger.error('branch= parameter and -B/--srcbranch option cannot both be specified - use one or the other')
                 sys.exit(1)
             srcbranch = args.srcbranch
+            params['branch'] = srcbranch
         nobranch = params.get('nobranch')
         if nobranch and srcbranch:
             logger.error('nobranch= cannot be used if you specify a branch')
-- 
2.24.0.windows.2


