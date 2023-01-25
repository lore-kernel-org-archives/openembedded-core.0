Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4194FC54EED
	for <webhook@archiver.kernel.org>; Wed, 25 Jan 2023 18:11:48 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.52911.1674670305515520013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jan 2023 10:11:45 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4FCA1A22D;
	Wed, 25 Jan 2023 19:11:43 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.209]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pKkFJ-3a3Xe40; Wed, 25 Jan 2023 19:11:41 +0100
Date: Wed, 25 Jan 2023 19:11:35 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCH] gtk4: add PACKAGECONFIG for cloudproviders
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <BVZ1PR.KYTKMKP2QL682@t-online.de>
In-Reply-To: 
	<9ab1d0034d3d20fcc42a544f5899f7072cac7c71.camel@linuxfoundation.org>
References: <20230122070632.756193-1-f_l_k@t-online.de>
	<9ab1d0034d3d20fcc42a544f5899f7072cac7c71.camel@linuxfoundation.org>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-teG+M9muwUg1aCJ8BOf7"
X-TOI-EXPURGATEID: 150726::1674670301-B1029007-13CD5A3A/0/0 CLEAN NORMAL
X-TOI-MSGID: a5773463-0c07-4fd2-9d55-7d4157f54771
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jan 2023 18:11:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176374

--=-teG+M9muwUg1aCJ8BOf7
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks for the propper fix. I've sent a v2 that excludes the second bit

