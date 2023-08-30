Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF1E2C83F01
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 17:49:09 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web10.1306.1693417746724990322
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 10:49:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=g+OnLLFy;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-68a3b66f350so5016698b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1693417746; x=1694022546; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDoUfrvvGOv7l0jfkj9sjNm/l12J1w8y7H2YF0l1fKs=;
        b=g+OnLLFy16DSnw2uvgMd0+/VX7bxyfKmO86E+xz41DuGAYS8IqYFBoXcp0vAu851rk
         nnvf/y8uy/JFhQZFZDnHDri4k/6JxN8gvtMUYHh9fkldVmC0agr95FYEkqB72BbO2LWa
         oLhmQ5k3+zslTZgaQTLWifpKlawrnC/jiYveGC7f3I69zZ3FJXsoObkd0Rv85eAfhEiJ
         KnGUL2iQeYdcm5B/Ix/VKuLpDuu9ergV42Y2tBq1eXpMtLCpy77oa1fPuBrgrKDnukRV
         prW8vTxU6eVf6vMOU8OQSk92cVo5jSi+F68PELoPKDlmk+Ph59yqCk/Cotf9GMcmkO8K
         7ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693417746; x=1694022546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDoUfrvvGOv7l0jfkj9sjNm/l12J1w8y7H2YF0l1fKs=;
        b=iRIPVYRtw/bafcOzWz06+jooRhS5J1RjGJ7waXCQjOau4wJTBxRbk3YSnAbLhYryio
         buepmemz0wnaHwn6SOH0ju4PAKyZ9zhyzZbHgnuVp3ACyAJ4OhwZBzS0DSJcsKk1I0Ca
         4PMkZvwEUS/CqP5oV3auhbgQrKcTNyQCvNri0LAMBnmSrfZlX+tqFVDOjcecAmtw8h93
         MUcVnffWNICNxSoA0sJKsFpkn6vCj1TVN77uQeXFhnraHEMCD1Aqnnd9e4UDDe4kZWH7
         kAYoYlUiUj8oMpu0DLhYWdJuyuW3gkigEsJy5mVO+w8lpr5xQ0ZXh1bOLL7G0Oek9t4D
         zwig==
X-Gm-Message-State: AOJu0YxmTcIn6BtQY5rnbI+4+mGe8yceo1LsXtHdZU5h2bIz0hll4ouD
	B4B5EhDrxc3Gswba0QKIBBIWL/jBSZL3nwqxqjc=
X-Google-Smtp-Source: AGHT+IF3m+KUDM1GAEjy3buthjeW+eMm2e8xQWD2Kb31nKYjnRkY5AG7SbZYVvXf8iSBO897zxVJYQ==
X-Received: by 2002:a05:6a21:7807:b0:14c:d0d2:326d with SMTP id be7-20020a056a21780700b0014cd0d2326dmr2555008pzc.61.1693417745778;
        Wed, 30 Aug 2023 10:49:05 -0700 (PDT)
Received: from xps13.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id fm14-20020a056a002f8e00b006889348ba6dsm10567578pfb.93.2023.08.30.10.49.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 10:49:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 16/20] tcl: prevent installing another copy of tzdata
Date: Wed, 30 Aug 2023 07:48:20 -1000
Message-Id: <d5a038b764720bd3267f258994371909f3f34ad6.1693417541.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1693417541.git.steve@sakoman.com>
References: <cover.1693417541.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 17:49:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186918

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
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
index 982f370edb..921ea7a01d 100644
--- a/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
+++ b/meta/recipes-devtools/tcltk/tcl_8.6.13.bb
@@ -45,6 +45,12 @@ inherit autotools ptest binconfig
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
2.34.1


