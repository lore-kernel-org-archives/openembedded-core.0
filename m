Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC31C64ED6
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 01:02:25 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.7039.1677200543161221325
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Feb 2023 17:02:23 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout01.t-online.de (Postfix) with SMTP id EC4A9CBF;
	Fri, 24 Feb 2023 02:02:20 +0100 (CET)
Received: from [192.168.178.83] ([79.219.224.101]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pVMTS-3ATAUy0; Fri, 24 Feb 2023 02:02:10 +0100
Date: Fri, 24 Feb 2023 02:02:04 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv3] vte: update 0.70.2 -> 0.70.3
To: alexandre.belloni@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Message-Id: <G78KQR.MQ2N8D79QG3Y1@t-online.de>
In-Reply-To: <Y/f2ngPg/GeWQ4G+@mail.local>
References: <20230223075256.1755504-1-f_l_k@t-online.de>
	<Y/f2ngPg/GeWQ4G+@mail.local>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-reHn23X+P5oEMh/16Cd+"
X-TOI-EXPURGATEID: 150726::1677200530-C8C30DB0-6D55372C/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c8c6f53-779b-4dda-8295-209781b26dcb
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 01:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177644

--=-reHn23X+P5oEMh/16Cd+
Content-Type: text/plain; charset=us-ascii; format=flowed

I cant reproduce this. I've built core-image-sato multilib and rootfs 
was created without an issue

Am Fr, 24. Feb 2023 um 00:28:30 +0100 schrieb Alexandre Belloni via 
lists.openembedded.org 
<alexandre.belloni=bootlin.com@lists.openembedded.org>:
> I'm sorry I didn't catch it earlier but this is also the cause of:
> 
> ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: 
> duplicate files 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/multilib/lib32/usr/share/glib-2.0/schemas/gschemas.compiled 
> /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/glib-2.0/schemas/gschemas.compiled 
> is not the same
> 
> <https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/6745/steps/20/logs/stdio>
> 
> On 23/02/2023 08:52:56+0100, Markus Volk wrote:
>>  - Allow to build the gtk4 widget and vapi
>>    This is needed to build gtk4 based terminals like blackbox
>>  - Update dependencies
>>  - Cleanup recipe
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   .../vte/{vte_0.70.2.bb => vte_0.70.3.bb}      | 22 
>> +++++++++----------
>>   1 file changed, 11 insertions(+), 11 deletions(-)
>>   rename meta/recipes-support/vte/{vte_0.70.2.bb => vte_0.70.3.bb} 
>> (71%)
>> 
>>  diff --git a/meta/recipes-support/vte/vte_0.70.2.bb 
>> b/meta/recipes-support/vte/vte_0.70.3.bb
>>  similarity index 71%
>>  rename from meta/recipes-support/vte/vte_0.70.2.bb
>>  rename to meta/recipes-support/vte/vte_0.70.3.bb
>>  index ec2fb1f522..474ed87a88 100644
>>  --- a/meta/recipes-support/vte/vte_0.70.2.bb
>>  +++ b/meta/recipes-support/vte/vte_0.70.3.bb
>>  @@ -11,34 +11,34 @@ LIC_FILES_CHKSUM = " \
>>       file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057 
>> <file://copying.xterm;md5=d7fc3a23c16c039afafe2e042030f057/> \
>>   "
>> 
>>  -DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
>>  +DEPENDS = "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native 
>> gperf-native icu pango zlib"
>> 
>>   GNOMEBASEBUILDCLASS = "meson"
>>   GIR_MESON_OPTION = 'gir'
>>   GIDOCGEN_MESON_OPTION = "docs"
>> 
>>  -inherit gnomebase gi-docgen features_check 
>> upstream-version-is-even gobject-introspection
>>  +inherit gnomebase gi-docgen features_check 
>> upstream-version-is-even gobject-introspection vala
>> 
>>  -# vapigen.m4 is required when vala is not present (but the one 
>> from vala should be used normally)
>>   SRC_URI += 
>> "file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" 
>> <file://0001-add-w_exitcode-macro-for-non-glibc-systems.patch/>
>>  -SRC_URI[archive.sha256sum] = 
>> "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
>>  +SRC_URI[archive.sha256sum] = 
>> "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
>> 
>>   ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>> 
>>  -# Help g-ir-scanner find the .so for linking
>>  -do_compile:prepend() {
>>  -    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
>>  -}
>>  -
>>   # Package additional files
>>   FILES:${PN}-dev += "${datadir}/vala/vapi/*"
>> 
>>  -PACKAGECONFIG ??= "gnutls"
>>  -PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
>>  +PACKAGECONFIG ??= " \
>>  +    gnutls \
>>  +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 
>> 'gobject-introspection-data', 'vala', '', d)} \
>>  +    ${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl', 'gtk4', 
>> '', d)} \
>>  +"
>>  +PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
>>  +PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
>>   PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
>>   PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
>>   # vala requires gir
>>   PACKAGECONFIG:remove:class-native = "vala"
>>  +PACKAGECONFIG:remove:class-nativesdk = "vala gtk4"
>> 
>>   CFLAGS += "-D_GNU_SOURCE"
>> 
>>  --
>>  2.34.1
>> 
> 
>> 
>> 
>> 
> 
> 
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com <https://bootlin.com/>
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177639): 
> <https://lists.openembedded.org/g/openembedded-core/message/177639>
> Mute This Topic: <https://lists.openembedded.org/mt/97178843/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-reHn23X+P5oEMh/16Cd+
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>I cant reproduce this. I've built core-image-sato multilib and rootfs was created without an issue&nbsp;</div></div><div id="geary-quote" dir="auto"><br>Am Fr, 24. Feb 2023 um 00:28:30 +0100 schrieb Alexandre Belloni via lists.openembedded.org &lt;alexandre.belloni=bootlin.com@lists.openembedded.org&gt;:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">I'm sorry I didn't catch it earlier but this is also the cause of:

