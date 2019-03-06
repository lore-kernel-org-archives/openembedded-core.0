Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id BE6747CCB8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 07:59:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44DmP25ybxz4K;
	Wed,  6 Mar 2019 08:59:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551859143;
	bh=oabO7gX5FxM/xvoLLE/FtL0dvBkLYFDRSNkyhL+XqKo=;
	h=From:To:Cc:Subject:Date:From;
	b=MAlngHcfRRF1DFVXqiAKzomlzFl+3KG4ul9o3gXJjWXvgzabF4f8YXyrh65+0jBPN
	D/nUVu9O6y3KMRcXVGCl+y5y5zK4vkKGvufUAK63Iiv7bGpmGtgXAPYIObovIt9Pv5
	dBsAiz6UnMW0zP6u1reRqHgpUvrb6mX4Ez8cLO6yz4B7wF2DC5w+afNPEQGOaSrti/
	K/ZdQfSCx1FMDsQe4QzPObc7sbbcI+ks1Q/tfulsGofco2EJX4byw7DL13PbyMAuZg
	a9emtgKffSCDkgjutYfC/FGJlez9sG3+nQ3ozIgiNpCZyOnmIOigEUlVNmunKkb689
	Mnuklnz4jjA+htxApgIg6fNmHe6dbc0xTz410+Z0W2k0guG0S7WtVyJGGgN1u+nHUa
	p6jR8iAIgwSkU4V/PisxdroOGJeKa9KqFiLkZyBIUhfF6sRuEDRy0iOd/ApV+yF71P
	EZ+s56fzOtrZEhQ0ZDawZT+E5BgRCI8yh6gPAcxI7gUhqnV2qo50OCAG56k3wsyMJC
	HLaqtLEQ3LMNFXOAQ7McrUE3KKwvmBPbcLbPMxpW8fEAgL0QJJg5qX3uKedjPWXQka
	+4HmJX5t6V00toJxscmqxH5fjp5Pt2QIX9aJnVN+Ru08UVOBOGCetPlZKZxrf8YYou
	xj61bXSD4nq0qbrR8g3p/wDA=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:59:01 +0200
Message-Id: <20190306075901.13177-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Cc: Tom Rini <trini@konsulko.com>
Subject: [PATCH] bind-utils: Install nslookup
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
X-List-Received-Date: Wed, 06 Mar 2019 07:59:03 -0000

nslookup was undeprecated 15 years ago,
and installing bind-utils should replace the busybox version.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-connectivity/bind/bind_9.11.5.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/bind/bind_9.11.5.bb b/meta/recipes-connectivity/bind/bind_9.11.5.bb
index 11990ee27e..67672792b1 100644
--- a/meta/recipes-connectivity/bind/bind_9.11.5.bb
+++ b/meta/recipes-connectivity/bind/bind_9.11.5.bb
@@ -73,8 +73,6 @@ do_install_prepend() {
 
 do_install_append() {
 
-	rm "${D}${bindir}/nslookup"
-	rm "${D}${mandir}/man1/nslookup.1"
 	rmdir "${D}${localstatedir}/run"
 	rmdir --ignore-fail-on-non-empty "${D}${localstatedir}"
 	install -d -o bind "${D}${localstatedir}/cache/bind"
@@ -118,8 +116,12 @@ CONFFILES_${PN} = " \
 	${sysconfdir}/bind/db.root \
 	"
 
+ALTERNATIVE_${PN}-utils = "nslookup"
+ALTERNATIVE_LINK_NAME[nslookup] = "${bindir}/nslookup"
+ALTERNATIVE_PRIORITY = "100"
+
 PACKAGE_BEFORE_PN += "${PN}-utils"
-FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nsupdate"
+FILES_${PN}-utils = "${bindir}/host ${bindir}/dig ${bindir}/mdig ${bindir}/nslookup ${bindir}/nsupdate"
 FILES_${PN}-dev += "${bindir}/isc-config.h"
 FILES_${PN} += "${sbindir}/generate-rndc-key.sh"
 
-- 
2.17.1


