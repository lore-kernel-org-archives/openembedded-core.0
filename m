Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 512DE7066B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 01:46:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t1B1k2Qb021268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 10 Feb 2015 17:46:02 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 10 Feb 2015 17:46:02 -0800
Message-ID: <54DAB458.4060105@windriver.com>
Date: Wed, 11 Feb 2015 09:46:00 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1423559596.git.Qi.Chen@windriver.com>
	<9a96f78fbc6562ff7813121cab49a6ee8e1bd34a.1423559596.git.Qi.Chen@windriver.com>
	<CAJTo0Lagm4DoEGnSHuXLJ-e7Khz+ciH0c17rGtxJH+rq6xAGnw@mail.gmail.com>
In-Reply-To: <CAJTo0Lagm4DoEGnSHuXLJ-e7Khz+ciH0c17rGtxJH+rq6xAGnw@mail.gmail.com>
X-Originating-IP: [128.224.162.226]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] systemd: fix do_install failure in case of multilib
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
X-List-Received-Date: Wed, 11 Feb 2015 01:46:04 -0000
Content-Type: multipart/alternative;
	boundary="------------000207040302010505060309"

--------------000207040302010505060309
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2015 08:37 PM, Burton, Ross wrote:
>
> On 10 February 2015 at 09:14, Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     -  ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed -i
>     -e "\$ad /run/systemd/netif/links 0755 root root -"
>     ${D}${libdir}/tmpfiles.d/systemd.conf', d)}
>     +       ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '', 'sed
>     -i -e "\$ad /run/systemd/netif/links 0755 root root -"
>     ${D}${prefix}${nonarch_base_libdir}/tmpfiles.d/systemd.conf', d)}
>
>
> systemd.bb <http://systemd.bb> has a few variables that mirror the 
> variabes used in the systemd build system, 
> rootprefix/rootlibdir/rootlibexecdir. Would using one of those match 
> the variables used in the makefile to install these files to avoid 
> this sort of thing happening again?
>
> Ross

Hmm... I don't quite get you. But this do_install error was introduced 
into OE by a recent commit.

commit 2a675bc63b22724f12e6ed6ff58d0f1d1e0d3b29
Date:   Thu Jan 29 12:44:20 2015 -0800

     systemd: Backports fixes to 216

     Fix systemd-timesyncd assertion

     when networkd is disabled then we now do not
     create /run/systemd/netif/links but timesyncd needs it. So lets
     manually create this file when networkd is disabled so timesyncd
     can still function

     When enabling systemd-timesyncd we need systemd-timesync user

     Backport patches to enable timesyncd when resolved and networkd
     are disabled

     replace the resolv.conf symlinink patch with a proper backport

Best Regards,
Chen Qi

--------------000207040302010505060309
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 02/10/2015 08:37 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0Lagm4DoEGnSHuXLJ-e7Khz+ciH0c17rGtxJH+rq6xAGnw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On 10 February 2015 at 09:14, Chen Qi
            <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <div id=":24c" class="a3s" style="overflow:hidden">-     
                 ${@bb.utils.contains('PACKAGECONFIG', 'networkd', '',
                'sed -i -e "\$ad /run/systemd/netif/links 0755 root root
                -" ${D}${libdir}/tmpfiles.d/systemd.conf', d)}<br>
                +       ${@bb.utils.contains('PACKAGECONFIG',
                'networkd', '', 'sed -i -e "\$ad
                /run/systemd/netif/links 0755 root root -"
                ${D}${prefix}${nonarch_base_libdir}/tmpfiles.d/systemd.conf',
                d)}</div>
            </blockquote>
          </div>
          <br>
          <a moz-do-not-send="true" href="http://systemd.bb">systemd.bb</a>
          has a few variables that mirror the variabes used in the
          systemd build system, rootprefix/rootlibdir/rootlibexecdir. 
          Would using one of those match the variables used in the
          makefile to install these files to avoid this sort of thing
          happening again?</div>
        <div class="gmail_extra"><br>
        </div>
        <div class="gmail_extra">Ross</div>
      </div>
    </blockquote>
    <br>
    Hmm... I don't quite get you. But this do_install error was
    introduced into OE by a recent commit.<br>
    <br>
    commit 2a675bc63b22724f12e6ed6ff58d0f1d1e0d3b29<br>
    Date:   Thu Jan 29 12:44:20 2015 -0800<br>
    <br>
        systemd: Backports fixes to 216<br>
        <br>
        Fix systemd-timesyncd assertion<br>
        <br>
        when networkd is disabled then we now do not<br>
        create /run/systemd/netif/links but timesyncd needs it. So lets<br>
        manually create this file when networkd is disabled so timesyncd<br>
        can still function<br>
        <br>
        When enabling systemd-timesyncd we need systemd-timesync user<br>
        <br>
        Backport patches to enable timesyncd when resolved and networkd<br>
        are disabled<br>
        <br>
        replace the resolv.conf symlinink patch with a proper backport<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
  </body>
</html>

--------------000207040302010505060309--
