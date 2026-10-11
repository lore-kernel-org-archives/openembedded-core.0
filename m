Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5375CA9ED1
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:39 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23584.1791708096239296998
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Oe8uvABi;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48c4649b3aaso514294f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708094; x=1792312894; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H+X6OAp+nQehujSJQqE+H+ngxA9jq6jg9v0VXpplhHw=;
        b=Oe8uvABibnSTKojd2fr1FUIZIEjqmfbuVfeTGNEpdFh/qMY9rD1OKKEaGFa8hWzRTd
         BX4t39xJfdQ8OriwCjpZy0zlqvCAf4EL9hzDToVwH57Em+ZjNbW/qjkM2v0opVVkXV4u
         4VJMyabzcPTRvcLSE6EWCK5IZc4xbiFGrCDJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708094; x=1792312894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H+X6OAp+nQehujSJQqE+H+ngxA9jq6jg9v0VXpplhHw=;
        b=rzqkmjAQ4JGznzNniCNELqvnRC8q69GSkaZmelhWtLQTREciJMQ9oBG6BUVbsA0cYH
         RnHYW2mWbQUVQdgDvHE5HcO43kX4O+aOfcsCqx0yznSaouUnxvhQiZsVZoBZhr/9VfPa
         p+TsaLgjK3QYvx+XJN1Q42jxIZoNHQG0W7ao0vNVXBJ6PEdVLnWbV8fphrLG4Ri9Blry
         +WeNidKizNHvTDgOHj1R2Dey5Vs+aznpfzFuV9WgXwfTNBC/IKMnWWSN1SKZlLh/UU7z
         l7cCA07OhADhO0VoNvayDPP8Blm9DW3bwB334Kzpc552tPgurnK0vAG7uavtzQVrpIrE
         pCxA==
X-Gm-Message-State: AFq9FYJPpmzRDyELFYsYFnu8fiXZztc5WdU+A8r4zH7twL1NM7UVb4xx
	D+YHbKhJ2gdb1GBHvp2TBFC3uVl4Vt4tap4Au3Sfa06cIALJXk0yCfocYIn8Bz5XH5qL2lEziV4
	crrMruWY=
X-Gm-Gg: AYBFou0QcTVwl4L6FLX9RSglPLsrbAF/wucR9o5qoX+6Qf6/jXy9q73+yxghrn/tnpn
	U06lCrQt75z0W/i+KEeFy0o3GW9Bs1H/Q86edO/1jnH/s+u50sCDfSRxRHVdGwQf8wEksoVNuYK
	r22Q4tvvNccUCzN0DUnPecbxLoaU8a3FI3gGkUOurfSTCjGmCytIZim0v5QkksskHymIMljsjGV
	Y+WuBUBP5PBkTuyZZlGBjBHspZRjEdudtZLvTpMCOapMlwJdW1UAiAoVQgI0zCtLgg0I+F6zf4U
	e0cS9ZoyE28Wza3iyhbj/6FLScPycDL6YsvJLutOrZ4z9vUfMfjLFx6ZEUMzt/QHE/E7tDSkTkB
	z+asH660NhvuNsupLxjliYUu+jzvJ+wZ2HDpTl0/rzf9WAPUljuIJlV7gtHe9/tmb5EepPDbTtR
	PjRnH9LYYmaGYdMXDPwaInZTZI2j29T6XES3mDuA7vkcUbxI6j2HvJdNLM4CweGwNFB/JtT2ztg
	YGG/vkx9BF3jkAppYyzEhqP6I9ymAIuypCj+mLmexSjLfYaNZmuB+flJzIzbO+tAy48A+UwAQ==
X-Received: by 2002:a05:6000:1ac5:b0:487:91e:d8ed with SMTP id ffacd0b85a97d-48dba784ca9mr11751975f8f.2.1791708094338;
        Sun, 11 Oct 2026 01:41:34 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.33
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:33 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 52/60] wget: fix CVE-2026-15146
Date: Sun, 11 Oct 2026 10:40:25 +0200
Message-ID: <4f963a7691766a181a743b6fa91339800454be20.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247561

From: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>

GNU Wget does not validate the IP address provided by an FTP PASV response while operating in FTP passive mode.
A malicious FTP server, or an HTTP server that redirects to an FTP URL, can exploit this behavior to redirect
Wget’s data connection to an arbitrary IP address and port.This allows an attacker to forge server-side requests
(SSRF) from the machine running Wget, potentially accessing localhost services or internal network resources.

Backport patch to fix CVE-2026-15146.
https://cgit.git.savannah.gnu.org/cgit/wget.git/commit/?id=4f85853f641863d5915786a8413e1a213726a62b

Ptest Result
DURATION: 18
END: /usr/lib/wget/ptest
2026-10-09T11:05
STOP: ptest-runner
TOTAL: 1 FAIL: 0

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-15146
  https://www.cve.org/CVERecord?id=CVE-2026-15146
  https://security-tracker.debian.org/tracker/CVE-2026-15146
  https://ubuntu.com/security/CVE-2026-15146

Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1a3f905de376f5a79a2a8b70545f08a4daec5a37)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../wget/wget/CVE-2026-15146.patch            | 126 ++++++++++++++++++
 meta/recipes-extended/wget/wget_1.25.0.bb     |   1 +
 2 files changed, 127 insertions(+)
 create mode 100644 meta/recipes-extended/wget/wget/CVE-2026-15146.patch

