Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1E91779261
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 02:06:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8626uxE009796
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2018 19:06:56 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Wed, 5 Sep 2018 19:06:55 -0700
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <20180905165227.29435-1-richard.purdie@linuxfoundation.org>
	<20180905165227.29435-7-richard.purdie@linuxfoundation.org>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <a7d35d68-e546-408f-561e-c5a3a8f4aaa5@windriver.com>
Date: Thu, 6 Sep 2018 10:11:48 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180905165227.29435-7-richard.purdie@linuxfoundation.org>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 7/8] busybox: Put klogd/syslogd alternative links in syslog package
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
X-List-Received-Date: Thu, 06 Sep 2018 02:07:00 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

I think my previous patch has covered this case.

   git://git.pokylinux.org/poky-contrib ChenQi/busybox-alternatives
   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/busybox-alternatives

Chen Qi (1):
   busybox: fix the alternatives logic


Is there some problem with the patch?

Best Regards,
Chen Qi

On 09/06/2018 12:52 AM, Richard Purdie wrote:
> Currently these are in ${PN} and ${PN}-syslog may get replaced by
> other packages but update-alternatives would error in the postinst
> if other files were installed first. Avoid the problems by putting
> the links in the correct package.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-core/busybox/busybox.inc | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/busybox/busybox.inc b/meta/recipes-core/busybox/busybox.inc
> index 586d5342e60..c26ef56bf78 100644
> --- a/meta/recipes-core/busybox/busybox.inc
> +++ b/meta/recipes-core/busybox/busybox.inc
> @@ -367,7 +367,10 @@ python do_package_prepend () {
>               # Match coreutils
>               if alt_name == '[':
>                   alt_name = 'lbracket'
> -            d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
> +            if alt_name == 'klogd' or alt_name == 'syslogd':
> +                d.appendVar('ALTERNATIVE_%s-syslog' % (pn), ' ' + alt_name)
> +            else:
> +                d.appendVar('ALTERNATIVE_%s' % (pn), ' ' + alt_name)
>               d.setVarFlag('ALTERNATIVE_LINK_NAME', alt_name, alt_link_name)
>               if os.path.exists('%s%s' % (dvar, target)):
>                   d.setVarFlag('ALTERNATIVE_TARGET', alt_name, target)



