Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web09.10274.1619186438954661574
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Apr 2021 07:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=bX/o/nZJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.171, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f171.google.com with SMTP id b17so35257533pgh.7
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Apr 2021 07:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=S6o7w2gMrY23kDghpiV6fVoWk+RHHvHTN+b3lkZP4I0=;
        b=bX/o/nZJP/iv3691xHU0oR51ehvPHB5Ndvrpev3UDXp6gkA4ENWQEpTvBt1ioo780B
         IyyGD7iAvzJJz8eQEw0HH7kCQ+/DOguxaRBbYVY1sY/LcZDBlwJevDNAst+s+CQCaFI6
         B5ed3CZSLMTwnIJYvawv/Gg0x9oVkUh7sm3GtY+YBMJMgigI2qkSuh3i6MFmZHczQ/5O
         VStVsSs44HcvazO4tA+8Z8m7p878Tk7yFjEGXYpaCKNeF06bGusHEpn2b3xRb4PY4U2B
         bai2RspgdIEeGxKFaYm5VnEYbn4pUDckQA9O9cmTi22WKj3veIWDwD9p+nk/g7DbJpxt
         j7aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S6o7w2gMrY23kDghpiV6fVoWk+RHHvHTN+b3lkZP4I0=;
        b=FsNsCvdGuq95xD8HWM6cy9kszEhSYFZxBvs5GJwf3k9fLfUgW44SDfthups1bB8QYD
         +hIOosADMkNflx+dedEwXXpOCo3/VU7lsNtusA5Wl3cuGqP09wDAAK7vqX8Eww79OfLz
         PFkwBmFXaa1C76FvDUozavITCtqXT1k4q1W1MEnmUyQ4Je81fWD/3pi/FmFZ0ry7fNKV
         6CwURapZEqh7Mh8WPpZyS4tHiTwK3/XFGp133l6yruJzCXNBVfY+R+3f6tusST3KvLsd
         whJ2kK/dpqofK91oytEh6PatSOWie1P/iLEDoiXk7OoWZW4+DBGrHODpCkuiRSv4PTbj
         ferg==
X-Gm-Message-State: AOAM531WVkzD9i1YM2NYzsrFOH5mbikx5WG/p5Z77DiS00wIRZIYX++U
	PLOTwMqR8OgGXaQTGTOoLRC0GHsmbqBAD5MV0/s=
X-Google-Smtp-Source: ABdhPJwQwIrYyIuIqgp1rKLRc2Xzs7Mh767vCMwW0t3NZVYOnXqRRLLSCEllrkAo0Cd3WBSNfXP6Lg==
X-Received: by 2002:a63:ee0d:: with SMTP id e13mr3837140pgi.375.1619186438003;
        Fri, 23 Apr 2021 07:00:38 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b25sm4988379pfd.7.2021.04.23.07.00.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 07:00:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/19] ca-certificates: Fix openssl runtime cert dependencies
Date: Fri, 23 Apr 2021 03:58:57 -1000
Message-Id: <ba2774dc6ba119094861c0723858e4b47e9b7eed.1619186107.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1619186107.git.steve@sakoman.com>
References: <cover.1619186107.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

With commit dc778c70449ee5401b5a24ad18b22b88338c47c5, dependency was
moved to openssl-bin which in itself was a fine change, but dropping
dependency on openssl too should have been kept along, dropping this
meant that openssl binary wont be able to validate secure connections as
the CApath files wont be installed, which infact are required for
openssl bins to work, following call e.g. fails

$ openssl s_client -connect google.com:443

....
New, TLSv1.3, Cipher is TLS_AES_256_GCM_SHA384
Server public key is 256 bit
Secure Renegotiation IS NOT supported
Compression: NONE
Expansion: NONE
No ALPN negotiated
Early data was not sent
Verify return code: 20 (unable to get local issuer certificate)
....

The local issuer certs are not found in default location
/usr/lib/ssh-1.1/certs, this dir and its content is installed by openssl package
therefore re-add the dependency on openssl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eaf377315efc73d6ffe361372a873918b3bb3bf5)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../ca-certificates/ca-certificates_20210119.bb             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
index 888a235c1a..7dcc86fdc1 100644
--- a/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
+++ b/meta/recipes-support/ca-certificates/ca-certificates_20210119.bb
@@ -83,8 +83,8 @@ do_install_append_class-native () {
     SYSROOT="${D}${base_prefix}" ${D}${sbindir}/update-ca-certificates
 }
 
-RDEPENDS_${PN}_class-target = "openssl-bin"
-RDEPENDS_${PN}_class-native = "openssl-native"
-RDEPENDS_${PN}_class-nativesdk = "nativesdk-openssl-bin"
+RDEPENDS_${PN}_append_class-target = " openssl-bin openssl"
+RDEPENDS_${PN}_append_class-native = " openssl-native"
+RDEPENDS_${PN}_append_class-nativesdk = " nativesdk-openssl-bin nativesdk-openssl"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.25.1

