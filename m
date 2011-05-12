Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1QKatR-0001th-O6
	for openembedded-core@lists.openembedded.org;
	Thu, 12 May 2011 20:45:50 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 May 2011 11:43:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,359,1301900400"; d="scan'208";a="746392230"
Received: from unknown (HELO [10.255.12.88]) ([10.255.12.88])
	by orsmga001.jf.intel.com with ESMTP; 12 May 2011 11:43:00 -0700
Message-ID: <4DCC2A34.7040709@intel.com>
Date: Thu, 12 May 2011 11:43:00 -0700
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1305196874.git.dexuan.cui@intel.com>
	<1865303E0DED764181A9D882DEF65FB69334F4BD99@shsmsx502.ccr.corp.intel.com>
In-Reply-To: <1865303E0DED764181A9D882DEF65FB69334F4BD99@shsmsx502.ccr.corp.intel.com>
Subject: Re: [PATCH 0/1] Automatically generate package repos for rpm	and deb [bug #1024]
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
X-List-Received-Date: Thu, 12 May 2011 18:45:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/12/2011 04:38 AM, Cui, Dexuan wrote:
> Dexuan Cui wrote:
>> From: Dexuan Cui<dexuan.cui@intel.com>
>>
>> This was made to address
>> http://bugzilla.yoctoproject.org/show_bug.cgi?id=1024. Please comment.
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>    Branch: dcui/master
>>    Browse:
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master
>
> This is an improved and simple version that keeps 1  package-index recipe and updates the 3 kinds of packages at the same time:
> http://git.pokylinux.org/cgit/cgit.cgi/poky-contrib/commit/?h=dcui/package-index&id=fb26e81dcb6e27e2908294e406a3011baed0120d
> This avoids forcing the user to remember which package type they enabled when running "bitbake package-index".
> (I also past the new version at the end of this mail for easy reviewing)
>
Dexuan,

I am not sure that this is the correct approach.  I think that you 
should look at how the packages get generated based on which package 
classes are included via PACKAGE_CLASSES, then in each of those classes 
set it up so that when the package-index task is called you know which 
indexer to run. This would be moving what you have in the 
package-index-<packager>.bb files to their respective 
package_<packager>.bbclass files and use

do_package_index[recrdeptask] += package_index_<packager>

in the case of ipk it would be in package_ipk.bbclass

do_package_index[recrdeptask] += "package_update_index_ipk"

You will also need to move the do_package_index[depends]

Another thing to verify is the current package_update_index_* correct 
for the different package types? Looking at package_update_index_rpm, I 
am not sure since it does not call createrepo, there might be a reason 
for this that Mark H or Qing can comment on.

Hope that made sense, I am sure Richard will correct me if I got 
something wrong!

Sau!

> Thanks!
> -- Dexuan
>
> commit fb26e81dcb6e27e2908294e406a3011baed0120d
> Author: Dexuan Cui<dexuan.cui@intel.com>
> Date:   Thu May 12 19:15:59 2011 +0800
>
>      package-index.bb: also add the support for rpm/deb
>
>      [YOCTO #1024]
>
>      -------------------------------
>      (I'll make a new patch to add the below description to the manual).
>
>      How to generate and use repos:
>
>      1) run "bitbake package-index" after building some target;
>      2) export ${DEPLOY_DIR_RPM} and ${DEPLOY_DIR_IPK} by a webserver on the host
>      (let's assume the host IP is 192.168.7.1) at
>      http://192.168.7.1/rpm
>      http://192.168.7.1/ipk
>      3) inside the target, according to the packaging system (ipk, rpm, deb) used
>      when we generate the target image, we can use different ways to manage
>      packages:
>          3.1) RPM:  "zypper addrepo http://192.168.7.1/rpm main; zypper refresh"
>      to retrieve info about the repo; next, we can use zypper install/remove to
>      manage packages.
>          3.2) IPK:  add the repo info into opkg config file, i.e., in
>      /etc/opkg/arch.conf, we can add something like
>      src i586 http://192.168.7.1/ipk/i586, and next we run "opkg update" to make
>      opkg update the list of available packages, and next we can use
>      opkg install/remove to manage packages.
>          3.3) DEB:(To be added)
>
>      Signed-off-by: Dexuan Cui<dexuan.cui@intel.com>
>
> diff --git a/meta/recipes-core/meta/package-index.bb b/meta/recipes-core/meta/package-index.bb
> index 3c642cb..969430b 100644
> --- a/meta/recipes-core/meta/package-index.bb
> +++ b/meta/recipes-core/meta/package-index.bb
> @@ -22,10 +22,14 @@ do_package_index[nostamp] = "1"
>   do_package_index[dirs] = "${DEPLOY_DIR_IPK}"
>   do_package_index[depends] += "opkg-utils-native:do_populate_sysroot"
>   do_package_index[depends] += "opkg-native:do_populate_sysroot"
> +do_package_index[depends] += "createrepo-native:do_populate_sysroot"
> +do_package_index[depends] += "dpkg-native:do_populate_sysroot apt-native:do_populate_sysroot"
>
>   do_package_index() {
>      set -ex
>      package_update_index_ipk
> +   createrepo "${DEPLOY_DIR_RPM}"
> +   package_update_index_deb
>      set +ex
>   }
>   addtask do_package_index before do_build
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



