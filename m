Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web11.8589.1594982046495675096
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2020 03:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Z/Tizn1O;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: rehsack@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id d16so7237959edz.12
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Jul 2020 03:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=oB6GWXo9tMr9At0tlMHDKxoQ8QEsNiGaHo/M0HX4AWk=;
        b=Z/Tizn1O63O7WnLr+/cBvtJak4HP0g+wHwKRZbU2cD8HfQFPJ1psky+pxlYn8Oroe7
         C6oyY0HGjakh2V0vbg11bJB7w6EOsd1PpMq33vm5toHv+IMi/svbOYNouWTchR7fX0ji
         Hl3WfH2jpO8HqY+8hQBwTDPta+cjMCpBY8mzKecsu1onolvREMSd9grA1HV0FstJJlQD
         nN2MWRsw69FT2s+IugcMd5jhDraANLrvm04JpLwXcxvmTI4OTbdJcU7q6yPf51l0sawx
         05ERa8GufQfS8o3c1id9uGzG/ctiRWUh8d6Pv2w7XFUJ+Q/eoQrqXl6na0aHHG+fMklH
         EA9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=oB6GWXo9tMr9At0tlMHDKxoQ8QEsNiGaHo/M0HX4AWk=;
        b=ADjNUsboLq1eZ4M77OzARvJFsAXv+tU61xY8WOIV1twnyx2M2xBfnn8W5Y6iK6QWYg
         QWiqRn2JSXLPL8Hyq2efncaqsqR0FEFH4N7Vd9Be4OXXCpP9ECHtsW34M0F5bjLcivLP
         IBfMIii/PNeFDzX6mD9hacdnc+KF15XIuNfm3xZd5WWMpPBt6AGlwz9hVxyn4KDAH7S3
         22WfUUEROObBLFa4b/wUhhmyawrQTmwpx0zRljucJYD90VgO+M1xEM2+tw67slGjS2dO
         z6QZZVb6N2lkpKINdWRw2JqYqROPMbZFwZEYznzwpVu6k9YSHhhld6zs9NweWg+Kcxc1
         wSFA==
X-Gm-Message-State: AOAM531ojQ5ZJ0wwkpjdrUbGiOqHi3IVTbPVSRedwJEcZnOUm20NVhzw
	WVzsv/bhoQpmOJTUtAqw8iQJczFr
X-Google-Smtp-Source: ABdhPJwcNHxpabg4giagwZLWV3MwEBhF7E5U5BEH09Usv2CKqBpDcR87LzhnqHI59sxs3Gyntdib4Q==
X-Received: by 2002:a05:6402:1778:: with SMTP id da24mr8868998edb.126.1594982044796;
        Fri, 17 Jul 2020 03:34:04 -0700 (PDT)
Return-Path: <rehsack@gmail.com>
Received: from beaker.muppets.liwing.de (p5b25b9cc.dip0.t-ipconnect.de. [91.37.185.204])
        by smtp.gmail.com with ESMTPSA id o21sm7567537eja.37.2020.07.17.03.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 03:34:03 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: "Jens Rehsack" <rehsack@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jens Rehsack <sno@netbsd.org>
Subject: [OE-core][RFC 2/2] buildtools-tarball: eliminate overwtiting OPENSSL_CONF
Date: Fri, 17 Jul 2020 12:33:48 +0200
Message-Id: <20200717103348.17225-2-sno@netbsd.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200717103348.17225-1-sno@netbsd.org>
References: <20200717103348.17225-1-sno@netbsd.org>

Remove overwriting of OPENSSL_CONF from buildtools-tarball.bb to clarify
whether nativesdk-openssl installs wrong content or buildtools-tarball:
    (nativesdk-openssl) tmp/sysroots/x86_64/usr/lib/ssl-1.1/openssl.cnf
    (buildtools-tarball) buildtools/sysroots/x86_64-pokysdk-linux/etc/ssl/openssl.cnf

Signed-off-by: Jens Rehsack <sno@netbsd.org>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index d0f8dd7d7c..02e662b5cc 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,7 +75,6 @@ create_sdk_files_append () {
 
 	echo 'export GIT_SSL_CAINFO="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	echo 'export SSL_CERT_FILE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
-	echo 'export OPENSSL_CONF="${SDKPATHNATIVE}${sysconfdir}/ssl/openssl.cnf"' >>$script
 
 	if [ "${SDKMACHINE}" = "i686" ]; then
 		echo 'export NO32LIBS="0"' >>$script
-- 
2.17.1

