Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8730371CA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Oct 2016 01:53:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9S1rJOj014647
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Oct 2016 18:53:19 -0700 (PDT)
Received: from [128.224.162.169] (128.224.162.169) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 27 Oct 2016 18:53:18 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1475211809.git.dengke.du@windriver.com>
	<65f138952d1e0942e73bea4eca028650439bbfc9.1475211809.git.dengke.du@windriver.com>
From: Dengke Du <dengke.du@windriver.com>
Message-ID: <7e909541-8c3b-d857-4763-1463e90d49ee@windriver.com>
Date: Fri, 28 Oct 2016 09:53:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <65f138952d1e0942e73bea4eca028650439bbfc9.1475211809.git.dengke.du@windriver.com>
Subject: Re: [PATCH 1/1] rng-tools: add systemd service file
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
X-List-Received-Date: Fri, 28 Oct 2016 01:53:20 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Ping.

// Dengke


On 2016年09月30日 13:05, Dengke Du wrote:
> Add systemd service file for rng-tools.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>   meta/recipes-support/rng-tools/rng-tools/rngd.service |  9 +++++++++
>   meta/recipes-support/rng-tools/rng-tools_5.bb         | 14 ++++++++++++--
>   2 files changed, 21 insertions(+), 2 deletions(-)
>   create mode 100644 meta/recipes-support/rng-tools/rng-tools/rngd.service
>
> diff --git a/meta/recipes-support/rng-tools/rng-tools/rngd.service b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> new file mode 100644
> index 0000000..b94ad50
> --- /dev/null
> +++ b/meta/recipes-support/rng-tools/rng-tools/rngd.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=Hardware RNG Entropy Gatherer Daemon
> +
> +[Service]
> +ExecStart=@SBINDIR@/rngd -f -r /dev/urandom
> +SuccessExitStatus=66
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-support/rng-tools/rng-tools_5.bb b/meta/recipes-support/rng-tools/rng-tools_5.bb
> index 913a092..e9786f9 100644
> --- a/meta/recipes-support/rng-tools/rng-tools_5.bb
> +++ b/meta/recipes-support/rng-tools/rng-tools_5.bb
> @@ -8,7 +8,9 @@ SRC_URI = "http://heanet.dl.sourceforge.net/sourceforge/gkernel/${BP}.tar.gz \
>              file://underquote.patch \
>              file://uclibc-libuargp-configure.patch \
>              file://init \
> -           file://default"
> +           file://default \
> +           file://rngd.service \
> +"
>   
>   SRC_URI[md5sum] = "6726cdc6fae1f5122463f24ae980dd68"
>   SRC_URI[sha256sum] = "60a102b6603bbcce2da341470cad42eeaa9564a16b4490e7867026ca11a3078e"
> @@ -20,7 +22,7 @@ python () {
>           d.setVar("INHIBIT_UPDATERCD_BBCLASS", "1")
>   }
>   
> -inherit autotools update-rc.d
> +inherit autotools update-rc.d systemd
>   
>   PACKAGECONFIG = "libgcrypt"
>   PACKAGECONFIG_libc-musl = "libargp"
> @@ -40,7 +42,15 @@ do_install_append() {
>           install -d "${D}${sysconfdir}/default"
>           install -m 0644 ${WORKDIR}/default ${D}${sysconfdir}/default/rng-tools
>       fi
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}; then
> +        install -d ${D}${systemd_unitdir}/system
> +        install -m 644 ${WORKDIR}/rngd.service ${D}${systemd_unitdir}/system
> +        sed -i -e 's,@SBINDIR@,${sbindir},g' ${D}${systemd_unitdir}/system/rngd.service
> +    fi
>   }
>   
>   INITSCRIPT_NAME = "rng-tools"
>   INITSCRIPT_PARAMS = "start 30 2 3 4 5 . stop 30 0 6 1 ."
> +
> +SYSTEMD_SERVICE_${PN} = "rngd.service"


