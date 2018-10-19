Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7788B799F0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2018 02:15:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w9J2FYf4010864
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Oct 2018 19:15:34 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Thu, 18 Oct 2018 19:15:34 -0700
To: Dan McGregor <danismostlikely@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <20181018152423.24962-1-danismostlikely@gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <639a7593-3780-3ab3-0b56-44523bba448c@windriver.com>
Date: Fri, 19 Oct 2018 10:21:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20181018152423.24962-1-danismostlikely@gmail.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH] os-release: move to nonarch_libdir
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
X-List-Received-Date: Fri, 19 Oct 2018 02:15:35 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

I suspect this is the correct fix for multilib conflict of os-release 
after the allarch/multilib change.
Kai, could you please verify if the following patch could be dropped 
with this patch applied?

commit 591a11ba58ce3c2c147bb1f8202bc6a0092b70eb
Author: Kai Kang <kai.kang@windriver.com>
Date:   Wed Oct 3 00:27:14 2018 +0800

     os-release: avoid multilib expand

     Add os-release to NON_MULTILIB_RECIPES in multilib.conf that do not do
     multilib expand for os-release.

     (From OE-Core rev: 361382ca16c276e1e404eab58c0956a2b6d23d7e)

     Signed-off-by: Kai Kang <kai.kang@windriver.com>
     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

Best Regards,
Chen Qi

On 10/18/2018 11:24 PM, Dan McGregor wrote:
> From: Dan McGregor <dan.mcgregor@usask.ca>
>
> Even on multilib systems, /usr/lib is where systemd expects the
> os-release file to live.
>
> Signed-off-by: Dan McGregor <dan.mcgregor@usask.ca>
> ---
>   meta/recipes-core/os-release/os-release.bb | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> index bf4f815a10d..7f3d9cba00c 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -42,9 +42,9 @@ python do_compile () {
>   do_compile[vardeps] += "${OS_RELEASE_FIELDS}"
>   
>   do_install () {
> -    install -d ${D}${libdir} ${D}${sysconfdir}
> -    install -m 0644 os-release ${D}${libdir}/
> -    lnr ${D}${libdir}/os-release ${D}${sysconfdir}/os-release
> +    install -d ${D}${nonarch_libdir} ${D}${sysconfdir}
> +    install -m 0644 os-release ${D}${nonarch_libdir}/
> +    lnr ${D}${nonarch_libdir}/os-release ${D}${sysconfdir}/os-release
>   }
>   
> -FILES_${PN} += "${libdir}/os-release"
> +FILES_${PN} += "${nonarch_libdir}/os-release"



