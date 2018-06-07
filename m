Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 73669770CA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jun 2018 13:12:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2018 06:12:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,486,1520924400"; d="scan'208";a="235210454"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga005.fm.intel.com with ESMTP; 07 Jun 2018 06:12:51 -0700
To: Andrej Valek <andrej.valek@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <20180607072501.27158-1-andrej.valek@siemens.com>
	<20180607073209.27240-1-andrej.valek@siemens.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <59452b23-7470-588c-75fb-7445aaa13ba1@linux.intel.com>
Date: Thu, 7 Jun 2018 16:13:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180607073209.27240-1-andrej.valek@siemens.com>
Subject: Re: [PATCH v2] feat(openssl-1.1): rework packaging
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
X-List-Received-Date: Thu, 07 Jun 2018 13:12:51 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/07/2018 10:32 AM, Andrej Valek wrote:
> -do_install_append_class-native () {
>           # Install a custom version of c_rehash that can handle sysroots properly.
>           # This version is used for example when installing ca-certificates during
>           # image creation.
>           install -Dm 0755 ${WORKDIR}/openssl-c_rehash.sh ${D}${bindir}/c_rehash
>           sed -i -e 's,/etc/openssl,${sysconfdir}/ssl,g' ${D}${bindir}/c_rehash

Why is this merged into the main do_install()? Please explain.

> +        # Create SSL structure
> +        install -d ${D}${sysconfdir}/ssl/
> +        mv ${D}${libdir}/ssl-1.1/openssl.cnf \
> +           ${D}${libdir}/ssl-1.1/certs \
> +           ${D}${libdir}/ssl-1.1/private \
> +           \
> +           ${D}${sysconfdir}/ssl/
> +        ln -sf ${sysconfdir}/ssl/certs ${D}${libdir}/ssl-1.1/certs
> +        ln -sf ${sysconfdir}/ssl/private ${D}${libdir}/ssl-1.1/private
> +        ln -sf ${sysconfdir}/ssl/openssl.cnf ${D}${libdir}/ssl-1.1/openssl.cnf

Please explain this change as well. Resend the patch with the 
explanations included in the commit log or (better), the recipe itself.

I would like to keep the new openssl recipe short and simple, and so 
anything that adds lines and complication should be well justified. :)

Alex

