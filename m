Return-Path: <tom.rini@gmail.com>
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by mail.openembedded.org (Postfix) with ESMTP id DE16277A2C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 14:28:16 +0000 (UTC)
Received: by mail-yw0-f195.google.com with SMTP id r85so789100ywg.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 07:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZnJaZ4QT/aD33TOKdvu5IAGF9uCUTazhUW9foEgKZ+I=;
	b=PdUDMqH2NrQZjNNChkpqzhB3F0hwMNI1V4HPd43rf+A7LutuZ08IgJ7zs1Bfopbjsu
	O+r0A3owNKC0SekdFw5lxoVirYCAo9ZtxqpK3pv6S1kJBqAWMVwd5O958o2Xx7sN0Rbe
	O3STxhe2f4qarol3RxGDXiAzghOyzfvi8JTw0vuJySImRVVAS+KeXdDwGn5nu/uAat2S
	J3UD0unrwxUmTFjgeZrIYYztVIFnrVKm0g0YDiNJqbiUZb6Q1AnyeopvVjd8F456KlUt
	F4vzZy6i0/AY/jEAO+Kklw7lpBOK7yoaBPIabYAJNeG7J9b9fEuZ5+64mIyjJMD3mhjh
	AWNg==
X-Gm-Message-State: AHPjjUjQbhsXBudPi3nFyhlDDiZebqsZvz+LobPaHPNfuxwxHoO93VMQ
	cD7BhbEEj+piK+lZbKHc5YmP
X-Google-Smtp-Source: AOwi7QAh2j/XVzhDgnGBIbitXWwmZBL7VJqKfGynD65+zdBYp8JsePpBPh00QJJSoTjNFBsAsgqbow==
X-Received: by 10.129.57.3 with SMTP id g3mr6193887ywa.433.1506695297504;
	Fri, 29 Sep 2017 07:28:17 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-184-142-68.ec.res.rr.com.
	[65.184.142.68]) by smtp.gmail.com with ESMTPSA id
	o126sm1732416ywb.8.2017.09.29.07.28.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Sep 2017 07:28:16 -0700 (PDT)
From: Tom Rini <trini@konsulko.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Sep 2017 10:28:19 -0400
Message-Id: <1506695299-30364-1-git-send-email-trini@konsulko.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506531609-5917-1-git-send-email-trini@konsulko.com>
References: <1506531609-5917-1-git-send-email-trini@konsulko.com>
Subject: [PATCHv2] image_types: Fix bmaptool support for RSS
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
X-List-Received-Date: Fri, 29 Sep 2017 14:28:17 -0000

With RSS we need to ensure that when making a bmap image that the
python3 that we created is found via /usr/bin/env rather than the host
python3.  Otherwise we're relying on the build host to have bmaptool
support installed.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Switch to checking for '.bmap' not 'bmap', per Ed Bartosh.
---
 meta/classes/image_types.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 61dca626311e..b373b217145f 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -311,3 +311,6 @@ DEPLOYABLE_IMAGE_TYPES ?= "hddimg iso"
 # The IMAGE_TYPES_MASKED variable will be used to mask out from the IMAGE_FSTYPES,
 # images that will not be built at do_rootfs time: vmdk, vdi, qcow2, hdddirect, hddimg, iso, etc.
 IMAGE_TYPES_MASKED ?= ""
+
+# bmap requires python3 to be in the PATH
+EXTRANATIVEPATH += "${@'python3-native' if d.getVar('IMAGE_FSTYPES').find('.bmap') else ''}"
-- 
1.9.1


