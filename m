Return-Path: <twoerner@gmail.com>
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
	[209.85.219.67])
	by mail.openembedded.org (Postfix) with ESMTP id 5BCA97FBB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 17:08:24 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id c2so6033584qvp.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Dec 2019 09:08:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE1Rxc6jOVjwBlymPoYGuKqxW0yBYZLhl7ReEm+sB2Q=;
	b=k6dg/eqiXwQjNEifStH/c53Dr8lKqENQ6nBg4exXLeRYukz0oDmvSw2dUs7QvoEJE9
	sITsyKNSHkSP8fASX48U02YnDZVVMnJVzEOoMWEyQSeF6zQRmbmVnMW+H5GVAgF1uE/r
	DzdrPnmV4ZEN2SrrXMGK+EiruL6NL2gsv0eGQCCl8YbP3DzTTiQ64K2iYOgssDvmtmrh
	n8K4hf07+Gie9lXy3gvjABLgddmWMF0yLNgtKbMXQgWqOJAEnKxnwjwCqUwhpy20d4gD
	HElo3aid7H4pl704Lk31bLGTRWMUFiZs6LA9YoZ1lgN8rgTxCqCw5ygDssAe3xe7SnSa
	gG0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lE1Rxc6jOVjwBlymPoYGuKqxW0yBYZLhl7ReEm+sB2Q=;
	b=VQJ6gpkSoCg51wEz4NmpWQt+v4N6KPFrNQKIVLLRGDdBUbuwH+IQiurfUaJ5pGhtDF
	dtadB4iQs4F/RiV89kwOzXRKva7hwxg+UbwEZe1OmZ8glaAeY3jJAN9Lf52HRlZlGssT
	J4E5EpduGCXnayPQOAM8v7zFUOdG9E3CiWf+15UBrxc/9Jiz+ZG8JpP0SrLQXM2CT9nl
	YQB4FIV5bPqbQLJerLDHmTM3jpDI5F/7jNz5jef2lJeaDEBKEI4xMw3sYZYV9kFlK0xA
	Ps26njDiYwGBnqN9TD0gjNYfK/uM9Z1l/XPcr6vEYCzJEJB+jSZxelt4p8/mD+UM3Gse
	juCQ==
X-Gm-Message-State: APjAAAXXRfAl08fi3gcUVBSjAT7zwdSt74MAKhXHD5//+S2dpE9JkSH4
	hGjr8utLpWTZgoSM2017G0N4XRga
X-Google-Smtp-Source: APXvYqyWPtLq5+4ywv36slzDZKcJ/OsGsmTRLJ+CtvG5PDKqNvqUk276DMg+9u0fAx08c+YD9StPkg==
X-Received: by 2002:a0c:ec08:: with SMTP id y8mr4068651qvo.13.1576084104777;
	Wed, 11 Dec 2019 09:08:24 -0800 (PST)
Received: from linux-uys3.suse ([206.248.190.95])
	by smtp.gmail.com with ESMTPSA id
	i19sm830670qki.124.2019.12.11.09.08.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Dec 2019 09:08:24 -0800 (PST)
From: Trevor Woerner <twoerner@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Dec 2019 12:08:18 -0500
Message-Id: <20191211170818.5097-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.23.0.37.g745f681289
MIME-Version: 1.0
Subject: [PATCH] meson.bbclass: allow buildtype to be changed
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
X-List-Received-Date: Wed, 11 Dec 2019 17:08:24 -0000
Content-Transfer-Encoding: 8bit

Some upstream projects are employing the buildtype parameter so users
can create, say, "production" versus "debug" builds. Therefore create a
configurable parameter so recipes/users can tweak it.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 meta/classes/meson.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/meson.bbclass b/meta/classes/meson.bbclass
index dc8c28963c..e1a13bbbf7 100644
--- a/meta/classes/meson.bbclass
+++ b/meta/classes/meson.bbclass
@@ -12,8 +12,9 @@ MESON_SOURCEPATH = "${S}"
 def noprefix(var, d):
     return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
 
+MESON_BUILDTYPE ?= "plain"
 MESONOPTS = " --prefix ${prefix} \
-              --buildtype plain \
+              --buildtype ${MESON_BUILDTYPE} \
               --bindir ${@noprefix('bindir', d)} \
               --sbindir ${@noprefix('sbindir', d)} \
               --datadir ${@noprefix('datadir', d)} \
-- 
2.23.0.37.g745f681289


