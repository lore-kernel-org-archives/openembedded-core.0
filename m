Return-Path: <mihai.serban@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 51F1F74CA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 19:57:07 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id l10-v6so11011999wrn.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 12:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=BFRu51lvAFtXBe6MLhcAyP0DEBo+/9mkgdUr7MF12wE=;
	b=I8tqjicp1xMLuf52i9nLqJyGSF5ntNM3ZATMio+uKMC4k1oFhc/l+Fl/bdyQZRFRSG
	ZEzA+C2/6AwzyS0dPcpeZqCW7diK5qa5HbkMSzVKbYsNM8F+vXAXhelTWG/gxNuq0mbJ
	QvHCOu+zve8ErG9r+9/wxfJjBebzhJ63pShGEWBkHXxwUVXqvn8JOEEb3hsWe/xqjGnC
	PmJFiHvqN1lBwNpJ/dow9sbUvpIsAsK3U8MJ4y9tCI8vdipGWGicCymJz/iLh/f/8EgR
	9WoIFOlysyY9MChyckWxMzUyUbJ0suqm7WwXRsxP95/vYQL5iTnUK2+iHxPQMYicZHqm
	Mb8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=BFRu51lvAFtXBe6MLhcAyP0DEBo+/9mkgdUr7MF12wE=;
	b=rxzZpEM4hwKNSKPhr0oHoNztzhNek/RYqrOqf/FyXXGASyiEunAq8minbTY0DGfHIf
	mMVQkGLi0NoHhd+JTRa4cjpem133mKeP4bP4VR6xAmoEzAe+1WhkEY2C2yppgzX/2Xsl
	QizHbMxv1NSm0aKLw5qVadTlvMcn+BOOB2sk2uzPbhuEF7Cv60Tp5S3FRBTVIOVCspbW
	P+MwDPi+cmVv6zM7iIbjld+AA88+3bofKX3fuYVYHBt0y0DHA3iFLs5ARsAwdmGAbwy8
	5rhkd5ktDWhfEcRDlEA2u77nRiJvX7QrDsalC9CEQsXvjo8iLhmUXmdZaHwCimw3yTZw
	L2xg==
X-Gm-Message-State: APt69E3Zv6CuTnm/f11D1V5BpSikz7ndp9Hm9UWx2CKA6Dc9Se7zJJx3
	9IdulVZgrGjpr0CyRvYItCoj+Hw/
X-Google-Smtp-Source: ADUXVKIgx74xdGUmtX0PQdjvRCiljr2gttQWalKpbNdOtOtVIIht3H7fSDN61LGWJv3oHHjXP9bOeg==
X-Received: by 2002:adf:efcf:: with SMTP id
	i15-v6mr2920097wrp.195.1529092627715; 
	Fri, 15 Jun 2018 12:57:07 -0700 (PDT)
Received: from localhost.localdomain ([95.76.150.3])
	by smtp.gmail.com with ESMTPSA id
	v2-v6sm10019063wrm.84.2018.06.15.12.57.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 12:57:06 -0700 (PDT)
From: Mihai Serban <mihai.serban@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 22:56:57 +0300
Message-Id: <20180615195657.8664-1-mihai.serban@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v2] kernel-fitimage: Allow DTB file relocation at boot time
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
X-List-Received-Date: Fri, 15 Jun 2018 19:57:07 -0000

Use UBOOT_DTB_LOADADDRESS variable to instruct U-Boot where to place the
selected DTB file when booting the system.
Without this settings U-Boot uses the relative offset where DTB resides
inside the loading address of the FIT image.

Signed-off-by: Mihai Serban <mihai.serban@gmail.com>
---

Changes since v1 (thanks to Alex Kiernan):
- remove entry line and UBOOT_DTB_ENTRYADDRESS since it is not used for DTBs

 meta/classes/kernel-fitimage.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-fitimage.bbclass
index 50a91e199069..b8ade9c38c73 100644
--- a/meta/classes/kernel-fitimage.bbclass
+++ b/meta/classes/kernel-fitimage.bbclass
@@ -134,6 +134,11 @@ EOF
 fitimage_emit_section_dtb() {
 
 	dtb_csum="sha1"
+	dtb_loadline=""
+
+	if [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
+		dtb_loadline="load = <${UBOOT_DTB_LOADADDRESS}>;"
+	fi
 
 	cat << EOF >> ${1}
                 fdt@${2} {
@@ -142,6 +147,7 @@ fitimage_emit_section_dtb() {
                         type = "flat_dt";
                         arch = "${UBOOT_ARCH}";
                         compression = "none";
+                        ${dtb_loadline}
                         hash@1 {
                                 algo = "${dtb_csum}";
                         };
-- 
2.17.1


