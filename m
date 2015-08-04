Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f181.google.com (mail-ig0-f181.google.com
	[209.85.213.181])
	by mail.openembedded.org (Postfix) with ESMTP id 85B1A7649D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Aug 2015 16:24:10 +0000 (UTC)
Received: by igbpg9 with SMTP id pg9so96532672igb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 09:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=rcAvj29Psgw7Fe2or2jupEacTLqBvGFdju7ha65Fkv0=;
	b=mzYHD35sT2D0yzw+eEfcv1AGLSsikzza7aRL6Rjx6xLaWBAB/ssz8N0Um++2Uxst9s
	uuqJYNZ8gKjXqYRuXhEGxQOUrBMjkyL6QX/RQ0JTdm7iBmUh3tR0WqEWULAjWswQOdtI
	avA2VGs9pHPddu12H4yfWSseuZl0JXK2N9RbrVGCqlaUYTr5ZoYY6oNxX5v0WYyDHLuj
	Fktk9xhW4LUcldkhOk8otn1d2j7gKUfm1kF53a32rdkQZUmlj8qVPZ5zcQdQHnhItJLQ
	MeP6ou452SlIqQkwtGZoJxVwMdFDmDFTh1W5VoAGHR+NIvTh6MNV8uUqL2P2GyBsB0+c
	pD7A==
X-Gm-Message-State: ALoCoQluAnWNolRildZb1QaxbIw8l0M6/sYkBTmAWi5wiZqWeDAXxb/T/mudf7l8TDKDe6HGCdrV
X-Received: by 10.50.114.9 with SMTP id jc9mr101688igb.56.1438705450513;
	Tue, 04 Aug 2015 09:24:10 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p5DE8CA2B.dip0.t-ipconnect.de.
	[93.232.202.43]) by smtp.gmail.com with ESMTPSA id
	ii1sm1400785igb.10.2015.08.04.09.24.09
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 04 Aug 2015 09:24:09 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Aug 2015 18:23:59 +0200
Message-Id: <6f3b3a9f3d73902d14ea10142dbee67ba6f26270.1438705086.git.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438705086.git.patrick.ohly@intel.com>
References: <cover.1438705086.git.patrick.ohly@intel.com>
In-Reply-To: <cover.1438705086.git.patrick.ohly@intel.com>
References: <cover.1438705086.git.patrick.ohly@intel.com>
Subject: [PATCH 1/2] combo-layer: enhance output in action_pull
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
X-List-Received-Date: Tue, 04 Aug 2015 16:24:12 -0000

The git operations can fail, for example when the branch is unknown
or misconfigured.

Better move the info message and extend it such that it is printed
first and provides the necessary context, because otherwise the
CalledProcessError exception gets dumped without mentioning for which
component it occurred.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 70dad83..7380f5b 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -585,8 +585,8 @@ def action_pull(conf, args):
         repo = conf.repos[name]
         ldir = repo['local_repo_dir']
         branch = repo.get('branch', "master")
+        logger.info("update branch %s of component repo %s in %s ..." % (branch, name, ldir))
         runcmd("git checkout %s" % branch, ldir)
-        logger.info("update component repo %s in %s ..." % (name, ldir))
         if not conf.hard_reset:
             output=runcmd("git pull --ff-only", ldir)
             logger.info(output)
-- 
2.1.4


