Return-Path: <ulfalizer@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id B490071957
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Oct 2016 02:47:41 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id b201so593366wmb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 19:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=5WsMKwCT1VuVZTUmXH9mpEJvx+7cj58imahYNWzrPtY=;
	b=mT6d6US6uUX+7Ol1cbFeLwcCHsVcadbCloulopEjXbUBEQrhGJxbl+Rg0MyZJxugBw
	NvApjI7A/cYJB4y4MqA0Iqlh9FW6zQ7ouG9nwzri4rZyDNv6OknMrRby5KcMpb+M7vR8
	pH/Cr7RQj1771UdMUdj2WH5VZd+9my1GmBcsmd/QPUxQyrpi5wbnz311nudlbhh75+RE
	vWd4Hqbt8YxcatWTFcV0ILE0nluaTWigkX+5xDycgr0Nck6qP+quKXSzbzeKgb4vRoYC
	c3MsYyte1HlVK1tTVEMf1v7Fk5B7cATdVUJ39Z+yVz2cR/fe8AOHf5PXnPmD4CekPNVF
	B/Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=5WsMKwCT1VuVZTUmXH9mpEJvx+7cj58imahYNWzrPtY=;
	b=bqpSmJOdZ5UiAatN8/NVIqt+f1uRNrfn3CzS3NdacPqHjoR5F/nLds6xOzL0cWzyCv
	WWlP8NmpsQLPnh6a+cHrfOI91UlDyjittikWls6wpX+KlL3XYwk61s0rDMGUmUJ5atWh
	7GDEM+Xecy4cTJdIAlfTCqdu9BS3tpOKYd45EUdGxwm+2SnSFu/ufPNPmU2qRMhLQFQW
	z/njiu2RZ0KS8bmOLoZwoY1lQmjzuOPRso29EdnK9/+pIhEMl9D3OdFpurwqdCWgS0Ma
	Bwu3HBaB+75vsZ0QJAFaxrBbnH9mHAxZ9tO9TmqK1fHPDEWUfgoGliLYvS9cncLMWN4M
	yVwg==
X-Gm-Message-State: AA6/9RmspBUJXTGrZWnFY6x5hGq00hY1RzsRd65+2MSkap4L+zZnbRpBS9gv/32e/Gs/Cw==
X-Received: by 10.28.23.18 with SMTP id 18mr458542wmx.100.1475290062437;
	Fri, 30 Sep 2016 19:47:42 -0700 (PDT)
Received: from huvuddator.home ([2a02:810d:1f40:230:2959:ccb4:be01:bff7])
	by smtp.gmail.com with ESMTPSA id
	s6sm22424897wjm.25.2016.09.30.19.47.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 30 Sep 2016 19:47:41 -0700 (PDT)
From: Ulf Magnusson <ulfalizer@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Oct 2016 04:46:53 +0200
Message-Id: <1475290031-20568-5-git-send-email-ulfalizer@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
References: <1475290031-20568-1-git-send-email-ulfalizer@gmail.com>
Subject: [PATCH 04/22] package_rpm.bbclass: Use bb.fatal() instead of raising FuncFailed
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
X-List-Received-Date: Sat, 01 Oct 2016 02:47:42 -0000

This sets a good example and avoids unnecessarily contributing to
perceived complexity and cargo culting.

Motivating quote below:

< kergoth> the *original* intent was for the function/task to error via
           whatever appropriate means, bb.fatal, whatever, and
           funcfailed was what you'd catch if you were calling
           exec_func/exec_task. that is, it's what those functions
           raise, not what metadata functions should be raising
< kergoth> it didn't end up being used that way
< kergoth> but there's really never a reason to raise it yourself

FuncFailed.__init__ takes a 'name' argument rather than a 'msg'
argument, which also shows that the original purpose got lost.

Signed-off-by: Ulf Magnusson <ulfalizer@gmail.com>
---
 meta/classes/package_rpm.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index f9398a9..c431545 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -58,7 +58,7 @@ def write_rpm_perfiledata(srcname, d):
     try:
         dependsfile = open(outdepends, 'w')
     except OSError:
-        raise bb.build.FuncFailed("unable to open spec file for writing.")
+        bb.fatal("unable to open spec file for writing")
 
     dump_filerdeps('RDEPENDS', dependsfile, d)
 
@@ -71,7 +71,7 @@ def write_rpm_perfiledata(srcname, d):
     try:
         providesfile = open(outprovides, 'w')
     except OSError:
-        raise bb.build.FuncFailed("unable to open spec file for writing.")
+        bb.fatal("unable to open spec file for writing")
 
     dump_filerdeps('RPROVIDES', providesfile, d)
 
@@ -617,7 +617,7 @@ python write_specfile () {
     try:
         specfile = open(outspecfile, 'w')
     except OSError:
-        raise bb.build.FuncFailed("unable to open spec file for writing.")
+        bb.fatal("unable to open spec file for writing")
 
     # RPMSPEC_PREAMBLE is a way to add arbitrary text to the top
     # of the generated spec file
-- 
2.7.4


