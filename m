Return-Path: <Mark.Asselstine@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA8F6AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 16:28:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t2PGSsO5009078
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Mar 2015 09:28:54 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Wed, 25 Mar 2015 09:28:53 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 25 Mar 2015 12:28:34 -0400
Message-ID: <1427300914-11208-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
X-Originating-IP: [128.224.56.18]
Subject: [PATCH] openssl: add a vardeps for configure on libdir
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
X-List-Received-Date: Wed, 25 Mar 2015 16:28:54 -0000
Content-Type: text/plain

Configure makes use of 'libdir' to set 'openssldir'. Unfortunately
openssl treats this as a hardcoded absolute path. The value passed in
as openssl becomes part of header files and baked in to executables.

For target builds libdir is not something that changes and for -native
builds unless you move your builds around you will see no issue with
the current implementation. If you do update libdir or if you move
your build or reuse sstate by copying it to a new build you will start
to see errors. These will be seen when you use the 'openssl' tool and
look like the following:

WARNING: can't open config file: /home/build/bitbake_build/tmp/
                        sysroots/x86_64-linux/usr/lib/ssl/openssl.cnf

Knowing that openssl treats 'openssldir' as a hard coded absolute path
and that we set this in configure we must add a 'vardeps' to ensure
that things get re-configured and built whenever 'libdir' is
modified. This will fix both target and -native builds per the
usecases described above. If 'libdir' is unchanged things continue to
function as they did before and a re-configure will not happen.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
index d337017..105b3fa 100644
--- a/meta/recipes-connectivity/openssl/openssl.inc
+++ b/meta/recipes-connectivity/openssl/openssl.inc
@@ -54,6 +54,8 @@ do_configure_prepend_darwin () {
 	sed -i -e '/version-script=openssl\.ld/d' Configure
 }
 
+do_configure[vardeps] += "${libdir}"
+
 do_configure () {
 	cd util
 	perl perlpath.pl ${STAGING_BINDIR_NATIVE}
-- 
2.0.1