ERROR: core-image-sato-1.0-r0 do_rootfs: Multilib check error: duplicate files /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/multilib/lib32/usr/share/glib-2.0/schemas/gschemas.compiled /home/pokybuild/yocto-worker/multilib/build/build/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs/usr/share/glib-2.0/schemas/gschemas.compiled is not the same

<a href="https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/6745/steps/20/logs/stdio">https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/6745/steps/20/logs/stdio</a>

On 23/02/2023 08:52:56+0100, Markus Volk wrote:
<blockquote> - Allow to build the gtk4 widget and vapi
   This is needed to build gtk4 based terminals like blackbox
 - Update dependencies
 - Cleanup recipe
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  .../vte/{vte_0.70.2.bb =&gt; vte_0.70.3.bb}      | 22 +++++++++----------
  1 file changed, 11 insertions(+), 11 deletions(-)
  rename meta/recipes-support/vte/{vte_0.70.2.bb =&gt; vte_0.70.3.bb} (71%)
 
 diff --git a/meta/recipes-support/vte/vte_0.70.2.bb b/meta/recipes-support/vte/vte_0.70.3.bb
 similarity index 71%
 rename from meta/recipes-support/vte/vte_0.70.2.bb
 rename to meta/recipes-support/vte/vte_0.70.3.bb
 index ec2fb1f522..474ed87a88 100644
 --- a/meta/recipes-support/vte/vte_0.70.2.bb
 +++ b/meta/recipes-support/vte/vte_0.70.3.bb
 @@ -11,34 +11,34 @@ LIC_FILES_CHKSUM = " \
      <a href="file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057">file://COPYING.XTERM;md5=d7fc3a23c16c039afafe2e042030f057</a> \
  "
  
 -DEPENDS = "glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu"
 +DEPENDS = "fribidi glib-2.0 gtk+3 libpcre2 libxml2-native gperf-native icu pango zlib"
  
  GNOMEBASEBUILDCLASS = "meson"
  GIR_MESON_OPTION = 'gir'
  GIDOCGEN_MESON_OPTION = "docs"
  
 -inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection
 +inherit gnomebase gi-docgen features_check upstream-version-is-even gobject-introspection vala
  
 -# vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
  SRC_URI += "<a href="file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch" "="">file://0001-Add-W_EXITCODE-macro-for-non-glibc-systems.patch"</a>
 -SRC_URI[archive.sha256sum] = "4d15b4380de3f564d57eabd006389c407c705df5b0c70030fdcc24971a334d80"
 +SRC_URI[archive.sha256sum] = "9457134a02f3157fca04f7e0d39bdb0f3099be0a3ce82b7139d0c98a80748f23"
  
  ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
  
 -# Help g-ir-scanner find the .so for linking
 -do_compile:prepend() {
 -    export GIR_EXTRA_LIBS_PATH="${B}/src/.libs"
 -}
 -
  # Package additional files
  FILES:${PN}-dev += "${datadir}/vala/vapi/*"
  
 -PACKAGECONFIG ??= "gnutls"
 -PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false,vala-native vala"
 +PACKAGECONFIG ??= " \
 +    gnutls \
 +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'gobject-introspection-data', 'vala', '', d)} \
 +    <a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DISTRO_FEATURES', 'opengl', 'gtk4', '', d)} \
 +"
 +PACKAGECONFIG[gtk4] = "-Dgtk4=true,-Dgtk4=false,gtk4"
 +PACKAGECONFIG[vala] = "-Dvapi=true,-Dvapi=false"
  PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
  PACKAGECONFIG[systemd] = "-D_systemd=true,-D_systemd=false,systemd"
  # vala requires gir
  PACKAGECONFIG:remove:class-native = "vala"
 +PACKAGECONFIG:remove:class-nativesdk = "vala gtk4"
  
  CFLAGS += "-D_GNU_SOURCE"
  
 -- 
 2.34.1
 
</blockquote>
<blockquote> 
 
 
</blockquote>

<div>-- 
</div>Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
<a href="https://bootlin.com">https://bootlin.com</a>
</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#177639): <a href="https://lists.openembedded.org/g/openembedded-core/message/177639">https://lists.openembedded.org/g/openembedded-core/message/177639</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/97178843/3618223">https://lists.openembedded.org/mt/97178843/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-reHn23X+P5oEMh/16Cd+--


