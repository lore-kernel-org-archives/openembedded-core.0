Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A737C64ED6
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 21:24:17 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web10.19565.1676150652604908565
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Feb 2023 13:24:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=I76YKwyb;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id a8-20020a17090a6d8800b002336b48f653so7470570pjk.3
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 13:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9HhoXqTm7NGsxvfx09idKWjJvv/BZS5wYSkFr02DAQA=;
        b=I76YKwyb2EQJ99KSnKSRfiuMl46vUO2/7yAqvA2+2hzTpavAWsdFnIfnnKe+clQ10A
         eCF25L83v6tMLrl/2ry5mWjeO9gp7sRUWm/7B6NF2hTM99lf5MYGzPnUG/Y7+VIK0olH
         hsYChyiD5/RFxyB1nP/fAxHAL924o62AWAalZLUswvb7FyZ6Cn/XAClgugTeDIVWtFKj
         ELwY0KM7FrwYdbhnMySZYFlrEntWhsLCJJJI7iuatpjhjyUEulMZ9R6Bp+6E5in9I2LT
         0bBjFZ5kqE1rV4jimt7fS5Qd2vuJ6rK0Mb1GVjvYbZJpVdthJMm4YHSAQJ5WmcvJhcFJ
         GBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9HhoXqTm7NGsxvfx09idKWjJvv/BZS5wYSkFr02DAQA=;
        b=ze3n2laD4jdmF3o3Y0fGzQ36THNnPmGN4GwCAx2GXGu2KLKlL77hIcvHUh+Nog8mha
         F+TNwFrt3iS+2nHPyxtbgEFsPTq3Wox7F0cgnXc0I5fGx8FxTuVTX4Zyd09l9O0iZ22X
         lLqKJgrl5tXsLJWOm6Iw3Cm7PsIlBTrJXOSGafwWEFnRjX9h3zywj4xh0TKjQ7g6A111
         C+JfnNT7vi5gMEPwDFcNfoRm47VerJlVxcinssqjwtmNaV5WOB1b33ZXWAACIkH9r6HV
         Z+sCPRlaMbTbkN9YXw5ctXohQyiAKII3cS9p48UEhgMPo/cSvV47mV8orREbYj0e0bnS
         ODDw==
X-Gm-Message-State: AO0yUKUukRzO6wdAmKj+YIYeUhwVYoO4REfVJcXyZ3txLDeydvNOXKXQ
	aX6wg1aHCsg3e3gv0QzFCLHvqbJ4YtvOlNxiuYg=
X-Google-Smtp-Source: AK7set/jGzllCzPVXiBNIvK9gZuNbeyvAWjgfn8O7GxL4ST0cIDjpVUAb8mYNqrkWBnwgvI19oon9w==
X-Received: by 2002:a05:6a21:6d81:b0:af:c871:c723 with SMTP id wl1-20020a056a216d8100b000afc871c723mr24341537pzb.33.1676150651735;
        Sat, 11 Feb 2023 13:24:11 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id v23-20020aa78097000000b0059393d46228sm5398595pff.144.2023.02.11.13.24.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 13:24:11 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][langdale 08/28] buildtools-tarball: set pkg-config search path
Date: Sat, 11 Feb 2023 11:23:31 -1000
Message-Id: <407e859edabb4e3527740a96a0dc8e0383c77f99.1676150527.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676150527.git.steve@sakoman.com>
References: <cover.1676150527.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Feb 2023 21:24:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177018

From: Ross Burton <ross.burton@arm.com>

The buildtools-tarball includes a native sysroot with .pc files, and
in the case of buildtools-extended-tarball a pkg-config binary too.

If we're using the host pkg-config then it doesn't know to search in the
native sysroot.  If we're using our pkg-config then it searches in the
build-time prefix and not the actual SDK installation location.

Neither of these are correct, so set PKG_CONFIG_LIBDIR to search:
- The native sysroot
- The host pkg-config's default search path, if present
- Falling back to /usr/lib/pkgconfig, if not

In an ideal world this would be handled by the generic toolchain script,
but that is slightly more involved.

[ YOCTO #15007 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 8f768a3f4c7ff477e994d60800e5a1b83891615a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-tarball.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-core/meta/buildtools-tarball.bb
index de399173ba..34f7773398 100644
--- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -75,6 +75,9 @@ create_sdk_files:append () {
 		echo 'export REQUESTS_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 		echo 'export CURL_CA_BUNDLE="${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certificates.crt"' >>$script
 	fi
+	echo 'HOST_PKG_PATH=$(command -p pkg-config --variable=pc_path pkg-config 2>/dev/null)' >>$script
+	echo 'export PKG_CONFIG_LIBDIR=${SDKPATHNATIVE}/${libdir}/pkgconfig:${SDKPATHNATIVE}/${datadir}/pkgconfig:${HOST_PKG_PATH:-/usr/lib/pkgconfig:/usr/share/pkgconfig}' >>$script
+	echo 'unset HOST_PKG_PATH'
 
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
 
-- 
2.34.1


