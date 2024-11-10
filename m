Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643AED6409F
	for <webhook@archiver.kernel.org>; Sun, 10 Nov 2024 14:09:43 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.36602.1731247774591815538
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Nov 2024 06:09:34 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout06.t-online.de (Postfix) with SMTP id 254114A5
	for <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 15:09:33 +0100 (CET)
Received: from [192.168.178.67] ([84.154.174.121]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tA8d9-2La1Kq0; Sun, 10 Nov 2024 15:09:31 +0100
Date: Sun, 10 Nov 2024 15:11:49 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe-core][PATCHv2] systemd: add PACKAGECONFIG for sysupdate
 feature
To: openembedded-core@lists.openembedded.org
Message-Id: <PFNQMS.0IE5MHM674YH1@t-online.de>
In-Reply-To: <1806A09B890EE15C.19665@lists.openembedded.org>
References: <1806A09B890EE15C.19665@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-WflPbBbsvhLR6Ejhwe4f"
X-TOI-EXPURGATEID: 150726::1731247771-FCFF68C0-5B5786C4/0/0 CLEAN NORMAL
X-TOI-MSGID: f8d63889-1403-4d96-9e76-ea7315561d45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Nov 2024 14:09:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206921

--=-WflPbBbsvhLR6Ejhwe4f
Content-Type: text/plain; charset=us-ascii; format=flowed

v2: Do what is normally done in the recipe with packageconfigs that 
depend on other packageconfigs to avoid possible issues with the order 
of options

