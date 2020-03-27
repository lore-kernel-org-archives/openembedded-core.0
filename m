Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.511.1585347800388294679
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Mar 2020 15:23:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mbw8C1PS;
 spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: jpuhlman@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id z5so11209559oth.9
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Mar 2020 15:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gpCQUqZe6BpzAkw3BUhR9Dn7QA0f/2lQN7pw/mO8Lj8=;
        b=mbw8C1PSjQGVeQteNuYTiYNPCpDr9BmbuVggdBrMZi59jGy+lRxJXOdbK7jyCp3RGm
         iXZ+mqN2Ia+WWeUlVpWWB47fxEgRKS7vmRcceanFIZU1iUjVuZ4GsHedutMaiE+0nn0y
         osqvoOM8Ggmhv9+0LBbIJzPEt0x8r7T29N3Tb8MnPkUnQUqMI33nkeGuaISE73vVqFJE
         uL7bRygMhIwmNqciREzAnDfH8wBSzcnFGfpbyhU81GSLbp/oBYmrv8N1Qs93oWxXVUX9
         /v3yf2Jt1k9SoHd5OFogRY3R5dSux8x56lGY76iWO9BWLS3o+4SNYX/p/1nmjpldQudK
         a4iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=gpCQUqZe6BpzAkw3BUhR9Dn7QA0f/2lQN7pw/mO8Lj8=;
        b=CKMArR869VoMoRrvKq1Nb/lPfF/qzRN31IQ3N60WMqhPuVGOUqVZaKvpFdEGGmwiY8
         y+BVOpejlBehUGMN3W2Gm/9k3YsdIVyxEIhm0dS1+t3Y/fidQi8Ts/VQpHxmU/J+lB/m
         QrJMTnXOBuelI91obQ/6J07sinog9i7hawiWxsuD9VcoruLtvNQilgRLMV3lc/WKvHcy
         6sR8zbtJ6sCL2hcRsP+ORSL1Ksk/ChGQ4XA2i7SFkDIaU1DNexr7C68/tD1F0vYtIx4O
         1C4ppW3yOkuaTtvbx+vQsXlt+eyvWTQ2kYp8Hw6KrhVfJNQ+hgv4v9UZgXHR5Bz2qd0u
         LmJQ==
X-Gm-Message-State: ANhLgQ23m/JReBn3dFIfX/m93PYVsW8357WqQ87rq1LnC7xU9vrSKNwF
	ndJE3z+xep+X0NIic+Q+b93pmcFG
X-Google-Smtp-Source: ADFU+vtmpa8ht1o6G43uoAhJ/7PFDGofvzj45dM7HuQtMnP41Mv3fngC7FBuAUr5Y0vjA9KrTry5qw==
X-Received: by 2002:a9d:5888:: with SMTP id x8mr674191otg.361.1585347799516;
        Fri, 27 Mar 2020 15:23:19 -0700 (PDT)
Return-Path: <jpuhlman@gmail.com>
Received: from workhorse.localdomain ([2600:1700:4c90:60a0:56be:f7ff:fe12:d0bd])
        by smtp.gmail.com with ESMTPSA id f3sm2341158ooq.9.2020.03.27.15.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2020 15:23:18 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 90DCB2A0860; Fri, 27 Mar 2020 15:23:17 -0700 (PDT)
From: "Jeremy Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Jeremy Puhlman <jpuhlman@mvista.com>
Subject: [PATCH] nativesdk-git: point to system gitconfig
Date: Fri, 27 Mar 2020 15:23:16 -0700
Message-Id: <20200327222316.8414-1-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jeremy Puhlman <jpuhlman@mvista.com>

On a system with selinux turned on, trying to access a directory
that is in a tree that doesn't exist returns the error permission
denined rather then no such file or directory, which causes git
to die.

git clone git://git.yoctoproject.org/poky
Cloning into 'poky'...
fatal: unable to access '/opt/poky/3.0+snapshot/sysroots/x86_64-pokysdk-linux/etc/gitconfig': Permission denied

Switch to using the system gitconfig of the host.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/git/git.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 95ab397f6a..4131c98977 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -22,6 +22,7 @@ PACKAGECONFIG[svn] = ""
 EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
 		--without-tcltk \
 "
+EXTRA_OECONF_append_class-nativesdk = " --with-gitconfig=/etc/gitconfig "
 
 # Needs brokensep as this doesn't use automake
 inherit autotools-brokensep perlnative bash-completion
-- 
2.20.1

