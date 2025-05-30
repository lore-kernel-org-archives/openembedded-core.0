Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA63C5B559
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 21:22:26 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.455.1748640139446706144
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 May 2025 14:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=U77gcvAG;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.181, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e16234307so21843415ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 14:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1748640139; x=1749244939; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NB3ZQ135zcI/GZ35rWl8HOcc7vYuaP7xVJaL+Gd3UNE=;
        b=U77gcvAGwW5hPrSzC7zlcSjr6TzNEwwytf2pAVcrnsi2sz9sg3PcKKfnheITnqUjLX
         aOB4Gc/+3/NNmZOTdUAjXO+Lls8nptSnbesaUXoUwRt7udJQHrd/rBLVaFpgQLlwTJkz
         cIfnxnvthLHBA1m4OhPR7YKgAFZhQmatCpTPk/j52spmplUUMMLyR3imcV9hiM5gmDkX
         QVTwAboWKDOioNf0zi0c+nSofgjBNpHFxSapWj1nrymM7LExnloQMWaPC8HCx8quxZrI
         xIUciyQ1HVelEslwaR3rMxO+WJiAqGS6k03KLHoeUBsGXuBP7FB9DaBLPJtXT0JDE3Y5
         aJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748640139; x=1749244939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NB3ZQ135zcI/GZ35rWl8HOcc7vYuaP7xVJaL+Gd3UNE=;
        b=F8cYx/E3Zd6z8J3sQmF/7GBEayGkkmYdWq07WoVpJhTXxMeoGhnOvgrZktp3d+cCqi
         YgLzZHHslU/+65OZ+unWGkLw0pyxst0w5c8/fslGvgss04odQ1cNkqwQD7I4javh8s34
         sPAz5qsTcGlFEOKbqFkDT+4qssLlcTlYxSDSolUKcljgr2QqWTrRiBwfM2wM5qjFD9c1
         MszkATZeUrxD4VAF5mAJFUhmAjexsCjdSwK9LU7yQ231U22Sx+7LBih6LUt1TEykjUkj
         clIXMrYl8VxZLaoq3C22jsK/ra+/aY29iKY1O9HRHPET5Vuf1o93jU4B0489DuwS4dtI
         a8+Q==
X-Gm-Message-State: AOJu0Yz7t4L/NeGMHiWI6eS1G4KUcJlMZaTjgAD8/OYntpeW9kwh4/zy
	mmo+IsSIqsP3LGQ/il6G9NPTYUdVTz2NqmmHXP3gtajBOWK52tJMbv7lBBxOuVgL6obSyjING87
	5G3Zq
X-Gm-Gg: ASbGnculrb2xuKPKd1KDHBzyiJ+tJdrJ8hP0MJI38XvQlstjs2lJ0hOH9TKDrceUwCb
	B2qaM1NaTUgYBVJxTyF0Q8ZHKLORFbwweUIFUmNFNgQKPp/WxYwVk+kXtAN65lqFVcn+LPQRulM
	cZpYKjYz5sZZ0f2Fwv3cthIL36YX/MSxpO7BhJatkkfXyvS5fXRLiSg8jElft4UOAh0kQUtK4eJ
	d5b3jFC4kFDmH/HcQ7Ino2y5vRErmf2lLfzKupESm6nWmWJjDZmaYZdjLQTLGXcAE1ksfkkIhfi
	AH7Jx4wowx+LfXumcRs9+KTF7/FKwOIiQ0J3axXSaY53OqZuLPamlA==
X-Google-Smtp-Source: AGHT+IEFqvlvdc3+kyNZnsmYpy8xXcGFEacopA9hKdobh6bDSYijD9RLoAt42t5tLKQh6deTf12U9g==
X-Received: by 2002:a17:903:32cf:b0:233:c5ef:3b88 with SMTP id d9443c01a7336-234f6780f92mr123111815ad.5.1748640138580;
        Fri, 30 May 2025 14:22:18 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:c9d8:e2d0:bfbc:3a26])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506be2622sm32621815ad.102.2025.05.30.14.22.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 14:22:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 03/14] screen: patch CVE-2025-46805
Date: Fri, 30 May 2025 14:21:53 -0700
Message-ID: <82023fb33edff2de2ad6e64d768608501053023f.1748639952.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748639952.git.steve@sakoman.com>
References: <cover.1748639952.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 21:22:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217541

From: Ashish Sharma <asharma@mvista.com>

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/screen/patch/?id=aa9f51f996a22470b8461d2b6a32e62c7ec30ed5
Upstream commit https://git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../screen/screen/CVE-2025-46805.patch        | 101 ++++++++++++++++++
 meta/recipes-extended/screen/screen_4.9.1.bb  |   1 +
 2 files changed, 102 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen/CVE-2025-46805.patch

