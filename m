Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f48.google.com (unknown [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 90E4265F11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 14:28:49 +0000 (UTC)
Received: by mail-wg0-f48.google.com with SMTP id b13so3478553wgh.19
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 07:28:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=L2/TT63u0pt/fs3Kh/0K5XewWnXYb+d6hPNaQObVsg8=;
	b=gg6KOhA91IHWuZg43wHP/9WGLzEBs11yZNR7ZMaQ1Hi5JZMDW/POfySJEmRxfn1/NN
	yDsPBL66vjhL8AG3jxk1dfLuqEIKDmguCrz/wrr9JDsF8uarRA5qSIaBbU8ykKHhHB8M
	hPotw4oCFWWbKyEsxc7oYwwgTc9fo8xqep869nIfdG5KcTx5GFrRk45SK89t5DvExH4m
	DiwEY2mpVfrUOag+/tY8Qzfzf3/pifAcmaj4Q1YFIadqjvqHACRdhLhZyqqJfGmmLOkf
	RE7XQnguecgz7sq/OwDFSHUIdoGdEtglMtHt1ukWcESrjfCqhI3XGfTvWGPGjC+oayuf
	iWiA==
X-Gm-Message-State: ALoCoQkR7xP8XmCW2HSWTEdjZH+wiPR36A5SGnuEvW311ESKciWzJAyEQ4V1QeoQb6wSL64Qif+1
X-Received: by 10.180.85.10 with SMTP id d10mr3430037wiz.0.1400768930096;
	Thu, 22 May 2014 07:28:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id o10sm560wjy.0.2014.05.22.07.28.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 22 May 2014 07:28:48 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 May 2014 15:28:32 +0100
Message-Id: <1400768912-5313-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] perl: stop perl-modules recommending perl-ptest
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
X-List-Received-Date: Thu, 22 May 2014 14:28:50 -0000

Change the logic that generates the perl-modules recommends to be an include
filter instead of an exclude filter, so that new sub-packages don't become
dependants of perl-modules (such as perl-ptest).

[ YOCTO #6203 ]

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/perl/perl_5.14.3.bb |    7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.14.3.bb b/meta/recipes-devtools/perl/perl_5.14.3.bb
index c307b99..c3ec5a8 100644
--- a/meta/recipes-devtools/perl/perl_5.14.3.bb
+++ b/meta/recipes-devtools/perl/perl_5.14.3.bb
@@ -320,7 +320,12 @@ python populate_packages_prepend () {
     do_split_packages(d, libdir, 'Module/([^\/]*)\.pm', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, 'Module/([^\/]*)/.*', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
     do_split_packages(d, libdir, '(^(?!(CPAN\/|CPANPLUS\/|Module\/|unicore\/|auto\/)[^\/]).*)\.(pm|pl|e2x)', 'perl-module-%s', 'perl module %s', recursive=True, allow_dirs=False, match_path=True, prepend=False)
-    d.setVar("RRECOMMENDS_${PN}-modules", d.getVar('PACKAGES', True).replace('${PN}-modules ', '').replace('${PN}-dbg ', '').replace('${PN}-misc ', '').replace('${PN}-dev ', '').replace('${PN}-pod ', '').replace('${PN}-doc ', ''))
+
+    # perl-modules should recommend every perl module, and only the
+    # modules. Don't attempt to use the result of do_split_packages() as some
+    # modules are manually split (eg. perl-module-unicore).
+    packages = filter(lambda p: 'perl-module-' in p, d.getVar('PACKAGES', True).split())
+    d.setVar("RRECOMMENDS_${PN}-modules", ' '.join(packages))
 }
 
 PACKAGES_DYNAMIC += "^perl-module-.*"
-- 
1.7.10.4


