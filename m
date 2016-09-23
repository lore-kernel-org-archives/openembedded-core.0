Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f51.google.com (mail-it0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 26E306022E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 13:23:31 +0000 (UTC)
Received: by mail-it0-f51.google.com with SMTP id n143so14997654ita.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Sep 2016 06:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=dfbxk6Y0j2FemFbf2R0W6NdQEPh9MFtmkrypG9aFFsM=;
	b=Yh/4CS/A2Qt12vJ07X0U1Sg3IvS6/lzwcu2YUIaM8wKMZub2MEB1EWR0rce7b6OFWO
	ZRWQDqjS6qFsPtAsD71N8Uyn/svOsmWMEcumU9TiVDSCgaaVefsqWw98KnvLFhGngJ3k
	Oe/UoYaAetuStueqRqWxfR04nrSy9m9RppsFYN9r4fMpGFuo8W+Q04O2JY1dGNcT334F
	kg7cH0JCFmxN4AAOxaCWrxp/LBbIr5b9+qqTg4TwYb4Dl/75ZBBaMVe6TEFVDQhi2uon
	oTBq+xWsLf02xP9bGMu25Ha64UO4EM7s2lmAtf0nIHECxPMIeu+gJm5TpL8aUfOWjTAR
	x3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dfbxk6Y0j2FemFbf2R0W6NdQEPh9MFtmkrypG9aFFsM=;
	b=JSMsKPMyMO3q5QePjkKgkEzUvch8CNGdg54NeR5JEGWu7nAGjmSOmQJf3uTF1WIjuN
	mh5aeZAc+8wjV/BXWdJY0FG5gq/K/3IBo6gezEbLCRBelDMz2lyS3Cmy2PMOx2jotE1E
	nttF3rdYHcqbRvX32U0dQASwFM0uPFKpQYZu5WVJNzNZ+6tCvKuSdO/xJNPY1amSNG+u
	R3l3jl+/QzH4iWOPzFfpLpi4hndegs8raEVX8hfdEAtxr3MIwpdmKA6tG0zO5HRiiWZq
	1mH3B+F9L5Mo6uSVr13qyKTuourtPeC1qoaU4SfphJgC55kipabd3SdILn0oRWwM1C4d
	npdQ==
X-Gm-Message-State: AA6/9Rmx/UygxrpcJ3OoK4Wh20YTWR0xqU1nZMC07NsRbLGbZ+3gO1sU3gFOVsnfYtUZZ+Se
X-Received: by 10.36.73.19 with SMTP id z19mr3560775ita.36.1474637013132;
	Fri, 23 Sep 2016 06:23:33 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p57A56298.dip0.t-ipconnect.de.
	[87.165.98.152]) by smtp.gmail.com with ESMTPSA id
	m127sm2817993ioe.32.2016.09.23.06.23.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 23 Sep 2016 06:23:30 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Sep 2016 15:23:20 +0200
Message-Id: <1474637000-22802-1-git-send-email-patrick.ohly@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] openssl.inc: avoid random ptest failures
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
X-List-Received-Date: Fri, 23 Sep 2016 13:23:32 -0000

"make alltests" is sensitive to the timestamps of the installed
files. Depending on the order in which cp copies files, .o and/or
executables may end up with time stamps older than the source files.
Running tests then triggers recompilation attempts, which typically
will fail because dev tools and files are not installed.

"cp -a" is not enough because the files also have to be newer than
the installed header files. Setting the file time stamps to
the current time explicitly after copying solves the problem because
do_install_ptest_base is guaranteed to run after do_install.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index f83664c..a632d8a 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -215,6 +215,19 @@ do_install_ptest () {
 	mkdir -p ${D}${PTEST_PATH}/util
 	install util/opensslwrap.sh    ${D}${PTEST_PATH}/util
 	install util/shlib_wrap.sh     ${D}${PTEST_PATH}/util
+	# Time stamps are relevant for "make alltests", otherwise
+	# make may try to recompile binaries. Not only must the
+	# binary files be newer than the sources, they also must
+	# be more recent than the header files in /usr/include.
+	#
+	# Using "cp -a" is not sufficient, because do_install
+	# does not preserve the original time stamps.
+	#
+	# So instead of using the original file stamps, we set
+	# the current time for all files. Binaries will get
+	# modified again later when stripping them, but that's okay.
+	touch ${D}${PTEST_PATH}
+	find ${D}${PTEST_PATH} -type f -print0 | xargs --verbose -0 touch -r ${D}${PTEST_PATH}
 }
 
 do_install_append_class-native() {
-- 
2.1.4


