Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE517C87FCC
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 21:29:14 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.47207.1753910952123124796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 14:29:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=iNXP8I9x;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.178, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2407235722bso3087245ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 14:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1753910951; x=1754515751; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0ZhREfshYAWlUE6w7qVdX+7ndn+I22NR05pKtAX8Dc=;
        b=iNXP8I9x35vpn+RwZHqQFkwCGisncG+50Ts/0rBVLI/5V6fRmz9r00rcrOycyivpDW
         BJ06fzRkzWqIAefD7Qb49CYFiBI3cZVVVl/ROfLSk3JAdkCI+2gXU/1EE14yGQtbecNA
         hVQ9YlU6G5akI7kRQGflZjhj+/+ssovVXPud4njP0lt98ZVHYt/h1UQPpnrJJ/WKbOzM
         bw0VdjKFPUWQgpyG+NSSBxTD7zEaUOA/MFMYlBJgkbvc8Ip6rxEkKpHbq+30ckCntKC/
         Q9dahf3foHj7zUDzj1oHzIghCpt0G+F6Ha/1HpksUQBkFj7u0+J8MFW1ZEP2OBt0+A7g
         12qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753910951; x=1754515751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0ZhREfshYAWlUE6w7qVdX+7ndn+I22NR05pKtAX8Dc=;
        b=K6qzYgn48Z5PPOz6Ur4xooSt8NYozEQ6SzuF8T+eMgum/11Y/6YaGm/rQ8ijot8YFa
         oP142rV8dPn/bO/ogy9mUU2RvLzC/BNpIyqFMUvQDHQIA79nVmvd0J4tgf3iJ0uqkIlQ
         YpJz9rjfZbhXtLvajtsXQG3ayiWegsJquOdAQeqxn4i57xRjj/1mnLU3OWLRcuxg5zo2
         kkhT623Zy52spvx/tT6Ikj1YC8kXUKPleK/Ae6p8I+5diOdh8CNpdacsuffT/kErQjL5
         6kuHnL5qmPDzSqQEASTPzoDSxQH+9SvigszqPMFFAWhqSm2V1izGJP3BrX4f2mEkuIy7
         m1ig==
X-Gm-Message-State: AOJu0YyRMqwznorQ4BjY2kYVHDb+0wWY0mZAloDLZGQwbyOEPT7+QA47
	5Ck93VFkaNyLRO/cGT8KP1Pk1AzQl2WKVUEn2SeekbUsL0sbM0BwTNTv/OLWt+djMZgk7BUZvSa
	gXakl
X-Gm-Gg: ASbGncuas8QZDucVioyyI4ngMtNtpzAbmPzZPr/Id/JJDfaaez98idv8MarrCKR9U1D
	YpXbr8849CITAl9lJ+L6hLSfOVcV5ss2oi7bGtHSe0wSw0HsHQu10Kw3iCn9mQLAwy/hvCP2E09
	oIBDR0SiF7G9EPUgXKddfZqhXiZPcZMaPwXrDPAHf1LeHf2gHIMFyVdeoSoRd140kqXv95Rh2vx
	R2QT2dKDMABBjFN/JkofOQXFx2+mskjeKuFVfkFHlzL/igSpHrZW0sMjLyWB3FNCmfSswiJZGdK
	RKpdVvGmgxKKlOJEp5HqDqlvAxbBUFmyH2WHqyO4yo4Au9hPODfsdtVBfAEI2EP0Ht4FkZrd30/
	xo/ZeH1eFOr2T
X-Google-Smtp-Source: AGHT+IEjZt6cmRO4zOGElzHQeEs/1JFINSX0GnzM+FaAetUcc8xWPolq3BmPKIOTD1MVT7YAdWYLTg==
X-Received: by 2002:a17:902:e848:b0:240:636c:df91 with SMTP id d9443c01a7336-24096aef320mr68420465ad.34.1753910951378;
        Wed, 30 Jul 2025 14:29:11 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:58fd:da9:30d5:829a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899b4adsm576365ad.132.2025.07.30.14.29.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 14:29:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/11] gnutls: patch CVE-2025-32989
Date: Wed, 30 Jul 2025 14:28:52 -0700
Message-ID: <9d9ce14e2edceb211c3193cef88715d9c67fd3e0.1753910853.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1753910853.git.steve@sakoman.com>
References: <cover.1753910853.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 21:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221160

From: Peter Marko <peter.marko@siemens.com>

Pick relevant commit from 3.8.10 release MR [1].

Binary test file was added as separate file as binary diffs are not
supported.

[1] https://gitlab.com/gnutls/gnutls/-/merge_requests/1979

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../04939b75417cc95b7372c6f208c4bda4579bdc34  | Bin 0 -> 1782 bytes
 .../gnutls/gnutls/CVE-2025-32989.patch        |  50 ++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.8.4.bb   |   6 +++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch

