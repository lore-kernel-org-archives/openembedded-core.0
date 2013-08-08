Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE3C161013
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2013 02:50:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r782oEsL010070
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Aug 2013 19:50:14 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Wed, 7 Aug 2013 19:50:14 -0700
Message-ID: <5203077C.3000605@windriver.com>
Date: Thu, 8 Aug 2013 10:50:36 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1375862591.git.Qi.Chen@windriver.com>
	<3cfae481384c0c94d116273ba085dbacaf455c6d.1375862591.git.Qi.Chen@windriver.com>
In-Reply-To: <3cfae481384c0c94d116273ba085dbacaf455c6d.1375862591.git.Qi.Chen@windriver.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: [PATCH V4 08/10] populate-volatile.sh: use 'cp -a' to avoid potential problem
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
X-List-Received-Date: Thu, 08 Aug 2013 02:50:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/07/2013 04:08 PM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> Previously, dead links in target directory will not be copied.
> This is incorrect as dead links are not uncommon in our rootfs.
> So we use '-a' option instead.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>   .../initscripts-1.0/populate-volatile.sh           |    3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> index 827fd7d..b1c0245 100755
> --- a/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> +++ b/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh
> @@ -76,7 +76,8 @@ link_file() {
>   	if [ -L \"$2\" ]; then
>   		[ \"\$(readlink -f \"$2\")\" != \"\$(readlink -f \"$1\")\" ] && { rm -f \"$2\"; ln -sf \"$1\" \"$2\"; };
>   	elif [ -d \"$2\" ]; then
> -		for f in $2/* $2/.[^.]*; do [ -e \$f ] && cp -rf \$f $1; done;
> +		cp -a $2/* $1
> +		cp -a $2/.[!.]* $1
My apologies.
The above two lines are missing colons.
They should be:
cp -a $2/* $1;
cp -a $2/.[!.]* $1;

Remote branch has been updated to fix this error.
Sorry for the inconvenience.

Best Regards,
Chen Qi

>   		rm -rf \"$2\";
>   		ln -sf \"$1\" \"$2\";
>   	else


