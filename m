Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 44B0A73257
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 20:54:05 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id l68so32396718wml.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=dFRcEdJaAx6w890tL/xWSPVlsUSa9cHhIVQtCAUNOGU=;
	b=Oq78uazcd/bqH4gouokgahYtLWum9yIGT91MU0tgbwFwOCPo10z4HtHGe3LqjobTEM
	YkGiDnLoxA/9rnEfVHtzI8IyPAXw5LSE/gberQJ/qaUqV1dQNEYPwgdChEi2jW8OdISt
	G1EAHBH3X7jwyudu2FLZ2bjRXm60hkcUCcz4bPIyjCiDpqS4UNEbCOivCRaOD3qy40im
	eOyKaHIL4T9lWvWsjiZLUA/hQ0YzfuUIsnjSmn3zXEbMeUbs1v6A6mTRDaZimyNoMN7+
	pZ0WzDHEYm6FimgpISt5JXdrKjfn1zLF6aD/eN3TnIkeOly8yXzH70jFumOK2WYw43TS
	r+2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=dFRcEdJaAx6w890tL/xWSPVlsUSa9cHhIVQtCAUNOGU=;
	b=a/FCq2B9RLbCujq6Fz/jSvfBrX7vmp/wjz636qpkzpKE3CifYclAcaf3kIG6t96Ly+
	d5ImxSXkOgZ2azYqQjypLcEXMR9weIQB11v+sQVETK7/VddMh78qOIWMryurAvRJ2gKl
	PJWMAs09fGyRnkOW7zB1qRChmU5im8GZQB5tgPu9AT6OIBoS3JFRabLjq/9ZrILHnGba
	XrxLMwIZFyzTLVlgcsaBd7Yo2zafzs56TrSJExAWgUIOv0XpGeDUY2wB1JbJlWoIEX2Y
	b2Jg6czll3oym2aJLp8B6nRJXQjJTsQH2veMGXSt6rLe/bJrsnYTKf8nOrbtorDEwVaq
	M6oA==
X-Gm-Message-State: AD7BkJKS8BmL8qRMgs/pGtt15hyoumL1ehqHkcP7+dcGM+DyH/AeMv6pjxOy2d+9U4YqCzLq
X-Received: by 10.28.217.146 with SMTP id q140mr4770618wmg.85.1457729646065;
	Fri, 11 Mar 2016 12:54:06 -0800 (PST)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id
	y62sm3951710wmg.12.2016.03.11.12.54.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 11 Mar 2016 12:54:05 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Mar 2016 20:54:00 +0000
Message-Id: <1457729640-21466-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH][jethro] base: check for existing prefix when expanding names in PACKAGECONFIG
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
X-List-Received-Date: Fri, 11 Mar 2016 20:54:09 -0000

When the DEPENDS are added as part of the PACKAGECONFIG logic the list of
packages are expanded so that any required nativesdk-/-native/multilib prefixes
and suffixes are added.

However the special handling of virtual/foo names doesn't check that the prefix
already exists, which breaks under nativesdk as in that situation there's an
explicit nativesdk- prefix *and* MLPREFIX is set to nativesdk-.  This results in
the same prefix being applied twice, and virtual packages such as virtual/libx11
ending up as virtual/nativesdk-nativesdk-libx11.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/classes/base.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index 9bd5499..38b69db 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -363,7 +363,10 @@ python () {
                     newappends.append(a)
                 elif a.startswith("virtual/"):
                     subs = a.split("/", 1)[1]
-                    newappends.append("virtual/" + prefix + subs + extension)
+                    if subs.startswith(prefix):
+                        newappends.append(a + extension)
+                    else:
+                        newappends.append("virtual/" + prefix + subs + extension)
                 else:
                     if a.startswith(prefix):
                         newappends.append(a + extension)
-- 
2.7.0


