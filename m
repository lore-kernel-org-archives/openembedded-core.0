Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 231EBC5B543
	for <webhook@archiver.kernel.org>; Wed,  4 Jun 2025 20:11:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by mx.groups.io with SMTP id smtpd.web10.23726.1749060235744532977
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Jun 2025 11:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fkq75kBy;
 spf=pass (domain: redhat.com, ip: 170.10.129.124, mailfrom: steved@redhat.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749060234;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K2cNY8dsHj7q0wO1yReflUiHxSFejPHlj3nPaEf+ZRs=;
	b=fkq75kByTt0B66XaDlHtPqCG5OB/+RSu73li55UPEyL+ANS6JYXNJWRQKPN+nBzeAohc1Y
	vVlz/yR/MmldgPqt1rl0YV2HyfjZoEo4n0ae9tjxLB09xUl4gzHYL5WOQdR9zpmIIJ1M6b
	PtQ2DyYF13SInwvPeRONeW8nz1yrjT8=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-01c_DlAdP_O9JXrlSPT0Xw-1; Wed, 04 Jun 2025 14:03:53 -0400
X-MC-Unique: 01c_DlAdP_O9JXrlSPT0Xw-1
X-Mimecast-MFC-AGG-ID: 01c_DlAdP_O9JXrlSPT0Xw_1749060233
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3ddc0663b97so2667685ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 11:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749060232; x=1749665032;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K2cNY8dsHj7q0wO1yReflUiHxSFejPHlj3nPaEf+ZRs=;
        b=AAukkuUSlRdyTK770fQ5g3KPPo040fDveVTFwt115/spv9ptNhOA2TxLtLwZ0nFr17
         T2KJ9jzN7TcGBtXsp+PbUvSwvwATw6jTNvyWEg0sF6EE29Q14ylpgVN4JJSNeuqB0E3h
         lU6f5TLmSD6eKg3XCflDG1xSUGUiRoxO9hpYE3PRnsC2JNx1D9SxT9B85OnAVGvinMWJ
         5JIoqoUiKWRCkSR/tD3K9Wo31oxNaNSLzqjTsXVTX3GswObTukkbo1UvgHF0XjWjRtUs
         jw913GHneMZBsbjpdLekx1IOAyL49oGD/+wKB7lwXt+c2rBtcWVUh+to/hmTiJZ2lGaZ
         Jk5A==
X-Forwarded-Encrypted: i=1; AJvYcCVRQm4OvWBVgkqpBtP5/JM5Uu/4oTL07EOAM6pp1zIfcniEObNcJ27VC2NBUB4OiPyP3v3tLnW5a5JylqsH96UMZA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwhDbE1NN2ZnxTurQCtHJR/WsY0IglOMwrHwoaqIUn/DuNjm/Ag
	siO3Fb52DkRYeTSGKYTGOHQ79AJS/aXNvxdpTjIDsxDwxyKO1JIV3RCimvKBF67jTfTzh9xOa+I
	zbttldCB0s/SBUA8oge7rkfcIHd/6uG1QiGiTKDGJWbtFjYAoEG8EhW/d9NKCsmxJZQfLnZZv6i
	IQp3ZZSLfueAmPeA==
X-Gm-Gg: ASbGncuctpLJR+9zHNn3k86InrGaDmEyaMSwuKmJTtlko7cTIQAClSq2KqEW8NnIcV3
	5zHN/YMYyQCGgC7TKnuYSArI7hvxAzjQwwiDin3uLdasXh2t3N948vvRw18flZn8Ao5ZMFMH8tB
	+CBGRg9Z1sWVcwI9PNSqNE+zbzu8A57meAHnj65QbSJ11zLb1/J3wM3TGQx+9p8J/bVGohTCUAn
	KqDfUXKtCn4SZj5jhI1tmRfdV+Z8vZrSzCHrHERHb2sou6LCwHp0gXpXmP4ZXBYNwGlQjtC+DyC
	B9/E7eJ6dOE=
X-Received: by 2002:a05:6e02:160d:b0:3dc:7b3d:6a37 with SMTP id e9e14a558f8ab-3ddbed3766emr46978825ab.8.1749060232056;
        Wed, 04 Jun 2025 11:03:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdr2VhoSFAjm3dzuFtggHT1hE0GbYvqnsnlSmgcdz3LDj1sNBVfAjeV5skcxynR+mGqvFuEA==
X-Received: by 2002:ad4:5cc2:0:b0:6fa:b954:2c32 with SMTP id 6a1803df08f44-6faf70095ebmr54978656d6.35.1749060221565;
        Wed, 04 Jun 2025 11:03:41 -0700 (PDT)
Received: from [172.31.1.12] ([70.105.242.209])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4c7d8sm103508626d6.36.2025.06.04.11.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 11:03:40 -0700 (PDT)
Message-ID: <15a51751-2370-4473-a1d3-e4f7cb5e8e6b@redhat.com>
Date: Wed, 4 Jun 2025 14:03:39 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH OE-core] nfs-utils: don't use signals to shut down nfs server.
To: NeilBrown <neilb@suse.de>, openembedded-core@lists.openembedded.org
Cc: "Yan, Haixiao (CN)" <haixiao.yan.cn@windriver.com>,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>
References: <174800219540.608730.11726448273017682287@noble.neil.brown.name>
From: Steve Dickson <steved@redhat.com>
In-Reply-To: <174800219540.608730.11726448273017682287@noble.neil.brown.name>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: V55rsuZxnNm4QNDj7nBZCIupKQ077D62Ss75VtjOlNc_1749060233
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Jun 2025 20:11:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217965

