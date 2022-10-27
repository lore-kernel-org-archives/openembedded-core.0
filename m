Return-Path: <yanxk.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D690AFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 07:59:39 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web11.6700.1667203174574921765
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 00:59:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com header.s=170520fj header.b=d5UlyXTk;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: yanxk.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1667203172; i=@fujitsu.com;
	bh=eFsVhAjNO4wg35Nm/V554nowh30klBWPum7Cfguox90=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=d5UlyXTkUdN/XrP0V7b6UjomrSNd4Waiw/Z4kTT3haptxs9Q2fL61OsmxOyTAmO08
	 FtEt7zdzXZnZDnpf8sffZggCL42C6T2ueWqgha52HEX1MBSvp4cBsSY/LGFKxvhitL
	 4VFgwBopYefHHLtAMvzJzJfBGgV9lZXy7Y4J7XBGm6spaHfGJKouFJ1/Jl9z2TIwh2
	 PP9U7fEWugJwCJ00TtD//7XW6S45XgwyIyecH38lMXZj2K1PbkmjorsztMt3AP+4dS
	 eAK/pDtcE3adBQzQBMInfiYOggcjSc1eBFfaBH4NqQihiqrdnNa+cX0R9W8FxEEqKK
	 XKGggRSLKtBaw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRWlGSWpSXmKPExsViZ8ORpJvSEJ9
  ssPUQn8Wdn+/YHRg9zm1cwRjAGMWamZeUX5HAmrFt8Sq2gtniFa3PP7E2MD4W7mLk4hASeMAo
  cbPhCDOEc5lJYuvpv6wQzl5GiZOX5wFlODnYBOQkFj+eCpTg4BAR0JO4+k8UJMws4CnRNW8mC
  4gtLKAtcWzjMzYQm0VAVeLh7p1gcV4BN4lFny+BjZEAGrNj9RMmiLigxMmZT1gg5mhKtG7/zQ
  5hy0s0b50NVa8kcefXZUYIu0Ji1qw2JghbTeLquU3MExgFZiEZNQvJqFlIRi1gZF7FaFqcWlS
  WWqRrpJdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcApRJLC/WSy0u1iuuzE3OSdHLSy3ZxAgM3ZRi
  he87GLuX/tE7xCjJwaQkyutdHJ8sxJeUn1KZkVicEV9UmpNafIhRhoNDSYJXsRYoJ1iUmp5ak
  ZaZA4wjmLQEB4+SCG9JNVCat7ggMbc4Mx0idYrRnuPuwr17mTk+3zsAJD/+uQgkp87+t59ZiC
  UvPy9VSpy3tRSoTQCkLaM0D24oLO4vMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmdQNZzpO
  ZVwK3+xXQWUxAZ7G1x4GcVZKIkJJqYFqWXJbsG+2po/654VdY5LaTxS6/LPdMcPlUUtAbbOT9
  epNLupzqKrnjl6z4Dr1hmbBlqn5oh9LG83YJR45cZbYrzbq7WmNq195nwRdPbpqfpdsb5X+FV
  +Cxk7fx3Jtlbk0BVzac/HXYccaUtR5Xpjx+dk9cyuVN8cyeSeuO207Tc5pe2nHzWU/i7hWGa1
  hWr317YWtMx3FJx3lLtvPukcyQCbrobHxY6cybyfdnL08pvvf+RVnDu5zd8YviRV6W/D1+8Pv
  29vKv+muEr7BFzBONfj/hqYhMpKxMgfj2qutGIVbcC9RPTe+9/fvwvbN683f8ls1ddkNU9e7u
  H9OnLDAy/n14Wv7vKiGpnhtSfdyJSizFGYmGWsxFxYkALxUz63YDAAA=
X-Env-Sender: yanxk.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-565.messagelabs.com!1667203172!516434!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6635 invoked from network); 31 Oct 2022 07:59:32 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-13.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 31 Oct 2022 07:59:32 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F03DD1AD
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:59:31 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E509E1AB
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:59:31 +0000 (GMT)
Received: from localhost.localdomain (10.167.218.229) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 31 Oct 2022 07:59:29 +0000
From: <yanxk.fnst@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: <fnstml-fujitsuten@fujitsu.com>, Yan Xinkuan <yanxk.fnst@fujitsu.com>
Subject: [meta-oe][PATCH V3] bc: Add ptest.
Date: Thu, 27 Oct 2022 09:12:42 +0800
Message-ID: <1666833162-10154-1-git-send-email-yanxk.fnst@fujitsu.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.218.229]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 07:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172291

