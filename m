Return-Path: <jan.kiszka@siemens.com>
X-Greylist: delayed 333 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 03 Sep 2019 12:35:16 UTC
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id AC2537F369
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2019 12:35:16 +0000 (UTC)
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x83CThkZ022596
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 3 Sep 2019 14:29:43 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may
	be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x83CThYw015190;
	Tue, 3 Sep 2019 14:29:43 +0200
To: Henning Schild <henning.schild@siemens.com>,
	openembedded-core@lists.openembedded.org
References: <20190903122224.18634-1-henning.schild@siemens.com>
	<20190903122224.18634-4-henning.schild@siemens.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ce266dd8-8125-7c58-19e3-c59d77e88e85@siemens.com>
Date: Tue, 3 Sep 2019 14:29:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903122224.18634-4-henning.schild@siemens.com>
Subject: Re: [PATCH 4/6] oe-git-proxy: disable shell pathname expansion for the whole script
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
X-List-Received-Date: Tue, 03 Sep 2019 12:35:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03.09.19 14:22, Henning Schild wrote:
> From: Henning Schild <henning.schild@siemens.com>
> 
> This truly fixes the issue that cbc148d5d93d5f3531434fee7b234a16196b3088
> wanted to solve, without breaking the iteration over multiple entries.
> 
> Signed-off-by: Henning Schild <henning.schild@siemens.com>
> ---
>   scripts/oe-git-proxy | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/scripts/oe-git-proxy b/scripts/oe-git-proxy
> index 10e6560da4..2f65f0c482 100755
> --- a/scripts/oe-git-proxy
> +++ b/scripts/oe-git-proxy
> @@ -133,6 +133,9 @@ if [ -z "$ALL_PROXY" ]; then
>   	exec $SOCAT STDIO $METHOD
>   fi
>   
> +# disable pathname expansion, NO_PROXY fielnd could start with "*" or be it

field

> +set -f

Ah, that's much better than any (mis-)quoting.

Jan

> +
>   # Connect directly to hosts in NO_PROXY
>   for H in ${NO_PROXY//,/ }; do
>   	if match_host $1 $H; then
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

