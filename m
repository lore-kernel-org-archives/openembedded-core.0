Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EB89578695
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Dec 2017 06:45:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB86jn8h026635
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 7 Dec 2017 22:45:49 -0800 (PST)
Received: from [128.224.162.134] (128.224.162.134) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Thu, 7 Dec 2017 22:45:48 -0800
To: Andre McCurdy <armccurdy@gmail.com>,
	<openembedded-core@lists.openembedded.org>
References: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
From: Yi Zhao <yi.zhao@windriver.com>
Message-ID: <e03ac54c-11c9-2546-a622-c21169979cc5@windriver.com>
Date: Fri, 8 Dec 2017 14:44:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <1510293271-32407-1-git-send-email-armccurdy@gmail.com>
X-Originating-IP: [128.224.162.134]
Subject: Re: [PATCH] systemd: create wheel sysuser group offline
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
X-List-Received-Date: Fri, 08 Dec 2017 06:45:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



在 2017年11月10日 13:54, Andre McCurdy 写道:
> The default systemd-tmpfiles config file expects to be able to create
> files etc belonging to the wheel system group. Currently the wheel
> group is created at run time by systemd-sysusers, but that doesn't
> happen if systemd-sysusers is disabled (as it currently is by default
> when building with musl libc).

For sysvinit, we follow the Debian rule which doesn't have wheel group 
in the system. Should we have to break this rule for systemd? Is this 
necessary to use this group in systemd?

//Yi

>
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   meta/recipes-core/systemd/systemd_234.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd_234.bb b/meta/recipes-core/systemd/systemd_234.bb
> index 81a9509..7fdb65f 100644
> --- a/meta/recipes-core/systemd/systemd_234.bb
> +++ b/meta/recipes-core/systemd/systemd_234.bb
> @@ -333,7 +333,7 @@ USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'networkd', '--sys
>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'coredump', '--system -d / -M --shell /bin/nologin systemd-coredump;', '', d)}"
>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'resolved', '--system -d / -M --shell /bin/nologin systemd-resolve;', '', d)}"
>   USERADD_PARAM_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'polkit', '--system --no-create-home --user-group --home-dir ${sysconfdir}/polkit-1 polkitd;', '', d)}"
> -GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal"
> +GROUPADD_PARAM_${PN} = "-r lock; -r systemd-journal; -r wheel"
>   USERADD_PARAM_${PN}-extra-utils += "--system -d / -M --shell /bin/nologin systemd-bus-proxy;"
>   
>   FILES_${PN}-analyze = "${bindir}/systemd-analyze"


