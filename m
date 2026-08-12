Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5488EC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 16:16:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12065.1786551353026602522
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 09:15:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=f_l_k@t-online.de header.s=20260216 header.b=U6IiVLI3;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd97.aul.t-online.de (fwd97.aul.t-online.de [10.223.144.123])
	by mailout10.t-online.de (Postfix) with SMTP id EE9B238391
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 18:15:50 +0200 (CEST)
Received: from [192.168.178.36] ([84.154.161.72]) by fwd97.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wuBcM-1gsVVo0; Wed, 12 Aug 2026 18:15:50 +0200
Date: Wed, 12 Aug 2026 18:15:44 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH 1/2] clang: fix IsOpenEmbedded() detection for
 CLANG_EXTRA_OE_DISTRO entries
To: openembedded-core@lists.openembedded.org
Message-Id: <8UZNJT.394C4RULJTGT3@t-online.de>
In-Reply-To: <18CB1AE1D8088242.3956988@lists.openembedded.org>
References: <18CB1AE1D8088242.3956988@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-LAN9H2KX7r+4mjPrW92q"
X-TOI-EXPURGATEID: 150726::1786551350-957F9971-394DD5D1/0/0 CLEAN NORMAL
X-TOI-MSGID: 56434afb-c60c-4202-bb1a-3fae96e5aa30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1786551350; i=f_l_k@t-online.de;
	bh=XXK3ekKzdjUn7B4AUdXcrfZZb5d+ITCFlyYBooKyBHk=;
	h=Date:From:Subject:To:In-Reply-To:References;
	b=U6IiVLI39OIyH+xNHiqShxYTUCUwvlAm1sxSdWVFt85bbX7us3ydHoV+zA6FvuKy6
	 zNsmWjnqu7QK212ET+u+Etff/pLuVK/opgYEjCBvagJ3BNt7aKqK/fTeJRY+WVfNEk
	 iMTI7QRVSFx25NhygYYBeBbNdkIEY/0QM1Aoyo7aIvXOWbuoe0REsBOFyKOpAjOQsF
	 HyeBlD9W6bI0JybXJF+evmxnoKA6e2C7Xsjz9eOUFvQdPxNfBpNTTERDFAQuMvWkD/
	 +mBuhe6GfRmh7AIeYoodTTY1K++i6WY7dc8WDe6MJ66CxzHtkLLZuOnjjUbiybtK6+
	 UwHPYRHFr63+w==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 16:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243298

--=-LAN9H2KX7r+4mjPrW92q
Content-Type: text/plain; charset=us-ascii; format=flowed

Since being 'self-contained' is something I care about, I've been 
bothered for years by an issue where, using a self-built Yocto image 
with a built-in build appliance, I hit a failure in libcxx-native as 
soon as TOOLCHAIN = "clang" is used. With the help of claude.ai and a 
lot of debugging, I put together this patch, which fixes my problem.

