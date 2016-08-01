Return-Path: <jpuhlman@mvista.com>
Received: from mail-pa0-f50.google.com (mail-pa0-f50.google.com
	[209.85.220.50])
	by mail.openembedded.org (Postfix) with ESMTP id 3624460853
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Aug 2016 16:03:18 +0000 (UTC)
Received: by mail-pa0-f50.google.com with SMTP id iw10so54021040pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Aug 2016 09:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mbk3vivWifh13uNW3PR4JbbX5ySw/OnKxOTXGfANZuw=;
	b=Ps+9EzLuHqfOvUpqKSstNfXxhf0sPK3w9gDoudZ53b0KyyFNB+emqw3Xc5v1nJxH+t
	RaByU9IpkS8Coc59dOyQy37TxPXUd9yJx35IjcplcexCReyqZkbFkPvyaBggpUJVMsC9
	lio+/uGNZnAsTYnFnUAcwL+dalYyhujgA31InDpkwUmIPd6JluPh7zNY28Ben7e5jdzA
	wp31WrRmXJKTA7Oo6gs61y9qxVl6nQmEQOhaT5EBBdqipL1IJ98CgpvMdOZyRr5rzAyi
	kFzlWWNwV8BaBe7oAWlVPYBp5sm8XgIEp+i1WqPBCmmZ4X/VcBpGCMHT3Qopdx6MHZdq
	nlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=mbk3vivWifh13uNW3PR4JbbX5ySw/OnKxOTXGfANZuw=;
	b=MADHJMJpt8lky8JqpCKzZ6/6rmDO5prZHIoHgFmIA/H3lKrutNPFzYhp8NvpoBCFTS
	3T+Nvp+7aXVkB0IIJLwofgIuUEGJaILYKYcPJWvIEXFjmwG9+c+UgP1gLPENervzo7Cx
	BbzYKoPgVh3zg9VjuQ/jE0AyY3Wbyfwp02xfsLN6w4Fpnv3e9LDoyiGf+LQZETMrFms+
	bbRMBYaOuy6NodZgGl+GhhK1OHTZDQWY6E1mNRD/CpcOQvWkh0EMTf+EfNFhZXb/DY6f
	AxSPqvaSnCtZDdRR+ScQ6b+VtVFxZFPqj4UQ4gP4tjlhW7k/fvHtbi2CZ8MzpZMSbKdk
	x3YA==
X-Gm-Message-State: AEkoouvj1SzyrGmRZNAReWqemuO41E/Qq5eZzAFm5ZEePyX6FCzb4LB58dhjTiQE2YoG9oxw
X-Received: by 10.66.181.16 with SMTP id ds16mr97832038pac.102.1470067399498; 
	Mon, 01 Aug 2016 09:03:19 -0700 (PDT)
Received: from workhorse.mvista.com
	(99-0-9-164.lightspeed.frokca.sbcglobal.net. [99.0.9.164])
	by smtp.gmail.com with ESMTPSA id
	q4sm46807076pfb.18.2016.08.01.09.03.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 01 Aug 2016 09:03:18 -0700 (PDT)
From: Jeremy Puhlman <jpuhlman@mvista.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2016 09:02:55 -0700
Message-Id: <1470067375-24907-2-git-send-email-jpuhlman@mvista.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1470067375-24907-1-git-send-email-jpuhlman@mvista.com>
References: <1470067375-24907-1-git-send-email-jpuhlman@mvista.com>
Subject: [PATCH 2/2] Set READELF for cross compilation
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
X-List-Received-Date: Mon, 01 Aug 2016 16:03:19 -0000

In the case of using an external toolchain that supports multilib
compilation with a single binary, TARGET_PREFIX is the same for both main
and multilib abis. Without READELF exported, python3 assumes it is
either the readelf for ${BUILD_SYS}-readelf. Exporting cross readelf
fixes the build issue.

checking LDLIBRARY... libpython$(LDVERSION).so
checking for i586-montavistamllib32-linux-ranlib...
x86_64-montavista-linux-ranlib
checking for i586-montavistamllib32-linux-ar...
x86_64-montavista-linux-ar
checking for i586-montavistamllib32-linux-readelf... no
checking for readelf... readelf
configure: WARNING: using cross tools not prefixed with host triplet

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
---
 meta/conf/bitbake.conf | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index af3b181..9bf9bbb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -471,6 +471,7 @@ export OBJCOPY = "${HOST_PREFIX}objcopy"
 export OBJDUMP = "${HOST_PREFIX}objdump"
 export STRINGS = "${HOST_PREFIX}strings"
 export NM = "${HOST_PREFIX}nm"
+export READELF = "${HOST_PREFIX}readelf"
 PYTHON = "${@sys.executable}"
 
 export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc ${BUILD_CC_ARCH}"
-- 
2.6.2


