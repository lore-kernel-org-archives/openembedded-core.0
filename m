Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D545378984
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 03:11:15 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I3BEBp006681
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2018 20:11:15 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 17 Jul 2018 20:11:14 -0700
To: nick83ola <nick83ola@gmail.com>
References: <20180716081759.5747-1-nick83ola@gmail.com>
	<30a8009d-b30f-b55b-bb31-ac1330273835@windriver.com>
	<CABPh3UPFvQPxLzOCkGbr==exY6563k8aQankndPjN_wQs09H7g@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <3f651880-de5d-b867-c70c-3835e0ce56ed@windriver.com>
Date: Wed, 18 Jul 2018 11:14:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CABPh3UPFvQPxLzOCkGbr==exY6563k8aQankndPjN_wQs09H7g@mail.gmail.com>
X-Originating-IP: [128.224.162.218]
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Wed, 18 Jul 2018 03:11:16 -0000
Content-Type: multipart/alternative;
	boundary="------------B23DA793A072CDA28BFF370F"

--------------B23DA793A072CDA28BFF370F
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Nicola,

I'd like to detail the current handling of resolv.conf below.
This is the current resolv.conf handling logic.
But if you think there's something wrong about the logic, let me know.

/etc/resolv.conf would be created/written by multiple applications. In 
fact, any network manager is likely to handle it.
Our goal is to 1) make sure /etc/resolv.conf always exists and 2) avoid 
conflicts among multiple application

In systemd, if 'resolved' is enabled, both '/run/systemd/resolve' 
directory and '/run/systemd/resolve/resolv.conf' file will be created by 
systemd-resolved. What we need is just to create a symlink to 
/run/systemd/resolve/resolv.conf.
That's why we have: ln -s ../run/systemd/resolve/resolv.conf 
${D}${sysconfdir}/resolv-conf.systemd
So why /etc/resolv-conf.systemd instead of just /etc/resolv.conf? The 
answer is to avoid conflicts with other network managers.
If 'resolved' is not enabled, we still need to ensure the existence of 
/etc/resolv.conf. As it has been handled by the 'resolv-conf' 
ALTERNATIVE to point to /etc/resov-conf.systemd, we just need to ensure 
/etc/resolv-conf.systemd is not a dead link. That why we write 'd 
/run/systemd/resolve 0755 root root -' and 'f 
/run/systemd/resolve/resolv.conf 0644 root root'. That is to satisfy 
goal 1. If we have dropped goal 1, then such operation is not necessary. 
But I doubt there would be some problem if we don't satisfy goal 1.

Back to the code block in systemd recipe.
         if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 
'false', d)}; then
                 echo 'L! ${sysconfdir}/resolv.conf - - - - 
../run/systemd/resolve/resolv.conf' 
 >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
                 echo 'd /run/systemd/resolve 0755 root root -' 
 >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
                 echo 'f /run/systemd/resolve/resolv.conf 0644 root 
root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
                 ln -s ../run/systemd/resolve/resolv.conf 
${D}${sysconfdir}/resolv-conf.systemd
     else
                 sed -i -e "s%^L! /etc/resolv.conf.*$%L! 
/etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" 
${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
         ln -s ../run/systemd/resolve/resolv.conf 
${D}${sysconfdir}/resolv-conf.systemd
         fi

As we are using 'L' instead of 'L+', you can simply ignore the two 
lines, they are more likely to serve as fallbacks.
So expressed in pseudo codes, the above logic is:
if reoslved is not enabled:
     link /etc/resolv-conf.systemd to /run/systemd/resolve/resolv.conf
     make sure /etc/resolv-conf.systemd is not a dead link
else:
     link /etc/resolv-conf.systemd to /run/systemd/resolve/resolv.conf
     # systemd-resolved handles /run/systemd/resolve/resolv.conf, so 
nothing more needs to be done here

Best Regards,
Chen Qi


On 07/17/2018 06:05 PM, nick83ola wrote:
> Hi
>
>     commit 00e4662e55f66570cae29240c22b4d74b79d3ca5
>     Author: Maxin B. John <maxin.john@intel.com>
>     <mailto:maxin.john@intel.com>
>     Date:   Mon Jun 12 18:10:21 2017 +0300
>
>         systemd: enable resolved and networkd
>
>         Enable systemd-resolved and systemd-networkd by default.
>         Make it co-exist with connman and  Fix associated problems
>         in read-only rootfs.
>
>
> This part of the patch does nothing with the current version of 
> systemd (or does the wrong thing)
>
>
>         else
>                 sed -i -e "s%^L! /etc/resolv.conf.*$%L! 
> /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" 
> ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> +               ln -s ../run/systemd/resolve/resolv.conf 
> ${D}${sysconfdir}/resolv-conf.systemd
>         fi
>
> the check here was
>
>      if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 
> 'false', d)}; then
> apart from the part that the check is REVERSED ...
> if the PACKAGECONFIG doesn't contain the resolved option 
> systemd-resolved is not build and no modification is done on the 
> /lib/tmpfiles/etc/conf
>
> see
> https://github.com/systemd/systemd/blob/46659f7deb962f55c728e70597e37c2a3ab6326d/tmpfiles.d/etc.conf.m4#L16
> m4_ifdef(`ENABLE_RESOLVE',
>
> L! /etc/resolv.conf - - - - ../run/systemd/resolve/stub-resolv.conf
>
> )m4_dnl
>
> So the else branch can be safely removed.
>
>     commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038
>     Author: Khem Raj <raj.khem@gmail.com> <mailto:raj.khem@gmail.com>
>     Date:   Fri Dec 16 14:07:31 2016 -0800
>
>         systemd: point to correct resolv.conf when resolved is enabled
>
>         latest systemd has changed the resolved defaults which points to
>         127.0.0.53 port 53 on local network. If someone wants to use
>         host-local IP address then it can be pointed to copy in
>     /lib/systemd
>
>         (From OE-Core rev: 99d1199fd0961f94732a1a533d66472ca17cf6f5)
>
>         Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     <mailto:raj.khem@gmail.com>
>         Signed-off-by: Ross Burton <ross.burton@intel.com>
>     <mailto:ross.burton@intel.com>
>         Signed-off-by: Richard Purdie
>     <richard.purdie@linuxfoundation.org>
>     <mailto:richard.purdie@linuxfoundation.org>
>
>
> So here the error was introduced!!!!! read this patch carefully
> If you read the deleted comment it was saying:
> *if resolved is disabled*,
> But this patch reverse it to
>
> systemd: point to correct resolv.conf when resolved *is enabled*
>
>         if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 
> 'false', d)}; then
> -               # *if resolved is disabled*, it won't handle the link 
> of resolv.conf, so
> -               # set it up ourselves
> -               ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
> -               echo '*L! ${sysconfdir}/resolv.conf - - - - 
> ../run/resolv.conf'* >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> -               echo 'f /run/resolv.conf 0644 root root' 
> >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
> +               echo*'L! ${sysconfdir}/resolv.conf - - - - 
> ../run/systemd/resolve/resolv.conf'* 
> >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> +               echo 'd /run/systemd/resolve 0755 root root -' 
> >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
> +               echo 'f /run/systemd/resolve/resolv.conf 0644 root 
> root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
> +               ln -s ../run/systemd/resolve/resolv.conf 
> ${D}${sysconfdir}/resolv.conf
> +       else
> +               sed -i -e "s%^L! /etc/resolv.conf.*$%L! 
> /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" 
> ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>         fi
>         install -Dm 0755 
> ${S}/src/systemctl/systemd-sysv-install.SKELETON 
> ${D}${systemd_unitdir}/systemd-sysv-install
>  }
>
>
>
>
>
>     commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89
>     Author: Christopher Larson <chris_larson@mentor.com>
>     <mailto:chris_larson@mentor.com>
>     Date:   Wed Nov 4 20:19:19 2015 -0700
>
>         systemd: arrange for volatile /etc/resolv.conf
>
>         On sysvinit systems, volatiles is configured to make
>     /etc/resolv.conf symlink
>         to a file in a volatile path, which lets us write to
>     /etc/resolv.conf for
>         read-only-rootfs. For systemd, this isn't set up unless we enable
>         systemd-resolved, which we don't by default. When it's not
>     enabled, create the
>         /etc/resolv.conf symlink and ensure the volatile path is
>     created on boot with
>         tmpfiles.d.
>
>
> +       if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 
> 'false', d)}; then
> +               # if resolved is disabled, it won't handle the link of 
> resolv.conf, so
> +               # set it up ourselves
> +               ln -s ../run/resolv.conf ${D}${sysconfdir}/resolv.conf
> +               echo 'L! ${sysconfdir}/resolv.conf - - - - 
> ../run/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
> +               echo 'f /run/resolv.conf 0644 root root' 
> >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
> +       fi
>         install -Dm 0755 
> ${S}/src/systemctl/systemd-sysv-install.SKELETON 
> ${D}${systemd_unitdir}/systemd-sysv-install
>  }
>
> This patch was the right one the following 
> 669edd04432f8e76e32bd7f34f4d9aa63eef4038 reversed the sense of the switch
>
> Regards
> Nicola Lunghi
>
>     Best Regards,
>     Chen Qi
>
>
>     On 07/16/2018 04:17 PM, Nicola Lunghi wrote:
>>     From: Nicola Lunghi<nicola.lunghi@jci.com> <mailto:nicola.lunghi@jci.com>
>>
>>     if resolved option is not selected the package systemd-resolved
>>     is not installed so it cannot provide an alternative for
>>     resolv.conf
>>
>>     In this recipe the previous check was instead reversing the check (note the !).
>>
>>     This patch avoid messing with resol.conf link if resolved is disabled in
>>     the package config.
>>
>>     This in particular if we compile systemd with musl where systemd-resolved
>>     cannot be compiled.
>>
>>     Signed-off-by: Nicola Lunghi<nicola.lunghi@jci.com> <mailto:nicola.lunghi@jci.com>
>>     ---
>>       meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.bb>  | 8 +++-----
>>       1 file changed, 3 insertions(+), 5 deletions(-)
>>
>>     diff --git a/meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.bb>  b/meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.bb>
>>     index 3efca33e73..bd6dcef637 100644
>>     --- a/meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.bb>
>>     +++ b/meta/recipes-core/systemd/systemd_237.bb <http://systemd_237.bb>
>>     @@ -258,14 +258,11 @@ do_install() {
>>       	if [ -s ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf ]; then
>>       		${@bb.utils.contains('PACKAGECONFIG', 'networkd', ':', 'sed -i -e "\$ad /run/systemd/netif/links 0755 root root -" ${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf', d)}
>>       	fi
>>     -	if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
>>     +	if ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true', 'false', d)}; then
>>       		echo 'L! ${sysconfdir}/resolv.conf - - - - ../run/systemd/resolve/resolv.conf' >>${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>>       		echo 'd /run/systemd/resolve 0755 root root -' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>>       		echo 'f /run/systemd/resolve/resolv.conf 0644 root root' >>${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf
>>       		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
>>     -	else
>>     -		sed -i -e "s%^L! /etc/resolv.conf.*$%L! /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g" ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf
>>     -		ln -s ../run/systemd/resolve/resolv.conf ${D}${sysconfdir}/resolv-conf.systemd
>>       	fi
>>       	install -Dm 0755 ${S}/src/systemctl/systemd-sysv-install.SKELETON ${D}${systemd_unitdir}/systemd-sysv-install
>>       
>>     @@ -539,7 +536,7 @@ python __anonymous() {
>>       # TODO:
>>       # u-a for runlevel and telinit
>>       
>>     -ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel resolv-conf"
>>     +ALTERNATIVE_${PN} = "init halt reboot shutdown poweroff runlevel"
>>       
>>       ALTERNATIVE_TARGET[init] = "${rootlibexecdir}/systemd/systemd"
>>       ALTERNATIVE_LINK_NAME[init] = "${base_sbindir}/init"
>>     @@ -565,6 +562,7 @@ ALTERNATIVE_TARGET[runlevel] = "${base_bindir}/systemctl"
>>       ALTERNATIVE_LINK_NAME[runlevel] = "${base_sbindir}/runlevel"
>>       ALTERNATIVE_PRIORITY[runlevel] ?= "300"
>>       
>>     +ALTERNATIVE_${PN} +="${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf',
>>     '', d)}"
>>     <mailto:$%7B@bb.utils.contains%28%27PACKAGECONFIG%27,%27resolved%27,%27resolv-conf%27,%27%27,d%29%7D>
>>       ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
>>       ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
>>       ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
>
>
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>


--------------B23DA793A072CDA28BFF370F
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Nicola,<br>
      <br>
      I'd like to detail the current handling of resolv.conf below.<br>
      This is the current resolv.conf handling logic.<br>
      But if you think there's something wrong about the logic, let me
      know.<br>
      <br>
      /etc/resolv.conf would be created/written by multiple
      applications. In fact, any network manager is likely to handle it.<br>
      Our goal is to 1) make sure /etc/resolv.conf always exists and 2)
      avoid conflicts among multiple application<br>
      <br>
      In systemd, if 'resolved' is enabled, both '/run/systemd/resolve'
      directory and '/run/systemd/resolve/resolv.conf' file will be
      created by systemd-resolved. What we need is just to create a
      symlink to /run/systemd/resolve/resolv.conf.<br>
      That's why we have: ln -s ../run/systemd/resolve/resolv.conf
      ${D}${sysconfdir}/resolv-conf.systemd<br>
      So why /etc/resolv-conf.systemd instead of just /etc/resolv.conf?
      The answer is to avoid conflicts with other network managers.<br>
      If 'resolved' is not enabled, we still need to ensure the
      existence of /etc/resolv.conf. As it has been handled by the
      'resolv-conf' ALTERNATIVE to point to /etc/resov-conf.systemd, we
      just need to ensure /etc/resolv-conf.systemd is not a dead link.
      That why we write 'd /run/systemd/resolve 0755 root root -' and 'f
      /run/systemd/resolve/resolv.conf 0644 root root'. That is to
      satisfy goal 1. If we have dropped goal 1, then such operation is
      not necessary. But I doubt there would be some problem if we don't
      satisfy goal 1.<br>
      <br>
      Back to the code block in systemd recipe.<br>
              if ! ${@bb.utils.contains('PACKAGECONFIG', 'resolved',
      'true', 'false', d)}; then<br>
                      echo 'L! ${sysconfdir}/resolv.conf - - - -
      ../run/systemd/resolve/resolv.conf'
      &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
                      echo 'd /run/systemd/resolve 0755 root root -'
      &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
                      echo 'f /run/systemd/resolve/resolv.conf 0644 root
      root' &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
                      ln -s ../run/systemd/resolve/resolv.conf
      ${D}${sysconfdir}/resolv-conf.systemd<br>
          else<br>
                      sed -i -e "s%^L! /etc/resolv.conf.*$%L!
      /etc/resolv.conf - - - - ../run/systemd/resolve/resolv.conf%g"
      ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
              ln -s ../run/systemd/resolve/resolv.conf
      ${D}${sysconfdir}/resolv-conf.systemd<br>
              fi<br>
      <br>
      As we are using 'L' instead of 'L+', you can simply ignore the two
      lines, they are more likely to serve as fallbacks.<br>
      So expressed in pseudo codes, the above logic is:<br>
      if reoslved is not enabled:<br>
          link /etc/resolv-conf.systemd to
      /run/systemd/resolve/resolv.conf<br>
          make sure /etc/resolv-conf.systemd is not a dead link <br>
      else:<br>
          link /etc/resolv-conf.systemd to
      /run/systemd/resolve/resolv.conf<br>
          # systemd-resolved handles /run/systemd/resolve/resolv.conf,
      so nothing more needs to be done here<br>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 07/17/2018 06:05 PM, nick83ola wrote:<br>
    </div>
    <blockquote
cite="mid:CABPh3UPFvQPxLzOCkGbr==exY6563k8aQankndPjN_wQs09H7g@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">Hi<br>
        <div><br>
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF">
                <div class="gmail-m_-8033413996440123836moz-cite-prefix">
                  commit 00e4662e55f66570cae29240c22b4d74b79d3ca5 <br>
                  Author: Maxin B. John <a moz-do-not-send="true"
                    class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:maxin.john@intel.com" target="_blank">&lt;maxin.john@intel.com&gt;</a>
                  <br>
                  Date:   Mon Jun 12 18:10:21 2017 +0300 <br>
                  <br>
                      systemd: enable resolved and networkd <br>
                  <br>
                      Enable systemd-resolved and systemd-networkd by
                  default. <br>
                      Make it co-exist with connman and  Fix associated
                  problems <br>
                      in read-only rootfs. <br>
                  <br>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>This part of the patch does nothing with the current
              version of systemd (or does the wrong thing)<br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div>        else<br>
                              sed -i -e "s%^L! /etc/resolv.conf.*$%L!
              /etc/resolv.conf - - - -
              ../run/systemd/resolve/resolv.conf%g"
              ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
              +               ln -s ../run/systemd/resolve/resolv.conf
              ${D}${sysconfdir}/resolv-conf.systemd<br>
                      fi</div>
          </div>
          <div class="gmail_quote"><br>
          </div>
          <div class="gmail_quote">the check here was</div>
          <div class="gmail_quote"><br>
          </div>
          <div class="gmail_quote">     if !
            ${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'true',
            'false', d)}; then<br>
          </div>
          <div class="gmail_quote">apart from the part that the check is
            REVERSED ...<br>
          </div>
          <div class="gmail_quote">if the PACKAGECONFIG doesn't contain
            the resolved option systemd-resolved is not build and no
            modification is done on the /lib/tmpfiles/etc/conf</div>
          <div class="gmail_quote"><br>
          </div>
          <div class="gmail_quote">see<br>
          </div>
          <div class="gmail_quote"><a moz-do-not-send="true"
href="https://github.com/systemd/systemd/blob/46659f7deb962f55c728e70597e37c2a3ab6326d/tmpfiles.d/etc.conf.m4#L16">https://github.com/systemd/systemd/blob/46659f7deb962f55c728e70597e37c2a3ab6326d/tmpfiles.d/etc.conf.m4#L16</a><br>
          </div>
          <div class="gmail_quote">
            <table class="gmail-highlight gmail-tab-size
              gmail-js-file-line-container">
              <tbody>
                <tr>
                  <td id="gmail-LC16" class="gmail-blob-code
                    gmail-blob-code-inner gmail-js-file-line
                    gmail-highlighted">m4_ifdef(`ENABLE_RESOLVE',</td>
                </tr>
                <tr>
                </tr>
              </tbody>
            </table>
            <table class="gmail-highlight gmail-tab-size
              gmail-js-file-line-container">
              <tbody>
                <tr>
                  <td id="gmail-LC17" class="gmail-blob-code
                    gmail-blob-code-inner gmail-js-file-line">L!
                    /etc/resolv.conf - - - -
                    ../run/systemd/resolve/stub-resolv.conf</td>
                </tr>
                <tr>
                </tr>
              </tbody>
            </table>
            )m4_dnl<br>
          </div>
          <div class="gmail_quote"><br>
          </div>
          So the else branch can be safely removed.<br>
        </div>
        <div><br>
        </div>
        <div>
          <div class="gmail_quote">
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF">
                <div class="gmail-m_-8033413996440123836moz-cite-prefix"> 
                  commit 669edd04432f8e76e32bd7f34f4d9aa63eef4038 <br>
                  Author: Khem Raj <a moz-do-not-send="true"
                    class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:raj.khem@gmail.com" target="_blank">&lt;raj.khem@gmail.com&gt;</a>
                  <br>
                  Date:   Fri Dec 16 14:07:31 2016 -0800 <br>
                  <br>
                      systemd: point to correct resolv.conf when
                  resolved is enabled <br>
                  <br>
                      latest systemd has changed the resolved defaults
                  which points to <br>
                      127.0.0.53 port 53 on local network. If someone
                  wants to use <br>
                      host-local IP address then it can be pointed to
                  copy in /lib/systemd <br>
                  <br>
                      (From OE-Core rev:
                  99d1199fd0961f94732a1a533d66472ca17cf6f5) <br>
                  <br>
                      Signed-off-by: Khem Raj <a moz-do-not-send="true"
