Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
 by mx.groups.io with SMTP id smtpd.web10.16949.1621247754398099088
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 03:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jriGxHN0;
 spf=pass (domain: gmail.com, ip: 209.85.214.181, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-pl1-f181.google.com with SMTP id v12so2881957plo.10
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 03:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=6B2d0H7uJf+u1IBpJdwQ7ZDN5YW556iV/YAn9Ic4eSg=;
        b=jriGxHN0qbO28qIJYnoRfBbQP4hERB/OuCKEoA68pAb56c07zJ3OAW4qrUNWUgqZc/
         LB2/3Jk0UgX24ZV7I2M+AwrPG7qDXiPT+TsD1NUxDkKuzaN4z4g/3QbJWIMMtMN3tDOi
         q2EdZ30kFgp8WaT4SJ2WUS2+eCJhQsKhB1pirRwDqXVisV9IIAplU8b/bKETTP6GRSGY
         3OH1pnOU2SO5sUGEbOe0AfYniYd6bkFCwOf4i92GBdCD7HIcbJ7YkDSFsV6qNpTdVuFT
         YmcmDbnknXcCwSnTj0rhsH4B56237Nr+khwJfJfpkAixPKRHv7O1vtFNDo/M3uU0OsFT
         wEVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=6B2d0H7uJf+u1IBpJdwQ7ZDN5YW556iV/YAn9Ic4eSg=;
        b=TCXZpbMcvnox76tpOY96D33Vt266nPESGPovZtaxIKW+DNyaJ+uJ9MWvgn7/KTZjqJ
         kDeyFOEtK9a/sY7eEYcXJOQyqUL8tXOJJmI7TeQSlR78+jRxZk44xGaHN75Mg6lG9/xw
         gUAW5YBvxKYSKXgXRqJyCB0vo7KlCY+G47YI1W5vUAx3duFUDGwoyENgaYZ+p40M0UTr
         TZeHN3c8iktWIlu0/n6xtEkSWaHWGbQYCicO2Tc6hch4LHY/UHYe9k6ySK8ACjjRWCzj
         QXB1r3JQ5IpWWcrKSGTiM0PV7MF7YSmRO20xqvXA2nmKF3uA/761GlQBRVnimywfMb1/
         ilPA==
X-Gm-Message-State: AOAM533QSyDLguZZOiqBBkU7EzNTljD1a+4ZWMC1Pw9aJBDEmlUpmmmI
	7VI9wMRXM80mzEbMCDnefOcsPyrUJn3vj6yU
X-Google-Smtp-Source: ABdhPJz5mTYBmjgcdxm+EMoNvKcbSldbJP5MdzvmRK1rbYIIfP3M7+zHsm1oFeI8V/F50ieI6hLIZg==
X-Received: by 2002:a17:90b:1c0b:: with SMTP id oc11mr9883771pjb.156.1621247753592;
        Mon, 17 May 2021 03:35:53 -0700 (PDT)
Return-Path: <vinay.m.engg@gmail.com>
Received: from ala-lpggp3.wrs.com (unknown-105-124.windriver.com. [147.11.105.124])
        by smtp.gmail.com with ESMTPSA id m20sm14903365pjq.40.2021.05.17.03.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 03:35:53 -0700 (PDT)
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Cc: kweihmann@outlook.com,
	rwmacleod@gmail.com,
	umesh.kalappa0@gmail.com,
	vinay.kumar@blackfigtech.com,
	alex.kanavin@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Subject: [PATCH v2 4/7] runqemu: Add hostfwd for rust testing.
Date: Mon, 17 May 2021 03:35:25 -0700
Message-Id: <20210517103528.24434-4-vinay.m.engg@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210517103528.24434-1-vinay.m.engg@gmail.com>
References: <a49a474e4767e9892598d529cd77bcdb89ccaadb.camel@linuxfoundation.org>
 <20210517103528.24434-1-vinay.m.engg@gmail.com>

Set hostfwd for rust 12345 -> 12345. This port is used for
"remote-test-server" and "remote-test-client" communication
while executing on qemutarget remotely.

Signed-off-by: Vinay Kumar <vinay.m.engg@gmail.com>
---
 scripts/runqemu | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index dd92a64553..9569dbe72f 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1056,7 +1056,8 @@ class BaseConfig(object):
         self.kernel_cmdline_script += netconf
         # Port mapping
         hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
-        qb_slirp_opt_default = "-netdev user,id=net0%s,tftp=%s" % (hostfwd, self.get('DEPLOY_DIR_IMAGE'))
+        rustport = "hostfwd=tcp::12345-:12345"
+        qb_slirp_opt_default = "-netdev user,id=net0%s,%s,tftp=%s" % (hostfwd, rustport, self.get('DEPLOY_DIR_IMAGE'))
         qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
         # Figure out the port
         ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
-- 
2.17.1

