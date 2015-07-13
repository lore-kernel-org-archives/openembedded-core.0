Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 7E442739BE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 14:09:09 +0000 (UTC)
Received: by wicmz13 with SMTP id mz13so63014404wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jul 2015 07:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=Z28e073BBrsGkDbB2T9W+MqEWmTLFRjHxlfH8k8Akbg=;
	b=N6djuYCud3pJh0mzeIJW6nS6EvCRyajy/3ewXrTQK/qeEyjCGzI8+2O7t4lWrpTCxT
	RtJ8/g3vpM8SHx9LAkmGDgrDoTPJVvqDmHULYB29R2z6XDCVeOCkvOX3jjCT+jy8WIbe
	gQrpMf9mk2I0JfywDF8b2SxtxQ0TtTBac7Tz9z9n0fLWdOiSQfpw/WOuztV4VjCZ8BWA
	qgtEnro3qjkKdrD2RYynwNp5do3SxdkgcBiIgauCOZVO32jjU9DHlGsRyJstTpzSXuRA
	SQJhaJtvrpHJbFgODts6q6f2A/nsw8nQjAxaUdJ+63ZX7g5a8cxM6aKqliEeaxdjxQGk
	1/cA==
X-Gm-Message-State: ALoCoQnqzd3qdbaPXRcDkPGdSDUq3XAC8mA7mzSBlHHuCJyPj/jH5RBpFbTwgO/xibvjY/oYDM62
X-Received: by 10.180.10.200 with SMTP id k8mr23270187wib.14.1436796549195;
	Mon, 13 Jul 2015 07:09:09 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	f3sm14841438wiz.13.2015.07.13.07.09.07
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 13 Jul 2015 07:09:08 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jul 2015 15:03:04 +0100
Message-Id: <0263c62a7c1a31f2d974d1b5f635133b16d92d2d.1436795781.git.ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
In-Reply-To: <cover.1436795781.git.ross.burton@intel.com>
References: <cover.1436795781.git.ross.burton@intel.com>
Subject: [PATCH 6/7] libc-package: fix path assumption
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
X-List-Received-Date: Mon, 13 Jul 2015 14:09:09 -0000

Relying on exec_func() doing a mkdir and chdir if you set ${B} is obscure,
instead just pass -C <dir> to oe_runmake.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/libc-package.bbclass | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/libc-package.bbclass b/meta/classes/libc-package.bbclass
index 2076aa1..21c6b43 100644
--- a/meta/classes/libc-package.bbclass
+++ b/meta/classes/libc-package.bbclass
@@ -363,10 +363,9 @@ python package_do_split_gconvs () {
             m.write(cmd + ":\n")
             m.write("\t" + commands[cmd] + "\n\n")
         m.close()
-        d.setVar("B", os.path.dirname(makefile))
         d.setVar("EXTRA_OEMAKE", "${PARALLEL_MAKE}")
         bb.note("Executing binary locale generation makefile")
-        bb.build.exec_func("oe_runmake", d)
+        bb.build.exec_func("oe_runmake", d, [os.path.dirname(makefile),])
         bb.note("collecting binary locales from locale tree")
         bb.build.exec_func("do_collect_bins_from_locale_tree", d)
         do_split_packages(d, binary_locales_dir, file_regex='(.*)', \
-- 
2.1.4


