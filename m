Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 7D9256D136
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Nov 2013 10:38:05 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,631,1378828800"; 
   d="scan'208";a="8941715"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 04 Nov 2013 18:34:40 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rA4Ac2Jl029062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Nov 2013 18:38:02 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013110418361282-2744886 ;
	Mon, 4 Nov 2013 18:36:12 +0800 
Message-ID: <5277790C.1060208@cn.fujitsu.com>
Date: Mon, 04 Nov 2013 18:38:04 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/11/04 18:36:12,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/11/04 18:36:13,
	Serialize complete at 2013/11/04 18:36:13
Subject: [PATCH 1/1] systemd.bbclass: only restart the service when it is running at systemd_postinst
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
X-List-Received-Date: Mon, 04 Nov 2013 10:38:07 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=GB2312

From: Li Zhijian <lizhijian@cn.fujitsu.com>

If systemd_postinst is installed as a delayed package scriptlet (installed to /etc/rpm-postints/${PN})
which would be executed at the first time of OS startup. And then this script would block when it is
trying to call systemctl to restart service.

It seems that it is not a good timing to restart service at run-postinsts.
I test serval services which has supported systemd(uuidd/avahi-daemon), all of them
will block the startup.

Steps to reproduce:
1) Installed systemd_postinst as a delayed package scriptlet
   i.e. Append Following lines to meta/recipes-core/busybox/busybox.inc
pkg_postinst_${PN}-syslog () {
       if [ "x$D" != "x" ] ; then
               exit 1
       fi
}
2) build a rootfs
# bitbake core-image-minimal
3) startup this rootfs

OS would block at /etc/rpm-postinsts/busybox-syslog, like follows
[ ***] A start job is running ro Run pending postinsts

This patch can fix the block problem, and make the service is consistent with the original status

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 meta/classes/systemd.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 8084251..9fef667 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -30,7 +30,8 @@ fi
 if type systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
+	if [ -z "$D" ] && [ systemctl status ${SYSTEMD_SERVICE} &>/dev/null ]; then
+		# if service is running, restart it
 		systemctl restart ${SYSTEMD_SERVICE}
 	fi
 fi
-- 
1.7.1








