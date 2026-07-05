Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 438F3C44512
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:43:09 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.140033.1783291388034870858
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:43:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GrlA65wZ;
 spf=pass (domain: smile.fr, ip: 209.85.221.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47db714766aso234283f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291386; x=1783896186; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oC+zoz5P98GcHC2hdVb5jCwp0KxyWLbLZVgNyeonSEs=;
        b=GrlA65wZi5bWHzl+llnEfzfP/EiUYENwi4+Q/92s4UZkx/zc2xNcZtnIYAWJSIHnJp
         EK3GRpA47ypwaLopU9fDRLrIdOVNXPTbdYdzrjjWJDUXcsic2G96iiOCbV/79b3qiVdv
         h0Mji8M/UaapupImMEP6r26hzt99fCCXZnFWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291386; x=1783896186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oC+zoz5P98GcHC2hdVb5jCwp0KxyWLbLZVgNyeonSEs=;
        b=eZYX716mDIFXeLOwYSGyrJtA+dIeL8OAJNFnWQbLF9B+p0TaCZMNPx9rfrpNbLQKQD
         NTAPcwZ/LwgZY53/4JIgD6MyQC852FT8Opu+sfVy19v3KS7hs1mntGKfduQI3+ovmrVf
         rtkVAQ9YzYrBlqV8VgJolZa+g5d9+4pIiYJ7Df47K3PnwMu0BWCY69ya6u+4pDIVqIXk
         BOKN+mSwdC6pSUoI9ugyNhBFQJCwlQPI38E0YCJAn46yZD4oYHB4Lat1jKtaEdAUdWhi
         seZrsEgySPyd0uWTsnO5e0SLN+rQqHY0wr3fIcH+zjexyD5SMYe85PfjkX/js6fv+Is8
         sT+w==
X-Gm-Message-State: AOJu0YwTcUkyExhXN8q9lewzI05mNLJHRVtowiioVR7OOvkmD6G1Zzgz
	PTk9oty9yUAvRWL/v62y5ClfI5vtUguXpcrVY+/qdIBuVP2gow38d8n2xT/U4EqARq/6HeuUqIh
	ECqrk05A=
X-Gm-Gg: AfdE7cnxzQchPqnqn0FVSNFJLf2vFIQoU7f75A2AhFNSX4tWqCOWT7MH5tKWGo+hEu1
	ECYfAQhIFEiw0+79NmnTq7gPd1/gc2BYSdlpyG5RSchNC/7ckpqyzxbIAhfrtqRYZNkzL9vgjEV
	E1/pGqQx8TZJwOZPaPozkfqbjeJs5JuD/kQwt6gESand4lJJ/q/VrJzg7wY+EmDtJtsd0eo587b
	8C4nFL9lVOCCPjxsoVgr+8eKeN+SMtBIp+WuCpoEHyx5wRGPlovaVS3+//RdlORT3f5MM3ulg9s
	9rtYlYmTzsMo7rzeTAvQnuk6cP86Nbd+reQNHWWQQdotSOHzINoXqPsZrDLQgLwjrHJ+L2xxDTq
	alu1PRJhxDxC7GEA1yYBVoIIyzpf4tjEUBW807qlXVh++X52Qto9h0DQjBK23Ul+fkC+8lXQz3D
	hFjgAOxUNKNStELs+gVV+nkD4Q4Q==
X-Received: by 2002:a05:6000:40cd:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47ab7b618edmr9138601f8f.0.1783291386255;
        Sun, 05 Jul 2026 15:43:06 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.43.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:43:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 39/55] quota: use native rpcgen and a single-word RPCGEN_CPP
Date: Mon,  6 Jul 2026 00:41:29 +0200
Message-ID: <1cb22db0d3a1cee6579449822b0fc7c36f8b9c99.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783289522.git.yoann.congal@smile.fr>
References: <cover.1783289522.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240193

From: Otavio Salvador <otavio@ossystems.com.br>

The rpc PACKAGECONFIG regenerates rquota.{c,h} and rquota_clnt.c from
rquota.x with rpcgen at build time, as the tarball ships no
pre-generated copies. Two problems made this fail:

- rpcgen was picked up from the host via HOSTTOOLS rather than from the
  build, which is non-deterministic and breaks on hosts that have no
  rpcgen at all.

- rpcgen execs its C preprocessor as a single program name, but OE
  exports $CPP as a multi-word "gcc -E --sysroot=... <flags>" string,
  so rpcgen reports "cannot find C preprocessor" and aborts.

Depend on rpcsvc-proto-native so rpcgen comes from the build, and set
RPCGEN_CPP to the single-word cross cpp so the preprocessor can be
exec'd.

Tested with bitbake quota (configure/compile/install/package) on
qemuarm.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 97a93dc468bdd172fe7eadca86bad9e149891eeb)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 meta/recipes-extended/quota/quota_4.11.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/quota/quota_4.11.bb b/meta/recipes-extended/quota/quota_4.11.bb
index b3860719611..811056f1f75 100644
--- a/meta/recipes-extended/quota/quota_4.11.bb
+++ b/meta/recipes-extended/quota/quota_4.11.bb
@@ -26,6 +26,10 @@ ASNEEDED = ""
 PACKAGECONFIG ??= "rpc bsd"
 PACKAGECONFIG:libc-musl = "rpc"
 
-PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc"
+# rpcgen execs its preprocessor as a single program; OE's multi-word $CPP fails,
+# so point it at the cross cpp instead.
+export RPCGEN_CPP = "${TARGET_PREFIX}cpp"
+
+PACKAGECONFIG[rpc] = "--enable-rpc,--disable-rpc,libtirpc rpcsvc-proto-native"
 PACKAGECONFIG[bsd] = "--enable-bsd_behaviour=yes,--enable-bsd_behaviour=no,"
 PACKAGECONFIG[ldapmail] = "--enable-ldapmail,--disable-ldapmail,openldap"

