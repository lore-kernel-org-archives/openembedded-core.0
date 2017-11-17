Return-Path: <tom.rini@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 5DFB17883B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 16:08:27 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id n32so7273702qtb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 08:08:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=tK9CWjcII7SoJu0V2lJH9I81EDE4TCLuGslrZKT+V2w=;
	b=Cwph24A9EGIjkT80NkilL8GnpohBUu6qk+lnm2PKdjwGSRcq+LSv4CIBFYFgFLpVdh
	th4kvNNJQ9HJHZ/arzWTElPd4smLoLlx7+hJe/OccK1UihQ6Ul3IPD0JQ+CCAourvI61
	znJPMImg7XFPX34bk4HFuTZUCVStPl03UVXyhwDHOOUkAhrOAvDmNDvtiMgC4NyMkFCm
	4CSK5X/6Ah88ltLO4ZsAo2fAnGf8g1J+r8MxKrD7SgmZ/Z9W7ROtq8S0meNqOmrA3Cp2
	mWX+z1lu/FHzrw0VKb0dbXx+GCMwShWXDfIE1xtj7u/5NrsVJCyW9mNhiLfMAudYhhCw
	jm/w==
X-Gm-Message-State: AJaThX4CpFUB8hXkENMKHHGFyR+TMX1D43LQ9v5KAki2ZvY4FU1pYX4s
	WbkgFFGKA3K0DX/lb/TNhoO3
X-Google-Smtp-Source: AGs4zMaGQBc1qhR7Pc+f6gOGrNSsB8Qy2xuxrsjMm0Xvh527hrXDfDIrDANMFGgDsIwF1Dlq7B4ugw==
X-Received: by 10.200.58.231 with SMTP id x94mr8960216qte.24.1510934908198;
	Fri, 17 Nov 2017 08:08:28 -0800 (PST)
Received: from opus.ec.rr.com (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	q37sm2714304qtj.66.2017.11.17.08.08.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 17 Nov 2017 08:08:26 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 11:08:17 -0500
Message-Id: <1510934900-22044-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510934900-22044-1-git-send-email-trini@konsulko.com>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2 1/4] wic: kparser.py: Check for SquashFS and use-uuid
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
X-List-Received-Date: Fri, 17 Nov 2017 16:08:27 -0000

The SquashFS filesystem does not support UUIDs so make this combination
be an error.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 scripts/lib/wic/ksparser.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/ksparser.py b/scripts/lib/wic/ksparser.py
index 7850e81d2f37..4fb6868531df 100644
--- a/scripts/lib/wic/ksparser.py
+++ b/scripts/lib/wic/ksparser.py
@@ -195,6 +195,11 @@ class KickStart():
                         raise KickStartError('%s:%d: %s' % \
                                              (confpath, lineno, err))
                     if line.startswith('part'):
+                        # SquashFS does not support UUID
+                        if parsed.fstype == 'squashfs' and parsed.use_uuid:
+                            err = "%s:%d: SquashFS does not support UUID" \
+                                  % (confpath, lineno)
+                            raise KickStartError(err)
                         # using ArgumentParser one cannot easily tell if option
                         # was passed as argument, if said option has a default
                         # value; --overhead-factor/--extra-space cannot be used
-- 
2.7.4


