Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by mail.openembedded.org (Postfix) with ESMTP id EBAC6731D8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 16:58:34 +0000 (UTC)
Received: by mail-lb0-f169.google.com with SMTP id bc4so74146136lbc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Mar 2016 08:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=RsLkW6S1YtkOXwkOiPgh+Vvyb8/dMcB78QXPpM4ZZIw=;
	b=s4dTZGkqoegWKgM/QHwt03V8KlRNmmWjUlse6k4X2wRq92rwBHt38V1m+iwFGEBaiB
	cAE8tIJOUFn1lTw31PSOTchRmagX/2DAna0CT9c5NTuxYxNJ8j6/kbiqWq+DwzQVDkXS
	E4MaqO58uvxBwbuhaSijwuXVixutlFhENFYgnF9NYp+bPfXPGY0xQ2a4jXHHlwHCwuLs
	ZTV7E8dP6Q938nUtu5JEvIx9UHWgvHnlyuCzVwDjiPlu0Fdj8i98+c6KvxGODJW2ZWi+
	nXAZXDPlZBP/jiBGAtUOjySZSyNm2lNBKWscF0fRBn6KW3O5Nlh7ayOykDsX0334hgO9
	pB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=RsLkW6S1YtkOXwkOiPgh+Vvyb8/dMcB78QXPpM4ZZIw=;
	b=iBLQ5Y39qSuWWHB2AYRBSkAgvK9sc2ffJakHNKJzNWesoPFEhKu6DRDqksew6cfMdu
	fTIjBa6OtzYcwGNQ0cdbFwFNSqgZTbFyUuUVKPMHh5Xv6tVkpJpXzyLT0M5x4tTaXhOp
	xQZd1EXscPzqJTY0B3Wb/KSPzbcDoC+uBd3/kj0YtYx7BbEJzIHN8gAdIg420bmzm1rs
	Jz7ZT9bPz7VvpeXQdb9MeRJ8ntaTBfxCK9EpNof+XAInDj5YrcutCIfNW1R4UoILnU9J
	1nOl1K/zlDsA9dlp1m4CjaEqo8PNfH9L+YP+XSvTDa7ZLtOKMhL+N+nd5E93JreumKGV
	s8gw==
X-Gm-Message-State: AD7BkJKMR/14IsEWD9Re//ldrUFhxnFrARnkYuunN9xiyNKo76s9ocNg+E4y3C+4EymqyQ==
X-Received: by 10.112.130.69 with SMTP id oc5mr3946537lbb.54.1457542714621;
	Wed, 09 Mar 2016 08:58:34 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id
	t17sm1461322lfd.17.2016.03.09.08.58.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 Mar 2016 08:58:32 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>,
	Matt Madison <matt@madison.systems>,
	openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:58:31 +0100
Message-Id: <1457542711-30476-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH] package_deb: Fix python runtime error
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
X-List-Received-Date: Wed, 09 Mar 2016 16:58:35 -0000

The dictionary cannot be used for iteration if its size may change
during the loop.

ERROR: Error executing a python function in
/home/ricardo/curro/qt5022/build-qt5022/repo/yocto/meta/recipes-devtools/perl/perl_5.22.0.bb:
Exception: RuntimeError: dictionary changed size during iteration

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/classes/package_deb.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_deb.bbclass b/meta/classes/package_deb.bbclass
index b3cf07a25b1f..6ecea0e1824e 100644
--- a/meta/classes/package_deb.bbclass
+++ b/meta/classes/package_deb.bbclass
@@ -234,12 +234,12 @@ python do_package_deb () {
 
         rdepends = bb.utils.explode_dep_versions2(localdata.getVar("RDEPENDS", True) or "")
         debian_cmp_remap(rdepends)
-        for dep in rdepends:
+        for dep in rdepends.keys():
                 if '*' in dep:
                         del rdepends[dep]
         rrecommends = bb.utils.explode_dep_versions2(localdata.getVar("RRECOMMENDS", True) or "")
         debian_cmp_remap(rrecommends)
-        for dep in rrecommends:
+        for dep in rrecommends.keys():
                 if '*' in dep:
                         del rrecommends[dep]
         rsuggests = bb.utils.explode_dep_versions2(localdata.getVar("RSUGGESTS", True) or "")
-- 
2.7.0


