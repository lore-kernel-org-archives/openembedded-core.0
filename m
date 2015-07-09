Return-Path: <patrick.ohly@intel.com>
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1757D6017E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jul 2015 08:35:35 +0000 (UTC)
Received: by iggp10 with SMTP id p10so9136456igg.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jul 2015 01:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=obu+PATy/YX10mMLS0ddfufDZbENrmg+g3g49/LAEbg=;
	b=nNT1hKdXWwB9/UmiN2QpflOWS8cUKqyUIr7kl7FuOfzccGJWBGVYTTEZWcPT16N3Zc
	iXi9e/OuH5x3BtkBx+1l2x2GBYrqvet2c8tgPhk/W4VZ60Fy8wd4bMmVOH1mOoj8idke
	Jb2X54hh+R1KUHSJTgC2f7Rhm48uS9J5+nuHcvtSHxcaj93heMj6DqoJYz0YWgB541h8
	imUO/qAU2yWB3chqq47UwCwAjAnQsuWztF5xcBczGAHsd8YtDQeuujZkFyoQMpI9eXrK
	FHit6pWc+vLRJp0QU2aphxwZrStb3riW43LSsSqo/P1rxVliucvUJBQNUQ0pjoZyMa6k
	5aQQ==
X-Gm-Message-State: ALoCoQnG6ROpNb6v2p3GktwTBCcwJOkA8G/UGbn21KfoiICOJOBBzUrNRvtIIlWG9cc/ijofzPlc
X-Received: by 10.107.168.150 with SMTP id e22mr25306623ioj.9.1436430935584;
	Thu, 09 Jul 2015 01:35:35 -0700 (PDT)
Received: from pohly-mobl1.ger.corp.intel.com (p57A56742.dip0.t-ipconnect.de.
	[87.165.103.66]) by smtp.gmail.com with ESMTPSA id
	z6sm16131006ign.13.2015.07.09.01.35.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 09 Jul 2015 01:35:34 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jul 2015 10:35:26 +0200
Message-Id: <1436430926-15641-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] archiver.bbclass: add do_deploy_all_archives
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
X-List-Received-Date: Thu, 09 Jul 2015 08:35:36 -0000

When working specifically on source archiving, it is useful
to trigger that for all recipes required by something like an
image recipe, without actually having to build that.

"bitbake -c deploy_all_archives <target>" does that now.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/archiver.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 7b5274d..d908d16 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -374,3 +374,10 @@ addtask do_ar_configured after do_unpack_and_patch
 addtask do_dumpdata
 addtask do_ar_recipe
 addtask do_deploy_archives before do_build
+
+addtask do_deploy_all_archives after do_deploy_archives
+do_deploy_all_archives[recrdeptask] = "do_deploy_archives"
+do_deploy_all_archives[recideptask] = "do_${BB_DEFAULT_TASK}"
+do_deploy_all_archives() {
+        :
+}
-- 
2.1.4


