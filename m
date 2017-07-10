Return-Path: <jan.kiszka@web.de>
Received: from mout.web.de (mout.web.de [212.227.17.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6786277D11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 19:42:40 +0000 (UTC)
Received: from md1f2u6c.home ([95.157.57.47]) by smtp.web.de (mrweb103
	[213.165.67.124]) with ESMTPSA (Nemesis) id 0LvSLn-1dcS3N1k4x-010gUw
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 21:37:38 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Jul 2017 21:37:29 +0200
Message-Id: <952454ab377f01903de390afda19fa9b5b004af5.1499715449.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.12.3
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
In-Reply-To: <cover.1499715449.git.jan.kiszka@web.de>
References: <cover.1499715449.git.jan.kiszka@web.de>
X-Provags-ID: V03:K0:w/sj0HxG6XKyYzR0zn/Tvz9+5g87TEyYz4KfogqiRkvi63arWVf
	pMUnLq3mBmj5c+e5BH92bXAv8WXJk7cH9idfSDD13DuDbQN5LZw3DQN7AHjMbLhK46BiGkW
	Rlqmnwy5nkbpc6oSCSjCnmM24L041xTC/AiNUF47TsxZRNzCT1HKpETxDEMDSBXmMZC0x77
	+XXKu+u9Hm0w3WHryGVag==
X-UI-Out-Filterresults: notjunk:1;V01:K0:aaTpeu7rf+s=:1GtRfhELtiN+ef3SNDjeEa
	6TutsZNFiufqSUv8i2txGTYo+8CvU8ey7oO7IzZxckTJ0+1D3bX4z4JZ9Gm4lElrEuWHqblQK
	VuErqafs09ocjkMKSYoCzwtEd/jQETGgYlG7fi4PbfNCDmiM89xWlspg44KGHJNuGtEgXjGTY
	RfVtfCWVtcF5pQREFgJ9Wh9eFFqBmxB45HTEYzWzu9CXZEDFpQXCYIzzwPu5/Y90QsnnZsHh/
	1MM02Ml4ACn8nQrLokY8cl6MfbbVfcp2H97fQWKUqxuZ9nhFXhvemVr2OjyO0Bdd2xFQZztTd
	S7gv/OEOvNvHtSxJTOYTlGgd569OI4yioBVqMshYdQ8fa2+x+i2PrrLse+/zdzqpLoXD2+Ykk
	8qBqu1JyJQoaRBg+yHofhIhbU95x2blhf23P0T4zq2O1z06Fi/ba6HNfll4VOskVN4lHNIjIB
	U5E+aWIg8UO37WITUn3iTEGX0jxifKUPEcgB7VnTBTp23kuZOqQQR0NgAnYKAaX+VSMCm4iqa
	vcBkueShnBH4doyf/ARwDloYN7kd0X2m5JTmYTWvv3qW4WTedvPOCh5SYF0Mo3x3u+vKdyWJ1
	Y3g8YLq5Y+JOjuCnLe18M17KssZx9OJN7KOZoHQ/yFuvGVrKweU3vkSdPEk9kzOijAioWq4wg
	uvKqrWtRsAOneIyCrLRaYVg5SFudA64Ub9KaMBhhAFNhmtyvfw+uYaiHNeiCq2cklhsDov4eh
	RdwFC7ThpKtZOPZdHvYEvvgmM/lYYJTD063NmPRfbgf+YgFfqQc4Y5odr6k=
Subject: [PATCH 3/3] rng-tools: Add support for Atheros 9170 hwrng
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
X-List-Received-Date: Mon, 10 Jul 2017 19:42:42 -0000

From: Jan Kiszka <jan.kiszka@siemens.com>

Useful only on devices with no other sources: USB WLAN sticks based on
the Atheros 9170 (carl9170 kernel driver) provide a hardware random
generator. However, the interface needs to be up in order to is the
generator. That's not the case until ifup ran, but wpa_supplicant will
block this until the random pool is initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 meta/recipes-support/rng-tools/rng-tools/default | 4 ++++
 meta/recipes-support/rng-tools/rng-tools/init    | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/meta/recipes-support/rng-tools/rng-tools/default b/meta/recipes-support/rng-tools/rng-tools/default
index b968f2b789..85c5833a32 100644
--- a/meta/recipes-support/rng-tools/rng-tools/default
+++ b/meta/recipes-support/rng-tools/rng-tools/default
@@ -4,3 +4,7 @@ RNG_DEVICE=/dev/hwrng
 # Don't use urandom as source unless you fully understood what that does to
 # your system security!
 #RNG_DEVICE=/dev/urandom
+
+# Specify wlan interface to enable if rngd should use Atheros 9170 as source.
+# See kernel config help for the security limitations of this.
+#CARL9170_HWRNG_INTERFACE="wlan0"
diff --git a/meta/recipes-support/rng-tools/rng-tools/init b/meta/recipes-support/rng-tools/rng-tools/init
index 7cf78393a4..30cfc0f3d5 100644
--- a/meta/recipes-support/rng-tools/rng-tools/init
+++ b/meta/recipes-support/rng-tools/rng-tools/init
@@ -20,6 +20,9 @@ fi
 case "$1" in
   start)
     echo -n "Starting random number generator daemon"
+    if [ -n "$CARL9170_HWRNG_INTERFACE" ]; then
+        ip link set $CARL9170_HWRNG_INTERFACE up
+    fi
     start-stop-daemon -S -q -x $rngd $EXTRA_ARGS
     echo "."
     ;;
-- 
2.12.3


