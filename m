Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 53CE6731F2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Mar 2016 06:25:50 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fl4so40091325pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 23:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=cuY2Ts8o2e1kmd84fTusnSN+33lPuzU6w1HiwufME1Q=;
	b=UgnzPOqX0wwPnI0WVpVdaHB2gXydMl3OMKCrCxib/awfaJzfhqAvZWT4nKHXAL1v4m
	aWG1Z6tLNyEKxbX+McBF9+ToFP7X79Y580euzaY+RJ6dNb00MDHi3y246zenGL1FVHJx
	DbjHZ/r655Bf1L9G+/VP0QKz55QzGnSPjP0LJnTFF5Cw9V4A+X3zYHSc1Y67F1PuBPpd
	2T0DVzn1r4rr5fTFtmTQb+SytKOixeQb37d1qehRaMXfII6Rfkm3P4wZFayZpBgCgXF7
	HmeVD89RJzG/VbcL30eX4xt0ehEpG8rhUxJwamwWBs3cpDIMJWUGmcjFOc6+s79w3yYZ
	sCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cuY2Ts8o2e1kmd84fTusnSN+33lPuzU6w1HiwufME1Q=;
	b=JueYHx8fOEO+nyYAm2QNO0sNl7Lnz3IHofdhVPh3wa/SNlSAyx0cADQavm20j83G9o
	CGfIf/o5nOjQfnAfMU2WOPNYwMJRQHqKR9P+OlM2r0NdncYHMB5LhuGrK36Au0iY03I9
	du2Hq62YzgOz3srUIFk60rQMxWuTh3ZDKDp+oG6HOmm5sX8Q4hX2jpgNd16kuLoMd0Rb
	/3O/M2hu0sr7EBU8sqJ+76sJvcdhyrPvq88V6nZGVkvjrsHRFmhU6J1OUVxFxYTIbX9f
	HI1JgCqZgcw6lTygDU1FkbjjZ6EYqYsVWGsas4wqIkKB/wxS6lcCY5sSHpEQjNhFVaXJ
	fRvg==
X-Gm-Message-State: AD7BkJIcSE/NbbnCEK6qKz9MxXOh2bj6Fvhk1BRNk4p6J0E4gNhmkFVtBLMrI2G+s2SXyw==
X-Received: by 10.66.190.168 with SMTP id gr8mr18539837pac.23.1458887151701;
	Thu, 24 Mar 2016 23:25:51 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by smtp.gmail.com with ESMTPSA id
	s64sm13977045pfi.77.2016.03.24.23.25.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 24 Mar 2016 23:25:51 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Mar 2016 17:25:21 +1100
Message-Id: <1458887121-27484-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 2.7.3
Subject: [PATCH] gdb-cross: fix enabling of Python support
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
X-List-Received-Date: Fri, 25 Mar 2016 06:25:53 -0000

Python support was not being enabled because of a conflicting
--without-python configure argument in OE_EXTRACONF.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-devtools/gdb/gdb-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gdb/gdb-cross.inc b/meta/recipes-devtools/gdb/gdb-cross.inc
index 6e44778..9a9a5e4 100644
--- a/meta/recipes-devtools/gdb/gdb-cross.inc
+++ b/meta/recipes-devtools/gdb/gdb-cross.inc
@@ -4,6 +4,7 @@ DEPENDS = "expat-native ncurses-native readline-native python-native"
 
 inherit pythonnative
 
+EXTRA_OECONF_remove = "--without-python"
 EXTRA_OECONF += "--with-python=${STAGING_BINDIR_NATIVE}/python-native/python"
 
 do_compile_prepend() {
-- 
2.7.3


