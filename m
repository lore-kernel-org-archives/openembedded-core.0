Return-Path: <patrick.ohly@intel.com>
Received: from mail-pg0-f50.google.com (mail-pg0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id 6EF61781F7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 14:41:07 +0000 (UTC)
Received: by mail-pg0-f50.google.com with SMTP id 125so71052870pgi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jul 2017 07:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=i9RkB+WjHCpbRIRMlgLW8VPc0yTPNIh1Ykm+g1uc5WY=;
	b=cjCd4mSPKWJDNJ1Mwgzi2Y/dmwditvIHC8LyXjpIeGv/jAmfEBpG7LxLzOVf8h+NZd
	whYBYgcg9NjRq1mJT/RxPm+9Y3mMTcpnPBrgh95JxU+OaHzB1cUoZUVE/vGhd1EyFNTP
	RXD5usGBovGeVYJF20+2MpP4O3NZ3Ro4Xu8ucAS4EjU7MFw2o6NUGnZ737rWbYY8Kg/h
	MngtveIU8002xYklJ24GCcFy0X1HiJIpmTr22xc5dMRYbAqTn4/s1x9hSr+U99j1tcf+
	slv95CHiZaPl4fkX/ocXWxmMg6lAMqC39JScoBRVGo6nNodT2kKJ/nkLwZUhpbBqp0l3
	QWTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=i9RkB+WjHCpbRIRMlgLW8VPc0yTPNIh1Ykm+g1uc5WY=;
	b=r5DFcM6wFL5Ai99poBrgvXTeaBFpCAvD6FCq+jzolbNzcuUEWpyxX/sw5bK6uK8BaZ
	DAJbE3Aj5OrtFL/6HDNVgdWRRjzWEEEisyoK1mFf2UTzfG3yZPtTKm4C+AtQ4olue+Ub
	n9AZR9l6iehXZ6ywlS1JRjdiIOIDXyTamfH5FA1B2OHxmoZ+AlTsAU8t41K5kCX3YnsV
	GVK0Ai/3ewr2/+9Ph0VKvxapJCDjfvjXHFy3KZLXCBtkBtnU3fYwBkvBVBUhGp8NDIE9
	vIMI+cg8FuhLvqZ9QU8qrDQe9OuvoyyK5+Wx+TW3XC7esAuci74OLLgIUZq7HNo6ofz9
	9PCQ==
X-Gm-Message-State: AIVw112eSs5XHXOmt2FzV4oTIZvxVYEqN/juEahGyPqZD6vUqVAR0Pet
	n4mKGr66VtDQsDuA56k=
X-Received: by 10.84.132.46 with SMTP id 43mr21505949ple.409.1500993669200;
	Tue, 25 Jul 2017 07:41:09 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FE5D.dip0.t-ipconnect.de.
	[93.232.254.93]) by smtp.gmail.com with ESMTPSA id
	o13sm25181650pgr.40.2017.07.25.07.41.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 Jul 2017 07:41:08 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Jul 2017 16:40:59 +0200
Message-Id: <43bc5c63ee1c2bb8eb95107d43214ff2a598482f.1500993567.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] gettext.bbclass: also search for files in target sysroot
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
X-List-Received-Date: Tue, 25 Jul 2017 14:41:08 -0000

fwupd contains polkit policy files that it translates using polkit.its
and polkit.loc files that the next polkit release is going to
install (see https://github.com/hughsie/fwupd/issues/107).

In order to make that work with OE-core, the gettext tools must be
told to look also for files in the recipe-sysroot. Otherwise it only
uses the GETTEXTDATADIR set by the gettext-native tool wrappers, and
that only points to the files provided by gettext-native itself.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/classes/gettext.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/gettext.bbclass b/meta/classes/gettext.bbclass
index d60a0c1..689ef55 100644
--- a/meta/classes/gettext.bbclass
+++ b/meta/classes/gettext.bbclass
@@ -17,3 +17,8 @@ DEPENDS_GETTEXT ??= "virtual/gettext gettext-native"
 
 BASEDEPENDS_append = " ${@gettext_dependencies(d)}"
 EXTRA_OECONF_append = " ${@gettext_oeconf(d)}"
+
+# Without this, msgfmt from gettext-native will not find ITS files
+# provided by target recipes (for example, polkit.its).
+GETTEXTDATADIRS_append_class-target = ":${STAGING_DATADIR}/gettext"
+export GETTEXTDATADIRS

base-commit: d3a41fbd94462efc8c6f1b55f6fb54001b447c45
-- 
git-series 0.9.1

