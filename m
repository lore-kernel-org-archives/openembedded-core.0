Return-Path: <arun@gumstix.com>
Received: from mail-pa0-f41.google.com (mail-pa0-f41.google.com
	[209.85.220.41])
	by mail.openembedded.org (Postfix) with ESMTP id 2D04F6E2C3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 11 Apr 2015 01:17:21 +0000 (UTC)
Received: by pabtp1 with SMTP id tp1so37674781pab.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Apr 2015 18:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gumstix.com; s=google;
	h=from:to:subject:date:message-id;
	bh=OWtxrcielAXpPg0POmtpDas9OW7a6yOzLNYEfoPvLOs=;
	b=FIBlOmZ9VZlCHNL/9ZyP85opSxUixehPG9fJLOV6sr+2Q8L4IuFAy5kcXaOC/x7Uy2
	GVXupIHYANxybtzxhaBuzA/uZQtGGAjmtHutKTI10IUMit8fxRoKQ8Nd6YvkTdhimgxD
	eKdDTyM1vym1ETwJVSN78nVr3XfLAfqOtL5/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OWtxrcielAXpPg0POmtpDas9OW7a6yOzLNYEfoPvLOs=;
	b=UCOn0uRKhhhUf3YxkjX/qBJ6bp0IHTR1+xWO2J3LBQsGtGub2uHh1aQhdeBuL4kXY5
	ZDNG4ZerHMU+K1HOlNthXdV8OEQ8rju3mA168a6S7XKSa2iR9Y7A0ghX/ydYwriXTd6e
	OBFwi3STnWAd/0NFczhK6qqGXXXjm/HME9ZpIHzG2ojZ0TW4dcz6z9Qt9zsGwsDhMSyF
	3Wo5Bhkc19AVFEeIGfBGW3iK8PTPMev41Ydr+Xghr6qpMkcBsxSTSUow4Hs/WaSDqM18
	lUS4kJ/vMhLfAOEaei4FljFX5iY0Lr+S0Vqj7aGCi8pejiFVXBKeY4z5GPtQ0LF6pSIT
	bz8g==
X-Gm-Message-State: ALoCoQmUIYyYUOlqUPKSRtJhYwI0Cga4pjHoF3RYuqESYPz1hSkDB3Y+huEx6xhxsZjQQpjNkVnU
X-Received: by 10.68.102.228 with SMTP id fr4mr7024295pbb.87.1428715042974;
	Fri, 10 Apr 2015 18:17:22 -0700 (PDT)
Received: from localhost.localdomain (s206-116-3-180.bc.hsia.telus.net.
	[206.116.3.180])
	by mx.google.com with ESMTPSA id p5sm276065pdi.2.2015.04.10.18.17.22
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 10 Apr 2015 18:17:22 -0700 (PDT)
From: Arun Bharadwaj <arun@gumstix.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Apr 2015 18:17:19 -0700
Message-Id: <1428715039-4209-1-git-send-email-arun@gumstix.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] Do not always checkout master branch in the kernel repository
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
X-List-Received-Date: Sat, 11 Apr 2015 01:17:23 -0000

It seems like we are checking if a particular branch exists and
then we still go ahead and set the machine_branch as master.
This doesn't seem correct to me as it would work only for
repositories which contain a branch called "master" but would
fail in other cases.
---
 meta/classes/kernel-yocto.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index f42a5c2..410a6e8 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -211,7 +211,7 @@ do_kernel_checkout() {
 	# Create a working tree copy of the kernel by checking out a branch
 	machine_branch="${@ get_machine_branch(d, "${KBRANCH}" )}"
 	git show-ref --quiet --verify -- "refs/heads/${machine_branch}"
-	if [ $? -eq 0 ]; then
+	if [ $? -ne 0 ]; then
 		machine_branch="master"
 	fi
 
-- 
1.9.1


