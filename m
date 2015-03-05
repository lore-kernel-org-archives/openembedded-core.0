Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3C32860144
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2015 02:36:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t252aPxd002407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 4 Mar 2015 18:36:25 -0800 (PST)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 4 Mar 2015 18:36:24 -0800
Message-ID: <54F7C129.20909@windriver.com>
Date: Thu, 5 Mar 2015 10:36:25 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1425518329.git.kai.kang@windriver.com>
	<35db6d0fb6ac25ab4e970f4f9ea3c269f30b7e23.1425518329.git.kai.kang@windriver.com>
In-Reply-To: <35db6d0fb6ac25ab4e970f4f9ea3c269f30b7e23.1425518329.git.kai.kang@windriver.com>
Subject: Re: [PATCH 2/3] msmtp: add link file in /usr/lib
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
X-List-Received-Date: Thu, 05 Mar 2015 02:36:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年03月05日 09:20, Kai Kang wrote:
> Link file /usr/lib/sendmail points to /usr/sbin/sendmail is required by
> LSB core test according to Linux FHS.
>
> Refs:
> 1 http://refspecs.linuxfoundation.org/LSB_4.1.0/LSB-Core-generic/LSB-Core-generic/normativerefs.html#STD.LSB
> 2 http://www.pathname.com/fhs/pub/fhs-2.3.html#SPECIFICOPTIONS13
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>   meta/recipes-extended/msmtp/msmtp_1.6.1.bb | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
> index c9ad1da..ba93600 100644
> --- a/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
> +++ b/meta/recipes-extended/msmtp/msmtp_1.6.1.bb
> @@ -23,3 +23,8 @@ ALTERNATIVE_${PN} = "sendmail"
>   ALTERNATIVE_TARGET[sendmail] = "${bindir}/msmtp"
>   ALTERNATIVE_LINK_NAME[sendmail] = "${sbindir}/sendmail"
>   ALTERNATIVE_PRIORITY = "100"
> +
> +pkg_postinst_${PN}_linuxstdbase () {
> +	# /usr/lib is required by LSB rather than ${libdir}
> +	[ ! -e /usr/lib/sendmail ] && ln -sf ${sbindir}/sendmail /usr/lib
> +}

Retrieve it.
It should use ALTERNATIVES to deal the link files. I'll send V2.

Sorry for trouble.

-- 
Regards,
Neil | Kai Kang


