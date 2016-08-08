Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 967B677184
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 06:04:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u78648ZR000676
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Aug 2016 23:04:08 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 7 Aug 2016 23:04:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Aug 2016 14:04:05 +0800
Message-ID: <8374cee610f770f4e027f92785bc0bed13334fbb.1470636212.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1470636212.git.Qi.Chen@windriver.com>
References: <cover.1470636212.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] bitbake.conf: change localedir
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
X-List-Received-Date: Mon, 08 Aug 2016 06:04:08 -0000
Content-Type: text/plain

Previously, localedir is set to "${libdir}/locale". This would result
in locale database installed in '/usr/lib64/locale' in some multilib case.
For example, if we build out a multilib x86-64 self-hosted image and we try
to build projects on this host, things broke and the following error appears.

  Please use a locale setting which supports utf-8.
  Python can't change the filesystem locale after loading so we need a utf-8 when python starts or things won't work.

This is because '/usr/lib/locale' is the default one. And actually the
nativesdk-glibc is now set to use '/usr/lib/locale'.

Thus, we change the setting of 'localedir' to '${nonarch_libdir}/locale' to
fix the above problem.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index c32a3f8..ed77ee3 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -44,7 +44,7 @@ export libdir = "${exec_prefix}/${baselib}"
 export libexecdir = "${exec_prefix}/libexec"
 export includedir = "${exec_prefix}/include"
 export oldincludedir = "${exec_prefix}/include"
-localedir = "${libdir}/locale"
+localedir = "${nonarch_libdir}/locale"
 
 # Linkage between native/cross/nativesdk layouts
 base_bindir_native = "/bin"
-- 
1.9.1


