Return-Path: <andrej.kozemcak@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA833EC1450
	for <webhook@archiver.kernel.org>; Tue,  3 Mar 2026 13:37:18 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18350.1772545032262345388
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Mar 2026 05:37:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=andrej.kozemcak@siemens.com header.s=fm2 header.b=UPWWzTZB;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-1334352-20260303133709fa5e6f6eb6000207fd-ytejaf@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260303133709fa5e6f6eb6000207fd
        for <openembedded-core@lists.openembedded.org>;
        Tue, 03 Mar 2026 14:37:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=andrej.kozemcak@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wO/dB1+6fxqxYHOQriyo+9jRgUYtaVaRmKYFtkP9KZs=;
 b=UPWWzTZBG9h2DgHoQaiQqXOD+oRhoz2CSrKBY9jram9v/dpG0yDZFhRfbhFoHqxoBitN5o
 hM0+98AVg88cvpjLHPCOctBls0wFHm8Q7x7A/GlvBa3CqlxK1DntFRc+LmGR2siJLiKhemFt
 jI12Le2Duph6Dds9BPu9i6HXVIMCqurRNCB2e84ArM+zs9w2o0SyjGYa2NFdBtEAGVq9H1Ms
 UGPIFoksA/J3d+Bm/h/xLHyM6W8Lb5u0tCr4ajcq0o5zEPGJP7XHroh6XS/bZlQAqP2K9kZ7
 McIopb7kvuFVX7KcrGu7JcdNtazGKfLviNC/2fYNMbhfgrGkc8kQOO8g==;
From: Andrej Kozemcak <andrej.kozemcak@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrej Kozemcak <andrej.kozemcak@siemens.com>
Subject: [PATCH 4/6] iptables: upgrade 1.8.11 -> 1.8.12
Date: Tue,  3 Mar 2026 14:36:43 +0100
Message-ID: <20260303133645.1449-4-andrej.kozemcak@siemens.com>
In-Reply-To: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
References: <20260303133645.1449-1-andrej.kozemcak@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1334352:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Mar 2026 13:37:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232311

Changes:
  - fix null dereference parsing bitwise operations.
  - refuse to run under file capabilities, ie. getauxval(AT_SECURE).
  - fix for all-zero mask on Big Endian in arptables-nft.
  - support adding and replacing a rule in the same batch in iptables-nft.

  - filter
-A FORWARD -m comment --comment "new rule being replaced"
-R FORWARD 1 -m comment --comment "new replacing rule"
COMMIT

  - print -X in xtables-monitor command for base chains.
  - remove incorrect libebt_redirect translations.
  - translate bare '-m sctp' match to '-p sctp' just like TCP and UDP.
  - support for info-request and info-reply icmp types.
  - fix interface comparisons in `-C` commands in iptables-nft.
  - several fixes for ip[6]tables-translate, the tool to ease migration
    to nftables.
  - document flush behaviour with --noflush for user-defined chains.

Signed-off-by: Andrej Kozemcak <andrej.kozemcak@siemens.com>
---
 .../iptables/{iptables_1.8.11.bb => iptables_1.8.12.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/iptables/{iptables_1.8.11.bb => iptables_1.8.12.bb} (98%)

diff --git a/meta/recipes-extended/iptables/iptables_1.8.11.bb b/meta/recipes-extended/iptables/iptables_1.8.12.bb
similarity index 98%
rename from meta/recipes-extended/iptables/iptables_1.8.11.bb
rename to meta/recipes-extended/iptables/iptables_1.8.12.bb
index 686dc5afe5..928930d08c 100644
--- a/meta/recipes-extended/iptables/iptables_1.8.11.bb
+++ b/meta/recipes-extended/iptables/iptables_1.8.12.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://netfilter.org/projects/iptables/files/iptables-${PV}.tar.xz \
            file://ip6tables.service \
            file://ip6tables.rules \
            "
-SRC_URI[sha256sum] = "d87303d55ef8c92bcad4dd3f978b26d272013642b029425775f5bad1009fe7b2"
+SRC_URI[sha256sum] = "8e7ee962601492de6503d171d4a948092ab18f89f111de72e3037c1f40cfb846"
 
 SYSTEMD_SERVICE:${PN} = "\
     iptables.service \
-- 
2.47.3


