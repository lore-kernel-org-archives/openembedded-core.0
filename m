Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id E36FC6B180
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 21:46:46 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r5so678025wrg.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Feb 2019 13:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=N/uN5ZbAuQAEi+sMV7DkOzFR+87ZZQj0Yt1ewuJSqd0=;
	b=XaMySSFQhamHZ9XwkKSjOvo8GA0wVBOjk406ORCQTl+2DA09ohuIqSGmtS4PGckgXw
	5aosdaLvRQZF5B5tcmcFqYIfqHvnMuQC8LR+AaS6prZ4Wk3ZczQDnPdjCkJED0IeCHIk
	oQjaYbX728Sa2T/28H1sOSi9hvHvQ1jXxkuy0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=N/uN5ZbAuQAEi+sMV7DkOzFR+87ZZQj0Yt1ewuJSqd0=;
	b=ltlG2N06MGS1BRlAVzkgPbRzeaV5OmXpsKculqc20jhEiFnX645KATBG39Nfm6d3qZ
	iNeG3cYHAcqICKvVFr/bqMe6v8pUnt+TJ/HRW1MM6z2QE18oXR3n55XDAWoaVZPga9V4
	hrAjDTVo5YUZKRnmziReCJTSY/B01stoezN7PPFa7IcXkSngGvWADO57P2nobkSbcf0v
	vTuPK1P5dzQKtMYA7tpy0VD6ABXekrLsToY/SEoKSUUQxu9wm4kA4KyBuZlsFm8q92JH
	6HJpc0Ne1+PhgGJkDORgIWsZgXyg+fGfqkpJrwpNjXPo//k0AtaG8JHNVj2T3wDwM/FM
	iJnQ==
X-Gm-Message-State: AHQUAub3Jq59F4tSB6bHQXHCiC/qBGsxFKNiCcWujVu5CTlS+kTH5Dn0
	wCsHkw4E3xOb/Sg0Y17dCZkcizQ+bRg=
X-Google-Smtp-Source: AHgI3IbI4DTMgErOm0VIWkkMBKkF6+QYjl/6aE3DTGXSiD947XYCugYhlpHV4VsoOJ2GTrlikSzbRQ==
X-Received: by 2002:adf:a4c9:: with SMTP id h9mr11235334wrb.254.1550353607246; 
	Sat, 16 Feb 2019 13:46:47 -0800 (PST)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	n6sm7147773wmk.9.2019.02.16.13.46.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Feb 2019 13:46:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Feb 2019 21:46:37 +0000
Message-Id: <20190216214638.11456-6-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
References: <20190216214638.11456-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Subject: [PATCH 6/7] native: Enable RDEPENDS handling
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
X-List-Received-Date: Sat, 16 Feb 2019 21:46:47 -0000
Content-Transfer-Encoding: 8bit

Native recipes don't currently honour their RDEPENDS. In the case of
some python scripts this has started causing problems since whilst they're
not needed at build time (DEPENDS), they are needed at runtime.

We put off making this change due to circular dependency issues. I believe
the two such problems in OE-Core are now fixed, as is the dependency loop
identfication code in bitbake so its time to improve this situation.

[YOCTO #10113]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/native.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/native.bbclass b/meta/classes/native.bbclass
index 30a30f924d9..e9f6c740abb 100644
--- a/meta/classes/native.bbclass
+++ b/meta/classes/native.bbclass
@@ -192,3 +192,6 @@ do_packagedata[stamp-extra-info] = ""
 do_populate_sysroot[stamp-extra-info] = ""
 
 USE_NLS = "no"
+
+RECIPERDEPTASK = "do_populate_sysroot"
+do_populate_sysroot[rdeptask] = "${RECIPERDEPTASK}"
-- 
2.20.1


