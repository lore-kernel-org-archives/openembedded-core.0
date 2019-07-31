Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4683F7F3AE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 02:36:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x6V2atVm001984
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2019 19:36:55 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Tue, 30 Jul 2019 19:36:54 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20190731015020.21434-1-zangrc.fnst@cn.fujitsu.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9c7d5cdd-649c-a945-ef77-f5c6953e11f4@windriver.com>
Date: Wed, 31 Jul 2019 10:50:00 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20190731015020.21434-1-zangrc.fnst@cn.fujitsu.com>
X-Originating-IP: [128.224.162.148]
Subject: Re: [PATCHv3] mdadm:fix mdmonitor.service
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
X-List-Received-Date: Wed, 31 Jul 2019 02:36:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2019 09:50 AM, Zang Ruochen wrote:
> -The original file mdmonitor.service is as follows:
> ...
> |[Service]
> |Environment=  MDADM_MONITOR_ARGS=--scan
> |EnvironmentFile=-/run/sysconfig/mdadm
> |ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
> |ExecStart=/sbin/mdadm --monitor -y $MDADM_MONITOR_ARGS
> ...
> -It has a syntax error and it doesn't work properly,

What is the actual syntax error? Why does it not work properly?

>   so add files/0001-Fix-file-mdmonitor.service-syntax-error.patch to fix it.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>   ...-file-mdmonitor.service-syntax-error.patch | 49 +++++++++++++++++++
>   meta/recipes-extended/mdadm/mdadm_4.1.bb      |  1 +
>   2 files changed, 50 insertions(+)
>   create mode 100644 meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch
>
> diff --git a/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch b/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch
> new file mode 100644
> index 0000000000..a36fed6f9f
> --- /dev/null
> +++ b/meta/recipes-extended/mdadm/files/0001-Fix-file-mdmonitor.service-syntax-error.patch
> @@ -0,0 +1,49 @@
> +From a4a37cc9d91d7129910360914b8b2060139c0307 Mon Sep 17 00:00:00 2001
> +From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +Date: Tue, 30 Jul 2019 12:44:25 +0800
> +Subject: [PATCH] Fix file mdmonitor.service syntax error
> +
> +-The original file mdmonitor.service is as follows:
> +...
> +|[Service]
> +|Environment=  MDADM_MONITOR_ARGS=--scan
> +|EnvironmentFile=-/run/sysconfig/mdadm
> +|ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
> +|ExecStart=/sbin/mdadm --monitor -y $MDADM_MONITOR_ARGS
> +...
> +-It has a syntax error and it doesn't work properly,
> + so add new file mdmonitor.service to overwrite it.
> +
> +Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> +---
> + systemd/mdmonitor.service | 15 +++++++++------
> + 1 file changed, 9 insertions(+), 6 deletions(-)
> +
> +diff --git a/systemd/mdmonitor.service b/systemd/mdmonitor.service
> +index 3fc4687..bd243b4 100644
> +--- a/systemd/mdmonitor.service
> ++++ b/systemd/mdmonitor.service
> +@@ -6,11 +6,14 @@
> + #  (at your option) any later version.
> +
> + [Unit]
> +-Description=MD array monitor
> +-DefaultDependencies=no
> ++Description=Software RAID monitoring and management
> ++ConditionPathExists=/etc/mdadm.conf

Why do above changes? Also, isn't /etc/mdadm.conf always there?

> +
> + [Service]
> +-Environment=  MDADM_MONITOR_ARGS=--scan
> +-EnvironmentFile=-/run/sysconfig/mdadm
> +-ExecStartPre=-/usr/lib/mdadm/mdadm_env.sh
> +-ExecStart=BINDIR/mdadm --monitor -y $MDADM_MONITOR_ARGS
> ++Type=forking
> ++PIDFile=/var/run/mdadm/mdadm.pid

Type=forking is not encouraged. Is there any reason we want to use it?
Also, PIDFile is recommended to locate under /run instead of /var/run. 
systemd actually automatically modifies the configuration to change 
/var/run to /run.

Regards,
Chen Qi

> ++EnvironmentFile=-/etc/sysconfig/mdmonitor
> ++ExecStart=/sbin/mdadm --monitor --scan -y -f --pid-file=/var/run/mdadm/mdadm.pid
> ++
> ++[Install]
> ++WantedBy=multi-user.target
> +--
> +2.20.1
> +
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> index 74c94f6ecb..c3e15adc71 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
> @@ -22,6 +22,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/raid/mdadm/${BPN}-${PV}.tar.xz \
>   	   file://mdadm.init \
>   	   file://0001-mdadm-add-option-y-for-use-syslog-to-recive-event-re.patch \
>              file://include_sysmacros.patch \
> +           file://0001-Fix-file-mdmonitor.service-syntax-error.patch \
>              "
>   SRC_URI[md5sum] = "51bf3651bd73a06c413a2f964f299598"
>   SRC_URI[sha256sum] = "ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a"