class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:raj.khem@gmail.com" target="_blank">&lt;raj.khem@gmail.com&gt;</a>
                  <br>
                      Signed-off-by: Ross Burton <a
                    moz-do-not-send="true"
                    class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:ross.burton@intel.com" target="_blank">&lt;ross.burton@intel.com&gt;</a>
                  <br>
                      Signed-off-by: Richard Purdie <a
                    moz-do-not-send="true"
                    class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:richard.purdie@linuxfoundation.org"
                    target="_blank">&lt;richard.purdie@linuxfoundation.org&gt;</a>
                  <br>
                  <br>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>So here the error was introduced!!!!! read this patch
              carefully</div>
            <div>If you read the deleted comment it was saying:</div>
            <div><b>if resolved is disabled</b>,</div>
            <div>But this patch reverse it to <br>
            </div>
            <div><br>
            </div>
            <div style="margin-left:40px">systemd: point to correct
              resolv.conf when resolved <b>is enabled</b></div>
            <br>
            <div>        if ! ${@bb.utils.contains('PACKAGECONFIG',
              'resolved', 'true', 'false', d)}; then<br>
              -               # <b>if resolved is disabled</b>, it
              won't handle the link of resolv.conf, so<br>
              -               # set it up ourselves<br>
              -               ln -s ../run/resolv.conf
              ${D}${sysconfdir}/resolv.conf<br>
              -               echo '<b>L! ${sysconfdir}/resolv.conf - -
                - - ../run/resolv.conf'</b>
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
              -               echo 'f /run/resolv.conf 0644 root root'
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
              +               echo<b> 'L! ${sysconfdir}/resolv.conf - -
                - - ../run/systemd/resolve/resolv.conf'</b>
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
              +               echo 'd /run/systemd/resolve 0755 root
              root -'
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
              +               echo 'f /run/systemd/resolve/resolv.conf
              0644 root root'
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
              +               ln -s ../run/systemd/resolve/resolv.conf
              ${D}${sysconfdir}/resolv.conf<br>
              +       else<br>
              +               sed -i -e "s%^L! /etc/resolv.conf.*$%L!
              /etc/resolv.conf - - - -
              ../run/systemd/resolve/resolv.conf%g"
              ${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
                      fi<br>
                      install -Dm 0755
              ${S}/src/systemctl/systemd-sysv-install.SKELETON
              ${D}${systemd_unitdir}/systemd-sysv-install<br>
               }<br>
              <br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div><br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF">
                <div class="gmail-m_-8033413996440123836moz-cite-prefix">
                  commit b80da02ce9b683f96393fe0ea1f5f1a5f1a07c89 <br>
                  Author: Christopher Larson <a moz-do-not-send="true"
