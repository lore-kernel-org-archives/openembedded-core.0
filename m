Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SaTfC-00028G-GN
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jun 2012 17:21:18 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q51FAu0t022281
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Jun 2012 08:10:56 -0700 (PDT)
Received: from msp-dhcp42.wrs.com (172.25.34.42) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 1 Jun 2012 08:10:55 -0700
Message-ID: <4FC8DB7F.3070506@windriver.com>
Date: Fri, 1 Jun 2012 10:10:55 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1338368508.git.edwin.zhai@intel.com>
	<2255c64e0eb4a2b5b7f063dbc5ff421e606458c8.1338368508.git.edwin.zhai@intel.com>
	<4FC81BF9.5050405@intel.com>
In-Reply-To: <4FC81BF9.5050405@intel.com>
Subject: Re: RPM packaging issue?
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
X-List-Received-Date: Fri, 01 Jun 2012 15:21:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/31/12 8:33 PM, Laurentiu Palcu wrote:
> Hi list,
>
> I was trying to build core-image-gtk-directfb and ended up with this error:
>
> Log data follows:
> | DEBUG: Executing shell function do_rootfs
> | ERROR: Function failed: do_rootfs (see
> /home/lau/yocto/build/tmp/work/qemux86-poky-linux/core-image-minimal-1.0-r0/temp/log.do_rootfs.4857
> for further information)
> | Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/qemux86...
> | Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/i586...
> | Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/all...
> | Generating solve db for /home/lau/yocto/build/tmp/deploy/rpm/all...
> | Processing task-core-boot...
> | Processing module-init-tools...
> | Unable to find package module-init-tools (module-init-tools)!
> NOTE: package core-image-minimal-1.0-r0: task do_rootfs: Failed
>
> module-init-tools is provided by kmod package and is in the RDEPENDS of
> task_base recipe.
>
> Then I tried to add module_init_tools to CORE_IMAGE_EXTRA_INSTALL and
> build core-image-minimal (just for testing), the same result.
>
> The interesting thing is that this didn't happen if the packaging format
> is ipk.
>
> Anybody know anything about this issue?

The IMAGE_INSTALL list has module-init-tools in it.  This list is based on 
package name and not "dependency" or "provide" name.  The package 
module-init-tools no longer exists in the system, there is only a runtime 
provide from the kmod package.

This ensures that any package that requires module-init-tools will work 
properly, but anyone adding module-init-tools to the IMAGE_INSTALL it will fail 
as you've seen above.

--Mark

> Thanks,
> Laurentiu
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



