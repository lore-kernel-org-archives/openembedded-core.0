Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3825.1792750971402950293
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2026 03:22:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=cujWxy6p;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: anusmita.duttamazumder@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DCC51650;
	Fri, 23 Oct 2026 03:22:47 -0700 (PDT)
Received: from e142472.cambridge.arm.com (e142472.arm.com [10.2.210.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 481153F7B4;
	Fri, 23 Oct 2026 03:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792750970; bh=ouSj5AqedxrwRxm4D05wPLeoYxHQ3oiD2lxoo952RPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cujWxy6pZoQMCQ73Jmjf1cDA/GXidutddxXxtGh3kNV8bMKC0I+yebkdJs1guPdt9
	 jmRy6gjaXd6ZT985NmlFvP9cP2EOPKPBjU7y68l6wUknNInlEMoaR/QHeCouz/esTe
	 F9g7N9wCVs61QH1Ahw0tCUXTTrh7/K8znUPO0Pvk=
From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
To: openembedded-core@lists.openembedded.org
Cc: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
Subject: [PATCH 2/5] devtool: Check kernel configure result
Date: Fri, 23 Oct 2026 11:22:12 +0100
Message-ID: <20261023102215.4043005-3-anusmita.duttamazumder@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
References: <20261023102215.4043005-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2026 10:22:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248500
Content-Type: text/plain; charset="utf-8"

Stop source modification when the kernel do_configure task
fails instead of continuing with a potentially stale
configuration.

Signed-off-by: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
---
 scripts/lib/devtool/standard.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standa=
rd.py
index 84fa19c7aa..1f6ae1d931 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -847,6 +847,9 @@ def modify(args, config, basepath, workspace):
                 task =3D 'do_configure'
                 target =3D _get_multiconfig_targets(rd, pn)
                 res =3D tinfoil.build_targets(target, task, handle_event=
s=3DTrue)
+                if not res:
+                    raise DevtoolError('Configuring source for %s failed=
' %
+                                       target)
=20
                 # Copy .config to workspace
                 kconfpath =3D rd.getVar('B')
