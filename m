Received: from esa1.mentor.iphmx.com (esa1.mentor.iphmx.com [68.232.129.153])
 by mx.groups.io with SMTP id smtpd.web09.1232.1617089394151310745
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Mar 2021 00:29:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: mentor.com, ip: 68.232.129.153, mailfrom: awais_belal@mentor.com)
IronPort-SDR: 8pgb7ECwrnl7KpGRg2uj9oeKUEAf6DaKgMtOD5U55vJ1QLeDLfgkbiawv1W9oWdL1wwR3TOKHu
 IutF2bTUhMhLOTtYlorXWsiWMbL4BbjSGzaPmAK8l4PWVWwpt0cZ2we4CvaJPu6/cXv8VI8NhI
 Mr9wu9gfD1YPuqFK49Ny4HH923BJVXvrTqzHyVU7ft94eaC7yYphqqGJU62Nngdx1ymfN8caHE
 xRQ1Z8tE533Sej7QVrMgxMGYB4mWHgY0bXd8y58lwi4K9gNu84POFsQE9ZaSmdTRba2aRBGPi8
 QM8=
X-IronPort-AV: E=Sophos;i="5.81,290,1610438400"; 
   d="scan'208";a="61964251"
Received: from orw-gwy-01-in.mentorg.com ([192.94.38.165])
  by esa1.mentor.iphmx.com with ESMTP; 29 Mar 2021 23:29:53 -0800
IronPort-SDR: 8YgWTjQqOn34Su+v72pXQ8Kfwf7B8wWI7ocJgWLKeYMnjNRc+EJvnr1FJh+ku+hMbiKccMcZ3T
 To9dKZiiXOdl2AXHkvbtv7W6EPKbh+EncMhKw8qd9B9ybfsbXqcdBgdwmwJBXEKhgQKqB85eqW
 xi+ESGdkyyCD6wA2/iQBMHsluWYQTnF9gnbfiIOimc2iG4pmEFRD8D1WmsYbXtDrrN1SMrYzVC
 OWjsEUP82OYiYID7qdeQCppnWo/SZ61jvSFraA+VBeQnVhgwZpUkJs98g5+jrkmrOL6dNDE1vf
 icI=
From: "Awais Belal" <Awais_Belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] perl: fix creation and generate new perl-rdepends.txt
Date: Tue, 30 Mar 2021 12:29:22 +0500
Message-ID: <20210330072922.29389-2-awais_belal@mentor.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210330072922.29389-1-awais_belal@mentor.com>
References: <20210330072922.29389-1-awais_belal@mentor.com>
MIME-Version: 1.0
Return-Path: awais_belal@mentor.com
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3)
Content-Type: text/plain

The creation of perl-rdepends.txt simply copied over the
generated list (perl-rdepends.generated) to perl-rdepends.txt
while missing out the manual dependencies placed in
perl-rdepends.inc. This caused missing runtime dependencies.
Additionally, the mechanism always appended which then
produced duplicated lines in perl-rdepends.txt if the creation
function is run multiple times.
We now concatenate both the .inc and .generated to the final
.txt so manual and generated both types of dependencies make
it to the final configuration. A new perl-rdepends.txt is then
generated with these fixes.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-devtools/perl/files/perl-rdepends.txt | 8 ++++++++
 meta/recipes-devtools/perl/perl_5.32.1.bb          | 4 ++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/perl/files/perl-rdepends.txt b/meta/recipes-devtools/perl/files/perl-rdepends.txt
index e7cd551988..f20fc44b58 100644
--- a/meta/recipes-devtools/perl/files/perl-rdepends.txt
+++ b/meta/recipes-devtools/perl/files/perl-rdepends.txt
@@ -1,3 +1,11 @@
+
+# Some additional dependencies that the above doesn't manage to figure out
+RDEPENDS_perl-module-file-spec += "perl-module-file-spec-unix"
+RDEPENDS_perl-module-math-bigint += "perl-module-math-bigint-calc"
+RDEPENDS_perl-module-thread-queue += "perl-module-attributes"
+RDEPENDS_perl-module-overload += "perl-module-overloading"
+
+# Generated depends list beyond this line
 RDEPENDS_perl-module-anydbm-file += "perl-module-strict"
 RDEPENDS_perl-module-anydbm-file += "perl-module-warnings"
 RDEPENDS_perl-module-app-cpan += "perl-module-config"
diff --git a/meta/recipes-devtools/perl/perl_5.32.1.bb b/meta/recipes-devtools/perl/perl_5.32.1.bb
index 65db6da2b5..b28040c7fb 100644
--- a/meta/recipes-devtools/perl/perl_5.32.1.bb
+++ b/meta/recipes-devtools/perl/perl_5.32.1.bb
@@ -370,8 +370,8 @@ EOPREAMBLE
     sort -u | \
     sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
     egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-socket-inet6|module-io-socket-ssl|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-test2|module-text-unidecode|module-unicore|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' | \
-    egrep -wv '=>|module-algorithm-diff|module-carp|module-c<extutils-mm-unix>|module-encode-hanextra|module-extutils-makemaker-version-regex|module-file-spec|module-io-compress-lzma|module-locale-maketext-lexicon|module-log-agent|module-meta-notation|module-net-localcfg|module-net-ping-external|module-b-deparse|module-scalar-util|module-some-module|module-symbol|module-uri|module-win32api-file' >> ${WORKDIR}/perl-rdepends.generated
-    cp ${WORKDIR}/perl-rdepends.generated ${THISDIR}/files/perl-rdepends.txt
+    egrep -wv '=>|module-algorithm-diff|module-carp|module-c<extutils-mm-unix>|module-l<extutils-mm-unix>|module-encode-hanextra|module-extutils-makemaker-version-regex|module-file-spec|module-io-compress-lzma|module-io-uncompress-unxz|module-locale-maketext-lexicon|module-log-agent|module-meta-notation|module-net-localcfg|module-net-ping-external|module-b-deparse|module-scalar-util|module-some-module|module-symbol|module-uri|module-win32api-file' > ${WORKDIR}/perl-rdepends.generated
+    cat ${WORKDIR}/perl-rdepends.inc ${WORKDIR}/perl-rdepends.generated > ${THISDIR}/files/perl-rdepends.txt
 }
 
 # bitbake perl -c create_rdepends_inc
-- 
2.17.1

