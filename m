Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177])
	by mail.openembedded.org (Postfix) with ESMTP id EBA0F7E5D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 23:30:19 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id a3so4860214pgb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 16:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=I+R86ZV/Ouxs7+GUW+RT1cOVZ/Oj3vxyiugRC2cIRsU=;
	b=ROBcglMHcEKDA+QJhwq8sq5Oi+DKnt53m+2QlgMyxQdrspmHzA2DD1oOIqosOSa2NF
	Jn+WUX/ZvQEBJUJOGi1F+lpRUH9QHV80u7LYWTmMas5jB9XDrK3Tm15dvLljx7ygnt5c
	ch9M82eayK/LinvRnajgot3po/DjIaYcvSZkZcvDuOB4QWN98+UpPm9kjV0CBln3V+sO
	gzX9pXzbKEst4cUL2DaO2Fb3tF2Xdoij5vedqtq/FSRaERwT6fNMCZC/H6s/FN9RivGT
	K1HFc8+zEDpDiWT4Rc0c1T5X7SkM32KSLAyo2YZcyN9FE0Dh0AGRZifBTP/4a7BGcVIn
	YrTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=I+R86ZV/Ouxs7+GUW+RT1cOVZ/Oj3vxyiugRC2cIRsU=;
	b=SZ6AEVhz6bzmOHVg/zVuerq89XoE3NeSSkkdaAQDC3+lUGNpHrRipqC4J76Ge1J+qp
	11hlJLSNjFzfQwEpQb5YRLbBvQIVDXz3t9AE/p6bRukGNX3eTYQICLm/Ie7CWHUJGv3O
	WwmEv+rD03sEgHJ3wcR9pJKklizoTpZI0JBxiMhgzVEyR0tdf4lZ1ONAJKG++Da8Vh9x
	Ua/uAi3spC+MXXiFhSnxb3UlIif2kTMwa6F0KagvuRFuxACLjcSFLBMuTMl0k1W1P0n3
	JmhaVuRQWJ30sMIDCmezojjSMAFJzsRBlrVub3aQBsHz7gqLlKY6JKVhXl+uSFMALoc6
	J0Sg==
X-Gm-Message-State: APjAAAUo3aPP6o2K7iMcKCUbZnWs4GrJPXDEhm49JL81pKcDHH+ate8q
	vYSCtQ5WPGzAcYAhxbOMmiMGRcBf
X-Google-Smtp-Source: APXvYqx9Xs79cZoz9ZdaaM6YwfqdwpHHM/DA9z6TmC0x6Jl5EzJKe6UVocBOZkR9g9SiaQ+WdjFH/Q==
X-Received: by 2002:a63:fc61:: with SMTP id r33mr12214895pgk.294.1559345420197;
	Fri, 31 May 2019 16:30:20 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:c33:d8eb:da43:9914:3fc9])
	by smtp.gmail.com with ESMTPSA id u1sm7199631pfh.85.2019.05.31.16.30.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 31 May 2019 16:30:19 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 16:30:14 -0700
Message-Id: <1559345417-17830-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Armin Kuster <akuster@mvista.com>
Subject: [thud][PATCH 1/4] go-target.inc: fix go not found while multilib enabled
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
X-List-Received-Date: Fri, 31 May 2019 23:30:21 -0000

From: Hongxu Jia <hongxu.jia@windriver.com>

Go binaries were installed to ${libdir}/go/bin, and create symlink
in ${bindir}, while enabling multilib, libdir was extended (such as
/usr/lib64), but BASELIB was not (still /lib), so use
baselib (such as /lib64)) to replace

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta/recipes-devtools/go/go-target.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index c229ab2..379f87b 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -40,7 +40,7 @@ do_install() {
 	for f in ${B}/${GO_BUILD_BINDIR}/*; do
 		name=`basename $f`
 		install -m 0755 $f ${D}${libdir}/go/bin/
-		ln -sf ../${BASELIB}/go/bin/$name ${D}${bindir}/
+		ln -sf ../${baselib}/go/bin/$name ${D}${bindir}/
 	done
 }
 
-- 
2.7.4


