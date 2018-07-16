Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB5C7458B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:09:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G99Cu1004541
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 02:09:12 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 02:09:11 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20180716081759.5747-1-nick83ola@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
Date: Mon, 16 Jul 2018 17:12:44 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180716081759.5747-1-nick83ola@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [meta-oe][poky][PATCH v2] systemd: resolved linked even if the option is disabled
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
X-List-Received-Date: Mon, 16 Jul 2018 09:09:12 -0000
Content-Type: multipart/alternative;
	boundary="------------A9B846D7902A4EA8C2303005"

--------------A9B846D7902A4EA8C2303005
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

As I replied on poky mailing list to this patch, you need to first check 
the following three commits.

commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
Author: Maxin B. John <maxin.john@intel.com>
Date:   Mon Jun 12 18:10:21 2017 +0300

     systemd: enable resolved and networkd

     Enable systemd-resolved and systemd-networkd by default.
     Make it co-exist with connman and  Fix associated problems
     in read-only rootfs.

     Fixes [YOCTO #11331]

     (From OE-Core rev: d9b6d538e3d81ab0d5e7b7b6adecef555d782217)

     Signed-off-by: Maxin B. John <maxin.john@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
Author: Khem Raj <raj.khem@gmail.com>
Date:   Fri Dec 16 14:07:31 2016 -0800

     systemd: point to correct resolv.conf when resolved is enabled

     latest systemd has changed the resolved defaults which points to
     127.0.0.53 port 53 on local network. If someone wants to use
     host-local IP address then it can be pointed to copy in /lib/systemd

     (From OE-Core rev: 99d1199fd0961f94732a1a533d66472ca17cf6f5)

     Signed-off-by: Khem Raj <raj.khem@gmail.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
Author: Christopher Larson <chris_larson@mentor.com>
Date:   Wed Nov 4 20:19:19 2015 -0700

     systemd: arrange for volatile /etc/resolv.conf

     On sysvinit systems, volatiles is configured to make 
/etc/resolv.conf symlink
     to a file in a volatile path, which lets us write to 
/etc/resolv.conf for
     read-only-rootfs. For systemd, this isn't set up unless we enable
     systemd-resolved, which we don't by default. When it's not enabled, 
create the
     /etc/resolv.conf symlink and ensure the volatile path is created on 
boot with
     tmpfiles.d.

     (From OE-Core rev: 7f087f161e8942bcd35f88999dfca418f01cd7fa)

     Signed-off-by: Christopher Larson <chris_larson@mentor.com>
     Signed-off-by: Ross Burton <ross.burton@intel.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Best Regards,
Chen Qi


On 07/16/2018 04:17 PM, Nicola Lunghi wrote:
> From: Nicola Lunghi <nicola.lunghi@jci.com>
>
> if resolved option is not selected the package systemd-resolved
> is not installed so it cannot provide an alternative for
> resolv.conf
>
> In this recipe the previous check was instead reversing the check (note the !).
>
> This patch avoid messing with resol.conf link if resolved is disabled in
> the package config.
>
> This in particular if we compile systemd with musl where systemd-resolved
> cannot be compiled.
>
> Signed-off-by: Nicola Lunghi <nicola.lunghi@jci.com>
> ---
>   meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
> index 3efca33e73..bd6dcef637 100644
> --- a/meta/recipes-core/systemd/systemd_237.bb
> +++ b/meta/recipes-core/systemd/systemd_237.bb
> @@ -258,14 +258,11 @@ do_install() {
>   	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
>   		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
>   	fi
> -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
> +	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
>   		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>   		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>   		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>   		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
> -	else
> -		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> -		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
>   	fi
>   	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
>   
> @@ -539,7 +536,7 @@ python __anonymous() {
>   # TODO:
>   # u-a for runlevel and telinit
>   
> -ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
> +ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
>   
>   ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
>   ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
> @@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>   ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>   ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>   
> +ALTERNATIVE_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"
>   ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
>   ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
>   ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"



--------------A9B846D7902A4EA8C2303005
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Nicola,<br>
      <br>
      As I replied on poky mailing list to this patch, you need to first
      check the following three commits.<br>
      <br>
      commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
      <br>
      Author: Maxin B. John <a class="moz-txt-link-rfc2396E"
        href="mailto:maxin.john@intel.com">&lt;maxin.john@intel.com&gt;</a>
      <br>
      Date:   Mon Jun 12 18:10:21 2017 +0300
      <br>
      <br>
          systemd: enable resolved and networkd
      <br>
      <br>
          Enable systemd-resolved and systemd-networkd by default.
      <br>
          Make it co-exist with connman and  Fix associated problems
      <br>
          in read-only rootfs.
      <br>
      <br>
          Fixes [YOCTO #11331]
      <br>
      <br>
          (From OE-Core rev: d9b6d538e3d81ab0d5e7b7b6adecef555d782217)
      <br>
      <br>
          Signed-off-by: Maxin B. John <a class="moz-txt-link-rfc2396E"
        href="mailto:maxin.john@intel.com">&lt;maxin.john@intel.com&gt;</a>
      <br>
          Signed-off-by: Richard Purdie <a
        class="moz-txt-link-rfc2396E"
        href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
      <br>
      <br>
      commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
      <br>
      Author: Khem Raj <a class="moz-txt-link-rfc2396E"
        href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
      <br>
      Date:   Fri Dec 16 14:07:31 2016 -0800
      <br>
      <br>
          systemd: point to correct resolv.conf when resolved is enabled
      <br>
      <br>
          latest systemd has changed the resolved defaults which points
      to
      <br>
          127.0.0.53 port 53 on local network. If someone wants to use
      <br>
          host-local IP address then it can be pointed to copy in
      /lib/systemd
      <br>
      <br>
          (From OE-Core rev: 99d1199fd0961f94732a1a533d66472ca17cf6f5)
      <br>
      <br>
          Signed-off-by: Khem Raj <a class="moz-txt-link-rfc2396E"
        href="mailto:raj.khem@gmail.com">&lt;raj.khem@gmail.com&gt;</a>
      <br>
          Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E"
        href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
      <br>
          Signed-off-by: Richard Purdie <a
        class="moz-txt-link-rfc2396E"
        href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
      <br>
      <br>
      commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
      <br>
      Author: Christopher Larson <a class="moz-txt-link-rfc2396E"
        href="mailto:chris_larson@mentor.com">&lt;chris_larson@mentor.com&gt;</a>
      <br>
      Date:   Wed Nov 4 20:19:19 2015 -0700
      <br>
      <br>
          systemd: arrange for volatile /etc/resolv.conf
      <br>
      <br>
          On sysvinit systems, volatiles is configured to make
      /etc/resolv.conf symlink
      <br>
          to a file in a volatile path, which lets us write to
      /etc/resolv.conf for
      <br>
          read-only-rootfs. For systemd, this isn't set up unless we
      enable
      <br>
          systemd-resolved, which we don't by default. When it's not
      enabled, create the
      <br>
          /etc/resolv.conf symlink and ensure the volatile path is
      created on boot with
      <br>
          tmpfiles.d.
      <br>
      <br>
          (From OE-Core rev: 7f087f161e8942bcd35f88999dfca418f01cd7fa)
      <br>
      <br>
          Signed-off-by: Christopher Larson <a
        class="moz-txt-link-rfc2396E"
        href="mailto:chris_larson@mentor.com">&lt;chris_larson@mentor.com&gt;</a>
      <br>
          Signed-off-by: Ross Burton <a class="moz-txt-link-rfc2396E"
        href="mailto:ross.burton@intel.com">&lt;ross.burton@intel.com&gt;</a>
      <br>
          Signed-off-by: Richard Purdie <a
        class="moz-txt-link-rfc2396E"
        href="mailto:richard.purdie@linuxfoundation.org">&lt;richard.purdie@linuxfoundation.org&gt;</a>
      <br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 07/16/2018 04:17 PM, Nicola Lunghi wrote:<br>
    </div>
    <blockquote cite="mid:20180716081759.5747-1-nick83ola@gmail.com"
      type="cite">
      <pre wrap="">From: Nicola Lunghi <a class="moz-txt-link-rfc2396E" href="mailto:nicola.lunghi@jci.com">&lt;nicola.lunghi@jci.com&gt;</a>

if resolved option is not selected the package systemd-resolved
is not installed so it cannot provide an alternative for
resolv.conf

In this recipe the previous check was instead reversing the check (note the !).

This patch avoid messing with resol.conf link if resolved is disabled in
the package config.

This in particular if we compile systemd with musl where systemd-resolved
cannot be compiled.

Signed-off-by: Nicola Lunghi <a class="moz-txt-link-rfc2396E" href="mailto:nicola.lunghi@jci.com">&lt;nicola.lunghi@jci.com&gt;</a>
---
 meta/recipes-core/systemd/systemd_237.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_237.bb b/meta/recipes-core/systemd/systemd_237.bb
index 3efca33e73..bd6dcef637 100644
--- a/meta/recipes-core/systemd/systemd_237.bb
+++ b/meta/recipes-core/systemd/systemd_237.bb
@@ -258,14 +258,11 @@ do_install() {
 	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
 		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
 	fi
-	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
+	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
 		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
 		echo 'd /run/systemd/resolve 0755 root root -' &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
 		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
-	else
-		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
-		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
 	fi
 	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
 
@@ -539,7 +536,7 @@ python __anonymous() {
 # TODO:
 # u-a for runlevel and telinit
 
-ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
+ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
 
 ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
 ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
@@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
 ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
 ALTERNATIVE_PRIORITY[runlevel] ?= "300"
 
+ALTERNATIVE_${PN} += <a class="moz-txt-link-rfc2396E" href="mailto:${@bb.utils.contains('PACKAGECONFIG','resolved','resolv-conf','',d)}">"${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"</a>
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------A9B846D7902A4EA8C2303005--
