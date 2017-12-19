Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1259977F34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 01:32:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBJ1WoxD015491
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Dec 2017 17:32:51 -0800
Received: from [128.224.162.167] (128.224.162.167) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Mon, 18 Dec 2017 17:32:49 -0800
To: <openembedded-core@lists.openembedded.org>
References: <cover.1511770008.git.Qi.Chen@windriver.com>
	<77ec98cb684152de2ce0ea26dc7e877608c52d51.1511770008.git.Qi.Chen@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <65e627a0-0f13-c660-eacc-fb9cb198e4fe@windriver.com>
Date: Tue, 19 Dec 2017 09:34:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <77ec98cb684152de2ce0ea26dc7e877608c52d51.1511770008.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.167]
Subject: Re: [PATCH 1/1] bind: fix daemon startup failure on sysvinit
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
X-List-Received-Date: Tue, 19 Dec 2017 01:32:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ping

Could someone help review this patch?

Best Regards,
Chen Qi

On 11/27/2017 04:07 PM, Chen Qi wrote:
> When starting the bind daemon on sysvinit based system, we are
> meeting the following error and the daemon fails to start.
>
>    /etc/bind/rndc.key: permission denied
>
> Fix this problem by chaning the ownship of rndc.key to root:bind.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   ...owner-of-rndc.key-to-correctly-start-daem.patch | 32 ++++++++++++++++++++++
>   meta/recipes-connectivity/bind/bind_9.10.6.bb      |  1 +
>   2 files changed, 33 insertions(+)
>   create mode 100644 meta/recipes-connectivity/bind/bind/0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch
>
> diff --git a/meta/recipes-connectivity/bind/bind/0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch b/meta/recipes-connectivity/bind/bind/0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch
> new file mode 100644
> index 0000000..b3ec013
> --- /dev/null
> +++ b/meta/recipes-connectivity/bind/bind/0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch
> @@ -0,0 +1,32 @@
> +Subject: init.d: fix owner of rndc.key to correctly start daemon
> +
> +When starting with '-u bind' option, which is a common practice for
> +most distros, we would meet the following error and the daemon would
> +not be started up correctly.
> +
> +  /etc/bind/rndc.key: permission denied
> +
> +Fix this problem by changing the ownership of rndc.key to root:bind.
> +
> +Upstream-Status: Pending
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + init.d | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/init.d b/init.d
> +index b2eec60..d6860c7 100644
> +--- a/init.d
> ++++ b/init.d
> +@@ -57,6 +57,7 @@ case "$1" in
> + 	modprobe capability >/dev/null 2>&1 || true
> + 	if [ ! -f /etc/bind/rndc.key ]; then
> + 	    /usr/sbin/rndc-confgen -a -b 512 -r /dev/urandom
> ++	    chown root:bind /etc/bind/rndc.key
> + 	    chmod 0640 /etc/bind/rndc.key
> + 	fi
> + 	if [ -f /var/run/named/named.pid ]; then
> +--
> +2.11.0
> +
> diff --git a/meta/recipes-connectivity/bind/bind_9.10.6.bb b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> index 8b8835b..7eaaf9d 100644
> --- a/meta/recipes-connectivity/bind/bind_9.10.6.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.10.6.bb
> @@ -21,6 +21,7 @@ SRC_URI = "https://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
>              file://0001-gen.c-extend-DIRNAMESIZE-from-256-to-512.patch \
>              file://0001-lib-dns-gen.c-fix-too-long-error.patch \
>              file://use-python3-and-fix-install-lib-path.patch \
> +           file://0001-init.d-fix-owner-of-rndc.key-to-correctly-start-daem.patch \
>              "
>   
>   SRC_URI[md5sum] = "84e663284b17aee0df1ce6f248b137d7"



