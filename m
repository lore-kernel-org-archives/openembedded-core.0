Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
	[209.85.214.174])
	by mail.openembedded.org (Postfix) with ESMTP id B28767FCB8
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 15:30:47 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id g6so3950418plp.6
	for <openembedded-core@openembedded.org>;
	Mon, 13 Jan 2020 07:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vJ3KI5owfoytkqmKX67UY4nCre6aMgwDwNa23PxemM4=;
	b=boFfOfmfrs+qryAPCligt2ylW4FoMmUr+4CHfdVxoA1+Ns3xjqxHNOw/BRLc9b2gWL
	5ym30rpgL+x0PAQRTQA0zNnuJZX7KQxIJ210xkf5vpoY+3gYlJbI7e2wwO0s/dYv1t5O
	3HhL3Tc2FUg0x4Ajkrbp8QUwtjVgac9Ed55WUpgfyK/sVGiM0CY8kh64biWCNfbjryw/
	Ekt36sRyYP1cLWOzFNh1kxaLBM37XgIivsHaqhoccYg6tdcvSqUbFiHUc8Y0IeOKTS2c
	C00wrrw4/a5AB/GtOnsnwWby04fKrhy6J310HGVMQ5dgMnxfnnpl2nN5ql3bcOfAmvCR
	oKUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vJ3KI5owfoytkqmKX67UY4nCre6aMgwDwNa23PxemM4=;
	b=k+OUeUNtT7s9T3J9V5W3a8YBxOQk0YYrQ3c7rtvubNXrZJJzk3/N3ORYaXTfGLwGNq
	MTcJOZpjKo9mNtl/45xW86FfsZcMGBE6Y39C1PXWhqF+Zh2/Bo94+Yb+wO/v3BegQkmM
	0wEisERmajYkLEzpigpAdpsMDXYCvUQiSRTnXfbcY5+VFK+Dkmp0xsIpfwmMmIyW08n/
	Zefj3+ObTjLo9+A54bWavlZnF/R+FGwvWF8DSu5cEaclKmbDwUIQAgj0t24W53FbGzW3
	dBrA0NEHCwYaXrzxDnp+wleBPbXuAMnouLE8XhcUjQyB1K98NaQvakrn8SRO0SCOEABa
	uGyA==
X-Gm-Message-State: APjAAAU3/UqtSGsg0W7805OV+B97fziAa/3alH4cIltiZpo0ngHLmgSr
	Y7WZ056AaxfEvrDpMQz9vLQ6I+sH
X-Google-Smtp-Source: APXvYqx2d8CDvG5RXaEZwpCPLB5p2e+Q01IFGQDiBiNThLDRH/uAuKZMDEeLC2Do2mh/Fq8y4DPF7Q==
X-Received: by 2002:a17:90a:cc10:: with SMTP id
	b16mr21876662pju.55.1578929448557; 
	Mon, 13 Jan 2020 07:30:48 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:2dcb:8dcc:2050:e41d])
	by smtp.gmail.com with ESMTPSA id
	q8sm14167646pgg.92.2020.01.13.07.30.47
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 13 Jan 2020 07:30:48 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Mon, 13 Jan 2020 07:30:13 -0800
Message-Id: <430e95cd819577d4d71fe6d579a175b8776aa467.1578929268.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578929268.git.akuster808@gmail.com>
References: <cover.1578929268.git.akuster808@gmail.com>
Cc: akuster808@gnail.com
Subject: [warrior 14/28] cve-check: ensure all known CVEs are in the report
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jan 2020 15:30:47 -0000

From: Ross Burton <ross.burton@intel.com>

CVEs that are whitelisted or were not vulnerable when there are version
comparisons were not included in the report, so alter the logic to ensure that
all relevant CVEs are in the report for completeness.

(From OE-Core rev: 98256ff05fcfe9d5ccad360582c36eafb577c264)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index c00d2910be..f87bcc9dc6 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -208,12 +208,14 @@ def check_cves(d, patched_cves):
 
             if cve in cve_whitelist:
                 bb.note("%s-%s has been whitelisted for %s" % (product, pv, cve))
+                # TODO: this should be in the report as 'whitelisted'
+                patched_cves.add(cve)
             elif cve in patched_cves:
                 bb.note("%s has been patched" % (cve))
             else:
                 to_append = False
                 if (operator_start == '=' and pv == version_start):
-                    cves_unpatched.append(cve)
+                    to_append = True
                 else:
                     if operator_start:
                         try:
@@ -243,8 +245,11 @@ def check_cves(d, patched_cves):
                         to_append = to_append_start or to_append_end
 
                 if to_append:
+                    bb.note("%s-%s is vulnerable to %s" % (product, pv, cve))
                     cves_unpatched.append(cve)
-                bb.debug(2, "%s-%s is not patched for %s" % (product, pv, cve))
+                else:
+                    bb.note("%s-%s is not vulnerable to %s" % (product, pv, cve))
+                    patched_cves.add(cve)
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.17.1


