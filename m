Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by mail.openembedded.org (Postfix) with ESMTP id 647E674628
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 16:34:02 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id s13-v6so5541201plq.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Apr 2018 09:34:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sjbmiToafnpuyzJdSVQnYacHb34cDa+MdWw3T4PRsyE=;
	b=EdQZ2LxuwdmyFJNi+5Q4t5jNsBKtQdfAqjNn9HAxkshyezjFmdSWcmJz5g9bLjq4+/
	xllNudftCQpnMbsQiqrRCCa645FiLn7PBQ2ZyQHeKskSXTK7ZIZfyQruCsIZj939PPYC
	ozFQKzu69ISyU3ut1RwLR6LH3J0D8GDvsgndeOsSHc9ovWf6dc08MCrBEVyw3SUmbuhw
	DKeSnt+8HAtiuKFH3A+cEY72jHKgPMyqeykakuhqy2qZJu4L1Ea5q24ZOoP8h/QPp+xE
	VIXCAY8FDC2xGOvW0ckOL9C8n/L0UCAif2S5P/QqSAg2P394u8VlTLfofToDgdrpl1fH
	4raQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sjbmiToafnpuyzJdSVQnYacHb34cDa+MdWw3T4PRsyE=;
	b=DIg0WxBObTjXXbmSPTxFgVwK7LvspAs5ZocSlB0n5Ia7G/C45qa0R1q8mA0jk3jisk
	uFh+pxpsBqVt48GdipzwXMb1i84MHSJGy1F3HiKPez36euUjuZZ1UB2DsVGZbXyxZcQc
	efIOIRzwHWCZ60xhdontbwYTIfWHUZSyL577fxf3pmvRtbbeywu+TPVnHj+DSJDes7E0
	TzZvem89LtS4viRCQGgy9HvqfOBN703Uk/ddjPmBpiOT7Qqj1iwbbkSpwCVlhZ+FcKNd
	6707YLYJRnhfb9pCA0pRvIzMposUmAuIeW3NPP6GXorFmEqjcLFl7CrbnIxMa/KKptA9
	4KSg==
X-Gm-Message-State: ALQs6tARO6o10VEJgS5tOG4mvLj+CB0QBhl+RYNyZAwAJF8shcwKs2Dk
	ixxAiq4ZERX5SJWdv40fqfJmtQ==
X-Google-Smtp-Source: AIpwx4/7tgecjpWdqFrwe0/QXXhGDj1NirQTYB37MKqse5w+t+xhxZAsDlsTdqhCSrGc+LeU8aqqgw==
X-Received: by 2002:a17:902:a609:: with SMTP id
	u9-v6mr10988600plq.56.1524242043753; 
	Fri, 20 Apr 2018 09:34:03 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::487b])
	by smtp.gmail.com with ESMTPSA id
	204sm13450925pgf.61.2018.04.20.09.34.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Apr 2018 09:34:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Apr 2018 09:33:50 -0700
Message-Id: <20180420163354.12065-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180420163354.12065-1-raj.khem@gmail.com>
References: <20180420163354.12065-1-raj.khem@gmail.com>
Subject: [PATCH V2 2/6] musl: Depend on libssp-nonshared
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
X-List-Received-Date: Fri, 20 Apr 2018 16:34:03 -0000

libssp-nonshared is required on musl since
it does not implement the gcc runtime piece of
libssp, which actually it a gcc optimization to
reach to __stack_chk_fail

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1:
- Depend on libssp-noshared-staticdev

 meta/recipes-core/musl/musl_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 9f8c5126e8..a57460ddd2 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -22,6 +22,7 @@ DEPENDS = "virtual/${TARGET_PREFIX}binutils \
            libgcc-initial \
            linux-libc-headers \
            bsd-headers \
+           libssp-nonshared \
           "
 
 export CROSS_COMPILE="${TARGET_PREFIX}"
@@ -65,7 +66,7 @@ do_install() {
 	done
 }
 
-RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev"
+RDEPENDS_${PN}-dev += "linux-libc-headers-dev bsd-headers-dev libssp-nonshared-staticdev"
 RPROVIDES_${PN}-dev += "libc-dev virtual-libc-dev"
 RPROVIDES_${PN} += "ldd libsegfault rtld(GNU_HASH)"
 
-- 
2.17.0


