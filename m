Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 6C6A26EFA7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Mar 2014 16:46:09 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id u56so941643wes.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Mar 2014 08:46:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=crm3BK6KhnAggJwKWxHuHvIY7ZaPY2H7CYCg/vlWNy4=;
	b=iCQNoCT7dMgbVvrnVAmfCU5jotUG4u0T0UyjviDF+vjGBeWAHDvRxB8Qt0qp/uSD/C
	JfHVMtz0TWjOJ1LOj0WjgSDHSlnLtX8qB17d171rrcMlV/RyNby6xBaIHyZOqixga5Cy
	6k97Kn3uF15VnniU2QRjwCAP+g6lCLbOtR8xwOs+J8A9E5sMPUGFhwxbNxTjLkCLCmrr
	nCQHHfpRPAUFVcVbLHmBVikfCMyjBR8pibLKJcRFMjL48XzyNXKcz5/KX/cxA4q5Wt82
	MZIdoIa2so0Cm6UkrsPSppzDR0aHMuqcQhsmRRPUuQROmVU3BjTJINa3pvISVS+PbIwX
	Eq1w==
X-Gm-Message-State: ALoCoQl+AHT5k1tEHicvokeuN7A7mulvrNOOSCIRQ+NEpW2k3ArVxkEXUe3ih5ZUzmbFsd1vjGPq
X-Received: by 10.194.60.16 with SMTP id d16mr923988wjr.46.1393951569825;
	Tue, 04 Mar 2014 08:46:09 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id uq2sm54540928wjc.5.2014.03.04.08.46.08
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 04 Mar 2014 08:46:09 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Mar 2014 16:46:02 +0000
Message-Id: <1393951562-14251-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1393951562-14251-1-git-send-email-ross.burton@intel.com>
References: <1393951562-14251-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/3] perf: don't use oe.path.relative
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
X-List-Received-Date: Tue, 04 Mar 2014 16:46:09 -0000

Instead of using oe.path.relative, use the Python Standard Library function
os.path.relpath.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-kernel/perf/perf.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
index 6258cbb..56576d5 100644
--- a/meta/recipes-kernel/perf/perf.bb
+++ b/meta/recipes-kernel/perf/perf.bb
@@ -86,10 +86,10 @@ EXTRA_OEMAKE += "\
 	'sysconfdir=${sysconfdir}' \
 	'perfexecdir=${libexecdir}/perf-core' \
 	\
-	'ETC_PERFCONFIG=${@oe.path.relative(prefix, sysconfdir)}' \
-	'sharedir=${@oe.path.relative(prefix, datadir)}' \
-	'mandir=${@oe.path.relative(prefix, mandir)}' \
-	'infodir=${@oe.path.relative(prefix, infodir)}' \
+	'ETC_PERFCONFIG=${@os.path.relpath(sysconfdir, prefix)}' \
+	'sharedir=${@os.path.relpath(datadir, prefix)}' \
+	'mandir=${@os.path.relpath(mandir, prefix)}' \
+	'infodir=${@os.path.relpath(infodir, prefix)}' \
 "
 
 # PPC64 uses long long for u64 in the kernel, but powerpc's asm/types.h
-- 
1.7.10.4


