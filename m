Return-Path: <joaohf@gmail.com>
X-Greylist: delayed 1553 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 29 May 2014 03:19:50 UTC
Received: from mail-oa0-f54.google.com (unknown [209.85.219.54])
	by mail.openembedded.org (Postfix) with ESMTP id DBC116FB76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 03:19:50 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id j17so12169036oag.41
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 20:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=LbAaOKnk6Ctnr9XGuNA62neECEBc/CpGVN5Rnf5pxZc=;
	b=uBVk9knxpBt0E5oKHkp1aGkxrH9CgpYrnqv7SUFCIoteKoDkUbc79i+kKNZpTN1Spu
	SZucAqTQW2T5zdpz0mfm1FCsLrUxnjJ9UALcugD9NUagCDFIz0UlSRKMkjuihBQH4kLA
	rYxcsMeUbIwk7N0YzjLYvsW1Fxg1rj1mJLaDpCvhjsOQ7Vg4TEHyLmymfYct7GEzJLYf
	YlBLX4iN06w35lVTUoF4zwiMGryND4DHkMT92gl5OdhnFP/LxsbulhVLI7wkzsqEfqTX
	cDEFtjfNZXoA3+YSLWms7RltWdJyXY+AUNN7+RucI1EurZvYEvWmxpoG/wpcVDMIKSmS
	m6bg==
X-Received: by 10.60.231.134 with SMTP id tg6mr4501439oec.84.1401332044897;
	Wed, 28 May 2014 19:54:04 -0700 (PDT)
Received: from localhost.localdomain ([201.53.199.239])
	by mx.google.com with ESMTPSA id
	ux1sm37851395obc.28.2014.05.28.19.54.03 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 19:54:04 -0700 (PDT)
From: =?UTF-8?q?Jo=C3=A3o=20Henrique=20Ferreira=20de=20Freitas?=
	<joaohf@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 May 2014 23:53:51 -0300
Message-Id: <1401332031-23133-2-git-send-email-joaohf@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401332031-23133-1-git-send-email-joaohf@gmail.com>
References: <1401332031-23133-1-git-send-email-joaohf@gmail.com>
MIME-Version: 1.0
Cc: paul.eggleton@intel.com
Subject: [PATCH] combo-layer: fix revlist taking into account file_filter
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
X-List-Received-Date: Thu, 29 May 2014 03:19:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If file_filter is set, git format-patch takes account but git rev-list
does not. So revlist is going to get with wrong revisions. And last_revision
will be updated with wrong revision. The next time that user run
combo-layer it complain about applying patches.

So ensure that 'git rev-list' are using file_filter as 'git format-patch'.

Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
---
 scripts/combo-layer | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 9da1d3a..19d64e6 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -395,7 +395,7 @@ def action_update(conf, args):
         logger.debug("generated patch set:\n%s" % output)
         patchlist = output.splitlines()
 
-        rev_cmd = 'git rev-list --no-merges ' + rev_cmd_range
+        rev_cmd = "git rev-list --no-merges %s -- %s" % (rev_cmd_range, file_filter)
         revlist = runcmd(rev_cmd, ldir).splitlines()
 
         # Step 3: Call repo specific hook to adjust patch
-- 
1.9.1


