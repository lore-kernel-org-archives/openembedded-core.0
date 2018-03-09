Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id 243F77895A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Mar 2018 11:00:59 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id y26so3416653pgv.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 09 Mar 2018 03:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=4mxr8T4as7uXix+nh2nk2/vFvnuHOg8by6x3qkjJpSc=;
	b=s+MNw8lSsR1cesJt4s1aLsPftjWmkxc5+3XT8XFQYgEWFDpnRYS6bmNWnij5aGWTlv
	D8fLkandxJGHwbz/IPCeAW6S/GKxHb0NaSD5/7mN6N+SYjenXT2LN/o1SugfnbR8WPe7
	msSxsA2Q6x3GUmJW/3uLBr4xuKlrIMcMltfa3up78RuqDaypYxN4xyWoXNiUDE0zm/ys
	JapQ2Ys25skpwzIvPhRYl3SmtUGMAAWmuYQ2G0hQYU+3MrkKoSoAhtXr5y8LQFTmJbDY
	rPHqveOcRM4PqNgQfRBacBoqroQaTpM3iHkWEC5IDs7CsLqbyIS+gwNTalBEJl5e2HCy
	t5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=4mxr8T4as7uXix+nh2nk2/vFvnuHOg8by6x3qkjJpSc=;
	b=lSauEgLGgePP1Z05bFSzRu5jdssRPAn0m4EChohxCYwyyhuloHrDDP7+f/QXrifXlf
	BL7G2julrM27z356DYsNa078KYZfniIxMHkfgBvH3LqHuasJlpp+PB8LWQ/QVQLV4hlH
	i+yOUMmbxd5j82sfuWcW8sizuosDIWSDlH4ZEWJo1RJq6BUcIhk4+xaQhpEDHXC05WaR
	j9/rbhsqRRmPFUNbbJi4YaH8jJqYCOVJVTmOM3I/p9djw4odvqlMzzySCgLDtgEmNIT/
	zLaJx52DHEF+hti8mWwFYhtlvjMy9lhKUyln9vA4QYcN1nZPazMRReKou6GLB7kVl9CI
	Hw0w==
X-Gm-Message-State: APf1xPA7laKl8dfC4JRZhZA09IezE/jd/6KDsArSjvOYBaIMAIqZPXwN
	2YXzWdZuQ0BLQ/v9CGImQthkew==
X-Google-Smtp-Source: AG47ELuydWCdZqS+OM3Af/9XIbR6/uZeOcxftdALT+i1RdiPfiJBdvQMaE3aiaprKZ3qFR2/XfayQg==
X-Received: by 10.98.224.65 with SMTP id f62mr29738431pfh.191.1520593259606;
	Fri, 09 Mar 2018 03:00:59 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	205sm2447295pfy.117.2018.03.09.03.00.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 Mar 2018 03:00:57 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Mar 2018 03:00:48 -0800
Message-Id: <20180309110049.10725-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180309110049.10725-1-raj.khem@gmail.com>
References: <20180309110049.10725-1-raj.khem@gmail.com>
Subject: [PATCH 2/3] liburcu: Explicitly add pthread options to cflags
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
X-List-Received-Date: Fri, 09 Mar 2018 11:01:00 -0000

Some architectures e.g. riscv gcc does not add -D_REENTRANT
when enabling pthreads. Help it here by adding these options
while gcc gets fixed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/liburcu/liburcu_0.10.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-support/liburcu/liburcu_0.10.1.bb b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
index 0c8cd3571a..a73890af90 100644
--- a/meta/recipes-support/liburcu/liburcu_0.10.1.bb
+++ b/meta/recipes-support/liburcu/liburcu_0.10.1.bb
@@ -15,3 +15,5 @@ SRC_URI[sha256sum] = "9c09220be4435dc27fcd22d291707b94b97f159e0c442fbcd60c168f8f
 
 S = "${WORKDIR}/userspace-rcu-${PV}"
 inherit autotools
+
+CPPFLAGS  += "-pthread -D_REENTRANT"
-- 
2.16.2