On Wed, Aug 12 2026 at 18:13:40 +02:00:00, Markus Volk via 
lists.openembedded.org <f_l_k=t-online.de@lists.openembedded.org> wrote:
> do_preconfigure builds Distro::IsOpenEmbedded() from 
> CLANG_EXTRA_OE_DISTRO,
> but two bugs silently defeat OE-host detection for any distro beyond
> the shipped default (poky:poky).
> 
> The check is assembled by appending each entry as 'NAME ||' and
> stripping the trailing operator, so only the first entry gets a
> 'DistroVal ==' prefix.
> With more than one entry this generates e.g.:
>  bool IsOpenEmbedded() const { return DistroVal == POKY 
> ||WAYLAND_DESKTOP; }
> and compiles but IsOpenEmbedded() then always returns true regardless 
> of the
> actual distro, since a non-zero enumerator is truthy -- the check 
> becomes
> disabled rather than extended.
> 
> Separately, the .Case() match string is built from the
> underscore-converted identifier (needed since it doubles as a C++
> enumerator name) instead of the raw distro id as it appears in
> /etc/os-release. Since detection compares directly against the raw
> ID= value, any distro name containing a hyphen never matches.
> 
> This only surfaces on a self-hosted OE build host (e.g. via
> packagegroup-core-buildessential/-core-sdk) with a non-'poky' DISTRO
> registered in CLANG_EXTRA_OE_DISTRO. Mainstream distros never hit
> this path, since their native GCC keeps crt objects and headers
> together in one directory that clang's default search already finds.
> OE-built hosts split these across two directories, which is exactly
> what the IsOpenEmbedded()-gated candidate exists to handle -- with it
> disabled, native clang-toolchain builds (e.g. libcxx-native) fail:
> 
>     /usr/bin/x86_64-oe-linux-ld: cannot find crtbeginS.o: No such 
> file or directory
>     /usr/bin/x86_64-oe-linux-ld: cannot find -lgcc: No such file or 
> directory
> 
> Verified with debug instrumentation in
> GCCInstallationDetector::ScanLibDirForGCCTriple(): with both fixes
> applied, clang -v correctly reports:
> 
>     Found candidate GCC installation: /usr/lib/x86_64-oe-linux/16.1.0
>     Selected GCC installation: /usr/lib/x86_64-oe-linux/16.1.0
> 
> Build each comparison explicitly and join with ' || ', and use the
> raw (hyphenated) distro id for the .Case() match while keeping the
> underscore-converted identifier only for the generated C++
> enumerator/method names.
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> Co-authored-by: Claude <noreply@anthropic.com 
> <mailto:noreply@anthropic.com>>
> ---
>  meta/recipes-devtools/clang/llvm-project-source.inc | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc 
> b/meta/recipes-devtools/clang/llvm-project-source.inc
> index 85b5ef06dc..5cd08d4085 100644
> --- a/meta/recipes-devtools/clang/llvm-project-source.inc
> +++ b/meta/recipes-devtools/clang/llvm-project-source.inc
> @@ -65,18 +65,19 @@ python do_preconfigure() {
>      triple = ""
>      name = ""
>      check = ""
> -    oe_names = ""
> +    oe_names = []
>      distros = d.getVar('CLANG_EXTRA_OE_DISTRO')
>      for distro in distros.split():
> -        distro_id = distro.split(":")[0].replace('-','_')
> +        distro_id_raw = distro.split(":")[0]
> +        distro_id = distro_id_raw.replace('-','_')
>          distro_triple = distro.split(":")[1]
> -        case += '\\n    .Case("' + distro_id + '", Distro::' + 
> distro_id.upper() + ')'
> +        case += '\\n    .Case("' + distro_id_raw + '", Distro::' + 
> distro_id.upper() + ')'
>          triple += '\\n   if (Distro.Is' + distro_id.upper() + 
> '())\\n     return "x86_64-' + distro_triple + '-linux";'
>          name += '\\n    '+ distro_id.upper() + ','
>          check += '\\nbool Is' + distro_id.upper() + '() const { 
> return DistroVal == ' + distro_id.upper() + '; }'
> -        oe_names +=  distro_id.upper() + ' ||'
> +        oe_names.append('DistroVal == ' + distro_id.upper())
> 
> -    check += '\\nbool IsOpenEmbedded() const { return DistroVal == ' 
> + oe_names[0:-3] + '; }'
> +    check += '\\nbool IsOpenEmbedded() const { return ' + ' || 
> '.join(oe_names) + '; }'
> 
>      cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % 
> name, source + '/clang/include/clang/Driver/Distro.h']
>      subprocess.check_output(cmd, stderr=subprocess.STDOUT)
> --
> 2.55.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#243296): 
> <https://lists.openembedded.org/g/openembedded-core/message/243296>
> Mute This Topic: <https://lists.openembedded.org/mt/120720284/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-LAN9H2KX7r+4mjPrW92q
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Since being 'self-contained' is something I care about, I've been bothered for years by an issue where, using a self-built Yocto image with a built-in build appliance, I hit a failure in libcxx-native as soon as TOOLCHAIN = "clang" is used. With the help of claude.ai and a lot of debugging, I put together this patch, which fixes my problem.</div></div><div id="geary-quote" dir="auto"><br>On Wed, Aug 12 2026 at 18:13:40 +02:00:00, Markus Volk via lists.openembedded.org &lt;f_l_k=t-online.de@lists.openembedded.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">do_preconfigure builds Distro::IsOpenEmbedded() from CLANG_EXTRA_OE_DISTRO,
but two bugs silently defeat OE-host detection for any distro beyond
the shipped default (poky:poky).

