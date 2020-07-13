Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web11.20232.1594649868571990877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jul 2020 07:17:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CdJ/nlz/;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id t15so6320480pjq.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Jul 2020 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=n/Zpov22VS0OPd5Wxe5fqKRyZbJPR0naDJuXGQqs93Y=;
        b=CdJ/nlz/i9yt74fXxBp/MAxU83D0R+Rsdjk3YdpcGwvYFgAEuSAFtJ+aInrOWhk0z1
         rsPxoq1HOdLUXbBRdBMUHzyB8+T6IZXrVQUHrqCEwYZd71NeEhaF5SAbhyAFCPkImf5I
         C/EqH9Ny/g5nutVDFHQfDP9zAIXlu9c8SaF62z8DqGtBsmHxYlpntfGepxTDUh7g+Opj
         TNrcXgdgO/633fF4pmdnYzM64yV25+plXhfDVJziUNB2Za99bOShNhXZJubo7Bee+/3x
         SS2ar2GK8LU6QNPEm+32mGp/Fh/TjmgyONe/0IPKuo9VC1269bKbZqyZ5diOhNmQ8BG4
         u6wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=n/Zpov22VS0OPd5Wxe5fqKRyZbJPR0naDJuXGQqs93Y=;
        b=bjIpvEhtano31NkzAu4SieYeX1DEfx0R5r9R/QEZRX9Ji8XGSk1FtgEFTAfZtCMTfm
         sXEzpb3qRKffGzWqBBzdzmOktnN+ite1/VGIaOLLVwAzLgeyRPlP8/V7c7Tlqrhhg1of
         4zO3BtDZZhbFyLA+GHCASn+6/shpHHVTdTu8i9QJgCcaFkKOiNuN5Of9xJDBy8OuwJW3
         g+clNjHj6OqxEdH0eByJUoRxwA5NAtOp1XsVOcecWPx5q4alU0zYOXMSkJaBbptJ9ruS
         y71J4cOcwVm8UFUrZszT7bPrx2lWOzufToLfsp2R4asEYB/H0UmROTcQ7BCfgPMWAKqI
         jgqA==
X-Gm-Message-State: AOAM531v8iTAeGsOOZoVsIpIonIXU51bQfkIAeM9DIuyU77l16lIFKkb
	ltwyS2z5dgt9AazkNyIo8lE0AkjopNxt7Q==
X-Google-Smtp-Source: ABdhPJxelIeKOH44yxcNvWf5ZEYH5y711iMRb1xxUZ8b9yWm7MBrtD/rwAUNYVU3Eun4qKVgM4miyw==
X-Received: by 2002:a17:90a:d306:: with SMTP id p6mr2054433pju.25.1594649867547;
        Mon, 13 Jul 2020 07:17:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id k7sm13723738pgh.46.2020.07.13.07.17.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2020 07:17:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/15] openssl: move ${libdir}/[...]/openssl.cnf to ${PN}-conf
Date: Mon, 13 Jul 2020 04:17:00 -1000
Message-Id: <89736eaa7352cf9d1c73d4427be76683ee56bbb4.1594649587.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1594649587.git.steve@sakoman.com>
References: <cover.1594649587.git.steve@sakoman.com>

From: Hannu Lounento <hannu.lounento@vaisala.com>

Some openssl command line operations like creating an X.509 CSR require
the file /usr/lib/ssl-1.1/openssl.cnf to exist and fail if it doesn't

    root@qemux86-64:~# openssl req -out my.csr -new -newkey rsa:2048 -nodes -keyout my.key
    Can't open /usr/lib/ssl-1.1/openssl.cnf for reading, No such file or directory
    140289168594176:error:02001002:system library:fopen:No such file or directory:../openssl-1.1.1g/crypto/bio/bss_file.c:69:fopen('/usr/lib/ssl-1.1/openssl.cnf','r')
    140289168594176:error:2006D080:BIO routines:BIO_new_file:no such file:../openssl-1.1.1g/crypto/bio/bss_file.c:76:

which is the case e.g. in core-image-minimal with just the
package openssl-bin added to the image by declaring

    IMAGE_INSTALL_append = " openssl-bin"

e.g. in local.conf.

The file did not exist in the aforementioned image / configuration
because it was packaged to the main openssl package

    FILES_${PN} =+ "${libdir}/ssl-1.1/*"

(there is no other FILES specification that would match the file either)
and

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-1.1.1g-r0.core2_64.rpm
    [...]
    /usr/lib/ssl-1.1/openssl.cnf
    [...]

Hence move /usr/lib/ssl-1.1/openssl.cnf (and openssl.cnf.dist as it
seems closely related) to the ${PN}-conf package to have it installed
with ${PN}-bin, which already (indirectly) depends on ${PN}-conf.

Note that the openssl recipe has the comment

    Add the openssl.cnf file to the openssl-conf package. Make the libcrypto
    package RRECOMMENDS on this package. This will enable the configuration
    file to be installed for both the openssl-bin package and the libcrypto
    package since the openssl-bin package depends on the libcrypto package.

but openssl-conf only contained /etc/ssl/openssl.cnf

    path/to/poky/build$ rpm --query --package --list tmp/deploy/rpm/core2_64/openssl-conf-1.1.1g-r0.core2_64.rpm
    /etc
    /etc/ssl
    /etc/ssl/openssl.cnf

/usr/lib/ssl-1.1/openssl.cnf is actually only a symlink that points to
../../../etc/ssl/openssl.cnf.

Other files and directories in /usr/lib/ssl-1.1/ were considered as well
because they seem to be configuration files and / or related to
(symlinks pointing to) /etc. They were not moved though, because based
on our use case and testing moving the openssl.cnf symlink is sufficient
for fixing the immediate problem and we lack knowledge about the other
files in order to make a decision to change their packaging.

Signed-off-by: Hannu Lounento <hannu.lounento@vaisala.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c1632d7041fe0c18ec61abfa79a9c025af43c033)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssl/openssl_1.1.1g.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
index 66fa8f7d0a..47ed6b7640 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.1.1g.bb
@@ -191,7 +191,9 @@ PACKAGES =+ "libcrypto libssl openssl-conf ${PN}-engines ${PN}-misc"
 
 FILES_libcrypto = "${libdir}/libcrypto${SOLIBS}"
 FILES_libssl = "${libdir}/libssl${SOLIBS}"
-FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf"
+FILES_openssl-conf = "${sysconfdir}/ssl/openssl.cnf \
+                      ${libdir}/ssl-1.1/openssl.cnf* \
+                      "
 FILES_${PN}-engines = "${libdir}/engines-1.1"
 FILES_${PN}-misc = "${libdir}/ssl-1.1/misc"
 FILES_${PN} =+ "${libdir}/ssl-1.1/*"
-- 
2.17.1