class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E"
                    href="mailto:chris_larson@mentor.com"
                    target="_blank">&lt;chris_larson@mentor.com&gt;</a>
                  <br>
                  Date:   Wed Nov 4 20:19:19 2015 -0700 <br>
                  <br>
                      systemd: arrange for volatile /etc/resolv.conf <br>
                  <br>
                      On sysvinit systems, volatiles is configured to
                  make /etc/resolv.conf symlink <br>
                      to a file in a volatile path, which lets us write
                  to /etc/resolv.conf for <br>
                      read-only-rootfs. For systemd, this isn't set up
                  unless we enable <br>
                      systemd-resolved, which we don't by default. When
                  it's not enabled, create the <br>
                      /etc/resolv.conf symlink and ensure the volatile
                  path is created on boot with <br>
                      tmpfiles.d. <br>
                  <br>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>+       if ! ${@bb.utils.contains('PACKAGECONFIG',
              'resolved', 'true', 'false', d)}; then<br>
              +               # if resolved is disabled, it won't handle
              the link of resolv.conf, so<br>
              +               # set it up ourselves<br>
              +               ln -s ../run/resolv.conf
              ${D}${sysconfdir}/resolv.conf<br>
              +               echo 'L! ${sysconfdir}/resolv.conf - - - -
              ../run/resolv.conf'
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/etc.conf<br>
              +               echo 'f /run/resolv.conf 0644 root root'
              &gt;&gt;${D}${exec_prefix}/lib/tmpfiles.d/systemd.conf<br>
              +       fi<br>
                      install -Dm 0755
              ${S}/src/systemctl/systemd-sysv-install.SKELETON
              ${D}${systemd_unitdir}/systemd-sysv-install<br>
               }<br>
              <br>
            </div>
            <div>This patch was the right one the following
              669edd04432f8e76e32bd7f34f4d9aa63eef4038 reversed the
              sense of the switch</div>
            <div><br>
            </div>
            <div>Regards</div>
            <div>Nicola Lunghi<br>
            </div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
              0.8ex;border-left:1px solid
              rgb(204,204,204);padding-left:1ex">
              <div bgcolor="#FFFFFF">
                <div class="gmail-m_-8033413996440123836moz-cite-prefix">
                  Best Regards,<br>
                  Chen Qi<br>
                  <br>
                  <br>
                  On 07/16/2018 04:17 PM, Nicola Lunghi wrote:<br>
                </div>
                <blockquote type="cite">
                  <pre>From: Nicola Lunghi <a moz-do-not-send="true" class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E" href="mailto:nicola.lunghi@jci.com" target="_blank">&lt;nicola.lunghi@jci.com&gt;</a>

