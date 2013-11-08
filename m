Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id F00AD6D2EF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 20:33:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA8KXT8p010959
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Nov 2013 12:33:29 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.234) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Fri, 8 Nov 2013 12:33:29 -0800
Message-ID: <527D4A98.60401@windriver.com>
Date: Fri, 8 Nov 2013 14:33:28 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1383369426.git.Qi.Chen@windriver.com>
	<b82b60b4613392b22d586aca914841b96c5f722d.1383369426.git.Qi.Chen@windriver.com>
In-Reply-To: <b82b60b4613392b22d586aca914841b96c5f722d.1383369426.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 2/2] sysvinit: adjust boot sequence and remove hack from udev
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
X-List-Received-Date: Fri, 08 Nov 2013 20:33:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/13, 12:22 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <qi.chen@windriver.com>
>
> Adjust the boot sequence in sysvinit based systems.
>
> The mountall.sh (mounting the local file system) needs to be started
> before udev and bootlogd.
>
> This patch makes mountall.sh start before udev and removes the hack of
> mounting tmpfs in the udev init script.
>
> This patch also adds some comments to the udev init script to make it
> clear why we create the '/var/volatile/tmp' directory.

Someone else might be able to comment on this.  Can you move mountall before 
udev?  I thought udev may be required in order to setup the hardware, or at 
least the device nodes to permit the mounting.

Mounting before bootlogd I can see.  Since w/o the mounts there may be nowhere 
to write to.

--Mark

> [YOCTO #5273]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    2 +-
>   meta/recipes-core/udev/udev.inc                    |    2 +-
>   meta/recipes-core/udev/udev/init                   |    4 +++-
>   .../modutils-initscripts/modutils-initscripts.bb   |    2 +-
>   4 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index c2998c3..2d58266 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -115,7 +115,7 @@ do_install () {
>   	update-rc.d -r ${D} save-rtc.sh start 25 0 6 .
>   	update-rc.d -r ${D} banner.sh start 02 S .
>   	update-rc.d -r ${D} checkroot.sh start 06 S .
> -	update-rc.d -r ${D} mountall.sh start 35 S .
> +	update-rc.d -r ${D} mountall.sh start 03 S .
>   	update-rc.d -r ${D} hostname.sh start 39 S .
>   	update-rc.d -r ${D} mountnfs.sh start 45 S .
>   	update-rc.d -r ${D} bootmisc.sh start 55 S .
> diff --git a/meta/recipes-core/udev/udev.inc b/meta/recipes-core/udev/udev.inc
> index 2ff8f00..02cab3b 100644
> --- a/meta/recipes-core/udev/udev.inc
> +++ b/meta/recipes-core/udev/udev.inc
> @@ -50,7 +50,7 @@ PACKAGES =+ "libgudev libgudev-dev libgudev-dbg"
>
>   INITSCRIPT_PACKAGES = "udev udev-cache"
>   INITSCRIPT_NAME_udev = "udev"
> -INITSCRIPT_PARAMS_udev = "start 03 S ."
> +INITSCRIPT_PARAMS_udev = "start 04 S ."
>   INITSCRIPT_NAME_udev-cache = "udev-cache"
>   INITSCRIPT_PARAMS_udev-cache = "start 36 S ."
>
> diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
> index e048a17..410a650 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -54,7 +54,9 @@ case "$1" in
>       }
>       [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
>       [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
> -    mount -a -t tmpfs 2>/dev/null
> +    # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
> +    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
> +    # /var/volatile/tmp directory to be available.
>       mkdir -p /var/volatile/tmp
>
>       # Cache handling.
> diff --git a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> index 89d38cf..594e554 100644
> --- a/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> +++ b/meta/recipes-kernel/modutils-initscripts/modutils-initscripts.bb
> @@ -7,7 +7,7 @@ SRC_URI = "file://modutils.sh \
>   PR = "r6"
>
>   INITSCRIPT_NAME = "modutils.sh"
> -INITSCRIPT_PARAMS = "start 4 S ."
> +INITSCRIPT_PARAMS = "start 05 S ."
>
>   inherit update-rc.d
>
>


