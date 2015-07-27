Return-Path: <dominic.sacre@gmx.de>
X-Greylist: delayed 306 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 27 Jul 2015 15:40:27 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by mail.openembedded.org (Postfix) with ESMTP id C9FA375A60
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 15:40:27 +0000 (UTC)
Received: from dastp.fritz.box ([79.253.190.123]) by mail.gmx.com (mrgmx103)
	with ESMTPSA (Nemesis) id 0LmJsk-1Yk8R01VP0-00ZxyL;
	Mon, 27 Jul 2015 17:35:20 +0200
From: =?UTF-8?q?Dominic=20Sacr=C3=A9?= <dominic.sacre@gmx.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 17:34:23 +0200
Message-Id: <1438011263-13535-1-git-send-email-dominic.sacre@gmx.de>
X-Mailer: git-send-email 2.4.6
MIME-Version: 1.0
X-Provags-ID: V03:K0:Uphlze3gckXSvTiG+i/mr53jqzUkxanC0tBcehWPenC/+OS6wSR
	S9/VdUQf7ZafBekxNHMBWcO3A0MHuFCWXN9a8ioT7dWds4oyLIpWHR4/CFkRupdMOYrk2c6
	8onBxkTnzZcU0qjGbs/t+/Np7mlWadWp4H41PrYW6I7epCBkVMRZnW50D6fdpsDlR4prEWx
	2vIyjTzJEkDOXU7tR9zwA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:Qq5JnKQefaQ=:EDxynTD7l2wMQ5R5cw27zK
	9xad+05AXbYDEYHUv0uv4Rc04RgIJi5uY+SGNHDhT1sAm3RPVVhw2lUAYf6DUDeUux+2x+IFP
	pP7oyMhVGszGMYbYOMQcbMdpPqDptNETTdyjzQZOL0/OOOLVLTZ3Fzw8ASzWBFHThNzVNSPR6
	xKV53AZBs8/VCjH28Lkz1od8j51mCKzrfuO9p2M8ZK4ujNDzwg0ATfRJ7xNDsdSYMHkoHqvh4
	CkQrYrVK7vRXy6G2RSyhcrUUWJ6/p/vMONPRiJHAgHVzuuo2EftA298YyGUtIULTf6ZIfpdXs
	s2E2bUE4AJJNW9ITXriincJHN9d1ZxIgZaOYbrOxRoBuCsy3HfcvSRD2/x7HDOK44M3gx3dPv
	0B3LdrF9kUKehNJsv4d2J21RDBprPjpS0LJ4kQujzoPmHF8F+5kUFzVSsGitsM/MhwGyPLdE9
	ej35qjFrOCirGx4VyhbMf+sstA6mpuKTSaFamJLJyIrrytdYFuS8kp71vfF6nde3SgjB9gQpS
	YXnK/Eg9zcFJit4zyPLKONKALPyOpOD1hvwHVXXRGXjmDZDNh+l5UfGJMbnZUDR1gmIuIbkHp
	vabPziV7wVO8Ir6tlz8PNn9LabEaVmEIkFSW0qe/IRZkM51iUmDWdKYjo4gp4xovkSEcEaAQL
	6vG7NgM5kjlRRxK/YuzEFAXtf1OLOyMAyYhF8CO05u577jXdy8RUBnDiy4Oj6og+xEfI=
Subject: [PATCH] opkg-utils: fix bashism in opkg-build
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
X-List-Received-Date: Mon, 27 Jul 2015 15:40:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix error '[[: not found' if /bin/sh is not bash.

This issue was introduced by the recent addition of tar_ignore_error.patch
to the opkg-utils recipe.

Signed-off-by: Dominic Sacré <dominic.sacre@gmx.de>
---
 meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
index e8250b7..4dddb08 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/tar_ignore_error.patch
@@ -32,13 +32,13 @@ Index: git/opkg-build
 +# Ignore error code 1, caused by modifying the number of hard links while creating the tar file
 +rc=0
 +( cd $pkg_dir && tar $ogargs -X $tmp_dir/tarX -cz $tarformat -f $tmp_dir/data.tar.gz . ) || rc=$?
-+if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
++if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc 
 +fi
 +
 +rc=0
 +( cd $pkg_dir/$CONTROL && tar $ogargs -cz $tarformat -f $tmp_dir/control.tar.gz . ) || rc=$?
-+if [[ $rc -ne 1 ]] && [[ $rc -ne 0 ]] ;then
++if [ $rc -ne 1 ] && [ $rc -ne 0 ]; then
 +        exit $rc
 +fi
 +
-- 
2.4.6


