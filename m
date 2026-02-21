Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A97C61DCB
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 08:16:54 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16462.1771661812898229475
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 00:16:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Hc6fcymm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id ffacd0b85a97d-4362507f396so2768877f8f.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 00:16:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1771661811; x=1772266611; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z1huomBzUGMbeNIsTEb8VU4REe35HRSFDZsNDRfk/qE=;
        b=Hc6fcymmdSBiK0W9IjOyfU+mN/N7zux583uYhPtDE2OOmt+bmtGJHVmf8ZT5w0Rhoc
         w5ersT022lsxlkGahxrduTD8+iQHYgVmlpcriPOiXFRsjwJtm7AZGlBLKJiovaw5vZi9
         le5CkXihvCj0cwxBtI7OSzQBxSiHFyQ64zLqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771661811; x=1772266611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z1huomBzUGMbeNIsTEb8VU4REe35HRSFDZsNDRfk/qE=;
        b=PDnMWfV8t0bXg3+GyARjwnirqV8HPPn1yH63A+YDfyj3emKbocFPCtJlpCGobFTN1l
         wdyzUY8hfIupl3XpPeRFu0tGiBDOGSEN7yM2WcSXpOvXju8goP293WLCN1ev581Ptgi3
         vWiJh6P+wbcSZP2A/lIhqqhgZnai4qxvvhfygqXOHD30g7nyOY4bpHeEPlP2jPdbaNkC
         XPuVnWuK+ZU61cdPyW4DX9z3jmJsBe5BxadQK17S3of3SSTyYrl2+HsAs2XVBF4fD/hh
         p2Xh+pKg8P4KKYyKLaJIPEz/K9Xp1sneVhod58F6/26khYhiH6UBalfnem9Hf13pv1d/
         upbg==
X-Gm-Message-State: AOJu0YwmJAHSB513ON3gReJE4wXrg9nqNOeu5XmpHZN9aqvHVlW3eVQ6
	yvfn3kmz/4icvytJcdB0hPtrs1xKl8MUr7cPbfWQXTM7sohA6VPH9jfaAVBa11gaYkkSALXQj4c
	A+sUAwuZyIw==
X-Gm-Gg: AZuq6aJNmhFdNFEca85CnczLlBLP4mr5XgWKvfo/5BxP8evIyiNv49xU3NN2WvIxqoJ
	Bi5r5NBvqVLjPKbwrcoiQt+MJXE+PgfS4jWbQJJ1QDA8QtBdl5d1IgNBFkqkbfcCPiZ/y/nXilj
	E/nAxIbIrny+4GZSvagDutT8BE97RgdWMfyoyTlcRA4fH2IHLhDaJsCmdXpk5qZI2v0tRuTi7df
	vGQBsvbyaz3UkdqmmRLg6EZl+6KqTcyZrwRRBpQ3a6ulHUUoFAmG4o+S14X10btIh3BHIONpv1N
	G25WgDfc8wx5ecAhoLBVXtAkMpSoa6l57fYpjhVhxqRcmN4AhMtSchwU8EGuibt0lkoWlo+xtks
	gtOI/jmUs/I8lgh6zj53eK6/nk3dY3tmhVMFzqILbiK0fkjeqv2q99Cnt9vcLIthTUFwtB/Fx9A
	XpMcXO/utbljM3GFounB8+RTgirk5vLojcwbaHPk5JYzu1Wj46OK8=
X-Received: by 2002:a05:6000:2585:b0:439:5061:aa42 with SMTP id ffacd0b85a97d-4396f1650d9mr4966833f8f.25.1771661810815;
        Sat, 21 Feb 2026 00:16:50 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b64:9a04:85e4:d902])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4cc81sm3455846f8f.26.2026.02.21.00.16.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 00:16:50 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] binutils: Drop unneeded and problematic vardeps explict value and immediate expansion
Date: Sat, 21 Feb 2026 08:16:46 +0000
Message-ID: <20260221081647.3216983-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260221081647.3216983-1-richard.purdie@linuxfoundation.org>
References: <20260221081647.3216983-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 08:16:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231603

This was introduced in 0788cf349fe37ef4a36c626dbc396c97d1ab14d7 as a way of
tracking the EXTRA_OECONF changes. These should be tracked reliably by the
contains() code now so it is assumed this was working around a bug at the time.
I checked the current task hashes and that information is there.

Therefore drop this bit of code as the immediate expansion causes inaccurate
values.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/binutils/binutils.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
index 00b13012585..b3d0728e4b2 100644
--- a/meta/recipes-devtools/binutils/binutils.inc
+++ b/meta/recipes-devtools/binutils/binutils.inc
@@ -129,8 +129,6 @@ export CXX_FOR_HOST = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_ARCH}"
 # to unset LD_LIBRARY_PATH.
 export CC_FOR_BUILD = "LD_LIBRARY_PATH= ${BUILD_CC}"
 
-MULTIARCH := "${@bb.utils.contains("DISTRO_FEATURES", "multiarch", "yes", "no", d)}"
-do_configure[vardeps] += "MULTIARCH"
 do_configure () {
 	(cd ${S} && gnu-configize)
 

