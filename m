Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1656279BC2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Oct 2018 16:30:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9CGStAZ002397
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Oct 2018 09:30:30 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 12 Oct 2018 09:28:48 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 12 Oct 2018 09:28:48 -0700
Message-ID: <20181012162848.21502-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH] openssl: use deterministic perl Text::Template module bundled by openssl source
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
X-List-Received-Date: Fri, 12 Oct 2018 16:30:56 -0000
Content-Type: text/plain

1. The building openssl requires to install perl Text::Template module(>=1.46),
but Text::Template is a non core Perl module, openssl chooses to bundle
Text::Template 1.46 into the source, for convenience.
https://github.com/openssl/openssl/commit/8ff2af548303d311ce3591406111f77862875a60

2. While Text::Template < 1.46, the produced build files are gravely faulty.
https://github.com/openssl/openssl/pull/6682

3. If host has installed Text::Template < 1.46 (such as CentOS-7.5 has Text::
Template 1.45). The mismatched old module was used although the right one in
openssl source.

So set PERL5LIB to use deterministic perl Text::Template module bundled
by openssl source and ignore the one of host

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
index 5a43a15..0351858 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1.bb
@@ -105,6 +105,7 @@ do_configure () {
 	fi
 	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
 	# environment variables set by bitbake. Adjust the environment variables instead.
+	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
 	perl ./Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
 }
 
-- 
2.10.2


