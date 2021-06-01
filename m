Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web11.58509.1622557118764331268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jun 2021 07:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=rcDCpdK/;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id e22so10793294pgv.10
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jun 2021 07:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2zrDfkPKh7eLnvDAQd6wzDs/kDsqCJUqXA5fq2rtKUM=;
        b=rcDCpdK/H033xrO+bBvumJfGSzg8P0iSzx6RjPssyBCPC2WpE/5U8LuScv7y12icly
         H8tGOr5GuFWQ1VJfn+a2e2LxjglWmY0ThXNugPdeMkJ7kI8hdsRRGoFvMufIwI3MQbfc
         GL+ABv8J1BHcaloofY4ZWHr+CtNrcr6N21CFQj7ntHG0kaOsVxe4Es+TaQ6A+NBUySsZ
         rKASeP+gE98y9R8Iv/58QsG1avsPmJ86GX4jbeF8MyIyG2oTABRwgo1zAH3PKi6hsW0n
         8Hs5ShN7AAA6gsghBEM1DHucxLF1zuCsfuSKsXehVbL6FYa7VNTO9c7/1xeEVKA9bRwW
         2hSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2zrDfkPKh7eLnvDAQd6wzDs/kDsqCJUqXA5fq2rtKUM=;
        b=mnW14hzFd1q0CvTWR1mczozraXEh1jJQ7Dv6jmJsAplbhPs1ySZAqfLbW5dPO3Vocm
         MhZ4CGPUxY7+NThYhuwOMUEGkx2gmjnhEmYNWFSRYccupJ3lf7Xz5ByvQaAhJZ/06kot
         0TNONIzqBf7J+iC6VCQOxcUVKktX+IATdh4wPfxhFpDViNfz5CdWqc0/v7WcENT38y40
         4UCA9+9UYWKKFTF/QlBislrbSFhT+lhePXHZDZ2k4LkdmstDXEBqVePpiQ7H5ve3XjuU
         GV/rPohgT/MYDaPWSkMSgDNdKitUC6pglBHVSdm9Sfb6Y+WFnBkWDjmaxeFXzgvxxB0S
         9LrQ==
X-Gm-Message-State: AOAM5334JSvXZDXvpWsd+1IdKizCweP8b2H90K0u/mq7V7NLhO/RSoTO
	Uc4ECoBwX9nnc7Q5+JNcQvOnxUp/upqXhqGUROc=
X-Google-Smtp-Source: ABdhPJy9J2q/QvKSZjNfJ7QdlNWWSpIwaA2HEGttbx7YWzEYsHIleCIB+WMdhIrlVXg34IpAW6tREA==
X-Received: by 2002:a05:6a00:a:b029:2e0:d1b:59d6 with SMTP id h10-20020a056a00000ab02902e00d1b59d6mr22122747pfk.27.1622557117598;
        Tue, 01 Jun 2021 07:18:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id bb18sm2307875pjb.44.2021.06.01.07.18.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 03/26] openssh: Add fixes for CVEs reported for openssh
Date: Tue,  1 Jun 2021 04:17:51 -1000
Message-Id: <302a6828b380ba20bb244f11f22a5bc273f0e5e7.1622556919.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1622556919.git.steve@sakoman.com>
References: <cover.1622556919.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1

