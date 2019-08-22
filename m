Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04ED97F21A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 18:52:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7MIpuWP025696
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2019 11:52:37 -0700
Received: from yow-dellw-ag.wrs.com (128.224.56.115) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 22 Aug 2019 11:52:04 -0700
From: Trevor Gamblin <Trevor.Gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2019 14:52:04 -0400
Message-ID: <1566499924-12897-1-git-send-email-Trevor.Gamblin@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] lighttpd: lighttpd: drop hard-coded lua version in PACKAGECONFIG
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
X-List-Received-Date: Thu, 22 Aug 2019 18:52:47 -0000
Content-Type: text/plain

From: Trevor Gamblin <trevor.gamblin@windriver.com>

When building lighttpd with PACKAGECONFIG_append_pn-lighttpd = "lua" in local.conf,
bitbake gives the following error:

ERROR: Nothing PROVIDES 'lua5.1' (but /home/tgamblin/build/oe-core/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb DEPENDS on or otherwise requires it)
NOTE: Runtime target 'lighttpd' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['lighttpd', 'lua5.1']

Removing the "5.1" from the PACKAGECONFIG line in lighttpd_1.4.54.bb fixes the issue.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
index ba1a2c5..72990d0 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.54.bb
@@ -44,7 +44,7 @@ PACKAGECONFIG[webdav-props] = "--with-webdav-props,--without-webdav-props,libxml
 PACKAGECONFIG[webdav-locks] = "--with-webdav-locks,--without-webdav-locks,util-linux"
 PACKAGECONFIG[gdbm] = "--with-gdbm,--without-gdbm,gdbm"
 PACKAGECONFIG[memcache] = "--with-memcached,--without-memcached,libmemcached"
-PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua5.1"
+PACKAGECONFIG[lua] = "--with-lua,--without-lua,lua"
 
 EXTRA_OECONF += "--enable-lfs"
 
-- 
2.7.4


