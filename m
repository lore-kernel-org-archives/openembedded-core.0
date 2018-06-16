Return-Path: <jpuhlman@mvista.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 31933753D6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jun 2018 01:02:42 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id z1-v6so5101282pgv.12
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2018 18:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=Gds4WzyFoCnF96IoVGY5eGi/d2+gQ1XjqxnwLCwDeAQ=;
	b=jfRocbe36BhS/ozYB8APcC7B8O/Z9gaQizOcUGBU7ljwz2IC1mnWiLV7viRb+YB/0G
	AX3fLnhqAzFj3EZRJEINt1Rg4Vf1oyyuusZcrpvzQH7UHPcfkBQoqEzMM9lDNZIX+gi5
	xTWeP9iULB2E2cuAn7DbXHKdYGBcbUsien4fgnlINsZdisGa1X1FyjyrrBHK3NAo7tRV
	Bbg+rDffKYhyj4Wp9k3prWo/mu4FLUeGTxM4jG9cETwUDzwFdG2U8LOmrp5ENyFQ9WuR
	S1brHaR+QwbLv1XECAjFjGdlom9ARLox9q23+o1ZW9VMOQwCZrNldY52Ul46lJUNlTDU
	MI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Gds4WzyFoCnF96IoVGY5eGi/d2+gQ1XjqxnwLCwDeAQ=;
	b=VK+bXYAmgMM4PKYA21AIMEFSButnwIaS5HaIgLC1n4Of1QyhAsBFTYFxo52IqCmmGb
	xr5Eh+9H+jnYy6jfSphD/wcv1+Af891LIJgR10KfJjdqBMFT48g6E2rGwP1Tmlj4KXOV
	Qb6n8eXfIdGozU9fGFCb7Rl1844FzP5DhPZ591yRibSDW9OqWlh2mt/HUM641YRsALrS
	xjguTU8UKTz92uJT3YOM7Y8L5U6zFMCyAXCiZI4CHsR32I13iz5c5dXZWJuhZd0VQz+W
	yv6E0aRAxDFXZE6CGLMQ55NqljwqqQv5Nk7BHw7YtG2U5MTsK4BI9vv9tel3PcUIA3sQ
	BMCg==
X-Gm-Message-State: APt69E3RQ4OJakKorW2wM+QjOuKraJUh6VnDeiVTvK7dMuo/td+75OeY
	KRJXh9MK7zu0lfv6No4hB/iNszc2qV0=
X-Google-Smtp-Source: ADUXVKJ80H83vLPXfcOLTNpQzB8nM/VuvTIbVQV+tnTi55Id25tXt//SnGOE3yyqbUNQqD/4Ab7HuA==
X-Received: by 2002:a62:d97:: with SMTP id 23-v6mr4314857pfn.202.1529110962861;
	Fri, 15 Jun 2018 18:02:42 -0700 (PDT)
Received: from jptest02.mvista.com (64.2.3.196.ptr.us.xo.net. [64.2.3.196])
	by smtp.gmail.com with ESMTPSA id
	l11-v6sm10615815pff.50.2018.06.15.18.02.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 15 Jun 2018 18:02:42 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Jun 2018 17:59:49 -0700
Message-Id: <1529110789-13035-1-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH] update-alternatives: Don't process duplicated entries
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
X-List-Received-Date: Sat, 16 Jun 2018 01:02:42 -0000

If ALTERNATIVE_<pkg> lists the same entry more then once, the
update-alternatives identical install and remove actions are added for
each repeated entry. This is exhibited when you add meta-selinux, and
examine the busybox package, which installs every link twice because it
alters the links to point to the shell replacements so selinux will work
with them. This can generate warnings on do_rootfs about similarly
prioritized alternatives. Given that at this point in the processing
the addtions should always be identical there shouldn't be any good
reason to add them twice.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/classes/update-alternatives.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes/update-alternatives.bbclass b/meta/classes/update-alternatives.bbclass
index aa01058..2c01c8b 100644
--- a/meta/classes/update-alternatives.bbclass
+++ b/meta/classes/update-alternatives.bbclass
@@ -207,7 +207,11 @@ python populate_packages_updatealternatives () {
         # Create post install/removal scripts
         alt_setup_links = ""
         alt_remove_links = ""
+        already_processed = set()
         for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+            if alt_name in already_processed:
+               continue
+            already_processed.add(alt_name)
             alt_link     = d.getVarFlag('ALTERNATIVE_LINK_NAME', alt_name)
             alt_target   = d.getVarFlag('ALTERNATIVE_TARGET_%s' % pkg, alt_name) or d.getVarFlag('ALTERNATIVE_TARGET', alt_name)
             alt_target   = alt_target or d.getVar('ALTERNATIVE_TARGET_%s' % pkg) or d.getVar('ALTERNATIVE_TARGET') or alt_link
-- 
2.6.4