if resolved option is not selected the package systemd-resolved
is not installed so it cannot provide an alternative for
resolv.conf

In this recipe the previous check was instead reversing the check (note the !).

This patch avoid messing with resol.conf link if resolved is disabled in
the package config.

This in particular if we compile systemd with musl where systemd-resolved
cannot be compiled.

Signed-off-by: Nicola Lunghi <a moz-do-not-send="true" class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E" href="mailto:nicola.lunghi@jci.com" target="_blank">&lt;nicola.lunghi@jci.com&gt;</a>
---
 meta/recipes-core/systemd/<a moz-do-not-send="true" href="http://systemd_237.bb" target="_blank">systemd_237.bb</a> | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/<a moz-do-not-send="true" href="http://systemd_237.bb" target="_blank">systemd_237.bb</a> b/meta/recipes-core/systemd/<a moz-do-not-send="true" href="http://systemd_237.bb" target="_blank">systemd_237.bb</a>
index 3efca33e73..bd6dcef637 100644
--- a/meta/recipes-core/systemd/<a moz-do-not-send="true" href="http://systemd_237.bb" target="_blank">systemd_237.bb</a>
+++ b/meta/recipes-core/systemd/<a moz-do-not-send="true" href="http://systemd_237.bb" target="_blank">systemd_237.bb</a>
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
 
