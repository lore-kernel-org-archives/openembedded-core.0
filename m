Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com [209.85.210.196])
 by mx.groups.io with SMTP id smtpd.web12.31067.1605029659527078919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 09:34:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=WE2ibg6W;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.196, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f196.google.com with SMTP id c20so12057202pfr.8
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 09:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=QlqrdJWTw6epRssv6rGi6g1FIZxrKWAkwKxXETe7NLQ=;
        b=WE2ibg6WqDgw4f2617Iu1D6rwYU/WHj6W8mGnWy/Ll+fGPp2w0j3x1rnLDFhxPv2x0
         3EdXQHHx0oVd5ks+teKQqbaLxG3HZjlm/Z58OXqwZn0q093NrxEsxDIp7pOiejdCRXfs
         NPgg9hlM3Yx5KE3vzzoRZXiI/ARCSVyye8msJtisJXksti5uDD9vrgh4oiIFDCZqpY9T
         9YfHkEPUu0YHAJGH7qxIoE6oPRviAuHkrpGe+yXNbm6CN8Qhs+27/L0GSmQoJh4YDq1g
         IU6GrXE4QZO+SSZw79yfpYuANbIC407CpwMRaaVo83MCkR21bmazAituhzS0wEyg32Kj
         eK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=QlqrdJWTw6epRssv6rGi6g1FIZxrKWAkwKxXETe7NLQ=;
        b=eP+KxzmgyTtd3PaVfrtIrVxFwpORmzPLdx9I6RCkUZrWYg9BomJiQeNrl9G1/18+Ab
         8fbqJIDXhDTkg7KsaXvzjFn8tpv3rz810VtcqBBtJXXIKT1waaxdQtmj9jj5Sdze3V0T
         2zOb+08UwbcQwsoqbJ2TJNLu1lHpCaq64gSqcTVKamilZilg87EWNIg7xq+cAWC0/jfz
         IlWJLOiC9qFSssk7MCAyHX8rDMv0+oUC8GBzMUUW50+G1cORjWt6jRX78bw34e0zSnQU
         sJeF8T2y97cUSVz3GMX1xmDUvqF0WHInq51/wd6FOET1B6u5OtufZoDPmI8OafQN97Aj
         ROxA==
X-Gm-Message-State: AOAM530q30GVFFZpQV+7yFZRkm1JsPQEyrisGkmFkIkuaXfkl/0pjo9O
	rF9IdW0vzyMMjTXuUD8S+xj39SV1DsimYVu3
X-Google-Smtp-Source: ABdhPJwSm7kvGWK1dVvQrTxV6WZWHhtrVNZUpI/zIpUOpCiKnVjq7mMX0hWP8AM45yKge5gYB4rRTQ==
X-Received: by 2002:a63:f91d:: with SMTP id h29mr17238209pgi.82.1605029657429;
        Tue, 10 Nov 2020 09:34:17 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x19sm3913084pjk.25.2020.11.10.09.34.16
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2020 09:34:16 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core] [master] openssh: whitelist CVE-2014-9278
Date: Tue, 10 Nov 2020 07:34:01 -1000
Message-Id: <20201110173401.29956-1-steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

The OpenSSH server, as used in Fedora and Red Hat Enterprise
Linux 7 and when running in a Kerberos environment, allows remote
authenticated users to log in as another user when they are listed
in the .k5users file of that user, which might bypass intended
authentication requirements that would force a local login.

Whitelist the CVE since this issue is Redhat specific.

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-connectivity/openssh/openssh_8.4p1.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
index 720b238e71..676a8a6533 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.4p1.bb
@@ -27,6 +27,10 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            "
 SRC_URI[sha256sum] = "5a01d22e407eb1c05ba8a8f7c654d388a13e9f226e4ed33bd38748dafa1d2b24"
 
+# This CVE is specific to OpenSSH server, as used in Fedora and Red Hat Enterprise Linux 7
+# and when running in a Kerberos environment. As such it is not relevant to OpenEmbedded
+CVE_CHECK_WHITELIST += "CVE-2014-9278"
+
 PAM_SRC_URI = "file://sshd"
 
 inherit manpages useradd update-rc.d update-alternatives systemd
-- 
2.17.1

