Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f66.google.com (mail-pl0-f66.google.com
	[209.85.160.66])
	by mail.openembedded.org (Postfix) with ESMTP id 767E6788DF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 20:46:14 +0000 (UTC)
Received: by mail-pl0-f66.google.com with SMTP id i6-v6so2237922plt.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Feb 2018 12:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=O8jHrwCegpNcHOSJJ944DZWkj3Iv0c9e9NbI0F+dXhQ=;
	b=eKtXGvny9Z2lxdTWQnomUshkm2n7Sc4R8qvx2CYnu16rqPII+0oCWCZR0O8OvjXCQ4
	Y7t/pbqATNBh/84VLj8CmZdPFJdZcRLMWXmAQkUs6OmW3oHwaDHmp3RZzDgtSFDCHzcq
	WfbBzdWo7jSFK/oYIFja+iJPPCKisJD2MAwAnkcC1z/lJmOu1o+n79ytG7kPfBANdf9q
	J2Y/900OY/U6z6Stgy98RJEMxnyYcUvGmTQ/3/thzz/57Zsx4GQMtgiDfz/2iemf/Nft
	xp0mCUPJONPqYonAgc5UZ2tQien9zN+VcQQNLieZ2TGV9NsuueHVEn0lLQ4cvjqM+MnP
	DW2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=O8jHrwCegpNcHOSJJ944DZWkj3Iv0c9e9NbI0F+dXhQ=;
	b=MbM8Uq7t/mpoOIpDK57+L37wKm6VP9dVdNIdZT1AfJq0crW/tiArU7cnLbKdfRf+gZ
	huXp3+MDLqktOGwKpL71TCX8Y9V8foYVnwLCdv/bLHqztIFhtG4fQBbO5f2SaohgK6Wm
	WABiKUhHNdo53fDYkDPNbPlHrb68ohLdoOlsLH90kA9KyA43A1TTiRKf4Jpi9eeZT3z+
	Dvx+YW0m5R2R61QZlEiwfIq896vppuRhm4rskLDKgB83kgd6lcJ64WW+i8ZsQF+txbEh
	dbK67n186rTir2CUvh8dRFkR2+GlVfiEVEMRjGIfOXMiHwndEHShwu6rbsrooTLabj2o
	wm6Q==
X-Gm-Message-State: APf1xPD5SDNLgQHJBh+7j+swvSC+B96Ew0BpP3Ju4ningm7ITvEXD8Qv
	rGFFWgxUp6m1hSybczQdSl0ltg==
X-Google-Smtp-Source: AG47ELuds36Y2SIWdly6cbOZLzgQVyV9n+SBJks2JMTm2rmKWIeff31VHy5P1yb9ojws0RcvmW892g==
X-Received: by 2002:a17:902:b704:: with SMTP id
	d4-v6mr2501337pls.406.1519850775626; 
	Wed, 28 Feb 2018 12:46:15 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	r78sm5376700pfb.24.2018.02.28.12.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Feb 2018 12:46:14 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Feb 2018 12:46:07 -0800
Message-Id: <20180228204607.16416-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH] glibc: Enable static PIE support
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
X-List-Received-Date: Wed, 28 Feb 2018 20:46:14 -0000

go programs when compiled with PIE fails otherwise on aarch64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glibc/glibc_2.27.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/glibc/glibc_2.27.bb b/meta/recipes-core/glibc/glibc_2.27.bb
index e9d4117a47..62db3e9d02 100644
--- a/meta/recipes-core/glibc/glibc_2.27.bb
+++ b/meta/recipes-core/glibc/glibc_2.27.bb
@@ -81,6 +81,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
                 --enable-bind-now \
                 --enable-stack-protector=strong \
                 --enable-stackguard-randomization \
+                --enable-static-pie \
                 ${GLIBC_EXTRA_OECONF}"
 
 EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
-- 
2.16.2


