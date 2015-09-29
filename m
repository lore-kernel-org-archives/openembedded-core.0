Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A3BF76FD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 07:47:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8T7laeO019534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 00:47:36 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 29 Sep 2015 00:47:35 -0700
Message-ID: <560A4216.2060307@windriver.com>
Date: Tue, 29 Sep 2015 15:47:34 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1443092691-216216-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1443092691-216216-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH] glib-2.0: cleanup buildpaths from pkgconfig files
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
X-List-Received-Date: Tue, 29 Sep 2015 07:47:36 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

recall this patch, I'll send out v2 for update commit logs.

Wenzong

On 09/24/2015 07:04 PM, wenzong.fan@windriver.com wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> * gio-2.0.pc:
>    -L/path/to/tmp/sysroots/qemux86-64/lib64 -> -L/lib64
>
> * gobject-2.0.pc:
>    -L/path/to/tmp/sysroots/qemux86-64/usr/lib64/../lib64
>      -> -L/usr/lib64/../lib64
>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
>   1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
> index 072f790..4ccdb93 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -75,6 +75,12 @@ do_install_append () {
>   	fi
>   }
>
> +do_install_append_class-target() {
> +	# cleanup buildpaths from gio-2.0.pc, gobject-2.0.pc
> +	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gio-2.0.pc
> +	sed -i -e 's#${STAGING_DIR_HOST}##g' ${D}${libdir}/pkgconfig/gobject-2.0.pc
> +}
> +
>   RDEPENDS_${PN}-ptest += "\
>               gnome-desktop-testing \
>               tzdata \
>