On Sun, Nov 10 2024 at 03:10:28 PM +01:00:00, Markus Volk 
<f_l_k@t-online.de> wrote:
> sysupdate links with libfdisk and depends on libblkid, libfdisk and 
> libopenssl
> 
> [<https://www.freedesktop.org/software/systemd/man/latest/systemd-sysupdate.html>]
> 
> Additionally add a PACKAGECONFIG for fdisk which can be activated 
> separately
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de 
> <mailto:f_l_k@t-online.de>>
> ---
>  meta/recipes-core/systemd/systemd_256.7.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-core/systemd/systemd_256.7.bb 
> b/meta/recipes-core/systemd/systemd_256.7.bb
> index af810c0fcd..484c118d81 100644
> --- a/meta/recipes-core/systemd/systemd_256.7.bb
> +++ b/meta/recipes-core/systemd/systemd_256.7.bb
> @@ -149,6 +149,7 @@ PACKAGECONFIG[default-compression-zstd] = 
> "-Dzstd=true -Ddefault-compression=zst
>  PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
>  PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false 
> -Dbootloader=false,python3-pyelftools-native"
>  PACKAGECONFIG[elfutils] = 
> "-Delfutils=true,-Delfutils=false,elfutils,,libelf libdw"
> +PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled,util-linux"
>  PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
>  PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
>  PACKAGECONFIG[homed] = "-Dhomed=true,-Dhomed=false"
> @@ -208,6 +209,7 @@ PACKAGECONFIG[seccomp] = 
> "-Dseccomp=true,-Dseccomp=false,libseccomp"
>  PACKAGECONFIG[selinux] = 
> "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
>  PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
>  PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
> +PACKAGECONFIG[sysupdate] = "-Dsysupdate=enabled,-Dsysupdate=disabled"
>  PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
>  PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d 
> -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= 
> -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
>  # When enabled use reproducible build timestamp if set as time epoch,
> @@ -833,6 +835,9 @@ python __anonymous() {
> 
>      if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) 
> and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl 
> cryptsetup', True, False, d):
>          bb.error("PACKAGECONFIG[homed] requires 
> PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and 
> PACKAGECONFIG[cryptsetup]")
> +
> +    if bb.utils.contains('PACKAGECONFIG', 'sysupdate', True, False, 
> d) and not bb.utils.contains('PACKAGECONFIG', 'fdisk openssl', True, 
> False, d):
> +        bb.error("PACKAGECONFIG[sysupdate] requires 
> PACKAGECONFIG[fdisk] and PACKAGECONFIG[openssl]")
>  }
> 
>  python do_warn_musl() {
> --
> 2.47.0
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206920): 
> <https://lists.openembedded.org/g/openembedded-core/message/206920>
> Mute This Topic: <https://lists.openembedded.org/mt/109497172/3618223>
> Group Owner: openembedded-core+owner@lists.openembedded.org 
> <mailto:openembedded-core+owner@lists.openembedded.org>
> Unsubscribe: 
> <https://lists.openembedded.org/g/openembedded-core/unsub> 
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


--=-WflPbBbsvhLR6Ejhwe4f
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto"><div>v2: Do what is normally done in the recipe with packageconfigs that depend on other packageconfigs to avoid possible issues with the order of options</div></div><div id="geary-quote" dir="auto"><br>On Sun, Nov 10 2024 at 03:10:28 PM +01:00:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">sysupdate links with libfdisk and depends on libblkid, libfdisk and libopenssl

[<a href="https://www.freedesktop.org/software/systemd/man/latest/systemd-sysupdate.html">https://www.freedesktop.org/software/systemd/man/latest/systemd-sysupdate.html</a>]

Additionally add a PACKAGECONFIG for fdisk which can be activated separately

Signed-off-by: Markus Volk &lt;<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&gt;
---
 meta/recipes-core/systemd/systemd_256.7.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/systemd/systemd_256.7.bb b/meta/recipes-core/systemd/systemd_256.7.bb
index af810c0fcd..484c118d81 100644
--- a/meta/recipes-core/systemd/systemd_256.7.bb
+++ b/meta/recipes-core/systemd/systemd_256.7.bb
@@ -149,6 +149,7 @@ PACKAGECONFIG[default-compression-zstd] = "-Dzstd=true -Ddefault-compression=zst
 PACKAGECONFIG[dbus] = "-Ddbus=true,-Ddbus=false,dbus"
 PACKAGECONFIG[efi] = "-Defi=true -Dbootloader=true,-Defi=false -Dbootloader=false,python3-pyelftools-native"
 PACKAGECONFIG[elfutils] = "-Delfutils=true,-Delfutils=false,elfutils,,libelf libdw"
+PACKAGECONFIG[fdisk] = "-Dfdisk=enabled,-Dfdisk=disabled,util-linux"
 PACKAGECONFIG[firstboot] = "-Dfirstboot=true,-Dfirstboot=false"
 PACKAGECONFIG[repart] = "-Drepart=true,-Drepart=false"
 PACKAGECONFIG[homed] = "-Dhomed=true,-Dhomed=false"
@@ -208,6 +209,7 @@ PACKAGECONFIG[seccomp] = "-Dseccomp=true,-Dseccomp=false,libseccomp"
 PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,initscripts-sushell"
 PACKAGECONFIG[smack] = "-Dsmack=true,-Dsmack=false"
 PACKAGECONFIG[sysext] = "-Dsysext=true, -Dsysext=false"
+PACKAGECONFIG[sysupdate] = "-Dsysupdate=enabled,-Dsysupdate=disabled"
 PACKAGECONFIG[sysusers] = "-Dsysusers=true,-Dsysusers=false"
 PACKAGECONFIG[sysvinit] = "-Dsysvinit-path=${sysconfdir}/init.d -Dsysvrcnd-path=${sysconfdir},-Dsysvinit-path= -Dsysvrcnd-path=,,systemd-compat-units update-rc.d"
 # When enabled use reproducible build timestamp if set as time epoch,
@@ -833,6 +835,9 @@ python __anonymous() {
 
     if bb.utils.contains('PACKAGECONFIG', 'homed', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'userdb openssl cryptsetup', True, False, d):
         bb.error("PACKAGECONFIG[homed] requires PACKAGECONFIG[userdb], PACKAGECONFIG[openssl] and PACKAGECONFIG[cryptsetup]")
+
+    if bb.utils.contains('PACKAGECONFIG', 'sysupdate', True, False, d) and not bb.utils.contains('PACKAGECONFIG', 'fdisk openssl', True, False, d):
+        bb.error("PACKAGECONFIG[sysupdate] requires PACKAGECONFIG[fdisk] and PACKAGECONFIG[openssl]")
 }
 
 python do_warn_musl() {
<div>-- 
</div>2.47.0

</div><div class="plaintext" style="white-space: break-spaces;">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#206920): <a href="https://lists.openembedded.org/g/openembedded-core/message/206920">https://lists.openembedded.org/g/openembedded-core/message/206920</a>
Mute This Topic: <a href="https://lists.openembedded.org/mt/109497172/3618223">https://lists.openembedded.org/mt/109497172/3618223</a>
Group Owner: <a href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a href="mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</div></blockquote></div>
--=-WflPbBbsvhLR6Ejhwe4f--


