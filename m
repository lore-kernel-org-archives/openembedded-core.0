Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEC6CD4925
	for <webhook@archiver.kernel.org>; Wed, 20 Sep 2023 22:31:44 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.3160.1695249097850713845
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Sep 2023 15:31:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=zIx6pKNF;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.182, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-69002ef0104so231380b3a.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 15:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1695249097; x=1695853897; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ilen5iD0u5va4ZdnSxAzkDg4qbEvJel/dfxBv5X78ik=;
        b=zIx6pKNF8Py8Dhf4gTsr5NwqZYTBbCYrsRlzu08dLHDyO3E4tlBgcVG8ypqx7FGCFD
         S0N983r9Yn6unknnT8nMgnYMgOIdiZWSfc/eo72MGr6cBKEwUWPDTk3ktEZHhnHd5hC8
         B1hRZHKIfmnZV14Ysd8elzokYJGoEaH0YPyRltFY/OSqp1tVdeMN84sQq/EAnRnrVgrG
         tZW34evxDP4jZlKzJkXHCSJhY3PUuvJL2WI9q8XbcqwRX9TrRZz2iXP0eMMhK5ujCm7t
         S1b1n5nB87p6d7AsW42BsfQwfkeZ7DgmsnX3k+enwmRsTdcjZvAhbT7P/StKIWLTFfZm
         Sqww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695249097; x=1695853897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilen5iD0u5va4ZdnSxAzkDg4qbEvJel/dfxBv5X78ik=;
        b=D+D+oHBCs+jpaOQspJD5ljkgdiNETSuKlSJwHJqJS9xcb5ntWNSzKn8dG0MvvbRvsZ
         qhkkXaw0WXxBcBq/gcQRnPOpHbFuzvyxwNFv77f6rDBwf/v8zQrgKniwTho4VY6ybo9P
         nblxjzR99ZQaTP0QuItNcUHjzoGF7S+yut23xGp/sMq+rYgRTP6MawSpiHymNcxPf7sM
         HKWAXUf54/hkOTLrygmVYtdKLsVzsQB6XR/2/8l4prVTNj+idHAVDKnNfOnKBrP67WTI
         fr+RNNB+gFXZimuOK3WQynLf5EhFBbCgYj58vC09iy2RL/3cQ8tWBGDVKC6PszIwosyv
         zUQw==
X-Gm-Message-State: AOJu0YwmMz6f747Fu2Ym6bbtX7YmF1BiVw/FPeq82bmK2O+o6zBwifsp
	sRNBnwX3g5I/q7zyAoUZ7ke7wKMDCFylDolU0Z4=
X-Google-Smtp-Source: AGHT+IF1VrNbcgC05qillqpkNAUag4fyKU0eC+J4SyR3I51azPG/LhlsGZmaxPaDbu3xNuXHRtBQDw==
X-Received: by 2002:a05:6a00:1508:b0:68b:e710:ee9c with SMTP id q8-20020a056a00150800b0068be710ee9cmr3938905pfu.19.1695249096990;
        Wed, 20 Sep 2023 15:31:36 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id a13-20020a63704d000000b00578f1a71a91sm11535pgn.79.2023.09.20.15.31.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 15:31:36 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/20] tcl: prevent installing another copy of tzdata
Date: Wed, 20 Sep 2023 12:30:55 -1000
Message-Id: <79498ea0e9eb88ad0175f7376c57efb46217a4a4.1695248921.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1695248921.git.steve@sakoman.com>
References: <cover.1695248921.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Sep 2023 22:31:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187966

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
2.34.1


