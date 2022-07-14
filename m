Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA9DC433EF
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 00:08:18 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.1896.1657757293268494843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 17:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=dp/kogbI;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from [192.168.1.99] (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id 39AA120FD069;
	Wed, 13 Jul 2022 17:08:12 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 39AA120FD069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1657757292;
	bh=i6weXqTLJrbZOzAn4kJzELMisLxnJbvmP7WnSjeaytE=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=dp/kogbIMHpCsGY6x5RlbItzEgx43lYSgBHgn04GKiZAYtIW/XChCWxd9Mi+yi436
	 1jJzANFJqYJmr74GFLlrpvFuhr8H9d1VPTxkc5yfoLGrgaziO1U7ZFbgM99CjoFPbP
	 3Wlt00l9Kp4/o8XOUPWmCqF70OJo2HkN1GBgd7iE=
Content-Type: multipart/alternative;
 boundary="------------0Caol4DRKDxJgHilYHcDjf05"
Message-ID: <017e9264-cb7e-9904-7746-56cc461196da@linux.microsoft.com>
Date: Wed, 13 Jul 2022 18:08:10 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [OE-core] [PATCH v2 1/2] rust-common: Fix use of target
 definitions for SDK generation
Content-Language: en-US
To: Otavio Salvador <otavio@ossystems.com.br>,
 openembedded-core@lists.openembedded.org
References: <20220710164300.953098-1-otavio@ossystems.com.br>
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
In-Reply-To: <20220710164300.953098-1-otavio@ossystems.com.br>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 00:08:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167996

This is a multi-part message in MIME format.
--------------0Caol4DRKDxJgHilYHcDjf05
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 7/10/22 10:42, Otavio Salvador wrote:
> We need full target passed for build so we changed the
> rust-cross-canadian to use same code used in regular rust recipes and
> added support to use specific llvm-target for the building host.
>
> Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for aarch64 on x86_64")
> Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
> Fixes: 8ed000debb ("rust-common: Fix for target definitions returning 'NoneType' for arm")
> Signed-off-by: Otavio Salvador<otavio@ossystems.com.br>
> ---
>
> Changes in v2:
> - Fix syntax for newer Python
>
>   meta/recipes-devtools/rust/rust-common.inc    | 21 ++++++++++++------
>   .../rust/rust-cross-canadian-common.inc       | 22 ++++++++++++++++---
>   2 files changed, 33 insertions(+), 10 deletions(-)
>
> diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
> index ef70c48d0f..a937d58a37 100644
> --- a/meta/recipes-devtools/rust/rust-common.inc
> +++ b/meta/recipes-devtools/rust/rust-common.inc
> @@ -119,12 +119,12 @@ def llvm_features(d):
>   
>   
>   ## arm-unknown-linux-gnueabihf
> -DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> -TARGET_ENDIAN[arm] = "little"
> -TARGET_POINTER_WIDTH[arm] = "32"
> -TARGET_C_INT_WIDTH[arm] = "32"
> -MAX_ATOMIC_WIDTH[arm] = "64"
> -FEATURES[arm] = "+v6,+vfp2"
> +DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> +TARGET_ENDIAN[arm-eabi] = "little"
> +TARGET_POINTER_WIDTH[arm-eabi] = "32"
> +TARGET_C_INT_WIDTH[arm-eabi] = "32"
> +MAX_ATOMIC_WIDTH[arm-eabi] = "64"
> +FEATURES[arm-eabi] = "+v6,+vfp2"
>   
>   ## armv7-unknown-linux-gnueabihf
>   DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
> @@ -304,12 +304,19 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
>       else:
>           arch_abi = rust_arch
>   
> +    # When building for the building system we need to return the HOST target
> +    # or wrong flags are used.
> +    if thing == "BUILD":
> +        llvm_target = d.getVar('RUST_HOST_SYS', arch_abi)
> +    else:
> +        llvm_target = d.getVar('RUST_TARGET_SYS', arch_abi)
> +
>       features = features or d.getVarFlag('FEATURES', arch_abi) or ""
>       features = features.strip()
>   
>       # build tspec
>       tspec = {}
> -    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
> +    tspec['llvm-target'] = llvm_target
>       tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
>       tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
>       tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
> diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
> index 1f21c8af26..eff9212648 100644
> --- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
> +++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
> @@ -27,9 +27,23 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
>   
>   python do_rust_gen_targets () {
>       wd = d.getVar('WORKDIR') + '/targets/'
> -    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
> -    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
> -    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
> +    # It is important 'TARGET' is last here so that it overrides our less
> +    # informed choices for BUILD & HOST if TARGET happens to be the same as
> +    # either of them.
> +    for thing in ['BUILD', 'HOST', 'TARGET']:
> +        bb.debug(1, "rust_gen_target for " + thing)
> +        features = ""
> +        cpu = "generic"
> +        arch = d.getVar('{}_ARCH'.format(thing))
> +        abi = ""
> +        if thing is "TARGET":
> +            abi = d.getVar('ABIEXTENSION')
> +            # arm and armv7 have different targets in llvm
> +            if arch == "arm" and target_is_armv7(d):
> +                arch = 'armv7'
> +            features = d.getVar('TARGET_LLVM_FEATURES') or ""
> +            cpu = d.getVar('TARGET_LLVM_CPU')
> +        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
>   }
>   
>   INHIBIT_DEFAULT_RUST_DEPS = "1"
> @@ -45,6 +59,8 @@ python do_configure:prepend() {
>       hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
>   }
>   
> +INSANE_SKIP:${PN} = "libdir"
> +
>   INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
>   SKIP_FILEDEPS:${RUSTLIB_TARGET_PN} = "1"


These look okay to me, could we backport these to Kirkstone?

Alejandro


>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167848):https://lists.openembedded.org/g/openembedded-core/message/167848
> Mute This Topic:https://lists.openembedded.org/mt/92292890/4354175
> Group Owner:openembedded-core+owner@lists.openembedded.org
> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub  [alhe@linux.microsoft.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------0Caol4DRKDxJgHilYHcDjf05
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 7/10/22 10:42, Otavio Salvador
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20220710164300.953098-1-otavio@ossystems.com.br">
      <pre class="moz-quote-pre" wrap="">We need full target passed for build so we changed the
rust-cross-canadian to use same code used in regular rust recipes and
added support to use specific llvm-target for the building host.

Fixes: ef566af964 ("rust: fix issue building cross-canadian tools for aarch64 on x86_64")
Fixes: bd36593ba3 ("rust-common: Drop LLVM_TARGET and simplify")
Fixes: 8ed000debb ("rust-common: Fix for target definitions returning 'NoneType' for arm")
Signed-off-by: Otavio Salvador <a class="moz-txt-link-rfc2396E" href="mailto:otavio@ossystems.com.br">&lt;otavio@ossystems.com.br&gt;</a>
---

Changes in v2:
- Fix syntax for newer Python

 meta/recipes-devtools/rust/rust-common.inc    | 21 ++++++++++++------
 .../rust/rust-cross-canadian-common.inc       | 22 ++++++++++++++++---
 2 files changed, 33 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/rust/rust-common.inc b/meta/recipes-devtools/rust/rust-common.inc
index ef70c48d0f..a937d58a37 100644
--- a/meta/recipes-devtools/rust/rust-common.inc
+++ b/meta/recipes-devtools/rust/rust-common.inc
@@ -119,12 +119,12 @@ def llvm_features(d):
 
 
 ## arm-unknown-linux-gnueabihf
-DATA_LAYOUT[arm] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
-TARGET_ENDIAN[arm] = "little"
-TARGET_POINTER_WIDTH[arm] = "32"
-TARGET_C_INT_WIDTH[arm] = "32"
-MAX_ATOMIC_WIDTH[arm] = "64"
-FEATURES[arm] = "+v6,+vfp2"
+DATA_LAYOUT[arm-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
+TARGET_ENDIAN[arm-eabi] = "little"
+TARGET_POINTER_WIDTH[arm-eabi] = "32"
+TARGET_C_INT_WIDTH[arm-eabi] = "32"
+MAX_ATOMIC_WIDTH[arm-eabi] = "64"
+FEATURES[arm-eabi] = "+v6,+vfp2"
 
 ## armv7-unknown-linux-gnueabihf
 DATA_LAYOUT[armv7-eabi] = "e-m:e-p:32:32-i64:64-v128:64:128-a:0:32-n32-S64"
@@ -304,12 +304,19 @@ def rust_gen_target(d, thing, wd, features, cpu, arch, abi=""):
     else:
         arch_abi = rust_arch
 
+    # When building for the building system we need to return the HOST target
+    # or wrong flags are used.
+    if thing == "BUILD":
+        llvm_target = d.getVar('RUST_HOST_SYS', arch_abi)
+    else:
+        llvm_target = d.getVar('RUST_TARGET_SYS', arch_abi)
+
     features = features or d.getVarFlag('FEATURES', arch_abi) or ""
     features = features.strip()
 
     # build tspec
     tspec = {}
-    tspec['llvm-target'] = d.getVar('RUST_TARGET_SYS', arch_abi)
+    tspec['llvm-target'] = llvm_target
     tspec['data-layout'] = d.getVarFlag('DATA_LAYOUT', arch_abi)
     tspec['max-atomic-width'] = int(d.getVarFlag('MAX_ATOMIC_WIDTH', arch_abi))
     tspec['target-pointer-width'] = d.getVarFlag('TARGET_POINTER_WIDTH', arch_abi)
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
index 1f21c8af26..eff9212648 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
+++ b/meta/recipes-devtools/rust/rust-cross-canadian-common.inc
@@ -27,9 +27,23 @@ DEBUG_PREFIX_MAP = "-fdebug-prefix-map=${WORKDIR}=/usr/src/debug/${PN}/${EXTENDP
 
 python do_rust_gen_targets () {
     wd = d.getVar('WORKDIR') + '/targets/'
-    rust_gen_target(d, 'TARGET', wd, d.getVar('TARGET_LLVM_FEATURES') or "", d.getVar('TARGET_LLVM_CPU'), d.getVar('TARGET_ARCH'))
-    rust_gen_target(d, 'HOST', wd, "", "generic", d.getVar('HOST_ARCH'))
-    rust_gen_target(d, 'BUILD', wd, "", "generic", d.getVar('BUILD_ARCH'))
+    # It is important 'TARGET' is last here so that it overrides our less
+    # informed choices for BUILD &amp; HOST if TARGET happens to be the same as
+    # either of them.
+    for thing in ['BUILD', 'HOST', 'TARGET']:
+        bb.debug(1, "rust_gen_target for " + thing)
+        features = ""
+        cpu = "generic"
+        arch = d.getVar('{}_ARCH'.format(thing))
+        abi = ""
+        if thing is "TARGET":
+            abi = d.getVar('ABIEXTENSION')
+            # arm and armv7 have different targets in llvm
+            if arch == "arm" and target_is_armv7(d):
+                arch = 'armv7'
+            features = d.getVar('TARGET_LLVM_FEATURES') or ""
+            cpu = d.getVar('TARGET_LLVM_CPU')
+        rust_gen_target(d, thing, wd, features, cpu, arch, abi)
 }
 
 INHIBIT_DEFAULT_RUST_DEPS = "1"
@@ -45,6 +59,8 @@ python do_configure:prepend() {
     hosts = ["{}-unknown-linux-gnu".format(d.getVar("HOST_ARCH", True))]
 }
 
+INSANE_SKIP:${PN} = "libdir"
+
 INSANE_SKIP:${RUSTLIB_TARGET_PN} = "file-rdeps arch ldflags"
 SKIP_FILEDEPS:${RUSTLIB_TARGET_PN} = "1"
</pre>
    </blockquote>
    <p><br>
    </p>
    <pre>These look okay to me, could we backport these to Kirkstone?

Alejandro
</pre>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20220710164300.953098-1-otavio@ossystems.com.br">
      <pre class="moz-quote-pre" wrap=""> 
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#167848): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/167848">https://lists.openembedded.org/g/openembedded-core/message/167848</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/92292890/4354175">https://lists.openembedded.org/mt/92292890/4354175</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:alhe@linux.microsoft.com">alhe@linux.microsoft.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------0Caol4DRKDxJgHilYHcDjf05--

