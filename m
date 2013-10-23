Return-Path: <lizhijian@cn.fujitsu.com>
Received: from song.cn.fujitsu.com (unknown [222.73.24.84])
	by mail.openembedded.org (Postfix) with ESMTP id 0D9516D096
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 07:34:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.93,553,1378828800"; 
   d="scan'208";a="8837002"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 23 Oct 2013 15:31:05 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id r9N7YNBm018682
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Oct 2013 15:34:24 +0800
Received: from [127.0.0.1] ([10.167.226.56])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013102315315426-2474734 ;
	Wed, 23 Oct 2013 15:31:54 +0800 
Message-ID: <52677C01.1020908@cn.fujitsu.com>
Date: Wed, 23 Oct 2013 15:34:25 +0800
From: Li Zhijian <lizhijian@cn.fujitsu.com>
Organization: fnst-ulinux
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/10/23 15:31:54,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/10/23 15:31:54,
	Serialize complete at 2013/10/23 15:31:54
Subject: [PATCH] systemd.bbclass: do not call 'systemctl restart ${SYSTEMD_SERVICE}' at systemd_postinst
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
X-List-Received-Date: Wed, 23 Oct 2013 07:34:26 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=GB2312

From: Li Zhijian <lizhijian@cn.fujitsu.com>

If systemd_postinst is installed as a delayed package scriptlet (installed to /etc/rpm-postints/${PN})
which would be executed at the first time of OS startup. And then this script would block when it is
trying to call systemctl to restart service.

It seems that it is not a good timing to restart service at run-postinsts.
I test serval services which has supported systemd(uuidd/avahi-daemon), all of them
will block the startup.

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 meta/classes/systemd.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/classes/systemd.bbclass b/meta/classes/systemd.bbclass
index 3700b2e..7aa5459 100644
--- a/meta/classes/systemd.bbclass
+++ b/meta/classes/systemd.bbclass
@@ -31,10 +31,6 @@ fi
  if type systemctl >/dev/null 2>/dev/null; then
 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
-
-	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" = "enable" ]; then
-		systemctl restart ${SYSTEMD_SERVICE}
-	fi
 fi
 }
 -- 1.7.1





