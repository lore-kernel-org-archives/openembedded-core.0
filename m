Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 860F6C2FC2E
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 13:46:19 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.187966.1692279978546660062
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 06:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lZ6vnBdA;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-52256241c50so10439758a12.3
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 06:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692279977; x=1692884777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eaUX71lwmRm51r5GNuhWpYt3lIHFV+d3H3mhabj6l7I=;
        b=lZ6vnBdAEVXXoURKN998LedbFw78UU3gQ4RezLrzm2X7RVhVDcePswY+8+W2LM3GI+
         qx3Xh8AAKsElR+MqNapofAuZXsXPh1AeQpb6HC5iyxXiZ/dZUokMtvM3L6U7FwqAKo3z
         L3tTb7BPbq1EqEzFMR1m9Y4CpQgzTWAzBvNyRDdPoN7rYKHO1KtLHsOsbuXRQyrJSu3y
         Bt0AmrPEozwo0kgBMxg8ZCZAQKV8RxHoWUgEPv12AKOmMAxGGAx30xQUwP3b/ANLc3fN
         U9n5EXxyJIA2r62aLGzf+dFC2Z2B18nKuPVf7XNScUSIEBXC5rBMTV6WGOOCByjGbS8X
         YgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692279977; x=1692884777;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaUX71lwmRm51r5GNuhWpYt3lIHFV+d3H3mhabj6l7I=;
        b=F3pU7KjXAm3bZpLwvxE3Q+XSn00IYjtsA2SZu+z4mx7ZR9fyJ2PsudFLuVxjkxkfgn
         DnDqWbf37EEEPUNeULRGjgBQBIVvU69HF6Ls1OS1IRS8qqFqq+/9puHSS0UVb3KNftXJ
         TnPDrm2wlpqXIn0Z4iaBJI4U6/TM4QMdfF1e5qPYEVUMcOVkfTtHXMEekl8OIhkT6a5D
         /UJt7EefMNUZ+Kx6H0z9WYEmmLEP82rdFqFOGd4T5NL4Y+Nn52tfrCckh7kLARuUCick
         wa9iR/ZMONb6LVCc/LTfWBPRj94xkio04/2MryhCD4GCkEf4BYJ90ZEBvfbxrGSopmhQ
         nHXw==
X-Gm-Message-State: AOJu0YxKEhl3QRrVYzzmKCuYG/eWCsJtQ9VhICIHyNaCWQmFBMPTSz+i
	yn8RYKBTK5H2pD2k1TXkpvMm503UMfY=
X-Google-Smtp-Source: AGHT+IF1+AmYTOGLQpSkn9WCjNScWAwYMnFqu+LfL1ebw7JBa2kk+YK3wL21Es18dhr924n0ZL51BQ==
X-Received: by 2002:a17:906:847b:b0:99c:ae35:8cc with SMTP id hx27-20020a170906847b00b0099cae3508ccmr5692619ejc.26.1692279976603;
        Thu, 17 Aug 2023 06:46:16 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id lj9-20020a170906f9c900b00988be3c1d87sm10144283ejb.116.2023.08.17.06.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 06:46:16 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] tcl: prevent installing another copy of tzdata
Date: Thu, 17 Aug 2023 15:46:04 +0200
Message-ID: <20230817134604.1281692-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 13:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186317

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
---
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index 91fc81352e..9eb924b0da 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -41,6 +41,12 @@ inherit autotools ptest binconfig
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
2.41.0


