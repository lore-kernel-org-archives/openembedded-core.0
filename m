Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U0tgy-0004yr-T8
	for openembedded-core@lists.openembedded.org;
	Thu, 31 Jan 2013 13:56:38 +0100
Received: from mail-lb0-f199.google.com ([209.85.217.199])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 31 Jan 2013 04:40:52 -0800
Received: by mail-lb0-f199.google.com with SMTP id m4so3225372lbo.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Jan 2013 04:40:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=Jtn27CpGu2eh+IVVlNjDbQx5dqWochRkZdkGnvuqf1Q=;
	b=R054UfXwIhGMKC6t90dOLsYHeYBEvhE0e+p0a9QA4btJZ2eJFAb0Chwb4Hk3LtLcIz
	uj9WRXFX8Yx8ytwFB0mRTiohVRbB7bqnB1d+gRmPKoxrFLpRI4vbveLNYLzOa8kWOQnT
	WLSVGcLv3SNgQ1ACmfxuCHmcyMEeq6EJvp71rT+ESQkh4KendQp2O/yX1upT1eu/zCbD
	xZwi2/kU8fV6Wj9R3xqNBrR3zDpZV8nTBy10CDqOeEkXi76zMOKSltVXzN/HTQ6PYpZj
	HicFCmoT8iERDdRt+AHImr/k7yrk3EuZP66rfAT1zI1eu+nvsN1seP2MAv40ZZ/1SiKK
	OwZw==
X-Received: by 10.194.76.7 with SMTP id g7mr15157603wjw.50.1359636050547;
	Thu, 31 Jan 2013 04:40:50 -0800 (PST)
X-Received: by 10.194.76.7 with SMTP id g7mr15157580wjw.50.1359636050373;
	Thu, 31 Jan 2013 04:40:50 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id e6sm9031180wiz.1.2013.01.31.04.40.48
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 04:40:49 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Jan 2013 12:38:45 +0000
Message-Id: <1359635925-27715-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn8EID1edjeagoWrL12huyA7lmjxWdtdyxNevFHr6qyPBSo7cJGF2AHs8pxU95hxv2n+HlgAbznSMKhUqjj9mCRNWplsmj0Tii1oR0S1u57RXOk6tbbhi8sTp9qJNcgfmMLeCuaWnkV1sUi3pmp16gyipqjE8A4cmXkWFRBAyaMloQoTEeHu/JBNKEQfrw0/JsjJ4at
Subject: [PATCH] polkit: respect systemd DISTRO_FEATURE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Jan 2013 12:56:38 -0000

By default polkit uses systemd if it's available, which mean systemd runtime
dependencies sneaking into non-systemd builds via sstate.

Instead respect the systemd feature and enable/disable support as relevant.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 2c0aaca..37d8428 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -7,8 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=155db86cdbafa7532b41f390409283eb \
 
 DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 
-PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
+PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)} \
+                 ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
+PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd"
 
 PR = "r9"
 
-- 
1.7.10.4



