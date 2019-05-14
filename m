Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id A6A627DF03
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 May 2019 04:54:13 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id t187so7926587pgb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 May 2019 21:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=oWbnlQ+MD8VzDhdVUS0jbKWbOG3hDeMshik4kk0kajM=;
	b=FYES8TmxkHFTJLRL0i5LRR/daGzWopG9AAqUP5Ns1loCalLYUXlrfx+kbJJL70rP9M
	SAO1StcGTBzHtAnJGgv0t1mwSDPw1Iircx+efhCI6fk+/WGFFbRfkqO44OdHueUZvSUq
	Xpx/DL0Ktx4TvyfIezUn6JA2ADzPmEMt2VtiBbXsKRVspK9+PTZOEhDlDw9GqCv4d3BO
	t5l79czKtvBQZLcI+9taZ+y5aU/SUmcBZOV1rfOQwtrsbTJT7tmRPjr2julHc6MG3VfZ
	dX/33/rvtbcFC9DYAPqI7LUY0xHpj5aq7scvjAoUQfKUjKOBpt+SYzDallhAiaKP8Wtq
	vgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=oWbnlQ+MD8VzDhdVUS0jbKWbOG3hDeMshik4kk0kajM=;
	b=FleK4HWxxa/Nwqq598QixEqYO+M3AYjgMzHaIUG2f4rovEl6YYIJv8A8r/qoNWJO6C
	suGHAXfpck7IxoeptM7sopszR/M/nON2Q4MNvRkpNF72hC2dcKSActsgsnT29RHo3N0H
	61YBdAYzVofdoro53Omt6+5aWgIO6tQ6AGklvQD7kPU3Q3dMcdpo0Nt0y0vYsbff/uKf
	4wJVinTpSHyQCVKUIC0IlEIek2LSybDR2S+wMOhCZyYvJgSzioMrKgLGZhILRvIMGjpS
	3tNbiGnEAZqdihMtEcmDzreI/kOm5XwhpPhcwNSwXl35GX2PD+AaI2JVQeyJe2Dvl8ZU
	/2Yw==
X-Gm-Message-State: APjAAAU7JwZ6isQNPgO7NWTK+qPePwbYOhFYSXAK9BvWyBASZmKmyQ23
	5hZdmP6YiGcHaWjohTHsww7NxUHh
X-Google-Smtp-Source: APXvYqzurdFF0NrKgTEzATN4XiHA0hHSEisCpVxLbMDySFQaC5GlpRSnDo49eX9hpKJdvkFyt8QufA==
X-Received: by 2002:a63:a08:: with SMTP id 8mr35492830pgk.46.1557809654741;
	Mon, 13 May 2019 21:54:14 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d909:eb3d:d2ab:fd1d])
	by smtp.gmail.com with ESMTPSA id
	q75sm5698451pfa.175.2019.05.13.21.54.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 May 2019 21:54:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 May 2019 21:53:48 -0700
Message-Id: <6d86d126121cd15c7e9832b24106332ab439beeb.1557809500.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1557809500.git.akuster808@gmail.com>
References: <cover.1557809500.git.akuster808@gmail.com>
Subject: [PATCH 06/23] wic: change expand behaviour to match docs
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
X-List-Received-Date: Tue, 14 May 2019 04:54:14 -0000

From: Ross Burton <ross.burton@intel.com>

The documentation says that --expand takes a comma-separated list of
partition:size pairs, but the code was splitting on hyphens.

Hyphens are not a transitional separator for a list of items, so change the code
to reflect the documentation.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/wic | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/wic b/scripts/wic
index b4b7212..a3c0f73 100755
--- a/scripts/wic
+++ b/scripts/wic
@@ -426,7 +426,7 @@ def expandtype(rules):
     if rules == 'auto':
         return {}
     result = {}
-    for rule in rules.split('-'):
+    for rule in rules.split(','):
         try:
             part, size = rule.split(':')
         except ValueError:
-- 
2.7.4


