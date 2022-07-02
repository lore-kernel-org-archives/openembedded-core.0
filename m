Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94D0DC433EF
	for <webhook@archiver.kernel.org>; Sat,  2 Jul 2022 22:09:09 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.55142.1656799746959215260
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 15:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IzB6RZma;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso5729078wma.2
        for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Jul 2022 15:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRDo7KfYEh9ABVWDZH1/la+5r7rN3nBfeEqUX9LZOqs=;
        b=IzB6RZmabCj1p1qB4Fa0z3Out64ROqQdVO4/bRboybYV1BRIQdExr11dfMtmMywvRp
         7n8QWd/GbQTCNtqPLjjgZJBX1D5buTkFXVzrfyeWLGzfpFkFTK7gw1o2BgTOq8wkd0P8
         SEcBxf9vepcKu4osZ0f2cLqmybuf4ATFlf/Ps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zRDo7KfYEh9ABVWDZH1/la+5r7rN3nBfeEqUX9LZOqs=;
        b=DNzz2coRcWyc117FjPPowcF28rMO7wQsIuSorL4rcw3RzpjcC60k/wrCbhGKhDpLnq
         QUrrKtfZ3lLE/Z9jTFoUcSHBcVLxQiA/ZVjm/ho7GQSqvx+D5xKZ3Q7zkwuerMy9FNl4
         Vkbypcee5OJk/fUWZwpbF1J9sewgiAsysjTGypeR7o8ZO8mwupp9TImMAzx3RpJpS06b
         hvpqeVK3aT1GN/4oA0b3FkATCzqQzG2h3hiSHlpoflsPG87rfyp4Ghq+VX2gOuuumg4M
         W4uo+tC/ifzdaVZLrHvF1Vt4yXfjCjj8bYND6eYOAJGyhyRZrBcOxdqieqS/iXl4YBMD
         NRug==
X-Gm-Message-State: AJIora/ttvikaAEkMHG8TxODk3spF8Zw+qytmDnV71KnPUo2yhRhIaJG
	j+MQPu2EEExGIpv8VdGLNNoFbYlQo4Acpg==
X-Google-Smtp-Source: 
 AGRyM1vVilBRxLPNg30grD7e5qE34E1hm353rqGZjIhFHNCIeZ3/fOH2vY+79tgmfUgk46GpT6G1TQ==
X-Received: by 2002:a05:600c:1e18:b0:3a0:4865:3784 with SMTP id
 ay24-20020a05600c1e1800b003a048653784mr23436062wmb.139.1656799744849;
        Sat, 02 Jul 2022 15:09:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3569:71aa:bd43:a6d5])
        by smtp.gmail.com with ESMTPSA id
 r13-20020adfe68d000000b0021018642ff8sm27908691wrm.76.2022.07.02.15.09.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 15:09:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Filter build paths on staticly linked arches
Date: Sat,  2 Jul 2022 23:09:01 +0100
Message-Id: <20220702220901.842208-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Jul 2022 22:09:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167552

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/go/go-1.18.3.inc        |  1 +
 .../go/go/filter-build-paths.patch            | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go/filter-build-paths.patch

diff --git a/meta/recipes-devtools/go/go-1.18.3.inc b/meta/recipes-devtools/go/go-1.18.3.inc
index 68062952cae..693b045e8f0 100644
--- a/meta/recipes-devtools/go/go-1.18.3.inc
+++ b/meta/recipes-devtools/go/go-1.18.3.inc
@@ -13,5 +13,6 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
     file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
+    file://filter-build-paths.patch \
 "
 SRC_URI[main.sha256sum] = "0012386ddcbb5f3350e407c679923811dbd283fcdc421724931614a842ecbc2d"
diff --git a/meta/recipes-devtools/go/go/filter-build-paths.patch b/meta/recipes-devtools/go/go/filter-build-paths.patch
new file mode 100644
index 00000000000..caf727714e8
--- /dev/null
+++ b/meta/recipes-devtools/go/go/filter-build-paths.patch
@@ -0,0 +1,48 @@
+Filter out build time paths from ldflags and other flags variables when they're
+embedded in the go binary so that builds are reproducible regardless of build
+location. This codepath is hit for statically linked go binaries such as those
+on mips/ppc.
+
+Upstream-Status: Pending
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: go/src/cmd/go/internal/load/pkg.go
+===================================================================
+--- go.orig/src/cmd/go/internal/load/pkg.go
++++ go/src/cmd/go/internal/load/pkg.go
+@@ -2225,6 +2225,17 @@ func (p *Package) collectDeps() {
+ // to their VCS information (vcsStatusError).
+ var vcsStatusCache par.Cache
+ 
++func filterCompilerFlags(flags string) string {
++	var newflags []string
++	for _, flag := range strings.Fields(flags) {
++		if strings.HasPrefix(flag, "--sysroot") || strings.HasPrefix(flag, "-fmacro-prefix-map") || strings.HasPrefix(flag, "-fdebug-prefix-map") {
++			continue
++		}
++		newflags = append(newflags, flag)
++	}
++	return strings.Join(newflags, " ")
++}
++
+ // setBuildInfo gathers build information, formats it as a string to be
+ // embedded in the binary, then sets p.Internal.BuildInfo to that string.
+ // setBuildInfo should only be called on a main package with no errors.
+@@ -2329,7 +2340,7 @@ func (p *Package) setBuildInfo(includeVC
+ 			appendSetting("-gcflags", BuildGcflags.String())
+ 		}
+ 		if BuildLdflags.present {
+-			appendSetting("-ldflags", BuildLdflags.String())
++			appendSetting("-ldflags", filterCompilerFlags(BuildLdflags.String()))
+ 		}
+ 		if cfg.BuildMSan {
+ 			appendSetting("-msan", "true")
+@@ -2347,7 +2358,7 @@ func (p *Package) setBuildInfo(includeVC
+ 		appendSetting("CGO_ENABLED", cgo)
+ 		if cfg.BuildContext.CgoEnabled {
+ 			for _, name := range []string{"CGO_CFLAGS", "CGO_CPPFLAGS", "CGO_CXXFLAGS", "CGO_LDFLAGS"} {
+-				appendSetting(name, cfg.Getenv(name))
++				appendSetting(name, filterCompilerFlags(cfg.Getenv(name)))
+ 			}
+ 		}
+ 		appendSetting("GOARCH", cfg.BuildContext.GOARCH)
-- 
2.34.1


