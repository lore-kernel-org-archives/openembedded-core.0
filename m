Received: from pp0155.ppsmtp.net (pp0155.ppsmtp.net [132.145.231.114])
 by mx.groups.io with SMTP id smtpd.web08.27610.1605719622951748827
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 09:13:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ifm.com header.s=pps header.b=y/rcva6l;
 spf=pass (domain: ifm.com, ip: 132.145.231.114, mailfrom: prvs=1591cff76d=fedor.ross@ifm.com)
Received: from pps.filterd (pp2080.ppsmtp.internal [127.0.0.1])
	by pp2080.ppsmtp.internal (8.16.0.42/8.16.0.42) with SMTP id 0AIH5SwY018408
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ifm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=pps; bh=ILWgzETnnNxOkFwM69rjXK6R2REJcHn6JtCHpSd283I=;
 b=y/rcva6llrvKRT/R0eZQ37CiRNbpuRvCVsNe4u6UyG35k/ObBd82GvYb/IIHNCK9zW2r
 PIuWdeT/auFtQLJ6Z8yvAbY4JK+4vlwXKy5hHW2SqcapwNQrqH68ifJ71I/0aOcJF6Tx
 K6TjY9hrAWdkli8kHxBd2u9MBT7pS2V4xV9+AJILKT4L7TiDMN/aZeATyCXeGxGjIQv0
 QbtPkMaw3dRqdwwGoOUG09eYyiOzUxxi57y/k8jFzhGlnYSiZVxzGelDAz8ZdA6OLBk4
 wBrL9IbT75r4LoaBOje4G886urVxatrIdiVD31ieWOQr6ADen96Tn9ZoHc9BKl/ZjYc6 Xg== 
Received: from deesdmz227.dmz.es.de.ifm (mail27.ifm.com [194.156.152.227])
	by pp2080.ppsmtp.internal with ESMTP id 34w5b00dck-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:41 +0100
Received: from deesdmz227.dmz.es.de.ifm (localhost [127.0.0.1])
	by deesdmz227.dmz.es.de.ifm (Postfix) with ESMTP id A60B5884448
	for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 18:13:40 +0100 (CET)
From: fedor.ross@ifm.com
To: <openembedded-core@lists.openembedded.org>
CC: Fedor Ross <fedor.ross@ifm.com>
Subject: [PATCH 1/2] eudev: remove bashism to be compatible with dash
Date: Wed, 18 Nov 2020 18:13:13 +0100
Message-ID: <20201118171314.5543-1-fedor.ross@ifm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [172.18.85.69]
X-ClientProxiedBy: dettex01.intra.ifm (172.19.1.101) To dettex04.intra.ifm
 (172.19.1.163)
X-TM-AS-Product-Ver: SMEX-12.5.0.2055-8.6.1012-25798.001
X-TM-AS-Result: No-2.686800-5.000000-10
X-TMASE-MatchedRID: uiadmfAunJz9PUVsPjsM+dbgzPjrV+wc6qG5M9QNAO2OIsAELqL7WNxw
	X69jh9hhdf3zQ6T0AEUMXP6oZvHgdixppiUy9o4cA9lly13c/gECn5QffvZFlZGPHiE2kiT4I8V
	UmNdWQCx8yGuwdhtmwop7crTbZpm38d2M04iWy/KeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDuQQZRTbt3XEebGElQqWCnZU8KBUhIp9Or91hQYtbQ05p65HjpIIRIsNT8jvpNpNTzPoc
	N8Qd6QqpoJTZQzUzp6tuOQfN5p3qjVIWe9PfG2D9leimmhcnaXe4hkjgmJMlhA8jgfAt5oQ
X-TM-AS-User-Approved-Sender: Yes
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.686800-5.000000
X-TMASE-Version: SMEX-12.5.0.2055-8.6.1012-25798.001
X-TM-SNTS-SMTP: 
	59CF2F26C156C5C7FD95D74DF3FA13514338867617631C52D2DF9DA4CD7AFCED2002:9
X-C2ProcessedOrg: 02c94ccb-b9eb-40fe-af38-4bcaa8aaafa4
X-CompuMailGateway: Version: 7.00.0.20903.x86_64 COMPUMAIL Date: 20201118171340Z
X-Proofpoint-ID: SID=34w5b00dck QID=34w5b00dck-1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-18_06:2020-11-17,2020-11-18 signatures=0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Fedor Ross <fedor.ross@ifm.com>

Remove 'echo -e' and replace it with 'printf'. In bash the builtin
'echo' has an option for interpreting backslash escapes. In a shell like
dash the builtin 'echo' interprets backslash escapes by default.
Therefor the 'echo' in dash doesn't have the '-e' option. When using
'printf' instead it is safe to use it either with bash or dash.

Signed-off-by: Fedor Ross <fedor.ross@ifm.com>
---
 meta/recipes-core/udev/eudev/init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/udev/eudev/init b/meta/recipes-core/udev/eud=
ev/init
index 0455ade258..c60dbbf6d5 100644
--- a/meta/recipes-core/udev/eudev/init
+++ b/meta/recipes-core/udev/eudev/init
@@ -52,7 +52,7 @@ case "$1" in
     kill_udevd > "/dev/null" 2>&1
=20
     # trigger the sorted events
-    [ -e /proc/sys/kernel/hotplug ] && echo -e '\000' >/proc/sys/kernel/ho=
tplug
+    [ -e /proc/sys/kernel/hotplug ] && printf '\0\n' >/proc/sys/kernel/hot=
plug
     @UDEVD@ -d
=20
     udevadm control --env=3DSTARTUP=3D1
--=20
2.20.1


