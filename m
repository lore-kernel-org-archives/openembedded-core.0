Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A33FC47073
	for <webhook@archiver.kernel.org>; Fri, 29 Dec 2023 15:46:08 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.151034.1703864759891126675
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Dec 2023 07:45:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=nxX03LWP;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1d2e6e14865so33241065ad.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 07:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1703864758; x=1704469558; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ElcxYNMll73KwBx4ciVCdgJMglO8v//cLRtRxjHhLc=;
        b=nxX03LWPnYqz9Lg5+b6LtlBSyqk21HxhR/It7DsCFRmn+OqzC2vWo7Y818em/hh4rO
         lAmqxc7KUlr2o06d5n+AHZ/q+esft3LqpFD/O6mAbw4orLBdO871oaV/X3okEFzBoWC2
         xcGIo1BvZ8RORNqPpHahbjNDjaKirkCJzAkz6uFx7Gd4lJXD1pdWkLWyisgYUyczs82t
         +g1aozlcE3z6vlbSfq2scSfw9zAyVXLTYqqInlZUaDWuykEO6Au15rlY8DhDmdVa9Kmq
         VmBd8gNx8ta+w3aTmyG0ckcF/1sEr8WGqdA/G03OjjxKkWJ1hW//X56z98gj3mhob1dO
         oUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703864758; x=1704469558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ElcxYNMll73KwBx4ciVCdgJMglO8v//cLRtRxjHhLc=;
        b=MC2X+2fd0z3KLyz5KKwmSOTx3TduC72/T0luumy53PcZ03SzXb3hqrNNFfiGprmE57
         WihdOPdPtHV670ETPSFLNw1NbHDPNq2ua319u1pU8ZSSJnofzJh3wtYaEORsTSDpIOeg
         YyyrjOAB1CIyMRFTwXFZ4My2batdaKOll0xDGLKi86Hge4SSd5q0NXDK5Xy4+BoPLUKo
         wAh6Qsb8JP+csvds//v9Yc//nfOkWsJdig6bGt2Hd8NIwiJaQOxQtDB86RSXz4irbMNr
         FzpoTu2PtU7SqL3I2A26JR3lW3JBsiaiZzUkNTgdRmxuOfbIt8gBbnTwlj9vVAZfjz1z
         Hz9Q==
X-Gm-Message-State: AOJu0YxNXQRSchRtrbHwRusAn8tXVpUDHvecFi0loqTHTvqTx+F4slGG
	dBYYj8SYnHD7cxdNUfwRgkB2RzwxwiM8s7nccISkYwDB03IwJg==
X-Google-Smtp-Source: AGHT+IFq/7Y9JUyZBg8ZFgEfHpA6gjDszv5m34wSA89mKKxQ8OwRvTH3l9e286qJ/1juJckky7VhUg==
X-Received: by 2002:a17:902:d2cb:b0:1d4:2230:7f33 with SMTP id n11-20020a170902d2cb00b001d422307f33mr6554356plc.70.1703864758692;
        Fri, 29 Dec 2023 07:45:58 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id jm7-20020a17090304c700b001d3e6f58e5esm15772705plb.6.2023.12.29.07.45.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 07:45:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 30/41] systemd-compat-units.bb: fix postinstall script
Date: Fri, 29 Dec 2023 05:44:44 -1000
Message-Id: <d114814fa2628cfea2769d65a26514b76e61a0fa.1703864512.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1703864512.git.steve@sakoman.com>
References: <cover.1703864512.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Dec 2023 15:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193047

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

This fixes an issue running "opkg upgrade" on a system with systemd
(and when there is an update to "systemd-compat-units",
for example between yocto 4.2.2 and 4.2.3):

//var/lib/opkg/info/systemd-compat-units.postinst: cd: line 3: can't cd to /etc/init.d: No such file or directory

The existence of /etc/init.d is now tested
without causing an error if doesn't exist.

Fixes [YOCTO #15292]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0330331a1386fd2a34b410a7f62b29bfc8dc23c4)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/systemd/systemd-compat-units.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd-compat-units.bb b/meta/recipes-core/systemd/systemd-compat-units.bb
index 253bc9fcf1..c03d97f9c9 100644
--- a/meta/recipes-core/systemd/systemd-compat-units.bb
+++ b/meta/recipes-core/systemd/systemd-compat-units.bb
@@ -27,7 +27,8 @@ SYSTEMD_DISABLED_SYSV_SERVICES = " \
 
 pkg_postinst:${PN} () {
 
-	cd $D${sysconfdir}/init.d  ||  exit 0
+	test -d $D${sysconfdir}/init.d  ||  exit 0
+	cd $D${sysconfdir}/init.d
 
 	echo "Disabling the following sysv scripts: "
 
-- 
2.34.1


