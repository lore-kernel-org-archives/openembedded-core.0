Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED0BC47422
	for <webhook@archiver.kernel.org>; Wed, 24 Jan 2024 14:01:48 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.23025.1706104899856326331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jan 2024 06:01:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=VILVIiuk;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6db9e52bbccso3442358b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 06:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1706104898; x=1706709698; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lcf+BE0eO1mfPDau8gkLiylMTxQTTcsXj97aD0TioaE=;
        b=VILVIiukKHS1wZZRmv+z/dmj2O6zGTyV6AcnmPfiNUoPoKyDpkKp7HRmewU0/gk1sq
         RI2v86HLQuW0LZsFANy8ZTn2sZGUh7QVANvnbOS6fsFttPR7/Njuq2pfQ51pQpccSHgc
         Ev5+iJKg+fACKzZ7z8DCXjLi4LykZBbi+FL7MZ9zeTETVTvm76N8G398B7V3ghAZdo7L
         mOjMwPmbqjjt/93XaA9WfFKJRjUBfdcrUrp9OtGFgqFQgSY2B1FnqJ2na7xo8WdmZTcK
         9W53Uv0FWJmYEl0sPPj7xWTsV1/Bk90zliNPw2U+fdeKdwKq0WzfSFWx1+WAocptPPeU
         UiVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706104898; x=1706709698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lcf+BE0eO1mfPDau8gkLiylMTxQTTcsXj97aD0TioaE=;
        b=LVoekKA/hsBPx4HirE1nTkOeyZkk2ckp/rFUyh4DlOvQi9im7DCQGj4xr/ifAVjFQl
         4EkNGc1GWvkciHlR4iZ15ahFLamgq9cA/eGKqgCyVlSUAjSUqwH1Z6qo2Ngc6siM2CDf
         yz2z2vih1RseBaIjADu/Eq9Tz0Ztlrt4wVpXZ/o7tPw6qDsKl32uZIIQC6IsuLfiwfde
         LHTC1+1v5C/R8uRjnG7lln0Gl9xbSvZ2xjKpTyx+hQ4Ga9d+S8nJj3hANOiBBLFisnsU
         1ysT/xXrIujfgKSegMUd/PVc5oXTeJ3YofPnmzfq4JSuDgC5R2bHzu11HPrbbNXi8ncI
         cRKg==
X-Gm-Message-State: AOJu0YzR7glDnsoRUiL5IvsbBOpjeu+kJtZqnl+GpZLtyVS0TqyL4LjL
	NLUkRIbkm7NusQ5MCMFvkwiX+hWk2ANwkNn0LpG3X6J4mnj0XCngCNSB5vRrNcLrho15KMnYJG2
	BJik=
X-Google-Smtp-Source: AGHT+IF6s6Snz73NM3EN+PJucCCtGMVelegrNEloUZYBtf4EfPsldDDij40HqRQGbqw13sxOX4PUNA==
X-Received: by 2002:a05:6a00:1a90:b0:6db:cff7:bc4b with SMTP id e16-20020a056a001a9000b006dbcff7bc4bmr5091562pfv.48.1706104898220;
        Wed, 24 Jan 2024 06:01:38 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id 8-20020a631648000000b005ccf10e73b8sm11535739pgw.91.2024.01.24.06.01.37
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 06:01:37 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 07/12] sudo: upgrade 1.9.14p3 -> 1.9.15p2
Date: Wed, 24 Jan 2024 04:01:10 -1000
Message-Id: <105ecb87e78b9133e4188a8b5c604ea0e9a47910.1706104658.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706104658.git.steve@sakoman.com>
References: <cover.1706104658.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jan 2024 14:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194283

From: Xiangyu Chen <xiangyu.chen@windriver.com>

Changelog:
===========
1.9.15p2:
- Fixed a bug on BSD systems where sudo would not restore the
terminal settings on exit if the terminal had parity enabled.

1.9.15p1:
- Fixed a bug introduced in sudo 1.9.15 that prevented LDAP-based
sudoers from being able to read the ldap.conf file.

