Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4838FC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 22:20:47 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.6040.1701210044279748056
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Nov 2023 14:20:44 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout11.t-online.de (Postfix) with SMTP id 3D6E021791;
	Tue, 28 Nov 2023 23:20:42 +0100 (CET)
Received: from [192.168.178.67] ([84.163.32.157]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r86Rd-3yFIO00; Tue, 28 Nov 2023 23:20:41 +0100
Date: Tue, 28 Nov 2023 23:20:58 +0100
From: f_l_k@t-online.de
Subject: RE: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER
 variables for llvm
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: openembedded-core@lists.openembedded.org
Message-Id: <Y2UU4S.B6RU8SK2KTBE2@t-online.de>
In-Reply-To: <DB5PR02MB10213D245CEB0C6D63AB066A9EFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231127102449.521512-1-f_l_k@t-online.de>
	<DB5PR02MB10213D245CEB0C6D63AB066A9EFBDA@DB5PR02MB10213.eurprd02.prod.outlook.com>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-5wizZ4tw254/NjRJimbi"
X-TOI-EXPURGATEID: 150726::1701210041-B980699C-EE33EC2A/0/0 CLEAN NORMAL
X-TOI-MSGID: 88ed815c-4ed5-490d-90dc-57817dc26728
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Nov 2023 22:20:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191392

--=-5wizZ4tw254/NjRJimbi
Content-Type: text/plain; charset=us-ascii; format=flowed

Thanks. I have sent a v3

On Mon, Nov 27 2023 at 10:35:37 PM +00:00:00, Peter Kjellerstedt 
<peter.kjellerstedt@axis.com> wrote:
>>  -----Original Message-----
>>  From: openembedded-core@lists.openembedded.org 
>> <mailto:openembedded-core@lists.openembedded.org> 
>> <openembedded-core@lists.openembedded.org 
>> <mailto:openembedded-core@lists.openembedded.org>> On Behalf Of 
>> Markus Volk
>>  Sent: den 27 november 2023 11:25
>>  To: openembedded-core@lists.openembedded.org 
>> <mailto:openembedded-core@lists.openembedded.org>
>>  Subject: [oe-core][PATCHv2] default-providers.inc: add 
>> PREFERRED_PROVIDER variables for llvm
>> 
>>  gallium-llvm needs to be built with clang if you, for example
>>  want to have support for opencl or want to build the intel-clc 
>> compiler.
>>  meta-clang recommends to set
>> 
>>  PREFERRED_PROVIDER_llvm = "clang"
>>  PREFERRED_PROVIDER_llvm-native = "clang-native"
>> 
>>  The current problem is that this is not taken into account in mesa 
>> and therefore
>>  both llvm and clang are included. This leads to files that are 
>> provided by both
>>  packages and would also unnecessarily increase the build time.
>> 
>>  Add PREFERRED_PROVIDER_llvm and PREFERRED_PROVIDER_llvm-native and 
>> make
>>  sure that the mesa recipe takes these variables into account.
>> 
>>  Signed-off-by: Markus Volk <f_l_k@t-online.de 
>> <mailto:f_l_k@t-online.de>>
>>  ---
>>   meta/conf/distro/include/default-providers.inc | 2 ++
>>   meta/recipes-graphics/mesa/mesa.inc            | 2 +-
>>   2 files changed, 3 insertions(+), 1 deletion(-)
>> 
>>  diff --git a/meta/conf/distro/include/default-providers.inc 
>> b/meta/conf/distro/include/default-providers.inc
>>  index d18173c744..819d71628b 100644
>>  --- a/meta/conf/distro/include/default-providers.inc
>>  +++ b/meta/conf/distro/include/default-providers.inc
>>  @@ -37,6 +37,8 @@ PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
>>   PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
>>   PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
>>   PREFERRED_PROVIDER_libgcc ?= "libgcc"
>>  +PREFERRED_PROVIDER_llvm ?= "llvm"
>>  +PREFERRED_PROVIDER_llvm-native ?= "llvm-native"
> 
> Don't insert them between PREFERRED_PROVIDER_libgcc and
> PREFERRED_PROVIDER_nativesdk-libgcc. They belong together.
> 
>>   PREFERRED_PROVIDER_nativesdk-libgcc ?= "nativesdk-libgcc"
>>   PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
>>   PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?= 
>> "nativesdk-linux-libc-headers"
>>  diff --git a/meta/recipes-graphics/mesa/mesa.inc 
>> b/meta/recipes-graphics/mesa/mesa.inc
>>  index e5c405a972..1a971242c9 100644
>>  --- a/meta/recipes-graphics/mesa/mesa.inc
>>  +++ b/meta/recipes-graphics/mesa/mesa.inc
>>  @@ -183,7 +183,7 @@ GALLIUMDRIVERS:append = 
>> "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
>>   GALLIUMDRIVERS:append = "${@bb.utils.contains 
>> <mailto:${@bb.utils.contains>('PACKAGECONFIG', 'virgl', ',virgl', 
>> '', d)}"
>> 
>>   PACKAGECONFIG[gallium] = 
>> "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, 
>> -Dgallium-drivers='', libdrm"
>>  -PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled 
>> -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
>>  +PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled 
>> -Dshared-llvm=enabled, -Dllvm=disabled, ${PREFERRED_PROVIDER_llvm} 
>> ${PREFERRED_PROVIDER_llvm-native} elfutils"
> 
> This should not be needed. When PREFERRED_PROVIDER_llvm and
> PREFERRED_PROVIDER_llvm-native are set, bitbake should automatically
> take care of depending on the correct recipes.
> 
>>   PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
>>   PACKAGECONFIG[va] = 
>> "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
>>   PACKAGECONFIG[vdpau] = 
>> "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
>>  --
>>  2.42.1
> 
> //Peter
> 


--=-5wizZ4tw254/NjRJimbi
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>Thanks. I have sent a v3</div></div><div id="geary-quote" dir="auto"><br>On Mon, Nov 27 2023 at 10:35:37 PM +00:00:00, Peter Kjellerstedt &lt;peter.kjellerstedt@axis.com&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;"><blockquote> -----Original Message-----
 From: <a href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a> &lt;<a href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>&gt; On Behalf Of Markus Volk
 Sent: den 27 november 2023 11:25
 To: <a href="mailto:openembedded-core@lists.openembedded.org">openembedded-core@lists.openembedded.org</a>
 Subject: [oe-core][PATCHv2] default-providers.inc: add PREFERRED_PROVIDER variables for llvm
 
 gallium-llvm needs to be built with clang if you, for example
 want to have support for opencl or want to build the intel-clc compiler.
 meta-clang recommends to set
 
 PREFERRED_PROVIDER_llvm = "clang"
 PREFERRED_PROVIDER_llvm-native = "clang-native"
 
 The current problem is that this is not taken into account in mesa and therefore
 both llvm and clang are included. This leads to files that are provided by both
 packages and would also unnecessarily increase the build time.
 
 Add PREFERRED_PROVIDER_llvm and PREFERRED_PROVIDER_llvm-native and make
 sure that the mesa recipe takes these variables into account.
 
 Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
 ---
  meta/conf/distro/include/default-providers.inc | 2 ++
  meta/recipes-graphics/mesa/mesa.inc            | 2 +-
  2 files changed, 3 insertions(+), 1 deletion(-)
 
 diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
 index d18173c744..819d71628b 100644
 --- a/meta/conf/distro/include/default-providers.inc
 +++ b/meta/conf/distro/include/default-providers.inc
 @@ -37,6 +37,8 @@ PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
  PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
  PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
  PREFERRED_PROVIDER_libgcc ?= "libgcc"
 +PREFERRED_PROVIDER_llvm ?= "llvm"
 +PREFERRED_PROVIDER_llvm-native ?= "llvm-native"
</blockquote>
Don't insert them between PREFERRED_PROVIDER_libgcc and 
PREFERRED_PROVIDER_nativesdk-libgcc. They belong together.

<blockquote>  PREFERRED_PROVIDER_nativesdk-libgcc ?= "nativesdk-libgcc"
  PREFERRED_PROVIDER_linux-libc-headers ?= "linux-libc-headers"
  PREFERRED_PROVIDER_nativesdk-linux-libc-headers ?= "nativesdk-linux-libc-headers"
 diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
 index e5c405a972..1a971242c9 100644
 --- a/meta/recipes-graphics/mesa/mesa.inc
 +++ b/meta/recipes-graphics/mesa/mesa.inc
 @@ -183,7 +183,7 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600',
  GALLIUMDRIVERS:append = "<a href="mailto:${@bb.utils.contains">${@bb.utils.contains</a>('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
  PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 -PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 +PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, ${PREFERRED_PROVIDER_llvm} ${PREFERRED_PROVIDER_llvm-native} elfutils"
</blockquote>
This should not be needed. When PREFERRED_PROVIDER_llvm and 
PREFERRED_PROVIDER_llvm-native are set, bitbake should automatically 
take care of depending on the correct recipes.

<blockquote>  PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
  PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
  PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 --
 2.42.1
</blockquote>
//Peter

</div></blockquote></div>
--=-5wizZ4tw254/NjRJimbi--


