Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f41.google.com (mail-pb0-f41.google.com
	[209.85.160.41])
	by mail.openembedded.org (Postfix) with ESMTP id 6B2316BBC3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 17:16:00 +0000 (UTC)
Received: by mail-pb0-f41.google.com with SMTP id rp2so5130817pbb.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 10:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=+jU/PX9GUFizbPtnT5hwke75uYJLY/zZ0AEf8dUuND8=;
	b=r+/BCGdVS02d2jXwm+/hUKdKjoke6Y0um8iNCp5LWOD1WaDVJFFexukHiRLs+UXql1
	Eo4gF8LJnq5Rf/6wg0L9h0TUuHDTZHWFz5hOyMi6Coy+BJwWtys8aEPP6ndcLAcKd/Kp
	tsFoJmSgYnTevDpVvcgmSKPnzDUR7j6UGK0bYeGKgKBWK7lgnwdhJSOFHACddHk+5G7F
	/6HXc+Yw6osgJjLT8BwGtipeM5WXNDhEp6vH2seBDhYioJBjSaNDwwT5+DBZLH1ysWYb
	tRA3KzOlQFMdIKd9XfD7lzi2tfC2Ip07D/Y+A/F/lW+c6iENqDwOeqFZwQKZ7AZNfsRE
	Z1HA==
X-Received: by 10.68.202.130 with SMTP id ki2mr22822020pbc.43.1377623761405;
	Tue, 27 Aug 2013 10:16:01 -0700 (PDT)
Received: from isis.gateway.2wire.net
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPSA id t9sm25769021pba.46.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 10:16:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 10:15:03 -0700
Message-Id: <621ba27fe578346e2feae489fba4d576148299fc.1377623208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.4
In-Reply-To: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
References: <569ad1cd7395edbd376600e8c05708a9cefd9262.1377623208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1377623208.git.raj.khem@gmail.com>
References: <cover.1377623208.git.raj.khem@gmail.com>
Subject: [PATCH 04/20] package_rpm.bbclass:Make the regexp less greedy
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
X-List-Received-Date: Tue, 27 Aug 2013 17:16:00 -0000

This causes issues when postinstalls have ERROR keywords
its interpreted as error and image build is cancelled

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/package_rpm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index b29d3ed..a9ec9b2 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -60,7 +60,7 @@ rpm_log_check() {
 	lf_txt="`cat $lf_path`"
 	for keyword_die in "unpacking of archive failed" "Cannot find package" "exit 1" ERR Fail
 	do
-		if (echo "$lf_txt" | grep -v log_check | grep "$keyword_die") >/dev/null 2>&1
+		if (echo "$lf_txt" | grep -v log_check | grep "\<$keyword_die\>") >/dev/null 2>&1
 		then
 			echo "log_check: There were error messages in the logfile"
 			printf "log_check: Matched keyword: [$keyword_die]\n\n"
-- 
1.8.3.4


