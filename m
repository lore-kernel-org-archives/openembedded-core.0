Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 66FDF65CE8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 15:18:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7GFIjgf018155
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 08:18:45 -0700 (PDT)
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Thu, 16 Aug 2018 08:18:43 -0700
To: Kai Kang <kai.kang@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180810144830.3436-1-kai.kang@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <9895c8e8-d22a-12ec-b30a-3b46f88d2586@windriver.com>
Date: Thu, 16 Aug 2018 11:18:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180810144830.3436-1-kai.kang@windriver.com>
X-Originating-IP: [172.25.44.4]
Subject: Re: [PATCH] lttng-tools: add systemd support
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
X-List-Received-Date: Thu, 16 Aug 2018 15:18:44 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 08/10/2018 10:48 AM, Kai Kang wrote:
> Add systemd service file of lttng-tools from Fedora
> 
> ftp://fr2.rpmfind.net/linux/fedora/linux/development/rawhide
> /Everything/source/tree/Packages/l/lttng-tools-2.10.5-1.fc29.src.rpm
> 
> And disable the service by default.
s/And disable the service by default./
   but disable the service by default since lttng is a heavy-weight
   debugging tool./

This is what we did when adding the service file to a *released*
product but one could argue that if you add lttng-tools to your
image then you really do want it to be enabled.

It's a small thing but could be important to someone so
speak up if it is. I think that it's better to enable it
by default for oe-core-2.6.

../Randy
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service |  9 +++++++++
>   meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb               | 12 +++++++++++-
>   2 files changed, 20 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service b/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service
> new file mode 100644
> index 00000000000..aaf81305923
> --- /dev/null
> +++ b/meta/recipes-kernel/lttng/lttng-tools/lttng-sessiond.service
> @@ -0,0 +1,9 @@
> +[Unit]
> +Description=LTTng 2.x central tracing registry session daemon
> +
> +[Service]
> +Type=forking
> +ExecStart=/usr/bin/lttng-sessiond -d
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
> index e4969c30807..0314b536376 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.9.5.bb
> @@ -31,12 +31,16 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>              file://x32.patch \
>              file://run-ptest \
>              file://0001-Allow-multiple-attempts-to-connect-to-relayd.patch \
> +           file://lttng-sessiond.service \
>              "
>   
>   SRC_URI[md5sum] = "051224eb991aee07f8721ff1877d0b96"
>   SRC_URI[sha256sum] = "77839eb6fc6c652125f08acfd9369701c2516eb05cc2084160e7efc7a3fb731c"
>   
> -inherit autotools ptest pkgconfig useradd python3-dir manpages
> +inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> +
> +SYSTEMD_SERVICE_${PN} = "lttng-sessiond.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
>   
>   USERADD_PACKAGES = "${PN}"
>   GROUPADD_PARAM_${PN} = "tracing"
> @@ -52,6 +56,12 @@ FILES_${PN}-dev += "${PYTHON_SITEPACKAGES_DIR}/*.la"
>   INSANE_SKIP_${PN} = "libexec dev-so"
>   INSANE_SKIP_${PN}-dbg = "libexec"
>   
> +do_install_append () {
> +    # install systemd unit file
> +    install -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/lttng-sessiond.service ${D}${systemd_unitdir}/system
> +}
> +
>   do_install_ptest () {
>       for f in Makefile tests/Makefile tests/utils/utils.sh ; do
>           install -D "${B}/$f" "${D}${PTEST_PATH}/$f"
> 


-- 
# Randy MacLeod
# Wind River Linux

