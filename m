Return-Path: <jpuhlman@gmail.com>
Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id 15F6061BAF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 22:25:53 +0000 (UTC)
Received: by mail-pl1-f196.google.com with SMTP id j20so1775064pll.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2020 15:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=xBaQ3wgge5jmLuYGnqxVRwCwdfeOLbPCBSiQsYv7K8k=;
	b=gi4cWFUQdLE6pPJX3KqMNSmRgsbTSRkPyy0CUrPPYKnCzTkClh4umEQgWvfCieLovq
	5BpGqpSvuF0HPSUtHCb+/g6tvx7TWPugNwNgU1IdTmu8DxjxUiEddYJuytxHKe+linKq
	lKjn1QLvgkGGmI4jYEin9u4xtyi7qgndjHYc5LzSdmWyAsmPNuK1tDSv5jI2dm+ai4DH
	esuuAiDahbI7lmEqyHKXkb5DIkZ85fgFhDXjSJAIV1nOkmZ4vwCtZNu4suo1SchPg1nt
	6Ku4a/wMSWQk1Y3sv3IeR5+EKC7QfzHZnSkzpyLTbO8JnZ/mk8sYenyagBILG7BuLaIC
	DqMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=xBaQ3wgge5jmLuYGnqxVRwCwdfeOLbPCBSiQsYv7K8k=;
	b=JfgvwMO17iNzgmjPoQP5hb2JFH61LbhzkI5EVaBagfEZ320wLmjTgBMOkPwMCN9Zrq
	Qcry9ZYymdNUzDUbof6gx5hkqXK4L42TrZojYfndyg/dlijRikihPI7BwgtT+57XENRS
	vmkhuxwXf9eYI7MAIsisVlWmHQyOcJONfmH1BZZgLZhygppZvAFVf4gyrFEUCER85hNW
	CRhjFSdt2qcQiCJBjI68moriiKdhbVHK5RvZZB9jlyV/5rxRKMPNeuRWuzc+sWqBUDWz
	n8m3LxDlfLO7i7vqtX0/Wz6FK3Zhs/gviXubvJBLqVY7Gq5bJ6bK22wGWKhA8mavi1rI
	WHNw==
X-Gm-Message-State: ANhLgQ0ba0ONN0wm91IbwKc+uKDo42eQZmv83f5hjWp5BFze5+922BQl
	mHJtsNt1gDs3Oj0RrUoGH8DypICN9tw=
X-Google-Smtp-Source: ADFU+vvx1wGNdm+NXZ/WrcCPK94Cbn/bTBUGsS1ojyY9OW3Z3cB1w4m6rj1gVsQVlDqBowvzGKyzFQ==
X-Received: by 2002:a17:90b:3792:: with SMTP id
	mz18mr878985pjb.43.1583965554810; 
	Wed, 11 Mar 2020 15:25:54 -0700 (PDT)
Received: from workhorse.localdomain
	(99-14-97-149.lightspeed.frokca.sbcglobal.net. [99.14.97.149])
	by smtp.gmail.com with ESMTPSA id
	d13sm6294300pjs.44.2020.03.11.15.25.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 11 Mar 2020 15:25:54 -0700 (PDT)
Sender: Jeremy Puhlman <jpuhlman@gmail.com>
Received: by workhorse.localdomain (Postfix, from userid 1000)
	id 424A02A05EB; Wed, 11 Mar 2020 15:25:53 -0700 (PDT)
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2020 15:25:42 -0700
Message-Id: <20200311222546.30284-2-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20200311222546.30284-1-jpuhlman@mvista.com>
References: <20200311222546.30284-1-jpuhlman@mvista.com>
Subject: [PATCH 2/6] qemu: Fix reproducibilty issues
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
X-List-Received-Date: Wed, 11 Mar 2020 22:25:54 -0000

From: Jeremy Puhlman <jpuhlman@mvista.com>

tests/qemu-iotests/common.env is generated from configure which
we pass ${HOSTTOOLS_DIR}/python3 as our python to use, which gets
copied into the ptests. Correct python3 path.

Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index f3342eaf28..e6dbc6d05a 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -56,6 +56,8 @@ do_install_ptest() {
 	# Don't check the file genreated by configure
 	sed -i -e '/wildcard config-host.mak/d' \
 	       -e '$ {/endif/d}' ${D}${PTEST_PATH}/tests/Makefile.include
+        sed -i -e 's,${HOSTTOOLS_DIR}/python3,${bindir}/python3,' \
+            ${D}/${PTEST_PATH}/tests/qemu-iotests/common.env 
 }
 
 # QEMU_TARGETS is overridable variable
-- 
2.13.3


