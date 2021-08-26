Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.29981.1629982761239317165
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 05:59:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=W//4rulO;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629982761;
  x=1661518761;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BTE3llTCTAf6X+uisLwGcdTvP7Zt0JANdHYP/TC5Rxc=;
  b=W//4rulOskfQ/U18IlzuVtZ4WuwvlXp10IqiBG2IuGX8hYAD81fzjlju
   WaSg5lQMKNfF0+hnnq2nDWOsJwaPCXrBYkUipFMke+VciLmpLtIzp8iwC
   GD6nKXzDZ20xA5pSqVcx43Nun9jYSQEjnjX8ozwxmYNokruEppMaYkDhK
   TJ29pprZmiWfvalPbTgp4oAkNR2cP2EPXT5BpVc7cjQJ96cF2ZlIsPE/H
   WMgz4xkF/KOy/r1zLcmc1uL6tvv9EDXj/d7+6vrreWzmH+07/3BcQiTbK
   PzElU7TaNlQxsBkGTwm0Uyo605LMopX1k8GnGseAXAjNtmAlBMRo9oWAc
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] meson.bbclass: Make the default buildtype "debug" if DEBUG_BUILD is 1
Date: Thu, 26 Aug 2021 14:59:12 +0200
Message-ID: <20210826125912.18487-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Setting the Meson buildtype to "debug" will by default only enable the
-g option to the compiler, which should not matter for OE-Core as it is
already enabled by setting DEBUG_BUILD to 1 in the first place. However,
if the package uses get_option('debug') in its meson.build files to
enable package specific debug code, this will now trigger as intended.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index 2beed89d11..e124d18144 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -12,7 +12,8 @@ MESON_SOURCEPATH = "${S}"
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
-MESON_BUILDTYPE ?= "plain"
+MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
+MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
 MESONOPTS = " --prefix ${prefix} \
               --buildtype ${MESON_BUILDTYPE} \
               --bindir ${@noprefix('bindir', d)} \
