Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f175.google.com (mail-pd0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 629E972DE0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:02 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so5964148pdb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ROgoMpCwdUWX4qRmhxIAkceo0c9Skuiq7S6ezR3vRhk=;
	b=zubOwg0Qt1uinnj22vHkfHcwrZCLHyQa6ZztKN+NIVKpL8XYSSalizT0JqvhDfXoVp
	kSE/csznNGX0tF05dIz6sYuGE4r0Y7f4sSdVnxkep+Pi2+CerLGolF7j3119+BiErhg9
	jT20SOAdHXTRMokAh8yqLPKYGIXVNebR+pc8Cw9aNQEMCTR+IGMT2K8PIvXAMFij1eHP
	AbqvppWCNEhZ8hrrz4UH3PfNzMXveE48h8J01S0PUZF7t4qGU9G1QwmwbWjgVsGAhFcw
	Xrzq0ZvKITbVTOWiuq9QYmG1+bOzIXcgoayj7jVNPzAtJDMu840RB5Md/nUdJTPoxvGG
	Keeg==
X-Received: by 10.66.156.229 with SMTP id wh5mr6581446pab.119.1423152303931;
	Thu, 05 Feb 2015 08:05:03 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:02 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:33 -0800
Message-Id: <c75e13fd450190aeb53d0298a42e3a0c3b29bd87.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Subject: [PATCH 25/61] socat: forcibly disable use of libbsd
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:03 -0000

From: Ross Burton <ross.burton@intel.com>

Socat will look for openpty() in BSD headers before Linux headers, so if libbsd
is present at configure time then that will be used.  We don't need to depend on
libbsd though, and leaving it floating can cause build errors, so tell configure
that the libbsd header isn't present.

(From OE-Core rev: 7defa2bb5b28ea69f749363a607a114cfa4ba4ed)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-connectivity/socat/socat_1.7.2.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
index efa3b91..44d7220 100644
--- a/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
+++ b/meta/recipes-connectivity/socat/socat_1.7.2.4.bb
@@ -26,6 +26,7 @@ EXTRA_AUTORECONF += "--exclude=autoheader"
 EXTRA_OECONF += "ac_cv_have_z_modifier=yes sc_cv_sys_crdly_shift=9 \
         sc_cv_sys_tabdly_shift=11 sc_cv_sys_csize_shift=4 \
         ac_cv_ispeed_offset=13 \
+        ac_cv_header_bsd_libutil_h=no \
 "
 
 PACKAGECONFIG ??= "tcp-wrappers"
-- 
1.9.1