+ALTERNATIVE_${PN} += <a moz-do-not-send="true" class="gmail-m_-8033413996440123836moz-txt-link-rfc2396E" href="mailto:$%7B@bb.utils.contains%28%27PACKAGECONFIG%27,%27resolved%27,%27resolv-conf%27,%27%27,d%29%7D" target="_blank">"${@bb.utils.contains('PACKAGECONFIG', 'resolved', 'resolv-conf', '', d)}"</a>
 ALTERNATIVE_TARGET[resolv-conf] = "${sysconfdir}/resolv-conf.systemd"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${sysconfdir}/resolv.conf"
 ALTERNATIVE_PRIORITY[resolv-conf] ?= "50"
</pre>
                </blockquote>
                <p><br>
                </p>
              </div>
              -- <br>
              _______________________________________________<br>
              Openembedded-core mailing list<br>
              <a moz-do-not-send="true"
                href="mailto:Openembedded-core@lists.openembedded.org"
                target="_blank">Openembedded-core@lists.openembedded.org</a><br>
              <a moz-do-not-send="true"
                href="http://lists.openembedded.org/mailman/listinfo/openembedded-core"
                rel="noreferrer" target="_blank">http://lists.openembedded.org/mailman/listinfo/openembedded-core</a><br>
            </blockquote>
          </div>
        </div>
        <div><br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------B23DA793A072CDA28BFF370F--
