Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 088746D145
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 02:27:02 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,727,1378828800"; 
   d="scan'208";a="9069638"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 19 Nov 2013 10:23:38 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rAJ2QuZ3030719
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 10:27:00 +0800
Received: from G08FNSTD110722 ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013111910250336-222018 ;
	Tue, 19 Nov 2013 10:25:03 +0800 
From: "Li Zhijian" <lizhijian@cn.fujitsu.com>
To: "'Patches and discussions about the oe-core layer'"
	<openembedded-core@lists.openembedded.org>
References: <5278C502.1080100@cn.fujitsu.com>
In-Reply-To: <5278C502.1080100@cn.fujitsu.com>
Date: Tue, 19 Nov 2013 10:26:54 +0800
Message-ID: <008701cee4ce$d0b805c0$72281140$@cn.fujitsu.com>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: AQEQPOfDOXd7AG6Ddc+0JXpejNh7ApupI3CA
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/11/19 10:25:03,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/11/19 10:25:07,
	Serialize complete at 2013/11/19 10:25:07
Subject: Re: [PATCH v2] systemd.bbclass: only restart the service when it is active at systemd_postinst
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
X-List-Received-Date: Tue, 19 Nov 2013 02:27:04 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset="us-ascii"
Content-Language: zh-cn

ping...

-- 
Best regards.
Li Zhijian

 |-----Original Message-----
 |From: openembedded-core-bounces@lists.openembedded.org
 |[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
 |Li Zhijian
 |Sent: Tuesday, November 05, 2013 6:14 PM
 |To: Patches and discussions about the oe-core layer
 |Subject: [OE-core] [PATCH v2] systemd.bbclass: only restart the service
 |when it is active at systemd_postinst
 |
 |From: Li Zhijian <lizhijian@cn.fujitsu.com>
 |
 |If systemd_postinst is installed as a delayed package scriptlet (installed
 |to /etc/rpm-postints/${PN})
 |which would be executed at the first time of OS startup. And then this
script
 |would block when it is
 |trying to call systemctl to restart service.
 |
 |It seems that it is not a good timing to restart service at run-postinsts.
 |I test serval services which has supported systemd(uuidd/avahi-daemon),
 |all of them
 |will block the startup.
 |
 |Steps to reproduce:
 |1) Installed systemd_postinst as a delayed package scriptlet
 |   i.e. Append Following lines to meta/recipes-core/busybox/busybox.inc
 |pkg_postinst_${PN}-syslog () {
 |       if [ "x$D" != "x" ] ; then
 |               exit 1
 |       fi
 |}
 |2) build a rootfs
 |$ bitbake core-image-minimal
 |3) startup this rootfs
 |
 |OS would block at /etc/rpm-postinsts/busybox-syslog, like follows
 |[ ***] A start job is running ro Run pending postinsts
 |
 |This patch can fix the block problem, and make the service is consistent
 |with the original status
 |
 |Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
 |---
 | meta/classes/systemd.bbclass |    3 ++-
 | 1 files changed, 2 insertions(+), 1 deletions(-)
 |
 |diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
 |index 3700b2e..1feac06 100644
 |--- a/meta/classes/systemd.bbclass
 |+++ b/meta/classes/systemd.bbclass
 |@@ -32,7 +32,8 @@ fi
 | if type systemctl >/dev/null 2>/dev/null; then
 | 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
 | -	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
 |+	if [ -z "$D" ] && systemctl is-active ${SYSTEMD_SERVICE}
 |&>/dev/null; then
 |+		# if service is active, restart it
 | 		systemctl restart ${SYSTEMD_SERVICE}
 | 	fi
 | fi
 |--
 |1.7.1
 |
 |
 |
 |
 |_______________________________________________
 |Openembedded-core mailing list
 |Openembedded-core@lists.openembedded.org
 |http://lists.openembedded.org/mailman/listinfo/openembedded-core