1.9.15:
- Fixed an undefined symbol problem on older versions of macOS
when "intercept" or "log_subcmds" are enabled in sudoers.
- Fixed "make check" failure related to getpwent(3) wrapping
on NetBSD.
- Fixed the warning message for "sudo -l command" when the command
is not permitted.  There was a missing space between "list" and
the actual command due to changes in sudo 1.9.14.
- Fixed a bug where output could go to the wrong terminal if
"use_pty" is enabled (the default) and the standard input, output
or error is redirected to a different terminal.  Bug #1056.
- The visudo utility will no longer create an empty file when the
specified sudoers file does not exist and the user exits the
editor without making any changes.  GitHub issue #294.
- The AIX and Solaris sudo packages on www.sudo.ws now support
"log_subcmds" and "intercept" with both 32-bit and 64-bit
binaries.  Previously, they only worked when running binaries
with the same word size as the sudo binary.  GitHub issue #289.
- The sudoers source is now logged in the JSON event log.  This
makes it possible to tell which rule resulted in a match.
Running "sudo -ll command" now produces verbose output that
includes matching rule as well as the path to the sudoers file
the matching rule came from.  For LDAP sudoers, the name of the
matching sudoRole is printed instead.
- The embedded copy of zlib has been updated to version 1.3.
- The sudoers plugin has been modified to make it more resilient
to ROWHAMMER attacks on authentication and policy matching.
This addresses CVE-2023-42465.
- The sudoers plugin now constructs the user time stamp file path
name using the user-ID instead of the user name.  This avoids a
potential problem with user names that contain a path separator
('/') being interpreted as part of the path name.  A similar
issue in sudo-rs has been assigned CVE-2023-42456.
- A path separator ('/') in a user, group or host name is now
replaced with an underbar character ('_') when expanding escapes
in @include and @includedir directives as well as the "iolog_file"
and "iolog_dir" sudoers Default settings.
- The "intercept_verify" sudoers option is now only applied when
the "intercept" option is set in sudoers.  Previously, it was
also applied when "log_subcmds" was enabled.  Sudo 1.9.14
contained an incorrect fix for this.  Bug #1058.
- Changes to terminal settings are now performed atomically, where
possible.  If the command is being run in a pseudo-terminal and
the user's terminal is already in raw mode, sudo will not change
the user's terminal settings.  This prevents concurrent sudo
processes from restoring the terminal settings to the wrong values.
GitHub issue #312.
- Reverted a change from sudo 1.9.4 that resulted in PAM session
modules being called with the environment of the command to be
run instead of the environment of the invoking user.
GitHub issue #318.
- New Indonesian translation from translationproject.org.
- The sudo_logsrvd server will now raise its open file descriptor
limit to the maximum allowed value when it starts up.  Each
connection can require up to nine open file descriptors so the
default soft limit may be too low.
- Better log message when rejecting a command if the "intercept"
option is enabled and the "intercept_allow_setid" option is
disabled.  Previously, "command not allowed" would be logged and
the user had no way of knowing what the actual problem was.
- Sudo will now log the invoking user's environment as "submitenv"
in the JSON logs.  The command's environment ("runenv") is no
longer logged for commands rejected by the sudoers file or an
approval plugin.

(cherry picked from OE-Core rev 5ea298680a8f17d3b808a2c43b0182e9c391f663)

Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/sudo/{sudo_1.9.14p3.bb => sudo_1.9.15p2.bb} (96%)

diff --git a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
similarity index 96%
rename from meta/recipes-extended/sudo/sudo_1.9.14p3.bb
rename to meta/recipes-extended/sudo/sudo_1.9.15p2.bb
index d5c5718ea5..431dfba3c2 100644
--- a/meta/recipes-extended/sudo/sudo_1.9.14p3.bb
+++ b/meta/recipes-extended/sudo/sudo_1.9.15p2.bb
@@ -7,7 +7,7 @@ SRC_URI = "https://www.sudo.ws/dist/sudo-${PV}.tar.gz \
 
 PAM_SRC_URI = "file://sudo.pam"
 
-SRC_URI[sha256sum] = "a08318b1c4bc8582c004d4cd9ae2903abc549e7e46ba815e41fe81d1c0782b62"
+SRC_URI[sha256sum] = "199c0cdbfa7efcfffa9c88684a8e2fb206a62b70a316507e4a91c89c873bbcc8"
 
 DEPENDS += " virtual/crypt ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam', '', d)}"
 RDEPENDS:${PN} += " ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-limits pam-plugin-keyinit', '', d)}"
-- 
2.34.1


