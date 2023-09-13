Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30AC9EDEC6A
	for <webhook@archiver.kernel.org>; Wed, 13 Sep 2023 14:41:49 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.312.1694616102628324389
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Sep 2023 07:41:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=VuC/o2dZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so111526351fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 07:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694616101; x=1695220901; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OSOEutwil3ropt3mGf5FzgFQ8gNTQmrpVDO5wkbwIUg=;
        b=VuC/o2dZbBjSTK3JOjSGy3qeJwWBJKwGXkwLbZvUSzSfJd46u+71RpWbWmR2+vxkO/
         iZHab7kSoBkuSYUKKFAcv/yl10P+lmgYKw593IzHTImlRGBK9NqaNv0DvyyKdI9BO8e7
         gOQ3xGbxmP+sAMDEb9yBEkHHBILpja4bcpEHEZF8Yi4pbjMByR26bQJOdcBcXM0tFghH
         doOWggatt4r19oe8sO53OWitycZa0aQfxLeAoehgW2ijUnDDhzRjmmp5qpcWH2j24N6A
         TTxi+JZXJN0VOJIlG48cOt6jRffRipKWVt9eIDRl+nf7cmLc3DSq7g5QxdgDhBS9Kto9
         ZCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694616101; x=1695220901;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSOEutwil3ropt3mGf5FzgFQ8gNTQmrpVDO5wkbwIUg=;
        b=TeWj/OaMDMk7+CvhAp1vodDyY6gKOTFXUlcyi0G/l1t7gN5RcnDmTfXoNd8WT+4nVB
         Pp+/zIsviDfFgn6GuEwmJfIPatIIGCyI9k3sOkLJJz+zKpUsX3cpdmoQRF8J2OoutxG5
         ML3FInAh2TbUiKlq6mkXO9XphIxRtHlE/Cz+OBP79tyEMWufep5RMUgwdorzlRhsbIZI
         1eguT/BKtDQPxO3ZAOh77+I5GiqYIUkGILsP8AtmEUEZfr/TEGK9hlyvwilgMR2V4T8P
         eA5CTYY6ccFUorAcFE7UmAqnYAz3dSHWtw77Od7uiXXRfdDrCMSR1cj4BISYRmfiJYXx
         4X7Q==
X-Gm-Message-State: AOJu0YyIELLzv7o0a57rpijISfnH7lUHrofvLHukZ1w0dz9iPPt5Yltr
	GKqXdgvVTuzbiW0N+PKyLE3nnqK9P/0=
X-Google-Smtp-Source: AGHT+IGn9jN4ClobItiX8b8QC4gwjTr6eXkYC/LmeXtAWYZioE/3x1EFpczwTRmuTsmGILJ8vtnQZw==
X-Received: by 2002:a2e:80d3:0:b0:2b6:df23:2117 with SMTP id r19-20020a2e80d3000000b002b6df232117mr2863687ljg.43.1694616100482;
        Wed, 13 Sep 2023 07:41:40 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id p21-20020a170906229500b00992b8d56f3asm8526608eja.105.2023.09.13.07.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 07:41:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Steve Sakoman <steve@sakoman.com>
Subject: [kirkstone][PATCH] tcl: prevent installing another copy of tzdata
Date: Wed, 13 Sep 2023 16:41:32 +0200
Message-ID: <20230913144132.7404-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Sep 2023 14:41:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187604

From: Martin Jansa <Martin.Jansa@gmail.com>

It checks build host filesystem and if it doesn't find UTC or GMT
files it installs another copy of tzdata files in:
/usr/lib/tcl8.6/tzdata

Buildhistory shows the difference:
-PKGSIZE = 2227075
+PKGSIZE = 3433088

See the autodetection in configure.in:
  #------------------------------------------------------------------------
  #       Check whether the timezone data is supplied by the OS or has
  #       to be installed by Tcl. The default is autodetection, but can
  #       be overridden on the configure command line either way.
  #------------------------------------------------------------------------

  AC_MSG_CHECKING([for timezone data])
  AC_ARG_WITH(tzdata,
      AC_HELP_STRING([--with-tzdata],
          [install timezone data (default: autodetect)]),
      [tcl_ok=$withval], [tcl_ok=auto])

  #
  # Any directories that get added here must also be added to the
  # search path in ::tcl::clock::Initialize (library/clock.tcl).
  #
  case $tcl_ok in
      no)
          AC_MSG_RESULT([supplied by OS vendor])
      ;;
      yes)
          # nothing to do here
      ;;
      auto*)
          AC_CACHE_VAL([tcl_cv_dir_zoneinfo], [
          for dir in /usr/share/zoneinfo \
                  /usr/share/lib/zoneinfo \
                  /usr/lib/zoneinfo
          do
                  if test -f $dir/UTC -o -f $dir/GMT
                  then
                          tcl_cv_dir_zoneinfo="$dir"
                          break
                  fi
          done])
          if test -n "$tcl_cv_dir_zoneinfo"; then
              tcl_ok=no
              AC_MSG_RESULT([$dir])
          else
              tcl_ok=yes
          fi
      ;;
      *)
          AC_MSG_ERROR([invalid argument: $tcl_ok])
      ;;
  esac
  if test $tcl_ok = yes
  then
      AC_MSG_RESULT([supplied by Tcl])
      INSTALL_TZDATA=install-tzdata
  fi

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ace9fbfeb42ebf920812e3dd6d665b8b20a1ca0)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/tcltk/tcl_8.6.11.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
index 9f6b003ffb..b591671868 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.11.bb
@@ -44,6 +44,12 @@ inherit autotools ptest binconfig
 AUTOTOOLS_SCRIPT_PATH = "${S}/unix"
 EXTRA_OECONF = "--enable-threads --disable-rpath --enable-man-suffix"
 
+# Prevent installing copy of tzdata based on tzdata installation on the build host
+# It doesn't install tzdata if one of the following files exist on the host:
+# /usr/share/zoneinfo/UTC /usr/share/zoneinfo/GMT /usr/share/lib/zoneinfo/UTC /usr/share/lib/zoneinfo/GMT /usr/lib/zoneinfo/UTC /usr/lib/zoneinfo/GMT
+# otherwise "/usr/lib/tcl8.6/tzdata" is included in tcl package
+EXTRA_OECONF += "--with-tzdata=no"
+
 do_install() {
 	autotools_do_install
 	oe_runmake 'DESTDIR=${D}' install-private-headers
-- 
2.42.0


