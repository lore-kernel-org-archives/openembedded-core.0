Return-Path: <serhe.popovych@gmail.com>
Received: from mail-lj1-f193.google.com (mail-lj1-f193.google.com
	[209.85.208.193])
	by mail.openembedded.org (Postfix) with ESMTP id B257E7BDB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 17:55:47 +0000 (UTC)
Received: by mail-lj1-f193.google.com with SMTP id k15-v6so5626795ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2018 09:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=co1v8igJz6wW32QmNVvTtuYSjTJQfc4Hy8CmL+aLC6Y=;
	b=Y1bst3S0d4IpLq+YttSPuFgu1k4psLGdV2GqATbq97udR4roa7ov/Hf25UOH/YCyjR
	e/zCK5aMijJAbMsNldoDpgtf0bYv1j8VduS2YLNjAWTPiWYdQgO8XKVNs2A2+v13b1k6
	dda1fjIHheEQ46xLetoeHzBYgbR7c8hMRzvwC5bMa5mMTTkpUfl3rMz9UNYAJJwDfZA4
	UM+HUMpcudA6tJ88pQWBoO4A7v3Cb/PeD1lG9AMZhZR4/D3qUhmD7dTp5jQcOFejgPJ+
	EMHF1BsWea9ANxGQxwdIbqGa0r0VmcIB4Z1pybrZXdueaYzB+6gaTwkT8hqH1+lyFDwc
	tNoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=co1v8igJz6wW32QmNVvTtuYSjTJQfc4Hy8CmL+aLC6Y=;
	b=apMSJr+ykc0Vi4WfJjRag1Y2YFVSy9xpR+ddn2IV+LNQWMaD5WWzosJ9fvi8p58awd
	34RxXYcjtF2SayJ1AZt7YHpCGrPcyeCB3U1WBqhMZGxswBmQq+RyH0rrzhasMrezcy+2
	0UjtZlaQxydKv94eiy3EpC4gW+kangdhL7JnTxVzk7icP+BEUVnp9KG0AJlnUeXaIdME
	8lutYv48YNKatrO+2zEmB+Q2NIz6jCCOojMoiupJ2Or2S0yZSAO1tuj1GcttwxxL+B9O
	CUx2o6Ic1ftm/+BcuWUx7v3tLEUHLZknDjrHq6Dayx8+32DTxgjEIq7POFRO0Ly0X4q/
	wNyw==
X-Gm-Message-State: AA+aEWbDHi+r4QH+LfzSiHfwItKEI5i5Vnf9d/8aobXwaPtP2n2yD4+u
	a3Yhmy2MmB+0kQicjgTybi2k3i07
X-Google-Smtp-Source: AFSGD/ULM5ytn0tl9dzdLReV5ifVClKouL53axxvfMhEJ7gWaKaXAM74B+OkDAS1RMA8Rb8s6D1CvQ==
X-Received: by 2002:a2e:81d3:: with SMTP id
	s19-v6mr2067696ljg.138.1544810148168; 
	Fri, 14 Dec 2018 09:55:48 -0800 (PST)
Received: from v-ubt16-x64-sonic.as41781.net ([193.34.155.16])
	by smtp.gmail.com with ESMTPSA id
	r27-v6sm991033lja.65.2018.12.14.09.55.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 14 Dec 2018 09:55:47 -0800 (PST)
From: Serhey Popovych <serhe.popovych@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Dec 2018 19:54:34 +0200
Message-Id: <1544810082-22164-6-git-send-email-serhe.popovych@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
References: <1544810082-22164-1-git-send-email-serhe.popovych@gmail.com>
Subject: [PATCH 05/13] arch-powerpc64.inc: Use elfv2 ABI when building with musl
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
X-List-Received-Date: Fri, 14 Dec 2018 17:55:48 -0000

Historically first PowerPC ABI was big-endian only (elfv1 currently). It
is standard ABI for both 32-bit ppc and 64-bit ppc64 architectures.

With PowerPC little-endian support new ABI was introduced (elfv2) and it
is used primarily with ppc64le target only. While it has support for
big-endian it is not commonly used and elfv1 still preferred.

Musl does support only elfv2 ABI for both LE and BE and does not have
any plans to support elfv1.

Since then to build for powerpc64 with musl new ABI should be used. As
expected it is not compatible with elfv1 but that isn't problem as long
as there is no binary distributed software or assembly code written for
elfv1 ABI.

Signed-off-by: Serhey Popovych <serhe.popovych@gmail.com>
---
 meta/conf/machine/include/powerpc/arch-powerpc64.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/machine/include/powerpc/arch-powerpc64.inc b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
index f751c6b..d9916d4 100644
--- a/meta/conf/machine/include/powerpc/arch-powerpc64.inc
+++ b/meta/conf/machine/include/powerpc/arch-powerpc64.inc
@@ -7,6 +7,9 @@ TUNECONFLICTS[m64] = "m32 nf"
 TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'm64', ' -m64', '', d)}"
 TUNE_ARCH .= "${@bb.utils.contains('TUNE_FEATURES', [ 'm64' ], 'powerpc64', '', d)}"
 
+# musl only supports elfv2 ABI for ppc64
+TUNE_CCARGS .= "${@['', ' -mabi=elfv2']['libc-musl' in d.getVar('OVERRIDES').split(':')]}"
+
 # user mode qemu doesn't support ppc64
 MACHINE_FEATURES_BACKFILL_CONSIDERED_append = " ${@bb.utils.contains('TUNE_FEATURES', 'm64', 'qemu-usermode', '', d)}"
 
-- 
2.7.4


