Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.29649.1628808772016390563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Aug 2021 15:52:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=afABy6f9;
 spf=pass (domain: gmail.com, ip: 209.85.214.177, mailfrom: ticotimo@gmail.com)
Received: by mail-pl1-f177.google.com with SMTP id c17so4075542plz.2
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Aug 2021 15:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZuHX+3cCobL+nsg6SyH5JkOhzVJBZlelJfULzABKu4=;
        b=afABy6f9jICTCcVBwW+bucSFvsoaDO/KUol8BgGnJEtk2Tc0VyHU5IK0UbFd8RVyPu
         c3KRgzKFDa1S/hzqh6zywh+WMoYgHXY5RivgbdPrYhLnRomlOJp1Y5TDCCjeKdU1sOtN
         p/PicWM3YV9f8Jhr1Yl+TMY9XIG39ox6NG4xW/ft8MGjbCGa3gvZIDNSWpAB/xPnIo1/
         7FORxr4P/AuBePr8K1xdkUsKu5up26ytiDhC5HMRlEtYdpl/nfYJ1mkUys/VPY0EIWxK
         34BWcAl8mTRYFGGC9HVbtdHM8SYKrfVQ03Ag9WcQmrz05bcXD6660l/b4I2QhOmBJ5UG
         76hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jZuHX+3cCobL+nsg6SyH5JkOhzVJBZlelJfULzABKu4=;
        b=auePD4SHwCfZYt2yQeHonJ52FovVD9w+wcFOkDTGKMEAbgAMXBNZdVrABd+lJ6aLyr
         W8VYsEZZuU/8CNV32PFbGNq9uO69dbePNO8xSLte9tmnpNJc/RLV05L3caCg4uXOYZH7
         52DKibAdq+nIRgxQecT1flK7XeR9beKvCWSqMn+v6pXgyJXBF+0bmgS171SRzTHyNLSY
         Coj9RRVm6qhkWdQhhPxKNff3cAnyQSNDWsHz1B2OqA5gw4jImumTE2aOiq7MxyGqn3Qq
         CRo7KfO6oc47E/5Pgw5xucl3XhDwcEg7COxWBzHM+M4bVU33qnBDVBwu5kzPJjFThUeX
         x/zA==
X-Gm-Message-State: AOAM533DrrsJoh3bm63RLdXQDtfbGzWVTn2h6xx18z4Px9qwhAeOgVrQ
	ujB/tIJPl29NM0tzi2HIGpisVP7Twp82RA==
X-Google-Smtp-Source: ABdhPJxVH41jDse8hrzFuJFhmEn+Ch4cnGRlx+KSWeppNwi0zNBJUEoPlT7jJYGD3V/FDM+XdQEkug==
X-Received: by 2002:a17:902:e80a:b029:12c:58eb:1c8f with SMTP id u10-20020a170902e80ab029012c58eb1c8fmr5405854plg.59.1628808771175;
        Thu, 12 Aug 2021 15:52:51 -0700 (PDT)
Return-Path: <ticotimo@gmail.com>
Received: from nereus.local ([2601:1c0:6000:1830:722c:f107:144b:6ff3])
        by smtp.gmail.com with ESMTPSA id gz17sm11186053pjb.8.2021.08.12.15.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 15:52:50 -0700 (PDT)
From: "Tim Orling" <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <timothy.t.orling@intel.com>
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <timothy.t.orling@intel.com>
Subject: [PATCH] perl: do_create_rdepends_inc override syntax
Date: Thu, 12 Aug 2021 15:52:44 -0700
Message-Id: <20210812225244.1533009-1-timothy.t.orling@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The do_create_rdepends_inc function is used to recreate
the perl-rdepends.txt file. Update RDEPENDS_ to RDEPENDS:
for the new override syntax.

Signed-off-by: Tim Orling <timothy.t.orling@intel.com>
---
 meta/recipes-devtools/perl/perl_5.34.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/perl/perl_5.34.0.bb b/meta/recipes-devtools/perl/perl_5.34.0.bb
index cc01321f7a..ab19a8d0be 100644
--- a/meta/recipes-devtools/perl/perl_5.34.0.bb
+++ b/meta/recipes-devtools/perl/perl_5.34.0.bb
@@ -361,7 +361,7 @@ EOPREAMBLE
     awk '{if ($3 != "\x22"$1"\x22"){ print $0}}'| \
     grep -v -e "\-vms\-" -e module-5 -e "^$" -e "\\$" -e your -e tk -e autoperl -e html -e http -e parse-cpan -e perl-ostype -e ndbm-file -e module-mac -e fcgi -e lwp -e dbd -e dbix | \
     sort -u | \
-    sed 's/^/RDEPENDS_/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
+    sed 's/^/RDEPENDS:/;s/perl-module-/${PN}-module-/g;s/module-\(module-\)/\1/g;s/\(module-load\)-conditional/\1/g;s/encode-configlocal/&-pm/;' | \
     egrep -wv '=>|module-a|module-apache.?|module-apr|module-authen-sasl|module-b-asmdata|module-convert-ebcdic|module-devel-size|module-digest-perl-md5|module-dumpvalue|module-extutils-constant-aaargh56hash|module-extutils-xssymset|module-file-bsdglob|module-for|module-it|module-io-socket-inet6|module-io-socket-ssl|module-io-string|module-ipc-system-simple|module-lexical|module-local-lib|metadata|module-modperl-util|module-pluggable-object|module-test-builder-io-scalar|module-test2|module-text-unidecode|module-unicore|module-win32|objects\sload|syscall.ph|systeminfo.ph|%s' | \
     egrep -wv '=>|module-algorithm-diff|module-carp|module-c<extutils-mm-unix>|module-l<extutils-mm-unix>|module-encode-hanextra|module-extutils-makemaker-version-regex|module-file-spec|module-io-compress-lzma|module-io-uncompress-unxz|module-locale-maketext-lexicon|module-log-agent|module-meta-notation|module-net-localcfg|module-net-ping-external|module-b-deparse|module-scalar-util|module-some-module|module-symbol|module-uri|module-win32api-file' > ${WORKDIR}/perl-rdepends.generated
     cat ${WORKDIR}/perl-rdepends.inc ${WORKDIR}/perl-rdepends.generated > ${THISDIR}/files/perl-rdepends.txt
-- 
2.30.2

