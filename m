Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 992D5CCA490
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 22:10:54 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4365.1792184051691469754
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 13:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=heL2xf4p;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: oo.hehir@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c169ae1cb26so257721766b.1
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792184050; x=1792788850; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZcDTDzs9kgbUhE9Q3fnAi1yw2rTeniMAJpt38V/Re0=;
        b=heL2xf4pVMeNRIiFG+cGk9Pu3A9BFsO6T8ZfaLE8nvlzKtdeBAlMjiC2g+6zW58qas
         Y7dsPH97chNG3q+ECGVhpgxg2UybRhraGTZ68doy+0O7CNWej6lC96+vE1l8f5k5FEaz
         JXb+sq3EJVRYZI5FD+t5AwcQWzQqFcvRZqvGqqTxh24bWOjKjR/NWG32PFwStXz6B/3B
         U9h6JrzYyqDiQkEvXo/CeUz6zSKq4PWxOqiWBlHbjJ3GRpc3OshnaVnE4jp/NItAn2WO
         3JoSyXhSKb4w0CEEnCDSovQ3n3vAb2zhmxdizIl4MA5nLA/RYzq/RPzoMx2el4Wn85hi
         1D8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792184050; x=1792788850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cZcDTDzs9kgbUhE9Q3fnAi1yw2rTeniMAJpt38V/Re0=;
        b=DtACKLMjjeHXnHM0MwXmkF0NHdkT9AVy41IrosF60dyr/4SMTU+t3UHJAN2rnvqx3y
         5rWcNoTqsuYdZFjRVR3IV6/Nwbl5a/8GKljQtNFxfvr9kgELZCBG8DCgL+3IG0hzjTxW
         pnOroQb0w1oJK2a2sWtbKwknUAGD0Izae+MRpB3x3Y5uDV6BDN3XIS/E00KMEeXsIyV5
         i+rkXkvFqfU8b6LVCNrh27BmiqRPXpO2KSGhZ1Lhr00X44zbOPTl+IgjwqgUgnk5uIEl
         Kow2eKQuqbeIKbLuNaVfW4FKaMxW9q+cAbBxkdHehaX79JOVdkRX/7CYU3mdfq0kgOrq
         5gCQ==
X-Gm-Message-State: AFq9FYKsHikb38Wja1t2qvPPVWTpdCIor4NxJsi36Gd+naBh4sDk5LEw
	ItuqPaTuhZ7deCP1wUKShJYZ0sO/XDBq/wE5eiZ/4DsOn0y8BEZH+Eu8tAab8A==
X-Gm-Gg: AYBFou0LAzSzspo6TqzIChPB5KmEpyGX7k4QknUq4S0oBQHqWaZK8kMnzDDA9Xr0Sss
	CwNwe2IPTb7n+3RcwvP15H3EGbvuyXCsu8WE7imXUx2QHeOY0wtWtrADuSDLZTe3szbUnHuv/mt
	qDep3TS9q4gBOpHlqjT2ZDEn38IG1LyaVNMZsP7sqxr4MDFYhRFCSgJ9wWcTLxuc6JIzPk7SO96
	5vqgrWGTPbL2zoKP3BvqZyBiqqiA/SMmW7J/iuNO3/ArzyBq6pbq8M3c6uwpu7u2OxAzJzpPA34
	rBJgbMk+ziKtWHApy43R1I9IxvcgjdQgSCKN7PupX5ZHShlrZz/LlsQkvLSKJc4LWX3jZj6uZog
	x2WUV/Mjraw4iHQlH5x/ek3lEjy293KNcX37naD0bj5pV77wFpwrZkDpeqH+jK+k/dtY+65zPgY
	+CWkU4+BOVu3iJdFkBPxS+5fme7SOK7NjtBWwvH3nYY2wbQunrsSc7CbfZ+4Q8u65M1R27fNiq4
	Vs=
X-Received: by 2002:a05:600c:1f83:b0:4a0:20b4:ba93 with SMTP id 5b1f17b1804b1-4a1d7612128mr18622095e9.16.1792183661167;
        Fri, 16 Oct 2026 13:47:41 -0700 (PDT)
Received: from hp-z640.fritz.box ([51.37.221.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1d3e2e602sm51205765e9.5.2026.10.16.13.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 13:47:39 -0700 (PDT)
From: OOHehir <oo.hehir@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	tgamblin@baylibre.com,
	OOHehir <oo.hehir@gmail.com>
Subject: [PATCH 5/7] tcl, tcl8: skip binary-40.3 on RISC-V
Date: Fri, 16 Oct 2026 21:45:34 +0100
Message-ID: <20261016204547.2328847-6-oo.hehir@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261016204547.2328847-1-oo.hehir@gmail.com>
References: <20261016204547.2328847-1-oo.hehir@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 22:10:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248044

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


