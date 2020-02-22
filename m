Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 4354E60AD8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 22:09:34 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id m16so5965547wrx.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2020 14:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Gq6Z4NBBlya22LnHPzYYs0Qsw8w2HlITnWFO1slkeA4=;
	b=QhgERKrUV2S4YmFhDlbnGqJtCe8nPNazLBEGkjOE65YTOuLreaBWRNiog9FPZwQOGa
	Pooa0BP4eVc/lBRfrz1tna/sEYx+JNcXX5lN99PLxNW+UxMQ67jfPr+O8lGi4q3EtHLV
	t0+mePYVO00sRMk9n8jjMVbW7bfBN2mgyraLNdER7NyjlLXEB3u+aMOoU8YoOmuBB+XB
	1mRjQxNkbogxd3tJ/koDwLo9Ai+6D1vVPhLvDzbhFLtTXYWqFQaeJrKB49syMEedRp7c
	IsvSOV5ETJToGINxPTQzdFJQWx2yg37dqjOqnYbI/VMJcb9VDhneBVJzHFz964rsmP+r
	mL/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Gq6Z4NBBlya22LnHPzYYs0Qsw8w2HlITnWFO1slkeA4=;
	b=jehACqlt3LBN91PysG4+IE3nZIUQ7P2c765hUQWCQ+wyL9Cym9CTHzOlKP/bmVFkyt
	/JFLX++n7IRPkj+1cVbRlgU6y4zB0ZOzvdfEI9s6kcDNGjZKpzxYK192iNoi0HAUaYDw
	85AnQ3tgZmfObkdfOz244jUxFkgbEMAfmAacxc7wqMMg1QMTBXE/Esuiv539ZSPQikZA
	XWO+hEwmPZ2HTZRn12kIdcA2lwxD8eHjQSoUqJJ3xKZj0q91FGWnnpUvT1GZrQXfImfh
	VG2iSbzxdmqJHRgtFyQJz3ddoms+51ES3jsOPc3HDHRz2GH0uYLcWvF4Ne9r6aEUfdZt
	rz8w==
X-Gm-Message-State: APjAAAU9qSYFSWpXHiRJO14Sc7Q/IdXCIhn8NpOzzPvfxC8g1WJ6L+FY
	HU6pPl9hk1Qxr4BX8UEg55GBsAV/
X-Google-Smtp-Source: APXvYqwAmaUb2pSckedmgWar3XZNJ5kIg365lV3uMBv03tKeYCJJ+x+I8Lvk3enn1vzOFJSlrxDAHA==
X-Received: by 2002:adf:ee01:: with SMTP id y1mr59767008wrn.152.1582409374615; 
	Sat, 22 Feb 2020 14:09:34 -0800 (PST)
Received: from linux-f9zs.site ([2a02:2450:1011:56f:238d:84be:b349:9184])
	by smtp.gmail.com with ESMTPSA id e8sm3729734wrr.69.2020.02.22.14.09.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 22 Feb 2020 14:09:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 22 Feb 2020 23:09:09 +0100
Message-Id: <20200222220909.12019-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200222220909.12019-1-alex.kanavin@gmail.com>
References: <20200222220909.12019-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] mdadm: drop from PTESTS_SLOW
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
X-List-Received-Date: Sat, 22 Feb 2020 22:09:34 -0000
Content-Transfer-Encoding: 8bit

There are two primary reasons for this:

1. mdadm test suite tends to work like this

do_action
sleep arbitrary_amount
check_result

This is unreliable, and arbitrary_amount may or may not be enough.
I have confirmed this by increasing the amount, and seeing more tests
pass than before.

2. The test suite aborts half way through because one of the mdadm binaries
segfaults. This indicates that upstream isn't actually running the suite
anymore, and in this situation we shouldn't be relying on it either.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/ptest-packagelists.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/ptest-packagelists.inc b/meta/conf/distro/include/ptest-packagelists.inc
index 752a0882dc..6e770853b8 100644
--- a/meta/conf/distro/include/ptest-packagelists.inc
+++ b/meta/conf/distro/include/ptest-packagelists.inc
@@ -58,6 +58,7 @@ PTESTS_FAST = "\
 #    rt-tests-ptest \ # Needs to be checked whether it runs at all
 #    bash-ptest \ # Test outcomes are non-deterministic by design
 #    ifupdown-ptest \ # Tested separately in lib/oeqa/selftest/cases/imagefeatures.py
+#    mdadm-ptest \ # Tests rely on non-deterministic sleep() amounts
 #"
 
 PTESTS_SLOW = "\
@@ -69,7 +70,6 @@ PTESTS_SLOW = "\
     gstreamer1.0-ptest \
     libevent-ptest \
     lttng-tools-ptest \
-    mdadm-ptest \
     openssh-ptest \
     openssl-ptest \
     perl-ptest \
-- 
2.25.0