Am Mi, 25. Jan 2023 um 14:24:39 +0000 schrieb Richard Purdie 
<richard.purdie@linuxfoundation.org>:
> On Sun, 2023-01-22 at 08:06 +0100, Markus Volk wrote:
>>  - Add missing cups runtime dependency
>>  - Create packages for the printbackends only for target
>>    This fixes:
>> 
>>    NOTE: Multiple providers are available for runtime 
>> gtk4-printbackend-cups (gtk4, gtk4-native)
>>    Consider defining a PREFERRED_RPROVIDER entry to match 
>> gtk4-printbackend-cups
>>    NOTE: Multiple providers are available for runtime 
>> gtk4-printbackend-file (gtk4, gtk4-native)
>>    Consider defining a PREFERRED_RPROVIDER entry to match 
>> gtk4-printbackend-file
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/recipes-gnome/gtk+/gtk4_4.8.3.bb | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>>  diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb 
>> b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
>>  index 6101905128..5112d3b38b 100644
>>  --- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
>>  +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
>>  @@ -65,7 +65,8 @@ PACKAGECONFIG:class-nativesdk = 
>> "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)
>> 
>>   PACKAGECONFIG[x11] = 
>> "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig 
>> libx11 libxext libxcursor libxi libxdamage libxrandr libxrender 
>> libxcomposite libxfixes xinerama"
>>   PACKAGECONFIG[wayland] = 
>> "-Dwayland-backend=true,-Dwayland-backend=false,wayland 
>> wayland-protocols virtual/egl virtual/libgles2 wayland-native"
>>  -PACKAGECONFIG[cups] = 
>> "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
>>  +PACKAGECONFIG[cloudproviders] = 
>> "-Dcloudproviders=enabled,-Dcloudproviders=disabled,libcloudproviders"
>>  +PACKAGECONFIG[cups] = 
>> "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups"
>>   PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
>>   PACKAGECONFIG[iso-codes] = ",,iso-codes,iso-codes"
>>   PACKAGECONFIG[ffmpeg] = 
>> "-Dmedia-ffmpeg=enabled,-Dmedia-ffmpeg=disabled,ffmpeg"
> 
> This bit is fine.
> 
>>  @@ -114,7 +115,7 @@ RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
>>   RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
>>   RDEPENDS:${PN}-dev += "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>("PACKAGECONFIG", "wayland", 
>> "wayland-protocols", "", d)}"
>> 
>>  -PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
>>  +PACKAGES_DYNAMIC:class-target += "^gtk4-printbackend-.*"
>>   python populate_packages:prepend () {
>>       import os.path
>> 
> 
> This bit is really a bug in the native.bbclass class extension code 
> and
> I'd really prefer to fix that rather than needing every recipe with a
> BBCLASSEXTEND native to handle PACKAGES_DYNAMIC specially.
> 
> You'll see that nativesdk.bbclass does:
> 
>     clsextend.map_regexp_variable("PACKAGES_DYNAMIC")
> 
> but native.bbclass doesn't do anything with PACKAGES_DYANAMIC which is
> the issue. Could you see if the patch below helps please?
> 
> diff --git a/meta/classes-recipe/native.bbclass 
> b/meta/classes-recipe/native.bbclass
> index 1e94585f3e3..cfd299d0c8c 100644
> --- a/meta/classes-recipe/native.bbclass
> +++ b/meta/classes-recipe/native.bbclass
> @@ -139,7 +139,7 @@ python native_virtclass_handler () {
>      if "native" not in classextend:
>          return
> 
> -    def map_dependencies(varname, d, suffix = "", selfref=True):
> +    def map_dependencies(varname, d, suffix = "", selfref=True, 
> regex=False):
>          if suffix:
>              varname = varname + ":" + suffix
>          deps = d.getVar(varname)
> @@ -148,7 +148,9 @@ python native_virtclass_handler () {
>          deps = bb.utils.explode_deps(deps)
>          newdeps = []
>          for dep in deps:
> -            if dep == pn:
> +            if regex and dep.startswith("^") and dep.endswith("$"):
> +                newdeps.append(dep[:-1].replace(pn, bpn) + 
> "-native$")
> +            elif dep == pn:
>                  if not selfref:
>                      continue
>                  newdeps.append(dep)
> @@ -171,6 +173,7 @@ python native_virtclass_handler () {
>          map_dependencies("RPROVIDES", e.data, pkg)
>          map_dependencies("RREPLACES", e.data, pkg)
>      map_dependencies("PACKAGES", e.data)
> +    map_dependencies("PACKAGES_DYNAMIC", e.data, regex=True)
> 
>      provides = e.data.getVar("PROVIDES")
>      nprovides = []
> 
> 
> Cheers,
> 
> Richard
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176350): 
> <https://lists.openembedded.org/g/openembedded-core/message/176350>
> Mute This Topic: <https://lists.openembedded.org/mt/96449563/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-teG+M9muwUg1aCJ8BOf7
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks for the propper fix. I've sent a v2 that excludes the second bit</div></div><div id="geary-quote" dir="auto"><br>Am Mi, 25. Jan 2023 um 14:24:39 +0000 schrieb Richard Purdie &lt;richard.purdie@linuxfoundation.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">On Sun, 2023-01-22 at 08:06 +0100, Markus Volk wrote:
<blockquote> - Add missing cups runtime dependency
 - Create packages for the printbackends only for target
   This fixes:
 
   NOTE: Multiple providers are available for runtime gtk4-printbackend-cups (gtk4, gtk4-native)
   Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbackend-cups
   NOTE: Multiple providers are available for runtime gtk4-printbackend-file (gtk4, gtk4-native)
   Consider defining a PREFERRED_RPROVIDER entry to match gtk4-printbackend-file
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta/recipes-gnome/gtk+/gtk4_4.8.3.bb | 5 +++--
  1 file changed, 3 insertions(+), 2 deletions(-)
 
 diff --git a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
 index 6101905128..5112d3b38b 100644
 --- a/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
 +++ b/meta/recipes-gnome/gtk+/gtk4_4.8.3.bb
 @@ -65,7 +65,8 @@ PACKAGECONFIG:class-nativesdk = "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)
  
  PACKAGECONFIG[x11] = "-Dx11-backend=true,-Dx11-backend=false,at-spi2-atk fontconfig libx11 libxext libxcursor libxi libxdamage libxrandr libxrender libxcomposite libxfixes xinerama"
  PACKAGECONFIG[wayland] = "-Dwayland-backend=true,-Dwayland-backend=false,wayland wayland-protocols virtual/egl virtual/libgles2 wayland-native"
 -PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups"
 +PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=enabled,-Dcloudproviders=disabled,libcloudproviders"
 +PACKAGECONFIG[cups] = "-Dprint-cups=enabled,-Dprint-cups=disabled,cups,cups"
  PACKAGECONFIG[colord] = "-Dcolord=enabled,-Dcolord=disabled,colord"
  PACKAGECONFIG[iso-codes] = ",,iso-codes,iso-codes"
  PACKAGECONFIG[ffmpeg] = "-Dmedia-ffmpeg=enabled,-Dmedia-ffmpeg=disabled,ffmpeg"
</blockquote>
This bit is fine.

<blockquote> @@ -114,7 +115,7 @@ RRECOMMENDS:${PN} = "${GTKBASE_RRECOMMENDS}"
  RRECOMMENDS:${PN}:libc-glibc = "${GTKGLIBC_RRECOMMENDS}"
  RDEPENDS:${PN}-dev += "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>("PACKAGECONFIG", "wayland", "wayland-protocols", "", d)}"
  
 -PACKAGES_DYNAMIC += "^gtk4-printbackend-.*"
 +PACKAGES_DYNAMIC:class-target += "^gtk4-printbackend-.*"
  python populate_packages:prepend () {
      import os.path
 
</blockquote>
This bit is really a bug in the native.bbclass class extension code and
I'd really prefer to fix that rather than needing every recipe with a
BBCLASSEXTEND native to handle PACKAGES_DYNAMIC specially.

You'll see that nativesdk.bbclass does:

    clsextend.map_regexp_variable("PACKAGES_DYNAMIC")

but native.bbclass doesn't do anything with PACKAGES_DYANAMIC which is
the issue. Could you see if the patch below helps please?

diff --git a/meta/classes-recipe/native.bbclass b/meta/classes-recipe/native.bbclass
index 1e94585f3e3..cfd299d0c8c 100644
--- a/meta/classes-recipe/native.bbclass
+++ b/meta/classes-recipe/native.bbclass
@@ -139,7 +139,7 @@ python native_virtclass_handler () {
     if "native" not in classextend:
         return
 
-    def map_dependencies(varname, d, suffix = "", selfref=True):
+    def map_dependencies(varname, d, suffix = "", selfref=True, regex=False):
         if suffix:
             varname = varname + ":" + suffix
         deps = d.getVar(varname)
@@ -148,7 +148,9 @@ python native_virtclass_handler () {
         deps = bb.utils.explode_deps(deps)
         newdeps = []
         for dep in deps:
-            if dep == pn:
+            if regex and dep.startswith("^") and dep.endswith("$"):
+                newdeps.append(dep[:-1].replace(pn, bpn) + "-native$")
+            elif dep == pn:
                 if not selfref:
                     continue
                 newdeps.append(dep)
@@ -171,6 +173,7 @@ python native_virtclass_handler () {
         map_dependencies("RPROVIDES", e.data, pkg)
         map_dependencies("RREPLACES", e.data, pkg)
     map_dependencies("PACKAGES", e.data)
+    map_dependencies("PACKAGES_DYNAMIC", e.data, regex=True)
 
     provides = e.data.getVar("PROVIDES")
     nprovides = []


Cheers,

Richard
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#176350): <a href="https://lists.openembedded.org/g/openembedded-core/message/176350">https://lists.openembedded.org/g/openembedded-core/message/176350</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/96449563/3618223">https://lists.openembedded.org/mt/96449563/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-teG+M9muwUg1aCJ8BOf7--


