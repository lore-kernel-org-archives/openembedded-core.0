Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD2EC48BF6
	for <webhook@archiver.kernel.org>; Sun, 18 Feb 2024 17:47:44 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.22621.1708278456702437232
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Feb 2024 09:47:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=BWBDahLV;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 5A50E240027
	for <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 18:47:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708278454; bh=0r6cMfQvGI3Yb3/iJcMxMYFf+Pa7fK6/jUDQC5ux5Ow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=BWBDahLV2H+imFp05m5/3TARyqa8hjM/sBiVroScHV53xBGSu2eu+DpOENnl9+Qzk
	 Yx4Zdbli/+ePRC4lt+iXuMSmrkJQd0zOdgKvzHq2yDrCTU2cKrDt2Bra/b4F91Luzi
	 GHMWHeotC0HiT2jqCsRjnSi3oliF4Y2UvSkoaPL50AIqhInQZlkir1wXQ3TlbhiKN5
	 MHlAAGhD86wfo7tYMUU9KA8cZTHsuDpKNeEm0OZH03Sth9Avt71pCZ0a/y2ndKOom0
	 j8izuSO+D6pDfsUNBlXs7Hu5k9u+wpqfXZmPxHH9efsSLHPtEKCrBSUndeUYrVb9Yv
	 CQDLs3WOuPRag==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TdCmj5tkwz6ty9;
	Sun, 18 Feb 2024 18:47:33 +0100 (CET)
From: simone.p.weiss@posteo.com
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] libuv: Upgrade 1.47.0 -> 1.48.0
Date: Sun, 18 Feb 2024 17:47:26 +0000
Message-Id: <20240218174726.2910505-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 18 Feb 2024 17:47:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195841

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

Upgrade libuv to pull in the fix for CVE-2024-24806

Changes:
* misc: remove deprecated stalebot file (Jameson Nash)
* build: disable windows asan buildbot (Ben Noordhuis)
* test: don't run tcp_writealot under msan (Ben Noordhuis)
* build,win: remove extraneous -lshell32 (Ben Noordhuis)
* unix: ignore ifaddrs with NULL ifa_addr (Stephen Gallagher)
* unix,win: utility for setting priority for thread (Hao Hu)
* pipe: add back error handling to connect / bind (Jameson Nash)
* test: check if ipv6 link-local traffic is routable (Ben Noordhuis)
* win: remove check for UV_PIPE_NO_TRUNCATE (Jameson Nash)
* linux: disable io_uring on hppa below kernel 6.1.51 (matoro)
* unix,win: fix read past end of pipe name buffer (Ben Noordhuis)
* unix: unbreak macOS < 10.14 (Sergey Fedorov)
* aix: disable ipv6 link local (Abdirahim Musse)
* doc: move cjihrig to emeriti (cjihrig)
* unix: correct pwritev conditional (Bo Anderson)
* test_fs.c: Fix issue on 32-bit systems using btrfs (Stephen Gallagher)
* misc: ignore libuv-release-tool files (Jameson Nash)
* win: honor NoDefaultCurrentDirectoryInExePath env var (Ardi Nugraha)
* idna: fix compilation warning (Sa=C3=BAl Ibarra Corretg=C3=A9)
* linux: remove HAVE_IFADDRS_H macro (Ben Noordhuis)
* test: skip tcp-write-in-a-row on IBM i (Abdirahim Musse)
* build,win: work around missing uuid.dll on MinGW (Anton Bachin)
* win: stop using deprecated names (Matheus Izvekov)
* unix,win: fix busy loop with zero timeout timers (Matheus Izvekov)
* aix,ibmi: use uv_interface_addresses instead of getifaddrs (Abdirahim
  Musse)
* linux: fix bind/connect for abstract sockets (Santiago Gimeno)
* win: replace c99 comments with c89 comments (Trevor Flynn)
* build: add .cache clangd folder to .gitignore (Juan Jos=C3=A9 Arboleda)
* unix: support full TCP keep-alive on Solaris (Andy Pan)
* freebsd: fix F_KINFO file path handling (David Carlier)
* linux: retry fs op if unsupported by io_uring (Santiago Gimeno)
* freebsd: fix build on non-intel archs (David Carlier)
* unix: optimize uv__tcp_keepalive cpp directives (Andy Pan)
* linux: disable io_uring on ppc64 and ppc64le (Brad King)
* doc: add very basic Security Policy document (Santiago Gimeno)
* build: re-enable msvc-asan job on CI (Jameson Nash)
* win/spawn: optionally run executable paths with no file extension
  (Brad King)
* win: fix ESRCH implementation (Jameson Nash)
* unix,win: reset the timer queue on stop (Santiago Gimeno)
* fix: always zero-terminate idna output (Ben Noordhuis)
* fix: reject zero-length idna inputs (Ben Noordhuis)
* test: empty strings are not valid IDNA (Santiago Gimeno)
* Merge pull request from GHSA-f74f-cvh7-c6q6 (Ben Noordhuis)

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 .../libuv/{libuv_1.47.0.bb =3D> libuv_1.48.0.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-connectivity/libuv/{libuv_1.47.0.bb =3D> libuv_1.48.=
0.bb} (94%)

diff --git a/meta/recipes-connectivity/libuv/libuv_1.47.0.bb b/meta/recip=
es-connectivity/libuv/libuv_1.48.0.bb
similarity index 94%
rename from meta/recipes-connectivity/libuv/libuv_1.47.0.bb
rename to meta/recipes-connectivity/libuv/libuv_1.48.0.bb
index 50ad6ba5eb..87a2c22a7c 100644
--- a/meta/recipes-connectivity/libuv/libuv_1.47.0.bb
+++ b/meta/recipes-connectivity/libuv/libuv_1.48.0.bb
@@ -6,7 +6,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D74b6f2f7818a4e3a80d03556f71b1=
29b \
                     file://LICENSE-extra;md5=3Df9307417749e19bd1d6d68a39=
4b49324"
=20
-SRCREV =3D "be6b81a352d17513c95be153afcb3148f1a451cd"
+SRCREV =3D "e9f29cb984231524e3931aa0ae2c5dae1a32884e"
 SRC_URI =3D "git://github.com/libuv/libuv.git;branch=3Dv1.x;protocol=3Dh=
ttps"
 UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
=20
--=20
2.39.2


