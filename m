Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id B617E79367
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 19:11:44 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id a5-v6so374012pgv.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 12:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yFEvFdJuFY0s56J2M0SlANGBPb+8JeL2FbMKiB+y1kE=;
	b=lKb/dj2pXaLkcIbGg+jgYcmyNoWbNN8XTmxxRu2TMTEapH6fjXFcs38T+f8I+nd4m+
	kHE2X0dg7cCCF9x7cPs6IpuwTjsqf2YD6avEBsrTx4P/08jNOHg44+OT2F0zSm32WlLD
	VVfJzYGQFJPf6pKZm9bSpgmgZjnrznPs3cCiDd12r3MDZqGWT4ckAvuiarPQhNKYiYAn
	s/JQJLPmy1+UGB3zpIJlZ0xlWW4Ztw411D1RTFUgaN90G0M+hbmuQ5xr8Io8OfD0z9JC
	CBWb574siCt/h3Ko1LatvjpG+lPzs5GXAmfR8drAoFtCXYgWXkHh8qrh33GGImXWB83/
	0UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=yFEvFdJuFY0s56J2M0SlANGBPb+8JeL2FbMKiB+y1kE=;
	b=VP56mSD0J+9sIkbVDmIG8iUye9JA/wYllF/WqUMzLCseJu38R7mR70EqRWMdEBB+iJ
	SU6yuYoQ/9Wt0Vptcy3+LidP6zblrUT/yeBo78h8cr9wwHVBDZAvQYILo6zSnrrcuYXB
	9qKlQ25gcFfBbrJ8n1dPVw0kyy7jqlpF+KUBX2Mkry01DewK161HP9J2j38o7QHG8gQM
	oI6Vd2l14mTnaCaMGRfFu/o9s85zFAwOMPJ0s115kWv6MHTcjKkFpfbeleyESaa++/oE
	gjuje9VgwXCcINLjLcAr4xH+GdluFJxXDvjIjSS9vO3NKYBCMVm2CsgV4FGOEbGXAh7R
	9Mgw==
X-Gm-Message-State: ABuFfoiOEdEwsdewDELx13WsbOiq9gh60B/9cMkZU2HcFuNZ+Eky9/KF
	d43m9z5XUjMvPCX0LJx6FTlTe/qB
X-Google-Smtp-Source: ACcGV61aixyGdFSSTC+uyuuIZ5ZpTtLkwM7kMtRra1rd5DwZP2ELe/TQ1r9PGojrUZOsaEDkGXDARA==
X-Received: by 2002:a62:798e:: with SMTP id
	u136-v6mr17416994pfc.95.1538507505218; 
	Tue, 02 Oct 2018 12:11:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::fd07])
	by smtp.gmail.com with ESMTPSA id
	z3-v6sm22863400pfm.150.2018.10.02.12.11.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Oct 2018 12:11:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Oct 2018 12:11:36 -0700
Message-Id: <20181002191136.8792-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [PATCH] mesa: Disable asm on musl
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
X-List-Received-Date: Tue, 02 Oct 2018 19:11:45 -0000
Content-Transfer-Encoding: 8bit

some unknown part of mesa's x86 assembly
code is broken by readonly text segments

[ YOCTO #12918 ]

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8d0e2cb67c..e6f3712706 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 
 EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
-EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
+EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
 # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
 FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
 
-- 
2.19.0


