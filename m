Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNWv0-0005DR-Ib
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 22:39:50 +0100
Received: from mail-pz0-f44.google.com ([209.85.210.44])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Nov 2011 13:32:31 -0800
Received: by pzk32 with SMTP id 32so448144pzk.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Nov 2011 13:32:31 -0800 (PST)
Received: by 10.68.72.104 with SMTP id c8mr2393165pbv.34.1320701551699;
	Mon, 07 Nov 2011 13:32:31 -0800 (PST)
Received: from [127.0.0.1] (masterfoo.zenlinux.com. [207.192.74.254])
	by mx.google.com with ESMTPS id a4sm27024294pbd.7.2011.11.07.13.32.29
	(version=SSLv3 cipher=OTHER); Mon, 07 Nov 2011 13:32:30 -0800 (PST)
Message-ID: <4EB84E67.5040803@intel.com>
Date: Mon, 07 Nov 2011 13:32:23 -0800
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <4EB8225D.6000804@intel.com>
	<1320700315-11952-1-git-send-email-eric@eukrea.com>
In-Reply-To: <1320700315-11952-1-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 1/2] useradd.bbclass: handle nativesdk case
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
X-List-Received-Date: Mon, 07 Nov 2011 21:39:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/07/2011 01:11 PM, Eric Bénard wrote:
> * without this patch, building dbus-nativesdk leads to a missing
> dependency on 'base-passwd-nativesdk'
> This was added by commit 46e6c3fa8034b12d178d605f3f5d7efe69671a13
> * this patch handle the nativesdk case in the class useradd
> * close bug 1702 http://bugzilla.pokylinux.org/show_bug.cgi?id=1702
>
> Signed-off-by: Eric Bénard<eric@eukrea.com>

Acked-by: Scott Garman <scott.a.garman@intel.com>

> ---
>   meta/classes/useradd.bbclass |   18 +++++++++++++++---
>   1 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/useradd.bbclass b/meta/classes/useradd.bbclass
> index fb70b3e..b935d01 100644
> --- a/meta/classes/useradd.bbclass
> +++ b/meta/classes/useradd.bbclass
> @@ -3,9 +3,16 @@ USERADDPN ?= "${PN}"
>   # base-passwd-cross provides the default passwd and group files in the
>   # target sysroot, and shadow -native and -sysroot provide the utilities
>   # and support files needed to add and modify user and group accounts
> -DEPENDS_append = " base-passwd shadow-native shadow-sysroot"
>   RDEPENDS_${USERADDPN}_append = " base-passwd shadow"
>
> +def useradd_dep_append(d):
> +	deps = ' '
> +	if not bb.data.inherits_class('nativesdk', d):
> +		deps = ' shadow-native shadow-sysroot base-passwd'
> +	return deps
> +
> +DEPENDS_append = "${@useradd_dep_append(d)}"
> +
>   # This preinstall function will be run in two contexts: once for the
>   # native sysroot (as invoked by the useradd_sysroot() wrapper), and
>   # also as the preinst script in the target package.
> @@ -96,8 +103,13 @@ useradd_sysroot_sstate () {
>   	fi
>   }
>
> -do_install[prefuncs] += "useradd_sysroot"
> -SSTATEPOSTINSTFUNCS += "useradd_sysroot_sstate"
> +python () {
> +	if not bb.data.inherits_class('nativesdk', d):
> +		funcs = bb.data.getVarFlag('do_install', 'prefuncs', d) or ""
> +		funcs += 'useradd_sysroot'
> +		bb.data.setVarFlag('do_install', 'prefuncs', funcs, d)
> +		d.setVar('SSTATEPOSTINSTFUNCS', (bb.data.getVar('SSTATEPOSTINSTFUNCS', d, True) or "").join("useradd_sysroot_sstate"))
> +}
>
>   # Recipe parse-time sanity checks
>   def update_useradd_after_parse(d):


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


