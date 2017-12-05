Return-Path: <tom.rini@gmail.com>
Received: from mail-ua0-f193.google.com (mail-ua0-f193.google.com
	[209.85.217.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0F8BF7867E
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 17:58:36 +0000 (UTC)
Received: by mail-ua0-f193.google.com with SMTP id q13so855633uaq.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 09:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tK9CWjcII7SoJu0V2lJH9I81EDE4TCLuGslrZKT+V2w=;
	b=SzR2PkU4aSdQkOERpfWd9GVzEVN9nFjwA1x4EJG2KxCJUufz9AmAFwu9sVmRwHbG6a
	hF7tBKVG1EKxZ3RYg+M4+DD0vxwg4FQFFRCaNl/3MtlbAUsKPV1SDXA+UxlvGOEUigaD
	adt+OhOBwHVFmIkK2eZqGZ8ii0KTA8TJBfuF9g51uizC6I9hwLwm4Lr7ZezQRx4sGfY8
	IUreu+35l0DoMZdHyEc/avS0+JYLtmyTEz5w6AZwE04HDAcChbKjuQZYHgKbomsd2/3L
	JPTG1F7t+g3y0rT9J3nvv6MW+JrshQEWSI7F8q6gFIL41iDGNu0Yq4uj5B5ssrWxTIW+
	4Yog==
X-Gm-Message-State: AKGB3mKYUtNguAr95QlYYxiZE2bcLu7+HKc/+xTYA63MS9/HsDp3eSJu
	sypmg6LXAQ58jkMFCxTgyPXV
X-Google-Smtp-Source: AGs4zMY/FE/60Q6qb2xuAPF3EakC8X+UzS44/zpCDVwg+1AEZr2F2Oux+qXx8Lc/B0e5Hg2LXpZf5Q==
X-Received: by 10.176.20.107 with SMTP id c40mr5429330uae.136.1512496717465;
	Tue, 05 Dec 2017 09:58:37 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68])
	by smtp.gmail.com with ESMTPSA id 131sm305558vke.53.2017.12.05.09.58.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Dec 2017 09:58:36 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 12:58:27 -0500
Message-Id: <1512496710-10548-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1512496710-10548-1-git-send-email-trini@konsulko.com>
References: <1512496710-10548-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv3 1/4] wic: kparser.py: Check for SquashFS and use-uuid
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
X-List-Received-Date: Tue, 05 Dec 2017 17:58:37 -0000

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


