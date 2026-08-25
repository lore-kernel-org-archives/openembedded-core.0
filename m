Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F08C5C61CE2
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:33 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18585.1787652444008301134
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=0MJSheyE;
 spf=pass (domain: smile.fr, ip: 209.85.221.50, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47fd4531020so2585396f8f.3
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652442; x=1788257242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NGj2uLe1mPWTYVSjkuCSFBh+JzOttbG1BWRn9k/XkLs=;
        b=0MJSheyEp5EgGQWwiHbla0SgZHLJpbEAnkHFhakkrTl2grSoSaT6W3nQV7LV+KDYZr
         7Z0NdLYq63hov6fs/ELrFGvRVFw6dxRJsBj0Vo1COCC4Oa4xBIvPn22n1rBNUX17YrWp
         Mph8lBQuvQnBQ6OCn19b7HLX5m2lkjTcaa7dg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652442; x=1788257242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NGj2uLe1mPWTYVSjkuCSFBh+JzOttbG1BWRn9k/XkLs=;
        b=f+Hx0HLB5JFPQj5w8wKmb+ZDuVcbsyR55z50zi2eENz8D2aWkA1J6s31S2qlcCHjJb
         ZptzNfwHL48cryv8+m01rLlGXZ7rNEsHXTH4topkWQqeBnbl7PCOX2S/uWhvrGqyo4Sk
         0R7nXZIz4KeFM7RA7QX7wDtlpu85KvrFgI6cYa/2H4Tw+yxQ8pEQQz3wVWr3NZgxXxzd
         0Ui8aQM4tsU9JX2MtiU52gbFnfl7ZQWFqIKN2NTaroOmUfyrCx625uib3KG8IaPKgVXk
         fHxinrCigu/VqGTkQdIiPS6iBO8zezaHkS3OYyUYYOlQrJCGqv4+usgNdgEiGYcPyvav
         iWLA==
X-Gm-Message-State: AFuF++nxBhqpaa7AfS8aq6T30Ozlg/PYuOZYjqsiX2utciltn9NBQCmN
	qnhyZVgDGpJd+K7Xqg8pO6WOeErFBiF6WG+gQNiRbv8EoIjvEeRPSqKi5qR8NgM3vsLWqJKCPBJ
	PG8JHl2c=
X-Gm-Gg: AR+sD137fnosiZkYrSf3zGtfW0Mw0L5iazBFIEws8QoiJzljWZf+Do/N8D8FIIvYI+h
	OXLr6BMUoCwo3xWNu4SjOcdGXSeYYg+0TAC6VnFF/0gwjoe6q0LiDoX9SKtfS7LqVqvse1b99BK
	y2Z1EfOwh4oLI0C6gRCPSZu9R8mgv1M4HhJiEPb8EANmVMXOtOBi2jGjCkpxDpoQ3cj9brOlzMR
	Uw8u7ay8dwM7sOQwC5+zzO/qPo7YcvK05Xxn4xV/VgRl1cUEzs6roWufL8/jPsIey3BVJMmn8rW
	nBeOpynMg4YQMLYV2GYMBuTmDvSfElzRXv7V6/2C/NefbK1D5lbLMLBJezVp2jWx3Ux78Gzuve/
	LQx9XQ15niVLlCFOEjE1xBDXISiy8tSG+VZfTCvRdtWGihRgJl7mTTbWEhXxtpp7HCAmggODLgZ
	jHrJ5Q84+eQL+V4uHCF+rZ7/x8tXUU0oVwTPuy4uV9nRypYc4zx2uPA7MGgjbH98nNwOV9Dgssd
	lRP24cvn5j81oUo+CvtqCVQiHxjfO4HKgVcvd3cSOEUr4ef7J+VdJ7+IkRYh1OaY1/xrihx9jRn
	BD4qJMM=
X-Received: by 2002:a5d:6f1c:0:b0:47f:6e23:64d6 with SMTP id ffacd0b85a97d-482c814ff04mr35858711f8f.16.1787652442144;
        Tue, 25 Aug 2026 03:07:22 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.21
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:21 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/11] rpcbind: Fix CVE-2026-16277
Date: Tue, 25 Aug 2026 12:06:49 +0200
Message-ID: <b7007d82eec734bab6760ae325645ae5b199e384.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244225

From: Vijay Anusuri <vanusuri@mvista.com>

Pick patch according to [2]

[1] https://nvd.nist.gov/vuln/detail/CVE-2026-16277
[2] https://security-tracker.debian.org/tracker/CVE-2026-16277

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../rpcbind/rpcbind/CVE-2026-16277.patch      | 34 +++++++++++++++++++
 .../recipes-extended/rpcbind/rpcbind_1.2.6.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch

diff --git a/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
new file mode 100644
index 00000000000..868e5c3f01c
--- /dev/null
+++ b/meta/recipes-extended/rpcbind/rpcbind/CVE-2026-16277.patch
@@ -0,0 +1,34 @@
+From bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d Mon Sep 17 00:00:00 2001
+From: Steve Dickson <steved@redhat.com>
+Date: Wed, 27 May 2026 11:42:11 -0400
+Subject: [PATCH] rpcinfo: stack buffer overflow in rpcinfo rpcbaddrlist()
+
+rpcinfo's rpcbaddrlist() formats two server-controlled, unbounded XDR strings into a fixed 128-byte stack buffer with sprintf(). A malicious or on-path rpcbind server overflows it when a user runs:
+rpcinfo -l <host> <prognum> <versnum>
+
+Reported-by: Michalis Vasileiadis <vmihalis.tmd@gmail.com>
+Signed-off-by: Steve Dickson <steved@redhat.com>
+
+Upstream-Status: Backport [https://git.linux-nfs.org/?p=steved/rpcbind.git;a=commitdiff;h=bb9bb7286a4c345442946dc2ce3c9e7f67e96d4d]
+CVE: CVE-2026-16277
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ src/rpcinfo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/rpcinfo.c b/src/rpcinfo.c
+index 0e14f78..43e8115 100644
+--- a/src/rpcinfo.c
++++ b/src/rpcinfo.c
+@@ -1120,7 +1120,7 @@ rpcbaddrlist (netid, argc, argv)
+ 
+ 	  re = &head->rpcb_entry_map;
+ 	  printf ("%10u%3u    ", parms.r_prog, parms.r_vers);
+-	  sprintf (buf, "%s/%s/%s ",
++	  snprintf (buf, sizeof(buf), "%s/%s/%s ",
+ 		   re->r_nc_protofmly, re->r_nc_proto,
+ 		   re->r_nc_semantics == NC_TPI_CLTS ? "clts" :
+ 		   re->r_nc_semantics == NC_TPI_COTS ? "cots" : "cots_ord");
+-- 
+2.43.0
+
diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
index dbd4d32e0a0..07e2f10c98a 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.6.bb
@@ -15,6 +15,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/rpcbind/rpcbind-${PV}.tar.bz2 \
            file://rpcbind.conf \
            file://rpcbind_add_option_to_fix_port_number.patch \
            file://0001-systemd-use-EnvironmentFile.patch \
+           file://CVE-2026-16277.patch \
           "
 SRC_URI[sha256sum] = "5613746489cae5ae23a443bb85c05a11741a5f12c8f55d2bb5e83b9defeee8de"
 

