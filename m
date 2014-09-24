Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7274F65D58
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 02:13:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8O2DVXF022479
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Sep 2014 19:13:31 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 23 Sep 2014 19:13:31 -0700
Message-ID: <542228B9.5030601@windriver.com>
Date: Wed, 24 Sep 2014 10:13:13 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1410240620.git.Chong.Lu@windriver.com>
	<3ce7cbed40ec5f20f202d0b37d9dcf8b9ac6d6f6.1410240620.git.Chong.Lu@windriver.com>
In-Reply-To: <3ce7cbed40ec5f20f202d0b37d9dcf8b9ac6d6f6.1410240620.git.Chong.Lu@windriver.com>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH 1/1] xinetd: add systemd unit file
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
X-List-Received-Date: Wed, 24 Sep 2014 02:13:38 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

ping

//Chong

On 09/09/2014 01:32 PM, Chong Lu wrote:
> Add systemd unit file for xinetd.
>
> Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
> ---
>   meta/recipes-extended/xinetd/xinetd/xinetd.service | 13 +++++++++++++
>   meta/recipes-extended/xinetd/xinetd_2.3.15.bb      | 12 +++++++++++-
>   2 files changed, 24 insertions(+), 1 deletion(-)
>   create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd.service
>
> diff --git a/meta/recipes-extended/xinetd/xinetd/xinetd.service b/meta/recipes-extended/xinetd/xinetd/xinetd.service
> new file mode 100644
> index 0000000..d5fdc5b
> --- /dev/null
> +++ b/meta/recipes-extended/xinetd/xinetd/xinetd.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=Xinetd A Powerful Replacement For Inetd
> +After=syslog.target network.target
> +
> +[Service]
> +Type=forking
> +PIDFile=/var/run/xinetd.pid
> +EnvironmentFile=-/etc/sysconfig/xinetd
> +ExecStart=@SBINDIR@/xinetd -stayalive -pidfile /var/run/xinetd.pid "$EXTRAOPTIONS"
> +ExecReload=@BASE_BINDIR@/kill -HUP $MAINPID
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> index 1928949..288186e 100644
> --- a/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> +++ b/meta/recipes-extended/xinetd/xinetd_2.3.15.bb
> @@ -17,12 +17,15 @@ SRC_URI = "http://www.xinetd.org/xinetd-${PV}.tar.gz \
>         file://Disable-services-from-inetd.conf-if-a-service-with-t.patch \
>         file://xinetd-should-be-able-to-listen-on-IPv6-even-in-ine.patch \
>         file://xinetd-CVE-2013-4342.patch \
> +      file://xinetd.service \
>         "
>   
>   SRC_URI[md5sum] = "77358478fd58efa6366accae99b8b04c"
>   SRC_URI[sha256sum] = "bf4e060411c75605e4dcbdf2ac57c6bd9e1904470a2f91e01ba31b50a80a5be3"
>   
> -inherit autotools update-rc.d
> +inherit autotools update-rc.d systemd
> +
> +SYSTEMD_SERVICE_${PN} = "xinetd.service"
>   
>   INITSCRIPT_NAME = "xinetd"
>   INITSCRIPT_PARAMS = "defaults"
> @@ -52,6 +55,13 @@ do_install() {
>   	install -m 644 "${WORKDIR}/xinetd.default" "${D}${sysconfdir}/default/xinetd"
>   	install -m 755 "${B}/xinetd/xinetd" "${D}${sbindir}"
>   	install -m 755 "${B}/xinetd/itox" "${D}${sbindir}"
> +
> +	# Install systemd unit files
> +	install -d ${D}${systemd_unitdir}/system
> +	install -m 0644 ${WORKDIR}/xinetd.service ${D}${systemd_unitdir}/system
> +	sed -i -e 's,@BASE_BINDIR@,${base_bindir},g' \
> +	       -e 's,@SBINDIR@,${sbindir},g' \
> +	       ${D}${systemd_unitdir}/system/xinetd.service
>   }
>   
>   CONFFILES_${PN} = "${sysconfdir}/xinetd.conf"


