Return-Path: <zhangzl2013@126.com>
X-Greylist: delayed 1839 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Aug 2019 03:19:33 UTC
Received: from mail-m965.mail.126.com (mail-m965.mail.126.com [123.126.96.5])
	by mail.openembedded.org (Postfix) with ESMTP id C4BFA7F3DE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2019 03:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Subject:From:Message-ID:Date:MIME-Version; bh=KI5zj
	uPBsTorzpBijR83yRA+jF7QY2gU/s95N9+1aJc=; b=W/zwZfONyB7R7meXAERsl
	AEOXsaS15JpSy++XdLuNVlmv9NqDfahsqPhaBcgS91k8WS5U28d1rXaWlQIwr+cd
	/V/FjAfEP7626WTe5FEvgm5CLrcc5iq0INYewrXxUNixQwRi/TC9/hnf6N0Vb6rO
	lqyvYV8CcbY9nKwcnexTH0=
Received: from [128.224.155.114] (unknown [60.247.85.82])
	by smtp10 (Coremail) with SMTP id NuRpCgCXQWaUjmhd9O_PLA--.372S2;
	Fri, 30 Aug 2019 10:48:52 +0800 (CST)
From: zhangzl2013 <zhangzl2013@126.com>
To: bruce.ashfield@gmail.com, openembedded-core@lists.openembedded.org
References: <1567132763-12581-1-git-send-email-zhangzl2013@126.com>
Message-ID: <15b2b94d-1c10-3e05-aa80-01a5651a3c80@126.com>
Date: Fri, 30 Aug 2019 10:45:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1567132763-12581-1-git-send-email-zhangzl2013@126.com>
X-CM-TRANSID: NuRpCgCXQWaUjmhd9O_PLA--.372S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFyrurW7WFW8Cw13Ary3twb_yoW8XrWxpF
	4kG3Z8tw1rJrWIk34xArn3XFySyw48G343KrWIg34UCr9xZr1rZFs29r15tFy2qr4FgFsF
	vF1v9r1Y9r1DZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jdzVUUUUUU=
X-Originating-IP: [60.247.85.82]
X-CM-SenderInfo: x2kd0wt2osiiat6rjloofrz/1tbitBQhz1pD+HJeigAAsJ
Subject: Re: [PATCH] spp: optimize strip_common_prefix function
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
X-List-Received-Date: Fri, 30 Aug 2019 03:19:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On a Haswell Xeon 3.2GHz machine, iteration on each include_path costs ~12.5ms.
And the total time we can save at best is (0.0125s * n_patches * n_include_paths)

On 8/30/19 10:39 AM, Zhaolong Zhang wrote:
> strip_common_prefix() is the hot path that executes on every input file.
> This patch sorts and uniqs the $include_paths by length descreasingly.
> And with the sorted $include_paths, the for-loop inside strip_common_prefix
> can break earlier, thus kernel_metadata task can be sped up by multiple times.
>
> Signed-off-by: Zhaolong Zhang <zhangzl2013@126.com>
> ---
>   tools/spp | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tools/spp b/tools/spp
> index 1150ff3..cba52bb 100755
> --- a/tools/spp
> +++ b/tools/spp
> @@ -125,6 +125,7 @@ strip_common_prefix()
>   	if [ $this_len -lt $out_len ]; then
>   	    relocated_name=$t
>   	    out_len=$this_len
> +	    break
>   	fi
>   	# add a trailing slash to get corner cases where one may
>   	# have been added or not dropped
> @@ -133,6 +134,7 @@ strip_common_prefix()
>   	if [ $this_len -lt $out_len ]; then
>   	    relocated_name=$t
>   	    out_len=$this_len
> +	    break
>   	fi
>       done
>   
> @@ -297,6 +299,16 @@ infiles=$@
>   
>   processed_files=""
>   
> +# this function also removes duplicated lines by `sort -u`
> +sort_by_len_dec()
> +{
> +        for i in $@; do
> +                echo $i
> +        done | sort -u | awk '{ print length($0) " " $0; }' | sort -nr | cut -d ' ' -f 2-
> +}
> +
> +include_paths=$(sort_by_len_dec $include_paths)
> +
>   ##
>   ## create variables for use in scripts
>   ##


