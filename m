Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
	[209.85.210.171])
	by mail.openembedded.org (Postfix) with ESMTP id 305DA75258
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 18:44:00 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id p12-v6so1823560pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 11:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ecQXB+2MDhLg+S/s24WZwgN72lMmX54ez6KdmeidcdY=;
	b=GpjUrjsAXpfg65+OplYlo2FQkoAEuBATs86jzNnrRNWYciZjI+Z/Q1gprTDYFgvrc7
	iQN+Oj6I7ygHhiCHYwApqt8HrRXPjBLP705tYJ9D18kT325hLp78DfRny2mDiabRqt64
	Fwz9e42ZRAxKWQMwooMpRw9QnE7Py+VBZodjkwYMtoM/3oZBrTLUtiDrdL5K2UGeDQ+x
	eG3IOrHcyD1jhHfqckaUEWc9h8BIMapZJ9ii92neOC8cyR8E0htI4X00b8T/UCflLBtH
	cEfWSQEqYFxz7KJGigM9yCj1GUBrETnKfPbPLwiCGP9STu74XHy/zFpGwmQlsA5NI9pE
	1rjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ecQXB+2MDhLg+S/s24WZwgN72lMmX54ez6KdmeidcdY=;
	b=qm7tfPlyt72OJIhh2Q6+6KCEmh0EQqsO53GdLqPi6aFleMwTnk6rs+J4l4lOAvJ0U1
	jlVDkdAuNsDkBgJr7uW0awS5Wao6In5NmSLR+E+mZV/ZWIBPxrIJ+oE/0ngvBtpuO0Ej
	Ktq4/gMF35gAWvm4aqL3BAobYhIed33h/R8VAGE9Yv/3jqvnQChIA88ePp4pMiuc3HdE
	4ExPGsnRp+R4ghx1vN/a4DFWsDFnQEYwYZH/YAbZuoh+NVljkpcjVVKDQF/TqT675S8F
	UOMHFA+/XhwFnWrLXDxq4fc1I6uzF9CXXFJFipgr/8m2kiL65Ffvyguh//3vEDuuCfgV
	aCZA==
X-Gm-Message-State: AOUpUlEtk11GHjGKDyf4Vxp8Z85hfL0PFSX4TNoeVH0v0aJhQrGKZjY4
	r8xx5t1pNJGtWyN6gQ+nHkPEVzkP
X-Google-Smtp-Source: AAOMgpft2gCLECHHQBcSCRxtvN1PotJRAAJ64wDcuwktKq+3w5297ehHSIoDyTF9kaVL6nzjNsmBeA==
X-Received: by 2002:a63:1644:: with SMTP id 4-v6mr600310pgw.103.1533235440796; 
	Thu, 02 Aug 2018 11:44:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	k26-v6sm8459491pfb.167.2018.08.02.11.44.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 11:44:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2018 11:43:52 -0700
Message-Id: <20180802184352.20258-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V3] musl: Fix dirent struct alignment issue seen on armv5te
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
X-List-Received-Date: Thu, 02 Aug 2018 18:44:00 -0000

- its a general problem however observed on armv5te based boards in OE
  other arches either have ways to compensate for misaligned access in hardware
  or compiler does not use 8byte alignment

- fix internal linux headers

Full logs
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=9cad27a3dc1a4eb349b6591e4dc8cc89dce32277..f2c6dbe2442027ed8fe0fa869918e41f495534d8

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V3: Elaborate commit message
 meta/recipes-core/musl/musl_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index b56870cb3f..e7d0e1a66b 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,7 +3,7 @@
 
 require musl.inc
 
-SRCREV = "9cad27a3dc1a4eb349b6591e4dc8cc89dce32277"
+SRCREV = "f2c6dbe2442027ed8fe0fa869918e41f495534d8"
 
 PV = "1.1.19+git${SRCPV}"
 
-- 
2.18.0


