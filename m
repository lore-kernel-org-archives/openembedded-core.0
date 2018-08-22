Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f48.google.com (mail-pl0-f48.google.com
	[209.85.160.48])
	by mail.openembedded.org (Postfix) with ESMTP id 4632A7915F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 00:43:41 +0000 (UTC)
Received: by mail-pl0-f48.google.com with SMTP id ba4-v6so99233plb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2018 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mQMz/CPZc/Y9cAp6bZyaMqCPIZ6Buksac9+8xEl0R9k=;
	b=QCumE+esGaptFTNoTQ0R3kZwTMfONnrwovmPmV3EAaZrWwWl8ptxweIc3Dj5xq0svT
	bV6JiEm4dTqFiqhHjVELc0zXSKWPl+eWQBJhqyRImmJcTvHF5xZpXDoIvI6yEjLEc/wQ
	+KkMHjP9M3trzLNh3qgocSqnTU44gPRnNWsmjUmm3mgU6qjebo5Z7jJktm9EydFtKpLM
	Og3OTZtT1CJdhr9ZWHogC2XgcBfU90/0ZiJX3Y7LxpfJJY1RaIFBy2samP/z5tBpe6MM
	ERAFwPSCEfzzpEA+q+Z5rQb87qAnymu3EpNWs4fc4Cqw2IKFsIKU5dNlM4ENwbcL6T2S
	1AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mQMz/CPZc/Y9cAp6bZyaMqCPIZ6Buksac9+8xEl0R9k=;
	b=D2iUErDbqO+1HUQnWCWNkxWY/bKhz6Ygt3ivhUanycRpYojHOhSaAZ7bd3FJ8KdrIX
	INmfcXtE70Ht8iVyuLAUmXiq6phtHtAzmE+wtO4VkWBuA8XNuoS+sCR+w2fPpByhej+S
	emTUXwEaFWtmDkPAR9fAxIViBd11RsBIO/hWET/sDor6BX0N+WKBgVcuIrKDGuFBRmkZ
	XNFQCArl3W7R5fOyTYlzSJz0+wokJcnekHX5vwqWG7APtMfR9XcsMS74EWRU/wGplWOw
	0Kw4dMY2Z/djGv9I26LCZTGPjX0sSwYwViRbSaVCqinnGK8dzqkyah0qTm/G1zpoiqcP
	DwRg==
X-Gm-Message-State: AOUpUlHqbgqGDcLh8qPsjq8ssREr6zb7XAqECucv25LYdOvOJWKyfO0V
	hEodzChwe+vc4Tg/R9d4r7C4yHNp
X-Google-Smtp-Source: AA+uWPz0QRngCxDRAzy4GxGZbspdGIyTRRpL0+DSvDUgVqwXvDyAaerFS0wF2uY2bO5uXQQjP+WpHw==
X-Received: by 2002:a17:902:820a:: with SMTP id
	x10-v6mr52077491pln.261.1534898622235; 
	Tue, 21 Aug 2018 17:43:42 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	h24-v6sm176217pgj.10.2018.08.21.17.43.41
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Aug 2018 17:43:41 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2018 17:43:30 -0700
Message-Id: <1534898610-15319-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1534898610-15319-1-git-send-email-armccurdy@gmail.com>
References: <1534898610-15319-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] gnutls: drop PACKAGECONFIG options for SSL v3 and TLS v1.3
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
X-List-Received-Date: Wed, 22 Aug 2018 00:43:41 -0000

By including PACKAGECONFIG options, the recipe takes responsibility
for defining the default state of these options. Although the recipe
currently aligns with the gnutls defaults (ie both disabled) tracking
new gnutls releases will be a maintenance effort. Unless there's a
clear reason to do otherwise, it seems safer to leave the choice of
which SSL/TLS versions to enable by default up to the gnutls
developers.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls_3.6.3.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls_3.6.3.bb b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
index 629fcd8..441bbec 100644
--- a/meta/recipes-support/gnutls/gnutls_3.6.3.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.6.3.bb
@@ -35,8 +35,6 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
-PACKAGECONFIG[ssl3] = "--enable-ssl3-support,--disable-ssl3-support,"
-PACKAGECONFIG[tls13] = "--enable-tls13-support,--disable-tls13-support,"
 
 EXTRA_OECONF = " \
     --enable-doc \
-- 
1.9.1


