Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7A6F97CCBD
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 07:43:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44Dm3Q299wz5Q
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Mar 2019 08:43:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551858226;
	bh=fqUBHQQLs526pWlgSE84S7u1e8uqnrUVz4mIGGRG3To=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JoovO0hecy+egdhilo0hDPRbYH1HcYhZ0+OAYoNfz7QinPxZjxc9q593i1wbRhI04
	QkvFI/xxYRV/zMuPp3a4n/Yw8hghLmnOjrBzf/7kXLaTQ4j9OlSpyqU/jJHns4LXGS
	O5R0RUhtQ3oEYdKDySpnnoIZSorLw3xhlkSY8F9dQIpyfondxXBopbvVaCxdncHoXz
	C5IaSf01mi8EEd9v+VGOd0voHXmDDip/G9FkZuNHMYv29jvQAH9UtDusodHGfrFPlr
	gY6hzvsRmIlOzn2m/MNa8kZQXU91DPNiiKxMkR7LbNqB/X6nfi91uE+LqnjJR/s5FP
	NctR6N8+BNWNBB9JDJSPzVFkwA/FMU49LEZUdA49RchDnkgLbMTuLCqOl1H0yK96Aa
	akLRYgzq3BMnmc2F9vgN30kVvZLMihM1PerdLg0wIRgfT/IU+KkmnQKHpjfaZa/zsz
	lS5BgOPApyp7rrLgD1CIRo4a5iue8M9LvdJg7W/1IcmDN2Q3BVVfGD3gZTlxUGbOHp
	ZCY8v1WVhnsrxoy2dd/UjJHRuxd9092p1sdXBhHCoePPzlS0dnDGd/H08TXSZ7uRoy
	DQ5rfKpFMKB/wQcSaOl41HynjsT5Wj5gvdwM1XwBnpz8UpcN/mZ7h7aGKhyIwUq2vJ
	NRrcBVoAph1iPsa0tIDtQ7R8=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Mar 2019 09:43:44 +0200
Message-Id: <20190306074344.11553-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190306074344.11553-1-bunk@stusta.de>
References: <20190306074344.11553-1-bunk@stusta.de>
Subject: [PATCH 2/2] rng-tools: Make nistbeacon support optional
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
X-List-Received-Date: Wed, 06 Mar 2019 07:43:46 -0000

Downloading your randomness directly from the US government
is a rare usecase but adds heavy dependencies.

Make it optional and non-default.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-support/rng-tools/rng-tools_6.6.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-support/rng-tools/rng-tools_6.6.bb b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
index d3361ae4e1..6796c9be9e 100644
--- a/meta/recipes-support/rng-tools/rng-tools_6.6.bb
+++ b/meta/recipes-support/rng-tools/rng-tools_6.6.bb
@@ -17,9 +17,7 @@ S = "${WORKDIR}/git"
 
 inherit autotools update-rc.d systemd pkgconfig
 
-DEPENDS = "curl \
-           libxml2 \
-           openssl \
+DEPENDS = " \
            sysfsutils \
           "
 
@@ -28,6 +26,7 @@ PACKAGECONFIG_libc-musl = "libargp libjitterentropy"
 PACKAGECONFIG[libargp] = "--with-libargp,--without-libargp,argp-standalone,"
 PACKAGECONFIG[libgcrypt] = "--with-libgcrypt,--without-libgcrypt,libgcrypt,"
 PACKAGECONFIG[libjitterentropy] = "--enable-jitterentropy,--disable-jitterentropy,libjitterentropy"
+PACKAGECONFIG[nistbeacon] = "--with-nistbeacon,--without-nistbeacon,curl libxml2 openssl"
 
 # Refer autogen.sh in rng-tools
 do_configure_prepend() {
-- 
2.17.1


