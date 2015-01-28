Return-Path: <Pengyu.Ma@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9EA60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 08:56:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0S8up4A001968
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 00:56:51 -0800 (PST)
Received: from yu.wr (128.224.163.160) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 28 Jan 2015 00:56:50 -0800
Message-ID: <54C8A44F.7020800@windriver.com>
Date: Wed, 28 Jan 2015 16:56:47 +0800
From: Pengyu Ma <pengyu.ma@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Pengyu Ma <pengyu.ma@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <1422429317-19707-1-git-send-email-pengyu.ma@windriver.com>
In-Reply-To: <1422429317-19707-1-git-send-email-pengyu.ma@windriver.com>
X-Originating-IP: [128.224.163.160]
Subject: Re: [PATCH] mesa: Upgrade to 10.4.0
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
X-List-Received-Date: Wed, 28 Jan 2015 08:56:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ignore this, I got some feedback from Robert, will send V2.

Pengyu

On 01/28/2015 03:15 PM, Pengyu Ma wrote:
> Signed-off-by: Pengyu Ma <pengyu.ma@windriver.com>
> ---
>   meta/recipes-graphics/mesa/mesa_10.4.0.bb |   16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>   create mode 100644 meta/recipes-graphics/mesa/mesa_10.4.0.bb
>
> diff --git a/meta/recipes-graphics/mesa/mesa_10.4.0.bb b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
> new file mode 100644
> index 0000000..7d3723e
> --- /dev/null
> +++ b/meta/recipes-graphics/mesa/mesa_10.4.0.bb
> @@ -0,0 +1,16 @@
> +require ${BPN}.inc
> +
> +SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
> +
> +SRC_URI[md5sum] = "b7b37117eecbdfaaf3075acfb063d5a3"
> +SRC_URI[sha256sum] = "98a7dff3a1a6708c79789de8b9a05d8042e867067f70e8f30387c15026233219"
> +
> +S = "${WORKDIR}/Mesa-${PV}"
> +
> +#because we cannot rely on the fact that all apps will use pkgconfig,
> +#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> +do_install_append() {
> +    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
> +        sed -i -e 's/^#ifdef MESA_EGL_NO_X11_HEADERS/#if ${@bb.utils.contains('DISTRO_FEATURES', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
> +    fi
> +}