diff --git a/meta/recipes-extended/wget/wget/CVE-2026-15146.patch b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
new file mode 100644
index 00000000000..5d8d1a898ea
--- /dev/null
+++ b/meta/recipes-extended/wget/wget/CVE-2026-15146.patch
@@ -0,0 +1,126 @@
+From 4f85853f641863d5915786a8413e1a213726a62b Mon Sep 17 00:00:00 2001
+From: Acts1631 <acts1631kjv@proton.me>
+Date: Sun, 5 Jul 2026 17:22:55 -0400
+Subject: ftp: validate PASV/LPSV response address against control connection
+ peer
+
+* src/ftp-basic.c (ftp_pasv): Reject if peer address doesn't match advertised
+  address,
+  (ftp_lpsv): Likewise.
+
+ftp_pasv() and ftp_lpsv() copied the IP address and port advertised in
+the server's 227 response without checking that it matched the peer
+of the control connection.  A malicious or compromised FTP server
+could therefore direct wget's data connection to an arbitrary host and
+port of its choosing (e.g. an internal service unreachable from the
+attacker directly), which is a server-side request forgery.
+
+ftp_epsv() was already safe since it only extracts a port and reuses
+the pre-filled control-connection address.
+
+Fix ftp_pasv() and ftp_lpsv() the same way: capture the control
+connection's peer address via socket_ip_address() before parsing the
+response, and reject the response (FTPINVPASV) if the parsed address
+does not match.
+
+Verified with a fake FTP server that returns a PASV response pointing
+at a different loopback address (127.0.0.2 instead of the real peer
+127.0.0.1): before the fix wget connects to the spoofed address, after
+the fix it rejects the response with "Cannot parse PASV response."
+Legitimate transfers using a correctly-addressed PASV response
+continue to work.
+
+Copyright-paperwork-exempt: Yes
+
+CVE: CVE-2026-15146
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/wget.git/commit/?id=4f85853f641863d5915786a8413e1a213726a62b]
+
+Signed-off-by: Ghanshyam Banait <Ghanshyam.BanaitSanjay@windriver.com>
+---
+ src/ftp-basic.c | 40 ++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 40 insertions(+)
+
+diff --git a/src/ftp-basic.c b/src/ftp-basic.c
+index 4870256a..0f4bb821 100644
+--- a/src/ftp-basic.c
++++ b/src/ftp-basic.c
+@@ -623,10 +623,19 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   int nwritten, i;
+   uerr_t err;
+   unsigned char tmp[6];
++  ip_address peer_addr;
+ 
+   assert (addr != NULL);
+   assert (port != NULL);
+ 
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the PASV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+ 
+   /* Form the request.  */
+@@ -677,6 +686,16 @@ ftp_pasv (int csock, ip_address *addr, int *port)
+   memcpy (IP_INADDR_DATA (addr), tmp, 4);
+   *port = ((tmp[4] << 8) & 0xff00) + tmp[5];
+ 
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family != AF_INET
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr), 4) != 0)
++    {
++      xzero (*addr);
++      *port = 0;
++      return FTPINVPASV;
++    }
++
+   return FTPOK;
+ }
+ 
+@@ -692,10 +711,19 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+   uerr_t err;
+   unsigned char tmp[16];
+   unsigned char tmpprt[2];
++  ip_address peer_addr;
+ 
+   assert (addr != NULL);
+   assert (port != NULL);
+ 
++  /* Remember who we are talking to on the control connection, so that
++     the address returned in the LPSV response can be checked below.
++     Accepting an arbitrary server-supplied address would let a
++     malicious FTP server redirect our data connection to any host of
++     its choosing (SSRF).  */
++  if (!socket_ip_address (csock, &peer_addr, ENDPOINT_PEER))
++    return FTPINVPASV;
++
+   xzero (*addr);
+ 
+   /* Form the request.  */
+@@ -842,6 +870,18 @@ ftp_lpsv (int csock, ip_address *addr, int *port)
+       DEBUGP (("*port is: %d\n", *port));
+     }
+ 
++  /* Reject the response if the advertised address does not match the
++     control connection's peer.  */
++  if (peer_addr.family != addr->family
++      || memcmp (IP_INADDR_DATA (addr), IP_INADDR_DATA (&peer_addr),
++                 af == 4 ? 4 : 16) != 0)
++    {
++      xzero (*addr);
++      *port = 0;
++      xfree (respline);
++      return FTPINVPASV;
++    }
++
+   xfree (respline);
+   return FTPOK;
+ }
+-- 
+cgit v1.3
+
diff --git a/meta/recipes-extended/wget/wget_1.25.0.bb b/meta/recipes-extended/wget/wget_1.25.0.bb
index 26f5c84e5a7..b8c803aae1f 100644
--- a/meta/recipes-extended/wget/wget_1.25.0.bb
+++ b/meta/recipes-extended/wget/wget_1.25.0.bb
@@ -24,6 +24,7 @@ SRC_URI = "${GNU_MIRROR}/wget/wget-${PV}.tar.gz \
            file://CVE-2026-16599.patch \
            file://CVE-2026-58470.patch \
            file://CVE-2026-58470-regression.patch \
+           file://CVE-2026-15146.patch \
            "
 
 SRC_URI[sha256sum] = "766e48423e79359ea31e41db9e5c289675947a7fcf2efdcedb726ac9d0da3784"

