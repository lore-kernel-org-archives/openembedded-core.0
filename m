Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web10.12363.1622226274860064319
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 May 2021 11:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=og+u7ufR;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: nishaparrakat@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id df21so5874450edb.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 May 2021 11:24:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=azAm/e0ODdYs2X2KZ8jSA1bHVUoHBhiSljBj8iVxIQU=;
        b=og+u7ufRloPvuxCoqec7FSygvSdEmARq6EOgEuvcydGuVx4axO1IVvc9V2hjAFDZS1
         9KSm2/ga/C/Tva+nBTbJalWf+fajaudgZClzk3i6xSWKoAONiJjltfllQ0h8zni9d3iu
         d1Zi0E56Z7O6Sp4AMW9ZVNxSMRxOls9nNZ/UuyE1oTph9GScOXNO9r3butXbK7HCnR1h
         d7dFF9HJzNAnUCR8KVnJIYUFFwL9LcLfzAaXGXYjbNa/tykyKdUPtA6XXOhYX/4ivy3B
         QJvlciphjjEn1Ni8OXG9UdTFs/muCDSyTmi1HvqVnv0aBEX7Aoo6NQC+TO1CoSUQiA4d
         NSFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=azAm/e0ODdYs2X2KZ8jSA1bHVUoHBhiSljBj8iVxIQU=;
        b=LvO98BJfwI3cDiLrevKb1BAulykkds0N4OHouzjACGsklQi7ysS0OdAtEOjTE9EEZM
         YRKnPEigf0RN7477sj+O+aoJKH7bZv+agVkGJUNbGTkv/M1/Q9eE4UncNKMmZCT2/DaN
         aBU3rr1ZnwB/LBL8lldUP55AZXSUvXY8kyFPz36RacTVKgDQZBLeJxchrZELiLxouCgl
         vHOGvvwSIg0Bl/PBmXAoKp70w0xB9RcMT4pywOFx/os7nLW4DA/Fp3+cmNOMIfzPP76Z
         khmaQYB0J34br+jOqb2F7ihpasEOczoQhIwlh5llyEhzLl51TzmS2nuzCgmdjvIjxQqs
         hxkA==
X-Gm-Message-State: AOAM532eux+YtHTpMsy0L6yqJg1AHNXlFYoVjJX3p36IIQMJVwfMluvK
	BC0c2WPh/at8jePnhBZ0khfL1XBWKBHOrNw+a9bzLw==
X-Google-Smtp-Source: ABdhPJwIkWZ32bkgnP+mwgedHZQOw96Npe5v4XqCsl0MD5q6h4GNTpFoZgbBXpiyc0JRVi1EXxtMFg==
X-Received: by 2002:a05:6402:b7b:: with SMTP id cb27mr6276741edb.213.1622226273270;
        Fri, 28 May 2021 11:24:33 -0700 (PDT)
Return-Path: <nishaparrakat@gmail.com>
Received: from bsys_traas.speedport.ip (p200300c00f3bb0983a22e2fffe1aa816.dip0.t-ipconnect.de. [2003:c0:f3b:b098:3a22:e2ff:fe1a:a816])
        by smtp.gmail.com with ESMTPSA id bn7sm2789808ejb.111.2021.05.28.11.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 11:24:32 -0700 (PDT)
From: "Nisha Parrakat" <nishaparrakat@gmail.com>
To: openembedded-core@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Sana Kazi <Sana.Kazi@kpit.com>
Subject: [poky][dunfell][PATCH] openssh: Add fixes for CVEs reported for openssh
Date: Fri, 28 May 2021 18:24:15 +0000
Message-Id: <20210528182415.22031-1-nishaparrakat@gmail.com>
X-Mailer: git-send-email 2.17.1

From: Sana Kazi <Sana.Kazi@kpit.com>

Applied patch for CVE-2020-14145
Link: https://anongit.mindrot.org/openssh.git/patch/?id=b3855ff053f5078ec3d3c653cdaedefaa5fc362d

Also, whitelisted below CVEs:

1.CVE-2020-15778:
As per upstream, because of the way scp is based on a historical
protocol called rcp which relies on that style of argument passing
and therefore encounters expansion problems. Making changes to how
the scp command line works breaks the pattern used by scp consumers.
Upstream therefore recommends the use of rsync in the place of
scp for better security. https://bugzilla.redhat.com/show_bug.cgi?id=1860487

2.CVE-2008-3844: It was reported in OpenSSH on Red Hat Enterprise Linux
and certain packages may have been compromised. This CVE is not
applicable as our source is OpenBSD.
Links:
https://securitytracker.com/id?1020730
https://www.securityfocus.com/bid/30794

Also, for CVE-2007-2768 no fix is available yet as it's unavoidable
drawback of using one time passwords as per
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2007-2768
Also it is marked as unimportant on debian
https://security-tracker.debian.org/tracker/CVE-2007-2768

Mailed to CPE to update database for CVE-2020-15778, CVE-2008-3844
and CVE-2007-2768. We can upstream CVE-2020-14145 till we recieve
response from CPE.

Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
Signed-off-by: Nisha Parrakat <nishaparrakat@gmail.com>
---
 .../openssh/openssh/CVE-2020-14145.patch      | 97 +++++++++++++++++++
 .../openssh/openssh_8.2p1.bb                  | 13 ++-
 2 files changed, 109 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
