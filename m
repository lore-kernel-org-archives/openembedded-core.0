Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <radu.moisan@intel.com>) id 1SuNT1-0007NF-RP
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 14:47:00 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Jul 2012 05:35:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; 
	d="scan'208,217";a="177805713"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 26 Jul 2012 05:35:14 -0700
Message-ID: <501139E2.1020003@intel.com>
Date: Thu, 26 Jul 2012 15:36:50 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120714 Thunderbird/14.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<1756274.ud5AYazWdz@helios>
	<F0E3167B-ECF8-494D-83E8-0D31CC826E65@dominion.thruhere.net>
	<50110B50.3030900@intel.com>
	<446507ED-01C5-4006-B9AE-C8D77B61C213@dominion.thruhere.net>
	<50111C7C.8080904@intel.com> <50112207.3060709@intel.com>
	<CAJTo0LYeKt+KypnrVq50tSbjqfK8XyvUnZp0xvz=KRmMx7dXzQ@mail.gmail.com>
	<C132AEAF-467E-450E-A86F-7A68BE96F917@dominion.thruhere.net>
	<CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com>
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 12:47:00 -0000
Content-Type: multipart/alternative;
	boundary="------------070301050003030108080608"

--------------070301050003030108080608
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I understand the reasoning behind RPROVIDES. I've grep'ed the sources 
and none of the packages that depend on dbus-x11 have build time 
dependencies on it, so the question arises "what's the point of 
PROVIDES?". I understand the compatibility argument, but it seems to me 
more like an argument when dependencies are not clear, but in this case 
they are clear. The following packages depend on dbus-x11, at run-time:

radu@dell-desktop>grep . -re dbus-x11
./recipes-bsp/qemu-config/*qemu-config.bb*:RDEPENDS_${PN} = "distcc 
${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)} 
task-core-nfs-server oprofileui-server rsync bash"
./recipes-gnome/gnome/*gconf_3.2.3.bb*:RDEPENDS_${PN} += 
"${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
./recipes-graphics/x11-common/*x11-common_0.1.bb*:RDEPENDS_${PN} = 
"dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"

Rephrasing my question, what would happen (potentially bad) if I don't 
have PROVIDES="dbus-x11" line in my recipe?

Also, I've done a clean build without PROVIDES="dbus-x11" line in 
dbus.inc and the build finished successfully, as if it were there (tried 
that as well).

Radu

On 07/26/2012 03:00 PM, Burton, Ross wrote:
> On 26 July 2012 12:55, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> It would be nice if other layers that have RDEPENDS_foo = "dbus-x11" keep working till their maintainers get around fixing them. Note that you might need to do a -c cleansstate on dbus first to trigger any errors.
> Yes, and isn't that what the RPROVIDES is for?



--------------070301050003030108080608
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    I understand the reasoning behind RPROVIDES. I've grep'ed the
    sources and none of the packages that depend on dbus-x11 have build
    time dependencies on it, so the question arises "what's the point of
    PROVIDES?". I understand the compatibility argument, but it seems to
    me more like an argument when dependencies are not clear, but in
    this case they are clear. The following packages depend on dbus-x11,
    at run-time:<br>
    <br>
    <small><font face="Droid Sans Mono">radu@dell-desktop&gt;grep . -re
        dbus-x11<br>
        ./recipes-bsp/qemu-config/<b>qemu-config.bb</b>:RDEPENDS_${PN} =
        "distcc ${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11',
        '', d)} task-core-nfs-server oprofileui-server rsync bash"<br>
        ./recipes-gnome/gnome/<b>gconf_3.2.3.bb</b>:RDEPENDS_${PN} +=
        "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"<br>
        ./recipes-graphics/x11-common/<b>x11-common_0.1.bb</b>:RDEPENDS_${PN}
        = "dbus-x11 xmodmap xdpyinfo xtscal xinit formfactor"</font></small><br>
    <br>
    Rephrasing my question, what would happen (potentially bad) if I
    don't have PROVIDES="dbus-x11" line in my recipe?<br>
    <br>
    Also, I've done a clean build without PROVIDES="dbus-x11" line in
    dbus.inc and the build finished successfully, as if it were there
    (tried that as well).<br>
    <br>
    Radu<br>
    <br>
    <div class="moz-cite-prefix">On 07/26/2012 03:00 PM, Burton, Ross
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAJTo0LZx5E7tcvLUMrjPdH2B5p+DnFxU63tbtL6tsDX5dVfVSQ@mail.gmail.com"
      type="cite">
      <pre wrap="">On 26 July 2012 12:55, Koen Kooi <a class="moz-txt-link-rfc2396E" href="mailto:koen@dominion.thruhere.net">&lt;koen@dominion.thruhere.net&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">It would be nice if other layers that have RDEPENDS_foo = "dbus-x11" keep working till their maintainers get around fixing them. Note that you might need to do a -c cleansstate on dbus first to trigger any errors.
</pre>
      </blockquote>
      <pre wrap="">
Yes, and isn't that what the RPROVIDES is for?</pre>
    </blockquote>
    <br>
    <br>
  </body>
</html>

--------------070301050003030108080608--
