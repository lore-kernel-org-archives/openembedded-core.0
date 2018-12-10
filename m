Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by mail.openembedded.org (Postfix) with ESMTP id A1BEB6B074
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 23:52:22 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id y4so5714842pgc.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Dec 2018 15:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=YMkIYTahY74g0JvwwW1ezPCvxz4VIFu/Cs8gLw7qy0s=;
	b=pGlZaLPary19TRyIlky0jBuSOFReiLFOB6mUeUcDm/oxgWazyv7CKC6e7gtAfQJW/x
	RckKs4fpD5borYWZ2xSVjzTRzf1uwkYUigOp7Pbl6oUQcZEC9IWIRoundbgkjWzIA779
	BmfH2V2OwZWUi9UWrWWkDl74tf4KRrfITtm/XnNVS34EwbFwQYjv8DJaB4oyppwUURKl
	5cdtowpvuTtLXvKnzuOgqyerTZCyWO7K+EZPATkAosQFkOmLiw8+HDhB8D9Wmrpeb90k
	JIIvHAnHIiFHLIB1IXwltXp+wLzX9Al5UbvBmNHWOgx+HFRAxO8j+EP5u7Vy3bBg+3RE
	CuHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=YMkIYTahY74g0JvwwW1ezPCvxz4VIFu/Cs8gLw7qy0s=;
	b=j2p4IZ/DvjSRBv0nklnAt5/4HQZ9xXBYmvy+iF9PAz+rEr+6HFXpl0D4+hPzFl82w9
	9Aq1JCisMy26umR1TFibMaXfPIuPgcEsUDuiefivvQgtuahmJjhU6hxkSxrg6Z29Z3xE
	iiUWgYxIdSebp6gOXOivwoQPjwsyeqa2osC/UMz4ydFkijhREkIcssRAm3KGK0eA+MlO
	jyEsBW2qmIW3v2l9AI/VExP9x3tbNddyolR0nJYh5jg+qE75QdnGOJ9JS8YqvqlBtsbp
	aaPKU97YKrvxCBj/nOXqQ3lUsczGHkSJlcDPmTjjHNQW8X7q/bCbPZ4FVBuiGvIehcSd
	F9fw==
X-Gm-Message-State: AA+aEWaqRivxf55Gac/QOyBJebi5avcek4vNR9lo4T/nhqPmiCN3yAYn
	x5ohsI+ZF6JU74PPdbdIrrtwiEKcxYQ=
X-Google-Smtp-Source: AFSGD/U688n6HhnYXz/rpGCkw+FcSxFsIVcmxWRmKg+BuWSSuQ4Sb1/oOVzqFnZSHcMgfUCX8ODkZw==
X-Received: by 2002:a62:16d6:: with SMTP id 205mr14227205pfw.256.1544485943526;
	Mon, 10 Dec 2018 15:52:23 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::6872])
	by smtp.gmail.com with ESMTPSA id
	p2sm18841557pgc.94.2018.12.10.15.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 15:52:23 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2018 15:52:07 -0800
Message-Id: <20181210235207.11741-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.20.0
In-Reply-To: <20181210235207.11741-1-raj.khem@gmail.com>
References: <20181210235207.11741-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] webkitgtk: Link compiler-rt for clang specific built-ins
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
X-List-Received-Date: Mon, 10 Dec 2018 23:52:22 -0000
Content-Transfer-Encoding: 8bit

When using clang, its increasingly using its own runtime which means
libgcc is not enough to find all primitives its using.

Fixes errors like
recipe-sysroot/usr/lib/libwebkit2gtk-4.0.so: undefined reference to
`__mulodi4'

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-sato/webkit/webkitgtk_2.22.4.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
index 60f1b3ea5d..196122002b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.22.4.bb
@@ -98,6 +98,8 @@ EXTRA_OECMAKE_append_x86-x32 = " -DENABLE_JIT=OFF "
 SECURITY_CFLAGS_remove_aarch64 = "-fpie"
 SECURITY_CFLAGS_append_aarch64 = " -fPIE"
 
+LDFLAGS_append_toolchain-clang = " -rtlib=compiler-rt"
+
 FILES_${PN} += "${libdir}/webkit2gtk-4.0/injected-bundle/libwebkit2gtkinjectedbundle.so"
 
 RRECOMMENDS_${PN} += "ca-certificates shared-mime-info"
-- 
2.20.0


