Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qa0-f54.google.com (mail-qa0-f54.google.com
	[209.85.216.54])
	by mail.openembedded.org (Postfix) with ESMTP id 24831729BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Jan 2015 17:25:24 +0000 (UTC)
Received: by mail-qa0-f54.google.com with SMTP id i13so3553582qae.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Jan 2015 09:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:organization;
	bh=Ixbhkc7h5FC0d9R+3+iBnUhV12xypwhA8USVA8I3Qa4=;
	b=ZCCTAs7nYF1Ay7i+lniF90HvctYWexExeKTrAv2GkZNMNXHx52LNkeAn2NgkzLsqnw
	FE8AUgid6CmeYT4/CbATigXq5/xH9Pd31LazywLgXiFHIY0Bhpughv2ppG/Qw8j9ExZ4
	xS1HGm3IzruB6g0g0vZbs5p519hKI60yR93ZX2YjLQZceo/13V1HJsDxuO8pfVmzc7NU
	lLo+pmWlm1squZUONqnvT+imd3Li9I4yscQHi6kz+K1Jc65vx+lkt9u+kDZwmhYhCaOu
	kl9Be/8p23pUNQvVu+MGSWoABLLfgBmaJSJkXw9f6UV6RfFaKNkd3bhOBmA8Y/T/1wc0
	fjhA==
X-Received: by 10.140.41.113 with SMTP id y104mr6050218qgy.51.1420651524831;
	Wed, 07 Jan 2015 09:25:24 -0800 (PST)
Received: from nano.lab.ossystems.com.br ([177.100.225.47])
	by mx.google.com with ESMTPSA id r12sm1761169qax.38.2015.01.07.09.25.22
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jan 2015 09:25:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by nano.lab.ossystems.com.br (Postfix, from userid 1000)
	id DA89D1CA798EB; Wed,  7 Jan 2015 15:25:19 -0200 (BRST)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  7 Jan 2015 15:25:17 -0200
Message-Id: <1420651519-25240-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.1.4
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 1/3] base.bbclass: Avoid explicit ${MAKE} in do_configure
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
X-List-Received-Date: Wed, 07 Jan 2015 17:25:26 -0000

The do_configure may eventually call 'make clean' when the sstate
signature does not match. We should respect EXTRA_OEMAKE when doing
so, so use 'oe_runmake' for it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 meta/classes/base.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index b8f61f3..de50be1 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -227,7 +227,7 @@ base_do_configure() {
 		if [ "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" ]; then
 			cd ${B}
 			if [ "${CLEANBROKEN}" != "1" -a \( -e Makefile -o -e makefile -o -e GNUmakefile \) ]; then
-				${MAKE} clean
+				oe_runmake clean
 			fi
 			find ${B} -name \*.la -delete
 		fi
-- 
2.1.4


