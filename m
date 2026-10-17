Return-Path: <oo.hehir@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F0BCCF2C9
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 11:24:22 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4551.1792236254007309741
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 04:24:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=R+FFDW6W;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: oo.hehir@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so506470f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 04:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792236252; x=1792841052; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZcDTDzs9kgbUhE9Q3fnAi1yw2rTeniMAJpt38V/Re0=;
        b=R+FFDW6WxzWK63+m0ZokZ+g5MoVi5kh3UiEXnz3xbvC/XIybQu19c0dKrrWC/3CRoE
         EIbBprKD/ISCJJiV4sRwkALy+tqoUWBGI4+373IOizJFxDZm0bC31Bm3DYI1XomZw41f
         kSQwItotu8EdZ6q3HzTTpBG6DiFdWcaAFA9KZla8sbc6fdAH8t+sRqBlsLkTuznlpfWj
         LhQR1K+FZNbziKIq0akKpunzc7LCRpJZ71p6DRg4AHArzT2RtK7II6/azNO7yn7R2ZF6
         +SZq/2VaYw01keDcQf9WYJpYRDSL4R4rQOfsZi+aejYAKSfE6YMzOxVm6idiNx+Z2hJp
         OL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792236252; x=1792841052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZcDTDzs9kgbUhE9Q3fnAi1yw2rTeniMAJpt38V/Re0=;
        b=HEBn+RaCVsdqdDv5PZxek0tPpYytYhJeoK0xQbIFZ1j1YsWJlkUgenw8bXqZJyvd68
         Asy6PPWnoYiKicwE2dPqdWcFL+SPgXO29m3Cs9b7/wR+6JSPn439jN/3sCnDPzdG5w9a
         93WqtMug1yyZMBgyf2c6EhoP8htn4tOuSiUoI8ftARtoYDS+ja8HIBK28XXt/x4KnXSz
         UE00INAPM3KvnS7myaI3f876X40bgUvvRns4uM8ywjo0pe4KZbAUZXI1iEYRUIoX1l6R
         dUvL63bNK1moFQMX2sGLpRUkNI3rolhcltvFz6bF+QRVm6HhrHcGaOHDWz93Ilg6RW3w
         rlkA==
X-Gm-Message-State: AFq9FYLYXyTD2YgN4T8sEHEipDWK/XY2bKYkI8lMuHFl52MGZy/jZfk1
	KgLjYdTcNHXM8YdMxj8FnIMEEeAPIlktPy7t1N7Ch6n3WJoYxe/l0hJcfKW8XllZ
X-Gm-Gg: AYBFou3Jea7fJ2HF/YG+c15g1cAJM8obtX2SJmm6Cs2/LkGcpB0ga2JuFiK9dYEWT7p
	CDTt0wUL+5sIGC63pInej+a3kv9cN2MTaOyyjvNRJzFp1TPkDXP2b66+NF3hs+nW9kufTOa+pjy
	mXLouo0IHX2+tZhpB2ii070ic/HRN+94Lne2fA3Cm19QWgprWidW0qfNdXJXfP1BaMpbW+mHIyO
	iiruW5EN6elWJF5tsnXK9MrdOii5W4RbJNsFIwLMZ1yB9n3jsLSAnM8heuDVVRFDxxAd4V3lgew
	JmeB8zixHmqI7sofs3M9PCRMP/THSWAsh6pAucfHBQBHMaDg/O8++sLS4UCH+8sX6rIeC/isxO/
	28ZvTmfPjJdyMkpcaXm3BBQWNt/JY+0C+YmYmvbepIqXmW5RXx9kkdb8W3I2WHkL1UbHLzAoWjW
	mHwkRsvaJqLpC19WU7R4gaJMBoKzsNEXONt0eC4BpAfxVhh67RZJT0GS4y42NBxsAIbSWgg/JuV
	ot5LkTQaskn4rw=
X-Received: by 2002:adf:ec91:0:b0:48c:54ec:ea3 with SMTP id ffacd0b85a97d-48dfae65b2dmr11761875f8f.13.1792236252189;
        Sat, 17 Oct 2026 04:24:12 -0700 (PDT)
Received: from hp-z640.fritz.box ([109.77.135.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd471877sm9140287f8f.1.2026.10.17.04.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 04:24:11 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	mathieu.dubois-briand@bootlin.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH v2 6/8] tcl, tcl8: skip binary-40.3 on RISC-V
Date: Sat, 17 Oct 2026 12:23:55 +0100
Message-ID: <20261017112358.77434-7-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261017112358.77434-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
 <20261017112358.77434-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 11:24:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248085

binary-40.3 expects a negative float NaN to stay negative when widened to
double. RISC-V returns the positive canonical NaN instead, as the ISA requires,
so the test always fails there. Reported upstream on the matching MIPS ticket.

Signed-off-by: OOHehir <oo.hehir@gmail.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest   | 5 +++++
 meta/recipes-devtools/tcltk8/tcl8/run-ptest | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 18e03716e3..6991873978 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -38,6 +38,11 @@ SKIP="$SKIP httpProxy-\*"
 SKIP="$SKIP mutex-condition-\*"
 # Timer-related tests are going to be fragile (16324)
 SKIP="$SKIP timer-\*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+case "$(uname -m)" in
+riscv*) SKIP="$SKIP binary-40.3" ;;
+esac
 
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=${*:-tests/*.test}
diff --git a/meta/recipes-devtools/tcltk8/tcl8/run-ptest b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
index 40666ef851..aa0959f013 100644
--- a/meta/recipes-devtools/tcltk8/tcl8/run-ptest
+++ b/meta/recipes-devtools/tcltk8/tcl8/run-ptest
@@ -36,6 +36,11 @@ SKIP="$SKIP http11-\*"
 SKIP="$SKIP httpProxy-\*"
 # Timer-related tests are going to be fragile (16324)
 SKIP="$SKIP timer-\*"
+# RISC-V widens a negative float NaN to the positive canonical NaN, so the
+# sign check fails: https://core.tcl-lang.org/tcl/tktview/bf029ced86
+case "$(uname -m)" in
+riscv*) SKIP="$SKIP binary-40.3" ;;
+esac
 
 # Run all tests in tests/*.test unless tests are specified as arguments
 TESTS=${*:-tests/*.test}
-- 
2.43.0


