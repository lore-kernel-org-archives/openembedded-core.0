Return-Path: <tom.rini@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 8188760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 03:20:32 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id a71so4665477qkc.9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 19:20:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=tK9CWjcII7SoJu0V2lJH9I81EDE4TCLuGslrZKT+V2w=;
	b=uhX2m2knMap6bJEBIWAs5Ro7D3vMCNOeqLrpebw5ih3ya9uQp9DPZWjYL6zUT22sO/
	UrgGpYbe7+U7nbynKqDFkOh9kZOaa13rDvF+//GZP4lcGs3ijNlhoduyzY/1PPn3Z46T
	rWTnDhPQvumwBRv5/w3bJTIH7abj43cRRnTUvw6KTILWLoGbDar4ikCGNX1pw9sCwBci
	6eJHvdc+kMRXizO875n9rrQDeQhWpessdFdFuBKaYbsJ9lOGIORF1gHaUnUkZy/dgri4
	DNENTlLe+W3KKjQ9C+Ty0flnub6tFGyZj2/AOFbdL1tUbFUNbgqO83F2OkRRaDRu/NCe
	wfQQ==
X-Gm-Message-State: AKGB3mL0RPwqyNNlNK7HX/CxUBzdOojkbm7h06KZSNLpf3A9F9IaW4lq
	EReKXlk1RWHyxNOA6lxHYt85
X-Google-Smtp-Source: ACJfBotp/Huh7rgIcduqgcy0GNQO0bNerrF+DlVmfly3d1qzfqAA87NiVj/kyiknvOgRQD/tRWWvtA==
X-Received: by 10.55.158.6 with SMTP id h6mr13177546qke.355.1513221633301;
	Wed, 13 Dec 2017 19:20:33 -0800 (PST)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	s43sm2001533qta.49.2017.12.13.19.20.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 13 Dec 2017 19:20:32 -0800 (PST)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Dec 2017 22:20:23 -0500
Message-Id: <1513221626-18805-2-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1513221626-18805-1-git-send-email-trini@konsulko.com>
References: <1513221626-18805-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv4 1/4] wic: kparser.py: Check for SquashFS and use-uuid
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
X-List-Received-Date: Thu, 14 Dec 2017 03:20:32 -0000

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


