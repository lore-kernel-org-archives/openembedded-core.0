Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 59A146D147
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 21:38:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 47731g5gjgzJD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Nov 2019 22:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572989896;
	bh=2c5pMEE4TUcU7ksRSxRwFojM25kLVQVU84xFz5IGBNI=;
	h=From:To:Subject:Date:From;
	b=H/2B0RT72iYZ9Nl1+0vhWVWlMNA2kMtkH4FTxfzppJd4694B2v6UfgtHHMwwlTUe2
	T4AFBWDXMh4Rq6MTy5y2euooiWhncmrfYI9DfjR3+9MGPWCV/la+ZMSVtTZ0NB+6oQ
	lw+gon+r92QaaU3DQdYJzqk/8lP+1fGDEHcGKJqDMBY0aqYbJw6gtOXXiKTfqidF+q
	uKwf5terwrpyNoYop8gJ2mK2akzAtS+KDytrJASIzWs7WzFGsJlSSLEAhb0PlpHumX
	b+zqs34ByeNlwUEFftW5xlLdn2RG2N4Z5C4t7yO1kjInFv0Iu6H4qMQQH8RyjDJaKk
	Rkj1kX/wJgkf6HkAbSI8pBsFHFEU7gyxrXL5lNOs6BnjmfJ4SRD5LC20FAWfWq1q8j
	gVPzEkpRONNdERrbUXNupkxQlLAZ4L49hF7TRkskAaQHR8EwgNFbwYjuyUAtxqBVP6
	v4kTkuvp0TP9XsN1i4ddhGf1n9/i4XlJWAj4HVjr2zBweazENWCa7regZ7Kh7QRrEN
	XznKic+yRx1lmWtmpYSAmDDxCbqmsrJftiPNf8ECeRaguh6UY1KSLMgEg7gUtIupw1
	byF44ltwbES5jz5pEjCKbwKurzbvwzNsyb7T9Uz42/fCgTr0h7DVQ7W0NDRwnz7sBO
	iJZ0QbpUjtDjGNJ5kXRbnPYU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Nov 2019 23:38:12 +0200
Message-Id: <20191105213813.27546-4-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH] libpng: whitelist CVE-2019-17371
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
X-List-Received-Date: Tue, 05 Nov 2019 21:38:15 -0000

From: Ross Burton <ross.burton@intel.com>

This is actually a memory leak in gif2png 2.x, so whitelist it in the libpng
recipe.

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 meta/recipes-multimedia/libpng/libpng_1.6.37.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
index 66af2f3d60..2ed87a8437 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.37.bb
@@ -29,3 +29,6 @@ PACKAGES =+ "${PN}-tools"
 FILES_${PN}-tools = "${bindir}/png-fix-itxt ${bindir}/pngfix ${bindir}/pngcp"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# CVE-2019-17371 is actually a memory leak in gif2png 2.x
+CVE_CHECK_WHITELIST += "CVE-2019-17371"
-- 
2.17.1