diff --git a/meta/recipes-extended/screen/screen/CVE-2025-46805.patch b/meta/recipes-extended/screen/screen/CVE-2025-46805.patch
new file mode 100644
index 0000000000..e0207b6072
--- /dev/null
+++ b/meta/recipes-extended/screen/screen/CVE-2025-46805.patch
@@ -0,0 +1,101 @@
+From aa9f51f996a22470b8461d2b6a32e62c7ec30ed5 Mon Sep 17 00:00:00 2001
+From: Axel Beckert <abe@debian.org>
+Date: Mon, 19 May 2025 00:42:42 +0200
+Subject: fix CVE-2025-46805: socket.c - don't send signals with root
+
+Gbp-Pq: fix-CVE-2025-46805-socket.c-don-t-send-signals-with-.patch.
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/screen/patch/?id=aa9f51f996a22470b8461d2b6a32e62c7ec30ed5 
+Upstream commit https://git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4]
+CVE: CVE-2025-46805
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+ socket.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/socket.c b/socket.c
+index e268e3d..11b5e59 100644
+--- a/socket.c
++++ b/socket.c
+@@ -832,6 +832,11 @@ int pid;
+   return UserStatus();
+ }
+ 
++static void KillUnpriv(pid_t pid, int sig) {
++    UserContext();
++    UserReturn(kill(pid, sig));
++}
++
+ #ifdef hpux
+ /*
+  * From: "F. K. Bruner" <napalm@ugcs.caltech.edu>
+@@ -917,14 +922,14 @@ struct win *wi;
+             {
+ 	      Msg(errno, "Could not perform necessary sanity checks on pts device.");
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      return -1;
+             }
+           if (strcmp(ttyname_in_ns, m->m_tty))
+             {
+ 	      Msg(errno, "Attach: passed fd does not match tty: %s - %s!", ttyname_in_ns, m->m_tty[0] != '\0' ? m->m_tty : "(null)");
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      return -1;
+ 	    }
+ 	  /* m->m_tty so far contains the actual name of the pts device in the
+@@ -941,19 +946,19 @@ struct win *wi;
+ 	{
+ 	  Msg(errno, "Attach: passed fd does not match tty: %s - %s!", m->m_tty, myttyname ? myttyname : "NULL");
+ 	  close(i);
+-	  Kill(pid, SIG_BYE);
++	  KillUnpriv(pid, SIG_BYE);
+ 	  return -1;
+ 	}
+     }
+   else if ((i = secopen(m->m_tty, O_RDWR | O_NONBLOCK, 0)) < 0)
+     {
+       Msg(errno, "Attach: Could not open %s!", m->m_tty);
+-      Kill(pid, SIG_BYE);
++      KillUnpriv(pid, SIG_BYE);
+       return -1;
+     }
+ #ifdef MULTIUSER
+   if (attach)
+-    Kill(pid, SIGCONT);
++    KillUnpriv(pid, SIGCONT);
+ #endif
+ 
+ #if defined(ultrix) || defined(pyr) || defined(NeXT)
+@@ -966,7 +971,7 @@ struct win *wi;
+ 	{
+ 	  write(i, "Attaching from inside of screen?\n", 33);
+ 	  close(i);
+-	  Kill(pid, SIG_BYE);
++	  KillUnpriv(pid, SIG_BYE);
+ 	  Msg(0, "Attach msg ignored: coming from inside.");
+ 	  return -1;
+ 	}
+@@ -977,7 +982,7 @@ struct win *wi;
+ 	  {
+ 	      write(i, "Access to session denied.\n", 26);
+ 	      close(i);
+-	      Kill(pid, SIG_BYE);
++	      KillUnpriv(pid, SIG_BYE);
+ 	      Msg(0, "Attach: access denied for user %s.", user);
+ 	      return -1;
+ 	  }
+@@ -1295,7 +1300,7 @@ ReceiveMsg()
+             Msg(0, "Query attempt with bad pid(%d)!", m.m.command.apid);
+           }
+           else {
+-            Kill(m.m.command.apid,
++            KillUnpriv(m.m.command.apid,
+                (queryflag >= 0)
+                    ? SIGCONT
+                    : SIG_BYE); /* Send SIG_BYE if an error happened */
+-- 
+cgit v1.2.3
+
diff --git a/meta/recipes-extended/screen/screen_4.9.1.bb b/meta/recipes-extended/screen/screen_4.9.1.bb
index 7b040e6b57..96f8021255 100644
--- a/meta/recipes-extended/screen/screen_4.9.1.bb
+++ b/meta/recipes-extended/screen/screen_4.9.1.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/screen/screen-${PV}.tar.gz \
            file://0002-comm.h-now-depends-on-term.h.patch \
            file://0001-fix-for-multijob-build.patch \
            file://0001-Remove-more-compatibility-stuff.patch \
+           file://CVE-2025-46805.patch \
            "
 
 SRC_URI[sha256sum] = "26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69"
-- 
2.43.0