Hey Neil,

On 5/23/25 3:41 AM, NeilBrown wrote:
> 
> Since Linux v2.4 it has been possible to stop all NFS server by running
> 
>     rpc.nfsd 0
> 
> i.e.  by requesting that zero threads be running.  This is preferred as
> it doesn't risk killing some other process which happens to be called
> "nfsd".
> 
> Since Linux v6.6 - and other stable kernels to which
> 
>    Commit: 390390240145 ("nfsd: don't allow nfsd threads to be
>    signalled.")
> 
> has been backported - sending a signal no longer works to stop nfs server
> threads.
> 
> This patch changes the nfsserver script to use "rpc.nfsd 0" to stop
> server threads.
> 
> Signed-off-by: NeilBrown <neil@brown.name>
> ---
>   .../nfs-utils/nfs-utils/nfsserver             | 28 +++----------------
>   1 file changed, 4 insertions(+), 24 deletions(-)
> 
> Resending with different From: address because first attempt was bounced
> as spam
> 
>    openembedded-core@lists.openembedded.org
>      host lb01.groups.io [45.79.81.153]
>      SMTP error from remote mail server after end of data:
>      500 This message has been flagged as spam.
> 
> 
> diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> index cb6c1b4d08d8..99ec280b3594 100644
> --- a/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> +++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/nfsserver
> @@ -89,34 +89,14 @@ start_nfsd(){
>   	start-stop-daemon --start --exec "$NFS_NFSD" -- "$@"
>   	echo done
>   }
> -delay_nfsd(){
> -	for delay in 0 1 2 3 4 5 6 7 8 9
> -	do
> -		if pidof nfsd >/dev/null
> -		then
> -			echo -n .
> -			sleep 1
> -		else
> -			return 0
> -		fi
> -	done
> -	return 1
> -}
>   stop_nfsd(){
> -	# WARNING: this kills any process with the executable
> -	# name 'nfsd'.
>   	echo -n 'stopping nfsd: '
> -	start-stop-daemon --stop --quiet --signal 1 --name nfsd
> -	if delay_nfsd || {
> -		echo failed
> -		echo ' using signal 9: '
> -		start-stop-daemon --stop --quiet --signal 9 --name nfsd
> -		delay_nfsd
> -	}
> +	$NFS_NFSD 0
> +	if pidof nfsd
>   	then
> -		echo done
> -	else
>   		echo failed
> +	else
> +		echo done
>   	fi
>   }
>   
Is this suppose to apply to the Linux nfs-utils upstream repo?

A bit confused...

steved.


