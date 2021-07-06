Received: from mail6.pr.hu (mail6.pr.hu [87.242.0.6])
 by mx.groups.io with SMTP id smtpd.web08.7704.1625584705877891090
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 08:18:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@pr.hu header.s=pr20170203 header.b=C5nE2Wqp;
 spf=pass (domain: pr.hu, ip: 87.242.0.6, mailfrom: zboszor@pr.hu)
Received: from [2a02:808:3:101::5] (helo=mail.pr.hu)
	by frontdoor.pr.hu with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <zboszor@pr.hu>)
	id 1m0mq7-0001pr-Uv; Tue, 06 Jul 2021 17:18:23 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=pr.hu;
	s=pr20170203; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Fg/KSs6GDP224z2Pa+/dPDyB0g0idF/cfb0O9LNwKCs=; b=C5nE2WqpAYKunFNjs2h0YoYu2l
	/H2Hdww2wFeaIuLhGozlGNrf3ZZEv2oSPe5jLVTP8R+mllGG/SbasTqsqMwwpIhlT+lpWzUsA9KbU
	TQM+Xe+oqPNmHFoiRVJ9srtZ2VcVNR5iNXFlaICnkG6U3LCYVTp/FrSHg1YzhO1TH5GwmFtiy9Fdj
	8Djx3yvAl4oum3iboA/VhjhkGXC0U7EM+am2A2PaBeJd5QUb2V3imwcLYdwIK8DVeuPR7ASiqzdoD
	yIkjzB2bVcyKB5ajHfHGa5MqwHm1E40Jm/AWbL8Fcq8HAJdYa0lbaO5PdBBrA8glcG+u6uvoi8Cxp
	SwxfPqyQ==;
Received: from host-87-242-23-58.prtelecom.hu ([87.242.23.58] helo=localhost.localdomain)
	by mail.pr.hu with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <zboszor@pr.hu>)
	id 1m0mq3-000101-Lv; Tue, 06 Jul 2021 17:18:21 +0200
Subject: Re: [OE-core] [PATCH] tzdata: Allow controlling zoneinfo binary format
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
References: <168F3C6148F999C2.26257@lists.openembedded.org>
From: "Zoltan Boszormenyi" <zboszor@pr.hu>
Message-ID: <1c608a24-c1c3-1658-a0eb-c41aab3f0f9a@pr.hu>
Date: Tue, 6 Jul 2021 17:18:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <168F3C6148F999C2.26257@lists.openembedded.org>
X-Spam-Score: -0.9 (/)
X-Scan-Signature: 897afa41943fbf854db707890184f9ae
X-Spam-Tracer: backend.mail.pr.hu -0.9 20210706151821Z
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

2021. 07. 06. 17:12 keltezéssel, Zoltan Boszormenyi via lists.openembedded.org írta:
> From: Zoltán Böszörményi <zboszor@gmail.com>
> 
> tzcode 2020b changed the default format from "-b fat" to "-b slim".
> Allow external control for the binary format.
> 
> Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
> ---
>   meta/recipes-extended/timezone/tzdata.bb | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/timezone/tzdata.bb b/meta/recipes-extended/timezone/tzdata.bb
> index f8443110d5..09145e1ed0 100644
> --- a/meta/recipes-extended/timezone/tzdata.bb
> +++ b/meta/recipes-extended/timezone/tzdata.bb
> @@ -19,13 +19,17 @@ TZONES= "africa antarctica asia australasia europe northamerica southamerica  \
>           "
>   # pacificnew
>   
> +# "slim" is the default since 2020b
> +# "fat" is needed by e.g. MariaDB's mysql_tzinfo_to_sql

FYI, the issue fixed by this change is:
https://jira.mariadb.org/browse/MDEV-26093

> +ZIC_FMT ?= "slim"
> +
>   do_compile () {
>           for zone in ${TZONES}; do \
> -            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
> +            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo -L /dev/null \
>                   ${S}/${zone} ; \
> -            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
> +            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/posix -L /dev/null \
>                   ${S}/${zone} ; \
> -            ${STAGING_BINDIR_NATIVE}/zic -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
> +            ${STAGING_BINDIR_NATIVE}/zic -b ${ZIC_FMT} -d ${WORKDIR}${datadir}/zoneinfo/right -L ${S}/leapseconds \
>                   ${S}/${zone} ; \
>           done
>   }
> 
> 
> 
> 
> 

