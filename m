Return-Path: <asharma@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301FCC3ABB2
	for <webhook@archiver.kernel.org>; Fri, 30 May 2025 04:27:40 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web10.3600.1748579252033572125
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 May 2025 21:27:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bt88pXSC;
 spf=pass (domain: mvista.com, ip: 209.85.161.41, mailfrom: asharma@mvista.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-60b8a9be972so481698eaf.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 May 2025 21:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1748579251; x=1749184051; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J8jpJWG0Y33iTaV9/un7MvivkyDSrNf8f85ytYrH8sU=;
        b=bt88pXSCaaJEVykoVp3FdITi7mz6hopk6hR0rvIDb3be4VK6ETZMRxa77VGUqSlsVM
         p/7GxX9BxO5UC3/YccfPiLmf8GhC87wVjquasptKUCnDHGHlbydBMVpXJDdzxpUL1qoi
         niI9P2JO8Jx0E/VowoiZKSEMENjR8KAA2FlOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748579251; x=1749184051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J8jpJWG0Y33iTaV9/un7MvivkyDSrNf8f85ytYrH8sU=;
        b=X5hEAfNSdwMhKJmhO6uWM/gOuE2eDiog4oenCI2Xa6E04zOL0ywu4kGtTzUAc7i7Gz
         bFgkBGpxV18sVJWKuc8ChWwm/DOX/0Vl90aG+O6D2x7bU5BAPnA74m0jAK2PuS9C4WXI
         Us8g5Llgw6EHPOfWjQjE9/IFw80x55CwbBv6mtNhKkGJfuxbN3dKHk9qWJLPG1Fsp+6+
         p3rUw2tmftn/UmvwHk3eRtEvwT32soSoLnEwgjMN5IImS7AYh6N+B8qk93SMm0HpIfFT
         vGZOiaghJIbBuSQt7OhRRYST0+fCc95hfLIMHS0z95Kwgt5Ygoeljhx/qziN/voMz/97
         s3Mg==
X-Gm-Message-State: AOJu0Yy/geKDEo+ecIuc+Qad7BMUTVvWkX7raTe7xkDE1C2Vtr+zPX1d
	zf22POMIU1yWc1oMk3y8w1CHFofa2B3yuVe7JM5XmOkNIGQhMuX+v9whpIL6znjQVJQ6j1UKb+i
	nZyIJSA0=
X-Gm-Gg: ASbGnctlSVr5O0urFK/ATPtivTzQf13GjGmVxLufiREvZYwQ0FH/RnsPYCelQG3zNSl
	FAntk11SibsRLgXUfYgEvn6Sj24DexDiACIDmFcETSZKAx2szZiOnF+3nSKN0qnL2dXYf3S1+FQ
	1EWZkB5UBd9hEJnR7piCEZgmsbysientXDZqdNEz4ZxOm8LdNulcNbNWdWRw/uCKXyWYi7BhHdD
	HhFq4Exci9SRgkL+PIvKm9JBJjvEs2SylfliDAmBk1xsI+KDvRBrPRG2nwy/FAqRibvfyWdRvL/
	i53lrQtsH2/MwdTRWizu77SKYGkt/RSwGlEoKEQN9pCKToWBBA==
X-Google-Smtp-Source: AGHT+IGPzSJV0VXh83Qnkv7HFTS6MOlsf3NWCpsoTfSZXpvspp4fVDm5vNQ8rTeae70YKiQsmRkT2w==
X-Received: by 2002:a05:6808:6a98:b0:406:6e86:683e with SMTP id 5614622812f47-4067963970cmr1080927b6e.14.1748579251007;
        Thu, 29 May 2025 21:27:31 -0700 (PDT)
Received: from MVIN00043 ([2401:4900:1c68:dbf6:cdc7:d2b4:6541:53e5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40678d04377sm266377b6e.49.2025.05.29.21.27.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 21:27:30 -0700 (PDT)
Received: by MVIN00043 (sSMTP sendmail emulation); Fri, 30 May 2025 09:57:23 +0530
From: Ashish Sharma <asharma@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Ashish Sharma <asharma@mvista.com>
Subject: [OE-core][scarthgap][PATCH] screen: patch CVE-2025-46805
Date: Fri, 30 May 2025 09:57:17 +0530
Message-Id: <20250530042717.3497565-1-asharma@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 May 2025 04:27:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217464

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/screen/patch/?id=aa9f51f996a22470b8461d2b6a32e62c7ec30ed5
Upstream commit https://git.savannah.gnu.org/cgit/screen.git/commit/?id=161f85b98b7e1d5e4893aeed20f4cdb5e3dfaaa4]

Signed-off-by: Ashish Sharma <asharma@mvista.com>
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
2.34.1


