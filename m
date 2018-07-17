Return-Path: <armccurdy@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0BD4D7872C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 18:07:02 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id y19-v6so1708165qto.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 11:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=KV7S6GeyojoU2rmWdzgMbfJAygjp8R+YoufgVoMrv38=;
	b=gtYVQ05tUkDTB9ZIFyaJIcMUYtFXTp+6Bc7FhpRngi9jGfSzJ5tiDRRrnxC73SNAuJ
	BQ4V8BdSfaF1bf/KUwmhBIBZqRXrvPRbhD4Iu5BSM+7RiswZqCAZQH7V+JuS8krQiYHn
	yy88j80wLKEGsU+lfSzH7HN/Q0DUaQi292PdOeN2srwkCSPfpj0TgMgt5a/PN82X2X0x
	NOUY+SYe1PY7kymeaoiLWiRbOPlkH909Ku0x5EkLzJOAAsGOZOLi/iO57Sw1xugYuDNb
	ORRhavTjqQAUndw79y2U4rUaE0cpw1IrHvqB/2kBPVNqx7CxchnJ3tz4jJAGB1yw7JKf
	x/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=KV7S6GeyojoU2rmWdzgMbfJAygjp8R+YoufgVoMrv38=;
	b=dz8HFhTNJs2moHStz7ry7vxKhw1KZesy+n5Nsg9QLoP0TaDiktMabfqamIIXJD3fYU
	MR+apryyX+Qm/fRINmEBeHz4iv9b25r75Ys08Fh/SSkJy3LzCn7F7d0lXWVENZlrgAHA
	YVxvptTxhfQB1CbnHzOrtCpuIKLvw411WvQuZqkoBt+t4OelR92nzRoSeCnKlvV1e/dQ
	WTUGOCHMdpo3H+gvF498pw18FwJ5v6RG/et98UgrLCmsNnpgUAGnzQlL5XqppESkOOJB
	AHd8unYryPotEU9THyXtKlq3btJCArQ6TiSgr8szmJvWDJ6eXv8notshT7I9JTnvhPzT
	ABtA==
X-Gm-Message-State: AOUpUlHeegBe8qPRQzaVgFgMKE0QUxMB5JusK0QrQPDojMfbeu3Im3xO
	hJZY4vWqPN3PmH1QJ/c2PdO6Yg==
X-Google-Smtp-Source: AAOMgpfxqIKy0IvFZisQ96QdmJ0SW3pcYrMg6+HqbSE9ezJSbLNkDMF1ROG+ayZ1OtBi0orajINqhQ==
X-Received: by 2002:ac8:1bb8:: with SMTP id
	z53-v6mr2772740qtj.278.1531850823713; 
	Tue, 17 Jul 2018 11:07:03 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	v192-v6sm1343896qkb.0.2018.07.17.11.07.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 17 Jul 2018 11:07:03 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 11:06:57 -0700
Message-Id: <1531850817-26274-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] curl: disable C source code generator
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
X-List-Received-Date: Tue, 17 Jul 2018 18:07:03 -0000

The --libcurl command line option causes curl to generate C source
code which, when compiled and linked with libcurl, creates a binary
which behaves in the same way as curl when run with the other options
passed on the curl command line.

  https://curl.haxx.se/docs/manpage.html#--libcurl

It's a development tool and not generally useful on the target,
especially if the target doesn't contain a toolchain etc.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/curl/curl_7.61.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.61.0.bb b/meta/recipes-support/curl/curl_7.61.0.bb
index 03d627e..cc983fd 100644
--- a/meta/recipes-support/curl/curl_7.61.0.bb
+++ b/meta/recipes-support/curl/curl_7.61.0.bb
@@ -49,6 +49,7 @@ PACKAGECONFIG[verbose] = "--enable-verbose,--disable-verbose"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 
 EXTRA_OECONF = " \
+    --disable-libcurl-option \
     --disable-ntlm-wb \
     --enable-crypto-auth \
     --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
-- 
1.9.1