The check is assembled by appending each entry as 'NAME ||' and
stripping the trailing operator, so only the first entry gets a
'DistroVal ==' prefix.
With more than one entry this generates e.g.:
 bool IsOpenEmbedded() const { return DistroVal == POKY ||WAYLAND_DESKTOP; }
and compiles but IsOpenEmbedded() then always returns true regardless of the
actual distro, since a non-zero enumerator is truthy -- the check becomes
disabled rather than extended.

Separately, the .Case() match string is built from the
underscore-converted identifier (needed since it doubles as a C++
enumerator name) instead of the raw distro id as it appears in
/etc/os-release. Since detection compares directly against the raw
ID= value, any distro name containing a hyphen never matches.

This only surfaces on a self-hosted OE build host (e.g. via
packagegroup-core-buildessential/-core-sdk) with a non-'poky' DISTRO
registered in CLANG_EXTRA_OE_DISTRO. Mainstream distros never hit
this path, since their native GCC keeps crt objects and headers
together in one directory that clang's default search already finds.
OE-built hosts split these across two directories, which is exactly
what the IsOpenEmbedded()-gated candidate exists to handle -- with it
disabled, native clang-toolchain builds (e.g. libcxx-native) fail:

    /usr/bin/x86_64-oe-linux-ld: cannot find crtbeginS.o: No such file or directory
    /usr/bin/x86_64-oe-linux-ld: cannot find -lgcc: No such file or directory

Verified with debug instrumentation in
GCCInstallationDetector::ScanLibDirForGCCTriple(): with both fixes
applied, clang -v correctly reports:

    Found candidate GCC installation: /usr/lib/x86_64-oe-linux/16.1.0
    Selected GCC installation: /usr/lib/x86_64-oe-linux/16.1.0

Build each comparison explicitly and join with ' || ', and use the
raw (hyphenated) distro id for the .Case() match while keeping the
underscore-converted identifier only for the generated C++
enumerator/method names.

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
Co-authored-by: Claude &lt;<a href="mailto:noreply@anthropic.com">noreply@anthropic.com</a>&gt;
---
 meta/recipes-devtools/clang/llvm-project-source.inc | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm-project-source.inc b/meta/recipes-devtools/clang/llvm-project-source.inc
index 85b5ef06dc..5cd08d4085 100644
--- a/meta/recipes-devtools/clang/llvm-project-source.inc
+++ b/meta/recipes-devtools/clang/llvm-project-source.inc
@@ -65,18 +65,19 @@ python do_preconfigure() {
     triple = ""
     name = ""
     check = ""
-    oe_names = ""
+    oe_names = []
     distros = d.getVar('CLANG_EXTRA_OE_DISTRO')
     for distro in distros.split():
-        distro_id = distro.split(":")[0].replace('-','_')
+        distro_id_raw = distro.split(":")[0]
+        distro_id = distro_id_raw.replace('-','_')
         distro_triple = distro.split(":")[1]
-        case += '\\n    .Case("' + distro_id + '", Distro::' + distro_id.upper() + ')'
+        case += '\\n    .Case("' + distro_id_raw + '", Distro::' + distro_id.upper() + ')'
         triple += '\\n   if (Distro.Is' + distro_id.upper() + '())\\n     return "x86_64-' + distro_triple + '-linux";'
         name += '\\n    '+ distro_id.upper() + ','
         check += '\\nbool Is' + distro_id.upper() + '() const { return DistroVal == ' + distro_id.upper() + '; }'
-        oe_names +=  distro_id.upper() + ' ||'
+        oe_names.append('DistroVal == ' + distro_id.upper())
 
-    check += '\\nbool IsOpenEmbedded() const { return DistroVal == ' + oe_names[0:-3] + '; }'
+    check += '\\nbool IsOpenEmbedded() const { return ' + ' || '.join(oe_names) + '; }'
 
     cmd = ['sed', '-i', 's#//CLANG_EXTRA_OE_DISTRO_NAME#%s#g' % name, source + '/clang/include/clang/Driver/Distro.h']
     subprocess.check_output(cmd, stderr=subprocess.STDOUT)
<div>-- 
</div>2.55.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#243296): <a href="https://lists.openembedded.org/g/openembedded-core/message/243296">https://lists.openembedded.org/g/openembedded-core/message/243296</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/120720284/3618223">https://lists.openembedded.org/mt/120720284/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-LAN9H2KX7r+4mjPrW92q--