diff --git a/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34 b/meta/recipes-support/gnutls/gnutls/04939b75417cc95b7372c6f208c4bda4579bdc34
new file mode 100644
index 0000000000000000000000000000000000000000..ffcfe23e99d4b353f07192729a86ffb5a249bbde
GIT binary patch
literal 1782
zcmZuxX;c$e6rPz(Mj*t1i7X-}tO`naVX?-wfC|xQltmHTVh9i+5R(WIl_e^&NWep}
zD54ZCAQh_~g}4Maq$t4!MNo08fC~uXmV&6A<Wx$}>HL^^_r34k?|$FhbAb|j2b9DI
zB?JUU5VJW;c%PqjT-%jX(0{fg$Ep*MF=N;CfOH)hhDk&SB(q4s7$bzB7!?T#V%Y*4
zePBYR1#J@Z<K#jC!!KSciI?)_qWCx#9oXuRNmPsB<6!AVnVhj$C{K)+#<1Lhn;t-*
zIu8T<V)-%|!;=vt6l|0V@sBh?C}sHhFx(jaUSNVHnKc!#Jf;D|6NZOu;Nby0JiXc8
z>@bj)F`_`f#ViUg04Fdq#X8hkU8iflZ;Tq=m;zi45=<Ss(vEbM{*J#Vb*QU4i!?4>
zSp_doZ|~Zl`D$-o=Z>SDxoXyEU}{igO5_B;+E&4`29^c^re=aTp<*I4P9Db;#EY4N
zIG}{>N4f_SA%YU7K={51qJ&}S_|}R9@ALjfQ_aJjD!ASaJq47MVA7>q1ABO8^fa&V
zeQGMfRGo1sU2>#aEw?mw*}!>YpKT-Z?_OFeCJw6Y-)iiKNYC3U8REMB$Zby^=7i2z
zbU=G?14n1q^uw*5DW@XcqW8C~UUjUtUal-HxXRvrV(j+&_5OEvI*=C-O%$0JD<S1p
z5O4Ms)#Hd4!WE0wU5dTWwltd7=;|ijov-6Alc{|2<4>Po>=vsKWql}}ey_rdTjt|P
zgR71cLntkI9ffwOse6rot}gGA2ut7B35r$(>OuyO#31<(95f5Q_U1hbld76$J*4z2
zetPzz_;t~9ZW*lDVgHsux`Gg32tK4FtN}_wxS@}1%~2W{qcm74A8Dn&<7}xY0w6G2
zzofwMHxwlx#1g>Q#|$(Kgo0%l7L{g-cQN1s2h3<P1`~;+5ZJ;pS}vE!rn|dGFlC#>
zf_3^I<SvlNfYUGt0oJDf3zJItV6vWqjyeK+z$lqeGCqBrJ|Uh@CL56u4+PR!L&MuT
zp%#GlJvjj$ULk<4&*gwx0gF`Hnzc9ic_B}>`_Z!2x}N-)^uf=n4=n!<hGBFe;NTbj
z5dz?J>VJ77^g@91FaQ}@*o<MNhQj1{+kL`Ja8FS9-X;V^P$k@jDxp8&r%(d)sM~gO
z5}8-V$WE(Di<TraRmE`2%8Z;@=5<ZgJ+)d0f&<fgsv95(B|!dQ9>NGDC?;f*iZ-D6
zwYoQ!iYuD1X%hE8KHM9hKX1HmnPx0v2erA1YPPg^%EN;>A==2JH55Dg<An6M%-f>%
zD#W#Z2<JU~#yIbkRVZ!eIcljkN@6n8yAU0)d7^%v*fctW+-?TB7<ga(%NtO`ZSNWQ
z+H%=<&P3N`KYr`p>l?+4ddeAyO<C}0IW`ODJ*>WKk#SMfs3a!_7-<p+H=P^CEUqej
z^4!TUDIZfdLWxlHr^3JJ5z5->yL!(|vgHnKSh^}I|L)w|CQ(Pv@pzx>zJ1g4)?g3<
z0&vCiAv;LBertJa8J950qS9wkd9=$#dgM4v(3dbKO0+~{!<&Z_pIhFOf{3~N%Jw(j
zWO8`qPTt_*L-W)`x2v=pB2gd%+6eV7)YNRevG(jUUlIMcX9pq=QIgjjm$q$#>NaO4
zReZUwGZ?ML4cF6xxd?-|g}iiSneM{ZlElIcQSg+TtxLU}4w^e+ooB^8x!7lf;qkKi
z?D6Kem$HkEm*=tuTiTr8iF=J^WO5XPMY`?-Q%4RVe1zje2!^a2K*3CApS9nM?QU&-
z@R{84+CfF(vCr&nJA}=Trxkx1;~Y`-`b)}^eP7vkA74779r_r4bp7f<r@#VN-uxR?
z``QM#Q2V0alO6=Lo{0ao=6(|Ml<|cN2c}H!sTXi6*s8{&HHl506kq1$WlaaI+1Aja
z=9r7gclJ+xOKA{Wy`=26(P>VVJ2qeYLZ6emDr;4J&OX-3U#ti2+}|9^ygF-6TG=bH
zb|$}L(|J`uP<Pi(c6QqZX{Bm?<80BR&{|zivB=KH<9Zya*KL0DmUC);wmEIbO<ng%
sRX@4icF)r*F}&W({g%z$6wZ*`OQvm|@J`UT#3Q7#!ShY-jG5+t1Dd6#hX4Qo

literal 0
HcmV?d00001

diff --git a/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
new file mode 100644
index 0000000000..e78c2d1da4
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/CVE-2025-32989.patch
@@ -0,0 +1,50 @@
+From 8e5ca951257202089246fa37e93a99d210ee5ca2 Mon Sep 17 00:00:00 2001
+From: Andrew Hamilton <adhamilt@gmail.com>
+Date: Mon, 7 Jul 2025 10:23:59 +0900
+Subject: [PATCH] x509: fix read buffer overrun in SCT timestamps
+
+Prevent reading beyond heap buffer in call to _gnutls_parse_ct_sct
+when processing x509 Signed Certificate Timestamps with certain
+malformed data. Spotted by oss-fuzz at:
+https://issues.oss-fuzz.com/issues/42530513
+
+Signed-off-by: Andrew Hamilton <adhamilt@gmail.com>
+Signed-off-by: Daiki Ueno <ueno@gnu.org>
+
+CVE: CVE-2025-32989
+Upstream-Status: Backport [https://gitlab.com/gnutls/gnutls/-/commit/8e5ca951257202089246fa37e93a99d210ee5ca2]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ NEWS                                             |   5 +++++
+ lib/x509/x509_ext.c                              |   2 +-
+ 2 files changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/NEWS b/NEWS
+index 85efb5680..025e05148 100644
+--- a/NEWS
++++ b/NEWS
+@@ -5,6 +5,11 @@ Copyright (C) 2000-2016 Free Software Foundation, Inc.
+ Copyright (C) 2013-2019 Nikos Mavrogiannopoulos
+ See the end for copying conditions.
+ 
++** libgnutls: Fix heap read buffer overrun in parsing X.509 SCTS timestamps
++   Spotted by oss-fuzz and reported by OpenAI Security Research Team,
++   and fix developed by Andrew Hamilton. [GNUTLS-SA-2025-07-07-1,
++   CVSS: medium] [CVE-2025-32989]
++
+ * Version 3.8.4 (released 2024-03-18)
+ 
+ ** libgnutls: RSA-OAEP encryption scheme is now supported
+diff --git a/lib/x509/x509_ext.c b/lib/x509/x509_ext.c
+index 064ca8357..05336a0c2 100644
+--- a/lib/x509/x509_ext.c
++++ b/lib/x509/x509_ext.c
+@@ -3757,7 +3757,7 @@ int gnutls_x509_ext_ct_import_scts(const gnutls_datum_t *ext,
+ 	}
+ 
+ 	length = _gnutls_read_uint16(scts_content.data);
+-	if (length < 4) {
++	if (length < 4 || length > scts_content.size) {
+ 		gnutls_free(scts_content.data);
+ 		return GNUTLS_E_REQUESTED_DATA_NOT_AVAILABLE;
+ 	}
diff --git a/meta/recipes-support/gnutls/gnutls_3.8.4.bb b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
index e77960724b..367872d47e 100644
--- a/meta/recipes-support/gnutls/gnutls_3.8.4.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.8.4.bb
@@ -24,6 +24,8 @@ SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar
            file://run-ptest \
            file://Add-ptest-support.patch \
            file://CVE-2024-12243.patch \
+           file://CVE-2025-32989.patch \
+           file://04939b75417cc95b7372c6f208c4bda4579bdc34 \
            "
 
 SRC_URI[sha256sum] = "2bea4e154794f3f00180fa2a5c51fe8b005ac7a31cd58bd44cdfa7f36ebc3a9b"
@@ -62,6 +64,10 @@ do_configure:prepend() {
 	for dir in . lib; do
 		rm -f ${dir}/aclocal.m4 ${dir}/m4/libtool.m4 ${dir}/m4/lt*.m4
 	done
+
+    # binary files cannot be delivered as diff
+    mkdir -p ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
+    cp ${WORKDIR}/04939b75417cc95b7372c6f208c4bda4579bdc34 ${S}/fuzz/gnutls_x509_parser_fuzzer.repro/
 }
 
 do_compile_ptest() {
-- 
2.43.0


