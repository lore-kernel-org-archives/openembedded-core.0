Return-Path: <Haitao.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3897BE4B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 06:20:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x1M6KV1S023314
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 21 Feb 2019 22:20:31 -0800 (PST)
Received: from pek-lpggp2.wrs.com (128.224.153.75) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.435.0;
	Thu, 21 Feb 2019 22:20:30 -0800
From: Liu Haitao <haitao.liu@windriver.com>
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Date: Fri, 22 Feb 2019 14:03:00 +0800
Message-ID: <1550815380-192596-1-git-send-email-haitao.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.75]
Subject: [PATCH] bitbake.conf:update FETCHCMD_wget with --no-passive-ftp
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
X-List-Received-Date: Fri, 22 Feb 2019 06:20:32 -0000
Content-Type: text/plain

When fetching the source of alsa it would trigger the following WARNING:

|WARNING: alsa-lib-1.1.6-r0 do_fetch: Failed to fetch URL
|ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.6.tar.bz2, attempting MIRRORS if
|available

Bitbake would use wget with "--no-passive" to fetch the source. Behind most firewall and NAT
configurations it could work well.However, in some rare firewall configurations,
active FTP actually works when passive FTP doesn't.

So disable the use of the passive FTP transfer mode for wget.

Signed-off-by: Liu Haitao <haitao.liu@windriver.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 435646a946..357de41780 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -666,7 +666,7 @@ SRC_URI[vardepsexclude] += "\
 
 FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
 FETCHCMD_cvs = "/usr/bin/env cvs"
-FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate"
+FETCHCMD_wget = "/usr/bin/env wget -t 2 -T 30 --no-passive-ftp --no-check-certificate"
 FETCHCMD_bzr = "/usr/bin/env bzr"
 FETCHCMD_hg = "/usr/bin/env hg"
 
-- 
2.17.1


