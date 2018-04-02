Return-Path: <rruslich@cisco.com>
Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
	by mail.openembedded.org (Postfix) with ESMTP id 12371745B7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Apr 2018 13:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=957; q=dns/txt; s=iport;
	t=1522677162; x=1523886762;
	h=from:to:cc:subject:date:message-id;
	bh=kfmqn9ZOq1EdK9FZgYPb8Od3NKLAZVi6RMVCwj21nVw=;
	b=LaADXHD3xQk1+xasVZLC9s7ChX9zLaz01eQfWUurkMJdbNRAv1N1iPpk
	JHMzitJFy2q4pXkN6QEBOxImzDfqOf/++6LWApmX8ZDqnrrcPGeNiZQfJ
	QnVjJXsra+unvd5KzMWj3H31KVgo2IqPJwrSpRkrccX1fO7FXgxeGTq8d o=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0CCAQBNMsJa/xbLJq1cGQEBAQEBAQE?=
	=?us-ascii?q?BAQEBAQcBAQEBAYUSKIw6jyaSU4F6C4UEhFU1FwECAQEBAQEBAmsohiSBUYU?=
	=?us-ascii?q?ADbBThFWDZoIrFIkhP4NchGyBA4UIAoxPimsIji4CjDWPVgIREwGBJR0BNoF?=
	=?us-ascii?q?ScBU6gkOQUDwwi2SCRgEB?=
X-IronPort-AV: E=Sophos;i="5.48,395,1517875200"; 
   d="scan'208";a="2904280"
Received: from aer-iport-nat.cisco.com (HELO aer-core-3.cisco.com)
	([173.38.203.22])
	by aer-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2018 13:42:36 +0000
Received: from rruslich-ThinkPad-W550s.cisco.com (dhcp-10-61-103-248.cisco.com
	[10.61.103.248])
	by aer-core-3.cisco.com (8.14.5/8.14.5) with ESMTP id w32DgZw2013507
	(version=TLSv1/SSLv3 cipher=AES128-SHA256 bits=128 verify=NO);
	Mon, 2 Apr 2018 13:42:36 GMT
From: Ruslan Ruslichenko <rruslich@cisco.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Apr 2018 16:42:18 +0300
Message-Id: <1522676539-16675-1-git-send-email-rruslich@cisco.com>
X-Mailer: git-send-email 1.9.1
X-Auto-Response-Suppress: DR, OOF, AutoReply
Cc: xe-linux-external@cisco.com
Subject: [PATCH 1/2] qemu: do not hardcode python2.7 path
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
X-List-Received-Date: Mon, 02 Apr 2018 13:52:41 -0000

It can be installed to some non standard path in which
case build will be broken.
As python2.7 is specified in HOSTTOOLS we can rely
that it is present in the PATH, so no need to hardcode
it to /usr/bin.

Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2a1d14b..dc73df8 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -28,7 +28,7 @@ EXTRA_OECONF = " \
     --target-list=${@get_qemu_target_list(d)} \
     --extra-cflags='${CFLAGS}' \
     "
-EXTRA_OECONF_append_class-native = " --python=${USRBINPATH}/python2.7"
+EXTRA_OECONF_append_class-native = " --python=python2.7"
 
 EXTRA_OEMAKE_append_class-native = " LD='${LD}' AR='${AR}' OBJCOPY='${OBJCOPY}' LDFLAGS='${LDFLAGS}'"
 
-- 
1.9.1


