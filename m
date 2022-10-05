Return-Path: <dl9pf@gmx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A27C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:54:57 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by mx.groups.io with SMTP id smtpd.web08.1120.1664992488901772994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:54:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmx.net header.s=badeba3b8450 header.b=kvPPByyi;
 spf=pass (domain: gmx.de, ip: 212.227.15.15, mailfrom: dl9pf@gmx.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1664992486;
	bh=njRk5k9K8nPwrxajhyUK+Ilz1ToOZafRMKpW7wLt7tg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=kvPPByyiS0i2eZgzrk6SmIVf4RwEeWVrkk0vsIVH5QPYv8U3m7p/fUykPRA0ufkP3
	 JBBXbAl+T+6bbmfUo0j5a6Nu6G7S9c9SjjRcXT7NqrO/gJwrCdjMVl55JQfPrphPer
	 DNSdXwbWuCzlMi54krn+p2cF0M6g0bMOWW7wh9kM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from gmx.de ([91.67.224.20]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MIMbO-1oRszC2PG0-00EQK3; Wed, 05
 Oct 2022 19:54:46 +0200
From: dl9pf@gmx.de
To: openembedded-core@lists.openembedded.org
Cc: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
Subject: [PATCH] buildtools-tarball: export certificates to python and curl
Date: Wed,  5 Oct 2022 19:54:28 +0200
Message-Id: <20221005175428.93367-1-dl9pf@gmx.de>
X-Mailer: git-send-email 2.35.4
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fPEW7FwlR7rRwvWMhlkZ2YNLccbD6cC3qK2OdcV72DkgvN0V1JY
 YVJfLbGvaT6U4odPOMDi2jFXAQ6D+bVoGrZk51EhwZL2sprEcFOIjhzMt/iYH7AHw77kIj2
 uIuTMQgE/p+D5ET9+oof28uXWVHfRJmreT3uW8vI/T940/yWxtD0Lb0gLifWca44h/auuEx
 GpqvdvoQilablW4si6+eg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qIg4+GDV0F0=:rBhRdntE8BgrYdxovUjxRG
 tLEjo1T/uIskeEqArmIFW+z22w0xlfWtXYBZ2ljITVgcp90KP462rwpS0pJ99de/YH+shca4U
 RXCHRzY5f1iXohhuxoX9QnSHLMDBvBAcVtjzVjF4GApMGTKNExcvAyruwB9HrC3C2RPRdWo+Y
 h4W2I/iUz45E6kIijNnl3Kq4h9fGZWjidV6x6dd8Go67/d5kjFnfUx2BvBO+BP6JUFTx/uBcQ
 MRWvexsAzW9SCpNMpyR8A1xp5fUWGdmLcTGx2swS5yhOKmlXsDfgPLO25OebqA40v2HsH5k99
 z7V6NvXFEKsVusl14o0YGvGd7XLeKHXhK3uZV3unlgEDj8UMPA5rnCoCJS85ej5eydyTKk+LL
 rN4T9ncD+At9VHlLPa/mt97ltIDqQWabhpepZ8/rKXuet8nhNF2+LkZWuGylmlJf+4klsotWe
 f/oovWPYU9mlFO9x7306GYHI7g8UYKDSzk5p0/X9HnsKnHbnql4m6zTP6nFqKuD7MM1N6hIKM
 RifSQD1N1+x78+GalsljeHyWIPeQnAGhSt4mTX/NMpf8I0K0wsJRUjJMeun8hus/IFgw2PkOh
 5ZBGoJvWA1lVgnsz57j8RLscUEzjScSUeuUmNkAHXijZ/nuOpbTQP02jaRu3sNhcI3Nzod0u+
 gDxXUtNQ0g/grpv4CWdMHABRZ8OC72qZNWKN5DhJ8d505NdRhRZ5sjC2NkU9+sKJQ8iV5QnEZ
 rDTP6f3Eze8cE/selzXsWG8I85kHvWREdIePZWkHX/qwyjSH+WMze02hpeEFfy4YfSwvgp50o
 u4AjPFb5lmDUPk3tN5E5e2+YXUUizFSkKelG24rZnqjsDguuSv0EZUYbqyZc5uYXRI4UlsIXF
 yEgUNFV4PfKkiF1i5DHcvHELETVLvcjUFsKKMJpOS9bMGbgrjvcECR6+un48SSfliJD1rYSQY
 pCKJKZgomQHAEfFXwcrfCW9uT6et7mzxWT9krSpAXNcVZKv406XRhQTWf0jekziuU5BEeWZBZ
 /w2I0bJrf9u+zVxC1gbnVNf8kL1qkzXhcXm1KHNojx4qi88ll6ZyiYhKu+VuNfQBUTqppGEfl
 9gXinexRMWm9uTIJuG4PbWQTq6oMjLWA0d7LTrrtbshvy21FbiP38bmDHcNIJITThKgomlQty
 x9Cig=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:54:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171476

From: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>

The custom path of the ca-certificates.crt within the buildtools-tarball r=
equires more
environment variables to be exported. Namely REQUESTS_CA_BUNDLE for the py=
thon requests library
and CURL_CA_BUNDLE for curl.

Signed-off-by: Jan-Simon Moeller <jsmoeller@linuxfoundation.org>
=2D--
 meta/recipes-core/meta/buildtools-tarball.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/buildtools-tarball.bb b/meta/recipes-c=
ore/meta/buildtools-tarball.bb
index 6b59e4934d..de399173ba 100644
=2D-- a/meta/recipes-core/meta/buildtools-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-tarball.bb
@@ -72,6 +72,8 @@ create_sdk_files:append () {
 	if [ -e "${SDK_OUTPUT}${SDKPATHNATIVE}${sysconfdir}/ssl/certs/ca-certifi=
cates.crt" ]; then
 		echo 'export GIT_SSL_CAINFO=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs/=
ca-certificates.crt"' >>$script
 		echo 'export SSL_CERT_FILE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs/c=
a-certificates.crt"' >>$script
+		echo 'export REQUESTS_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/ce=
rts/ca-certificates.crt"' >>$script
+		echo 'export CURL_CA_BUNDLE=3D"${SDKPATHNATIVE}${sysconfdir}/ssl/certs/=
ca-certificates.crt"' >>$script
 	fi

 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${SDK_SYS}
=2D-
2.35.4


