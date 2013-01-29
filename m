Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U04ol-00030E-Mz
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 07:37:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0T6LanW020812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 22:21:37 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Mon, 28 Jan 2013 22:21:35 -0800
Message-ID: <51076A83.2090102@windriver.com>
Date: Tue, 29 Jan 2013 14:21:55 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1359433618.git.Qi.Chen@windriver.com>
	<eca94e550e201c8dba211c4a9a547761c9e7737f.1359433618.git.Qi.Chen@windriver.com>
In-Reply-To: <eca94e550e201c8dba211c4a9a547761c9e7737f.1359433618.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH V2 6/6] initscripts: add read-only-rootfs-hook.sh script
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 06:37:44 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

V2 is a rebase against the latest master branch, which solves some 
conflicts in initscripts_1.0.bb file.

Because only this patch [6/6] had conflicts, I only sent out version 2 
of this patch.

Cheers,
Chen Qi

On 01/29/2013 02:17 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Add read-only-rootfs-hook.sh script to support a read-only rootfs.
> This script makes a union mount of /var/lib and /var/volatile/lib,
> making /var/lib directory writable.
>
> [YOCTO #3406]
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../initscripts-1.0/read-only-rootfs-hook.sh       |   19 +++++++++++++++++++
>   meta/recipes-core/initscripts/initscripts_1.0.bb   |    3 +++
>   2 files changed, 22 insertions(+)
>   create mode 100644 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> new file mode 100644
> index 0000000..3a295ee
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
> @@ -0,0 +1,19 @@
> +#!/bin/sh
> +
> +. /etc/default/rcS
> +
> +[ "$ROOTFS_READ_ONLY" = "no" ] && exit 0
> +
> +# Make sure unionfs is in /proc/filesystems
> +if ! grep -q unionfs /proc/filesystems; then
> +    echo "ERROR: unionfs not supported by kernel!"
> +    exit 1
> +fi
> +
> +mkdir -p /var/volatile/lib
> +mount -t unionfs -o dirs=/var/volatile/lib:/var/lib=ro none /var/lib
> +
> +if [ $? != 0 ]; then
> +    echo "ERROR: Union mount failed!"
> +    exit 1
> +fi
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 69b9bfb..68f8034 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -28,6 +28,7 @@ SRC_URI = "file://functions \
>              file://sysfs.sh \
>              file://device_table.txt \
>              file://populate-volatile.sh \
> +           file://read-only-rootfs-hook.sh \
>              file://volatiles \
>              file://save-rtc.sh \
>              file://GPLv2.patch"
> @@ -85,6 +86,7 @@ do_install () {
>   	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
>   	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
>   	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
> +	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
>   	install -m 0755    ${WORKDIR}/save-rtc.sh	${D}${sysconfdir}/init.d
>   	install -m 0644    ${WORKDIR}/volatiles		${D}${sysconfdir}/default/volatiles/00_core
>   
> @@ -116,6 +118,7 @@ do_install () {
>   	update-rc.d -r ${D} bootmisc.sh start 55 S .
>   	update-rc.d -r ${D} sysfs.sh start 02 S .
>   	update-rc.d -r ${D} populate-volatile.sh start 37 S .
> +	update-rc.d -r ${D} read-only-rootfs-hook.sh start 41 S .
>   	update-rc.d -r ${D} devpts.sh start 38 S .
>   	if [ "${TARGET_ARCH}" = "arm" ]; then
>   	        update-rc.d -r ${D} alignment.sh start 06 S .



