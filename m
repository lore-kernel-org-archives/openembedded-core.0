Return-Path: <armccurdy@gmail.com>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 611F570100
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 02:39:08 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id a26-v6so483623pfo.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2018 19:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=haWVtjveWHDfXvPG2XRlOin6IRgpesnKElNcleYz8/Q=;
	b=hBQZV2GXQ7pbZltJ9dU0x+osI8IBKQ6fW54+dbf2lUX7TfbVfnv7D75nLpqkUJGvLr
	s5b184lpsaTi9lYmnSZyjvYb0erj9LOIexbiKK259JDYfsvoU2zOJcu/D0yC4BE6OjyW
	1hwtISOf61tpCe1q6PjezoeKgPOqjYNjH4y3cgl3H5G6vuAvUGcoX55cB2wcrIAmT1R1
	9npkkRO602ULeLV3lPnSrGItNzL0Tn/X+7UZdhU+77KDTzW4GkjRjxaZY/Nnrd5HWfoE
	OhceOcYiVUxQWlJOHGgTF44lObRC9v84cAi/eY2gX/5f3Ayeeywgj2l6MwM1BC0Z++PZ
	xCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=haWVtjveWHDfXvPG2XRlOin6IRgpesnKElNcleYz8/Q=;
	b=Jz0vqIlbCjqAg4Ez9C1BHvXLOwQNJlwKwXlQ0PeTitm92j7yn1H3XapixN1cm7AJzR
	siKI2QW01SE/bxM9CbpE5K3qGbRPqoTEZzl6NZv3MYTAWJ4scopYskSISskcKC/YVsTd
	viAAC9uZyMnPDQhGi402aA1Cqv5Pu4MJaBl6CXl7cEORBT937gIRabl/uP0TUr75QcLL
	PWwwXxQziHGcbZ8QYvknsW6ieNMsSpS/cAEXtxQFZ/BZ29MAnz5rZjC2VSfPvevy4YNI
	NNvE+A7asyiNw357wxcjbSN9mYaVb3U5cz82cNNh7WsiuBEbL3j3y+nzSWiDB/f7d4t5
	GNjQ==
X-Gm-Message-State: AOUpUlEGe0fY8PnyEXrs0h93VAs8b7zN9DSbEWIc/D/Upk0G8EQ0ZotU
	2Ne29zenD9RqLOlV4LwdTwhPTH2h
X-Google-Smtp-Source: AAOMgpcBvbkcRs18Cgx1sLTKVn0YuTswguQwnj+OH4cJNvERZeHgdyN1QZFBm5iH3DMV0lQ8gR7g7A==
X-Received: by 2002:a63:f309:: with SMTP id
	l9-v6mr14231871pgh.369.1532399949418; 
	Mon, 23 Jul 2018 19:39:09 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	y132-v6sm14746314pfb.91.2018.07.23.19.39.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jul 2018 19:39:08 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jul 2018 19:38:51 -0700
Message-Id: <1532399935-32296-5-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
References: <1532399935-32296-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 5/9] openssl_1.0: drop leading "-" from no-ssl3 config option
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
X-List-Received-Date: Tue, 24 Jul 2018 02:39:08 -0000

Although passing -no-ssl3 works, comments in the openssl Configure
script suggest doing so isn't really correct:

  s /^-no-/no-/; # some people just can't read the instructions

The documented way to pass no-<cipher> config options is without a
leading "-"

  https://github.com/openssl/openssl/blob/OpenSSL_1_0_2-stable/INSTALL

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-connectivity/openssl/openssl_1.0.2o.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
index d9e9c84..58627b0 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2o.bb
@@ -71,7 +71,7 @@ PACKAGECONFIG[cryptodev-linux] = "-DHAVE_CRYPTODEV -DUSE_CRYPTODEV_DIGESTS,,cryp
 
 # Remove this to enable SSLv3. SSLv3 is defaulted to disabled due to the POODLE
 # vulnerability
-EXTRA_OECONF = "-no-ssl3"
+EXTRA_OECONF = "no-ssl3"
 
 export DIRS = "crypto ssl apps engines"
 export AS = "${CC} -c"
-- 
1.9.1