From: Yan Xinkuan <yanxk.fnst@fujitsu.com>

Add package test function for OSS 'bc', using bc in the
system to do calculation jobs according to the .b files
from the source code file of 'bc'.

Test example as below:
......
.00673400673400673400
=E2=80=9CPASS: bc/div.b=E2=80=9D
99836408603283573660347145562829683495827909199408566065153345558783\
9427595471.89114392327665123852
=E2=80=9CPASS: bc/exp.b=E2=80=9D
length(b)=3D 1406
=E2=80=9CPASS: bc/fact.b=E2=80=9D
......

If bc runs the .b files and does not crash, it would 'PASS',
otherwise it would 'FAIL'.

I ran ptest with Intel CORE i5 4450, in qemux86-64, the whole
test took up to 124 seconds, so it should be a slow test.

Thanks to Ross Burton for the professional guidance.

Signed-off-by: Yan Xinkuan <yanxk.fnst@fujitsu.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 1 +
 meta/recipes-extended/bc/bc/run-ptest           | 9 +++++++++
 meta/recipes-extended/bc/bc_1.07.1.bb           | 9 +++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/bc/bc/run-ptest

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 56088e4e66..5cbed54cc5 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -100,6 +100,7 @@ PTESTS_SLOW =3D "\
     tcl-ptest \
     util-linux-ptest \
     valgrind-ptest \
+    bc-ptest \
 "
 
 PTESTS_SLOW:remove:riscv64 =3D "valgrind-ptest"
diff --git a/meta/recipes-extended/bc/bc/run-ptest b/meta/recipes-extended/bc/bc/run-ptest
new file mode 100644
index 0000000000..da2156f8cd
--- /dev/null
+++ b/meta/recipes-extended/bc/bc/run-ptest
@@ -0,0 +1,9 @@
+#! /bin/sh
+
+for TEST in *.b; do
+	if bc -l $TEST </dev/null; then
+		echo =E2=80=9CPASS: bc/$TEST=E2=80=9D
+        else
+		echo =E2=80=9CFAIL: bc/$TEST=E2=80=9D
+        fi
+done
diff --git a/meta/recipes-extended/bc/bc_1.07.1.bb b/meta/recipes-extended/bc/bc_1.07.1.bb
index 1bec76bb2a..178588f11b 100644
--- a/meta/recipes-extended/bc/bc_1.07.1.bb
+++ b/meta/recipes-extended/bc/bc_1.07.1.bb
@@ -15,11 +15,12 @@ DEPENDS =3D "flex-native"
 SRC_URI =3D "${GNU_MIRROR}/${BPN}/${BP}.tar.gz \
            file://no-gen-libmath.patch \
            file://libmath.h \
-           file://0001-dc-fix-exit-code-of-q-command.patch"
+           file://0001-dc-fix-exit-code-of-q-command.patch \
+           file://run-ptest"
 SRC_URI[md5sum] =3D "cda93857418655ea43590736fc3ca9fc"
 SRC_URI[sha256sum] =3D "62adfca89b0a1c0164c2cdca59ca210c1d44c3ffc46daf9931cf4942664cb02a"
 
-inherit autotools texinfo update-alternatives
+inherit autotools texinfo update-alternatives ptest
 
 PACKAGECONFIG =3F=3F=3D "readline"
 PACKAGECONFIG[readline] =3D "--with-readline,--without-readline,readline"
@@ -29,6 +30,10 @@ do_compile:prepend() {
     cp -f ${WORKDIR}/libmath.h ${B}/bc/libmath.h
 }
 
+do_install_ptest() {
+        install ${S}/Test/*.b ${D}${PTEST_PATH}
+}
+
 ALTERNATIVE:${PN} =3D "bc dc"
 ALTERNATIVE_PRIORITY =3D "100"
 
-- 
2.25.1


