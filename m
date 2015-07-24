Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B216260962
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 08:04:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t6O84oZL021531
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jul 2015 01:04:50 -0700 (PDT)
Received: from [128.224.162.176] (128.224.162.176) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.235.1;
	Fri, 24 Jul 2015 01:04:39 -0700
Message-ID: <55B1F1A0.9030807@windriver.com>
Date: Fri, 24 Jul 2015 16:04:48 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
In-Reply-To: <1436941198-24451-1-git-send-email-wenzong.fan@windriver.com>
Subject: Re: [PATCH v3] rpcbind: handle rpcbind options
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
X-List-Received-Date: Fri, 24 Jul 2015 08:04:51 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Ping ...

On 07/15/2015 02:19 PM, wenzong.fan@windriver.com wrote:
> From: Li Wang <li.wang@windriver.com>
>
> While runing:
>
> $ systemctl restart rpcbind
> $ systemctl status rpcbind
>
> There are errors like below:
>    rpcbind[1722]: Cannot open '/tmp/rpcbind.xdr' file for reading, \
>      errno 2 (No such file or directory)
>    rpcbind[1722]: Cannot open '/tmp/portmap.xdr' file for reading, \
>      errno 2 (No such file or directory)
>
> Don't pass -w to rpcbind on boot up, since the files won't be there
> to be read, the patch refers to:
>    https://bugs.launchpad.net/ubuntu/+source/rpcbind/+bug/835833
>
> Signed-off-by: Li Wang <li.wang@windriver.com>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>   meta/recipes-extended/rpcbind/rpcbind/rpcbind.service | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> index b3ae254..9cdade4 100644
> --- a/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> +++ b/meta/recipes-extended/rpcbind/rpcbind/rpcbind.service
> @@ -5,7 +5,7 @@ Requires=rpcbind.socket
>   [Service]
>   Type=forking
>   EnvironmentFile=-@SYSCONFDIR@/rpcbind.conf
> -ExecStart=@SBINDIR@/rpcbind -w $RPCBIND_OPTS
> +ExecStart=@SBINDIR@/rpcbind $RPCBIND_OPTS
>   SuccessExitStatus=2
>
>   [Install]
>