new file mode 100644
index 0000000000..3adb981fb4
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
@@ -0,0 +1,97 @@
+From b3855ff053f5078ec3d3c653cdaedefaa5fc362d Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Fri, 18 Sep 2020 05:23:03 +0000
+Subject: upstream: tweak the client hostkey preference ordering algorithm to
+
+prefer the default ordering if the user has a key that matches the
+best-preference default algorithm.
+
+feedback and ok markus@
+
+OpenBSD-Commit-ID: a92dd7d7520ddd95c0a16786a7519e6d0167d35f
+
+Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
+---
+ sshconnect2.c | 41 ++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 38 insertions(+), 3 deletions(-)
+
+CVE: CVE-2020-14145
+Upstream-Status: Backport [https://anongit.mindrot.org/openssh.git/patch/?id=b3855ff053f5078ec3d3c653cdaedefaa5fc362d]
+Comment: Refreshed first hunk
+
+diff --git a/sshconnect2.c b/sshconnect2.c
+index 347e348c..f64aae66 100644
+--- a/sshconnect2.c
++++ b/sshconnect2.c
+@@ -1,4 +1,4 @@
+-/* $OpenBSD: sshconnect2.c,v 1.320 2020/02/06 22:48:23 djm Exp $ */
++/* $OpenBSD: sshconnect2.c,v 1.326 2020/09/18 05:23:03 djm Exp $ */
+ /*
+  * Copyright (c) 2000 Markus Friedl.  All rights reserved.
+  * Copyright (c) 2008 Damien Miller.  All rights reserved.
+@@ -102,12 +102,25 @@ verify_host_key_callback(struct sshkey *hostkey, struct ssh *ssh)
+ 	return 0;
+ }
+ 
++/* Returns the first item from a comma-separated algorithm list */
++static char *
++first_alg(const char *algs)
++{
++	char *ret, *cp;
++
++	ret = xstrdup(algs);
++	if ((cp = strchr(ret, ',')) != NULL)
++		*cp = '\0';
++	return ret;
++}
++
+ static char *
+ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ {
+-	char *oavail, *avail, *first, *last, *alg, *hostname, *ret;
++	char *oavail = NULL, *avail = NULL, *first = NULL, *last = NULL;
++	char *alg = NULL, *hostname = NULL, *ret = NULL, *best = NULL;
+ 	size_t maxlen;
+-	struct hostkeys *hostkeys;
++	struct hostkeys *hostkeys = NULL;
+ 	int ktype;
+ 	u_int i;
+ 
+@@ -119,6 +132,26 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ 	for (i = 0; i < options.num_system_hostfiles; i++)
+ 		load_hostkeys(hostkeys, hostname, options.system_hostfiles[i]);
+ 
++	/*
++	 * If a plain public key exists that matches the type of the best
++	 * preference HostkeyAlgorithms, then use the whole list as is.
++	 * Note that we ignore whether the best preference algorithm is a
++	 * certificate type, as sshconnect.c will downgrade certs to
++	 * plain keys if necessary.
++	 */
++	best = first_alg(options.hostkeyalgorithms);
++	if (lookup_key_in_hostkeys_by_type(hostkeys,
++	    sshkey_type_plain(sshkey_type_from_name(best)), NULL)) {
++		debug3("%s: have matching best-preference key type %s, "
++		    "using HostkeyAlgorithms verbatim", __func__, best);
++		ret = xstrdup(options.hostkeyalgorithms);
++		goto out;
++	}
++
++	/*
++	 * Otherwise, prefer the host key algorithms that match known keys
++	 * while keeping the ordering of HostkeyAlgorithms as much as possible.
++	 */
+ 	oavail = avail = xstrdup(options.hostkeyalgorithms);
+ 	maxlen = strlen(avail) + 1;
+ 	first = xmalloc(maxlen);
+@@ -159,6 +192,8 @@ order_hostkeyalgs(char *host, struct sockaddr *hostaddr, u_short port)
+ 	if (*first != '\0')
+ 		debug3("%s: prefer hostkeyalgs: %s", __func__, first);
+ 
++ out:
++	free(best);
+ 	free(first);
+ 	free(last);
+ 	free(hostname);
+-- 
+cgit v1.2.3
diff --git a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
index 6ed54a8139..64a0a72a8f 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.2p1.bb
@@ -24,6 +24,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
            file://sshd_check_keys \
            file://add-test-support-for-busybox.patch \
+           file://CVE-2020-14145.patch \
            "
 SRC_URI[md5sum] = "3076e6413e8dbe56d33848c1054ac091"
 SRC_URI[sha256sum] = "43925151e6cf6cee1450190c0e9af4dc36b41c12737619edff8bcebdff64e671"
@@ -35,7 +36,17 @@ CVE_CHECK_WHITELIST += "CVE-2007-2768"
 # and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
 CVE_CHECK_WHITELIST += "CVE-2014-9278"
 
-# CVE only applies to some distributed RHEL binaries
+# As per upstream, because of the way scp is based on a historical protocol called rcp
+# which relies on that style of argument passing and therefore encounters expansion
+# problems. Making changes to how the scp command line works breaks the pattern used
+# by scp consumers. Upstream therefore recommends the use of rsync in the place of
+# scp for better security. https://bugzilla.redhat.com/show_bug.cgi?id=1860487
+CVE_CHECK_WHITELIST += "CVE-2020-15778"
+
+# CVE-2008-3844 was reported in OpenSSH on Red Hat Enterprise Linux and
+# certain packages may have been compromised. This CVE is not applicable
+# as our source is OpenBSD. https://securitytracker.com/id?1020730
+# https://www.securityfocus.com/bid/30794
 CVE_CHECK_WHITELIST += "CVE-2008-3844"
 
 PAM_SRC_URI = "file://sshd"
-- 
2.17.1

