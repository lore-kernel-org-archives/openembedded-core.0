Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
 by mx.groups.io with SMTP id smtpd.web10.9478.1614585106803077655
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Feb 2021 23:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BFdzlql+;
 spf=pass (domain: gmail.com, ip: 209.85.166.174, mailfrom: flowergom@gmail.com)
Received: by mail-il1-f174.google.com with SMTP id e2so13841642ilu.0
        for <openembedded-core@lists.openembedded.org>; Sun, 28 Feb 2021 23:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGmGt3ydOiq6aEqM4+SnHuttX0NFXnKCi5VYjOYbFXw=;
        b=BFdzlql+RBtkJ8M8lQx40UohQGM7cbuQBqKi218/xQWTmrLQbZC//PCkwH6XMrtEjx
         BXPsJN3vbVECH4kkE4LuBRooFxuvJcZRBCVjFwsQEhQf/rt0VeVpm5V9mv85E3uZj3A6
         7XaT1Ldh8b2RWk4vdUHRRafyPwf/xQRqFQ2/Yn9xreidTdoROv4CBAGjrHhl7qcCFifo
         HwgCGLrWFkz0qwbS+4hjQefYA+S2wHhkXGLSfyWnYJfRVkPfoNrkxobDJ5DNfLMZXJFC
         gw+ZYcfdGaX3pEyqKPAVps+nw8v84m/i7C5YxBksoaR8bSIaWNnEGgDqFPdlBYWi8mED
         Gq7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FGmGt3ydOiq6aEqM4+SnHuttX0NFXnKCi5VYjOYbFXw=;
        b=WMk0KZdhsIB5b/CvpmFEwnnikBMRFL3zCLanMTexNF3iQNbXok2n6LWI4hR4L3+S2R
         MjBUA/J6BRuNeWfuj7+UG2ZTnGfqIq+/apqzfmIJffc2qNQ7S0EHt11FLTJpleoBJrZ0
         /VoCD54gnlz3yjURH7bcvMCa2yNzs1rZVgNBOXJjELuHhmtqnhSk6P8rVhL1DQXVW+cw
         4kKO1l1cSoE0EecmhbpNhAUke7FkSohg4CugoTpcT7xY7OZZBNnJvhTDxaXzQz7g2anW
         wpJv4jb7hEEIN0IKVz18g/KcyN1AZeM7HLEBsIHN0SYQjn7SOSgSdsbh/Fo6kzvq8vGx
         wfog==
X-Gm-Message-State: AOAM531jcdsHaEbghVSIKoObXHT46uo3ShErisof10C6PUx8FzcqzTft
	crbng4luNckeqYMK7xb0pXTxOHHAGEAlfd29
X-Google-Smtp-Source: ABdhPJzeMhvUUv/QlCGUE7LfK/TLDWOBwyTwKaXqumjpAtJy8f6wNmZCvtU2T9ogWt98VmLpXq2JQg==
X-Received: by 2002:a92:6a0b:: with SMTP id f11mr11653196ilc.290.1614585105669;
        Sun, 28 Feb 2021 23:51:45 -0800 (PST)
Return-Path: <flowergom@gmail.com>
Received: from localhost.localdomain ([116.42.185.119])
        by smtp.gmail.com with ESMTPSA id g6sm6628117ilj.28.2021.02.28.23.51.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Feb 2021 23:51:44 -0800 (PST)
From: "Minjae Kim" <flowergom@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Minjae Kim <flowergom@gmail.com>
Subject: [PATCH] bind: fix CVE-2020-8625
Date: Mon,  1 Mar 2021 16:51:37 +0900
Message-Id: <20210301075137.1388-1-flowergom@gmail.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

BIND Operational Notification: Zone journal (.jnl) file incompatibility

Upstream-Status: Acepted [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
CVE: CVE-2020-8625
Signed-off-by: Minjae Kim <flowergom@gmail.com>
---
 .../bind/bind/CVE-2020-8625.patch             | 41 +++++++++++++++++++
 .../recipes-connectivity/bind/bind_9.11.22.bb |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch

diff --git a/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
new file mode 100644
index 0000000000..9e438e319f
--- /dev/null
+++ b/meta/recipes-connectivity/bind/bind/CVE-2020-8625.patch
@@ -0,0 +1,41 @@
+Date: Sat, 20 Feb 2021 02:42:38 +0000
+From: ISC Security Officer <security-officer@....org>
+To: oss-security@...ts.openwall.com
+Cc: ISC Security Officer <security-officer@....org>
+Subject: BIND Operational Notification: Zone journal (.jnl) file
+ incompatibility,after upgrading to BIND 9.16.12 and 9.17
+
+To the packagers and redistributors of BIND --
+
+To our great embarrassment and sincere regret, another serious problem
+has been found affecting servers upgrading to BIND 9.16.12.
+
+If you have not already distributed packages based on 9.16.12 but
+planned to do so, we recommend that you change your plans and instead
+issue an updated package based on 9.16.11 plus the CVE-2020-8625 patch
+found at
+https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch.
+
+If you already HAVE distributed packages based on BIND 9.16.12 -- we are
+really sorry, and here is what you will need to know.
+
+Cathy Almond
+(for ISC Security Officer)
+
+Upstream-Status: Acepted [https://downloads.isc.org/isc/bind9/9.16.12/patches/CVE-2020-8625.patch]
+CVE: CVE-2020-8625
+Signed-off-by: Minjae Kim <flowergom@gmail.com>
+
+diff --git a/lib/dns/spnego.c b/lib/dns/spnego.c
+index e61d1c600f2..753dc8049fa 100644
+--- a/lib/dns/spnego.c
++++ b/lib/dns/spnego.c
+@@ -848,7 +848,7 @@ der_get_oid(const unsigned char *p, size_t len, oid *data, size_t *size) {
+ 		return (ASN1_OVERRUN);
+ 	}
+ 
+-	data->components = malloc(len * sizeof(*data->components));
++	data->components = malloc((len + 1) * sizeof(*data->components));
+ 	if (data->components == NULL) {
+ 		return (ENOMEM);
+ 	}
diff --git a/meta/recipes-connectivity/bind/bind_9.11.22.bb b/meta/recipes-connectivity/bind/bind_9.11.22.bb
index 3b4a299b36..e3b9cacc15 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.22.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.22.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
            file://0001-configure.in-remove-useless-L-use_openssl-lib.patch \
            file://0001-named-lwresd-V-and-start-log-hide-build-options.patch \
            file://0001-avoid-start-failure-with-bind-user.patch \
+           file://CVE-2020-8625.patch \
            "
 
 SRC_URI[sha256sum] = "afc6d8015006f1cabf699ff19f517bb8fd9c1811e5231f26baf51c3550262ac9"
-- 
2.24.3 (Apple Git-128)

