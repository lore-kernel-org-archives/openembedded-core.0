Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RVUiL-0004Mj-E8
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 21:55:41 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 29 Nov 2011 12:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,593,1315206000"; d="scan'208";a="42237558"
Received: from unknown (HELO [10.255.15.251]) ([10.255.15.251])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Nov 2011 12:49:00 -0800
Message-ID: <4ED5453C.5090704@linux.intel.com>
Date: Tue, 29 Nov 2011 12:49:00 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1322549636.git.Martin.Jansa@gmail.com>
	<eb7aab8096dac4fc73520c17e0edd4ac689c1cda.1322549636.git.Martin.Jansa@gmail.com>
	<2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
	<4ED53FCA.8000509@linux.intel.com>
	<20111129204308.GI7441@jama.jama.net>
In-Reply-To: <20111129204308.GI7441@jama.jama.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 10/10] gconf: add polkit to DEPENDS
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
X-List-Received-Date: Tue, 29 Nov 2011 20:55:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/29/2011 12:43 PM, Martin Jansa wrote:
> On Tue, Nov 29, 2011 at 12:25:46PM -0800, Saul Wold wrote:
>> On 11/29/2011 06:09 AM, Martin Jansa wrote:
>>> Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
>>> ---
>>>    meta/recipes-gnome/gnome/gconf_3.2.3.bb |    2 +-
>>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
>>> index aa9da78..907f0ba 100644
>>> --- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
>>> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
>>> @@ -3,7 +3,7 @@ SECTION = "x11/gnome"
>>>    LICENSE = "LGPLv2+"
>>>    LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
>>>
>>> -DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
>>> +DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
>>>
>>>    PR = "r1"
>>>
>>
>> What is this solving? This also would require polkit to have a
>> BBCLASSEXTEND with native.
>
> gconf-defaults.c:40:27: fatal error: polkit/polkit.h: No such file or directory
>
> most people have polkit build in sysroot and then if you upgrade gconf
> and polkit at the same time you can get it autodetected in
> gconf's do_configure and later removed from sysroot while polkit itself
> is being upgraded.
>
> And we probably don't want to disable defaults_service for gconf to force polkit
> dependency off.
>
> HAVE_POLKIT=no
> AC_ARG_ENABLE(defaults_service,
>    AS_HELP_STRING([--enable-defaults-service],
>      [build the defaults DBus service @<:@default=auto@:>@]),
>    , enable_defaults_service=auto)
>
> if test "x$enable_defaults_service" != "xno" ; then
>    PKG_CHECK_MODULES(DEFAULTS, glib-2.0 gthread-2.0 gobject-2.0 dbus-1 dbus-glib-1 polkit-gobject-1, HAVE_POLKIT=yes, HAVE_POLKIT=no)
>    if test "x$HAVE_POLKIT" = "xno"; then
>      if test "x$enable_defaults_service" = "xyes" ; then
>        AC_MSG_ERROR([[
> *** Could not find PolicyKit.]])
>      else
>        enable_defaults_service=no
>      fi
>    else
>      enable_defaults_service=yes
>    fi
> fi
>
> Weird it didn't fail for me without polkit-native (there isn't .bbappend in any of
> my layers and I've even tested it in distro less oe-core), but you're right, we should
> provide polkit-native or disable defaults_service for native gconf.
>
I think it would be best to disable the default_services for native 
gconf, a patch for that would be great, thanks

Sau!

> Cheers,


