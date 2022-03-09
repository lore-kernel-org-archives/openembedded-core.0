Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C287C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Mar 2022 21:28:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.2360.1646861321250194684
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Mar 2022 13:28:42 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de
 header.s=phobos-20191101 header.b=R7vNRtEv;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id D6FBC838AB;
	Wed,  9 Mar 2022 22:28:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1646861318;
	bh=0tdQ3Oc43PuhukNuWKH6YUKekzC9gJgxgMuzEYVrvHI=;
	h=From:To:Cc:Subject:Date:From;
	b=R7vNRtEvWdmzJAXNJJ8xW+i3oHAQy8XiM8BWG5SvrSLius1tX5sBQWWRs4dmnbP51
	 BgG50kMV+9L3G5380xsmxWKaQ+VVpCe0h2R/a7mrVS8d4evVg9WOk+85yysdFJMFGC
	 BvM117bClhfMjgoUFQf3nRW9IWFnlUxxcCNvJhLlUZGxOEuBpbmugBWuSn60si4+1R
	 HjwvwlFimeqx24Y6pzn6i9oYWAMjtj3e6J/D0NxnCfUCLGItSGsWkcU68nhvvtJmMt
	 V2pOa6ZT26fpq5DOnmf6QjniKAPBfLSgtbuhQSxoGbk6Rqpu/tFShNxL2NerheHFzb
	 TtKJ0k+Q/kCqA==
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Bruce Ashfield <bruce.ashfield@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [dunfell][PATCH] perf-tests: add bash into RDEPENDS (v5.12-rc5+)
Date: Wed,  9 Mar 2022 22:28:25 +0100
Message-Id: <20220309212825.398125-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Mar 2022 21:28:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162992

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Upstream commit:

   commit 1dc481c0b0cf18d3952d93a73c4ece90dec277f0
   Author: Leo Yan <leo.yan@linaro.org>
   Date:   Sat Mar 20 18:45:54 2021 +0800

       perf test: Change to use bash for daemon test

       When executing the daemon test on Arm64 and x86 with Debian (Buste=
r)
       distro, both skip the test case with the log:

Changes tools/perf/tests/shell/daemon.sh to be explicitly bash
(it was already required, but was just skipped on various
distros).

We add it into our RDEPENDS for perf-tests to fixup 5.12+
builds.

We already have relatively heavy RDEPENDS for perf tests (python3), so
adding bash into the RDEPENDS isn't signifcant even for older perf
builds that use the same recipe.

(cherry picked from commit 159cdb159ad0e9d3ed73cfc07f9acd5c0b608e7b)
Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-kernel/perf/perf.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
index e04047e85a..9c9bf1647f 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -267,7 +267,7 @@ RDEPENDS_${PN} +=3D "elfutils bash"
 RDEPENDS_${PN}-archive =3D+ "bash"
 RDEPENDS_${PN}-python =3D+ "bash python3 python3-modules ${@bb.utils.con=
tains('PACKAGECONFIG', 'audit', 'audit-python', '', d)}"
 RDEPENDS_${PN}-perl =3D+ "bash perl perl-modules"
-RDEPENDS_${PN}-tests =3D+ "python3"
+RDEPENDS_${PN}-tests =3D+ "python3 bash"
=20
 RSUGGESTS_SCRIPTING =3D "${@bb.utils.contains('PACKAGECONFIG', 'scriptin=
g', '${PN}-perl ${PN}-python', '',d)}"
 RSUGGESTS_${PN} +=3D "${PN}-archive ${PN}-tests ${RSUGGESTS_SCRIPTING}"
--=20
2.34.1


