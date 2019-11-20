Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id D8AD77F847
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 18:38:23 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id n1so1075322wra.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=KoNVjoA7kG+KBAx67kvRiAcLJE6SWPB52jBuhkWtl78=;
	b=FjK2spVj65n5SrJd0c/KTMfgplKBYMh2IjCfZDjMAFQeO+0SAjs8t2kD3ipmVLdzhy
	PUGixLx0C6pfRQMOxs3JCcjI6ggLAyin6/+/Cd6879EWagvV9beEajlndQuSvktlzGui
	0h/SLCK7ZVDgapaYhdr80vphIlEqdt/q5T1T8Urn354qRQrK8otxu5CnnI/ax3k405VU
	oukNmZzrZUtDNXqLtWVqq6QrEtwTs7020K0YTi7gvp0B4ekFJzv29r3mfmhOoh9jTa9x
	btOkWONcz/SgpiSig95Wb5xuGVaZ5AJ34pxPfi42AMpF/jOr/aGcMOn60erBVlvf60sV
	35iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=KoNVjoA7kG+KBAx67kvRiAcLJE6SWPB52jBuhkWtl78=;
	b=UmabMWOTY6HUlcM/Yw7d0AUcH6mqPz/v02dIm/vLCPk9XKD+DaowKqzqWCEFUcfL3E
	fzu2ppr3V3UE+qoX1MbC8N+k4RLOAjoMu5wXJepDE9dwXEYmFDjhuEyo3w8BFB6HKmx9
	EMwg9Ycv0V/yEaeqi1j+m2K8kEmdQXMkFn8XLdsNjgyZwxTazjqS9X2nsPnab//Yy/78
	R288eZWqmRrt54ozbgwyES5jcdl0fZr6n4ZwQW7SoSpHddguOWcL1E/XYLfvUSbn5qHz
	A49RgkYT3NIQzh/l1FhAI/5r/MgDuSZr3gy+xm9tNPoWIrDY5CI25uMYI0RawPyt9c+n
	bXfA==
X-Gm-Message-State: APjAAAV8ueuTfT0oyCX30vJyUVOwXkDHGgLjLjkAy+8N668MRZPFY8Fc
	eoia29cTDcQdnXmXpBVLYqfmUAP8oA4=
X-Google-Smtp-Source: APXvYqw1YopqgQAT14n5pmKuBypX0P6y67QG0lfgFqQ48y8IeO3npQh56aeW0Goyss3xvSzxqnmp8A==
X-Received: by 2002:adf:9527:: with SMTP id 36mr5253051wrs.398.1574275104463; 
	Wed, 20 Nov 2019 10:38:24 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by smtp.gmail.com with ESMTPSA id p25sm143652wma.20.2019.11.20.10.38.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 10:38:23 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 18:38:12 +0000
Message-Id: <20191120183813.9390-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191120183813.9390-1-ross.burton@intel.com>
References: <20191120183813.9390-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] grub: inherit pkgconfig
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
X-List-Received-Date: Wed, 20 Nov 2019 18:38:24 -0000
Content-Transfer-Encoding: 8bit

Grub uses pkg-config but is only in the sysroot via dependencies.  Be explicit
and inherit pkgconfig directly.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-bsp/grub/grub2.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-bsp/grub/grub2.inc
index c81def2a170..7138e4df872 100644
--- a/meta/recipes-bsp/grub/grub2.inc
+++ b/meta/recipes-bsp/grub/grub2.inc
@@ -33,7 +33,7 @@ GRUBPLATFORM_arm = "efi"
 GRUBPLATFORM_aarch64 = "efi"
 GRUBPLATFORM ??= "pc"
 
-inherit autotools gettext texinfo
+inherit autotools gettext texinfo pkgconfig
 
 EXTRA_OECONF = "--with-platform=${GRUBPLATFORM} \
                 --disable-grub-mkfont \
-- 
2.20.1


