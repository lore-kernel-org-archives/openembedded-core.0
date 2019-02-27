Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id EA6427CBD9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2019 07:19:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 448Rs86YQDz6p;
	Wed, 27 Feb 2019 08:19:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1551251997;
	bh=W2OcxlpDgE68V32tObIDKyGAIXXyiuTD1ZkR+l6bMZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bcNK66B93jP2q6mFm+USVbvXCPHeDTXMYgQ+QGj3Rt2XOF3e2/YleIbQfmnTa9YZ+
	I9QKqMpYHZuefljYpcQ+a8+vuCZjAcjXjeHmVswswiCkTGkqceSSegHkEQ5iN0mteU
	tZRIBEwaC1vTXVxKfe4w8uWYvSuby2BfsJMdWqghRo3DtzZ7Z4fEdkLU+YoLQ0U4nV
	B4x5b5IbNGKUYAjEUpboUvON0MgCD8HZVJzHBomARjjNfyNXp2fv3ViLhgPhTFqZpR
	3FtMyh/rUBbVtyZYZlQPX4mK5txMF92zjHL7LVYy5FwC5CNiQ4HAh/aHYwtQVibq66
	aqTk92R68opmBPUl/YwCNgljR+vtv1YDzJ12r3Yt3G+2GQCCBE/oALUQtjlY4DsdQt
	q5FfpSRoPSER0M+J0mc1kGh3/tMBQZ3rulwzwUQZCKVPB6ggH893sZv9S+JV6CFv/Q
	Ss82BVh72f2xvebdGEMUmDUa82BSjSKguWJfJvjdrTlZmxYICnCO1YDUwzQc5c5aY6
	0LXJdrgwaGWB4B4d/pDsz0cyiWRn+b6lnVmExla56CKacTtKbIbND/EtAobmeJlV1T
	JCxfPjCYQYN1NUUzWDLdnXRDir/X5Ndbv7v4hFGjaoA2P6KM5hcWj9DtMsSBTgLdrf
	wmSzAqOnRoVJ71g9e5jsrjv8=
Date: Wed, 27 Feb 2019 09:19:54 +0200
From: Adrian Bunk <bunk@stusta.de>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20190227071954.GA20203@localhost>
References: <20190227070420.36624-1-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190227070420.36624-1-raj.khem@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: Use -Og in DEBUG_OPTIMIZATION
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
X-List-Received-Date: Wed, 27 Feb 2019 07:19:57 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Feb 26, 2019 at 11:04:20PM -0800, Khem Raj wrote:
> -Og is for optimized debugging experience.
> this makes this consistent across different compilers especially gcc and
> clang, -O in clang is equal to -O2 where as in gcc its similar to -O1
> so it was not giving consistent debugging experience across compilers
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/conf/bitbake.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 1c5369ec98..758e89f126 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -610,7 +610,7 @@ DEBUG_FLAGS ?= "-g -feliminate-unused-debug-types ${DEBUG_PREFIX_MAP}"
>  
>  # Disabled until the option works properly -feliminate-dwarf2-dups
>  FULL_OPTIMIZATION = "-O2 -pipe ${DEBUG_FLAGS}"
> -DEBUG_OPTIMIZATION = "-O -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
> +DEBUG_OPTIMIZATION = "-Og -fno-omit-frame-pointer ${DEBUG_FLAGS} -pipe"
>  SELECTED_OPTIMIZATION = "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', 'DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
>  SELECTED_OPTIMIZATION[vardeps] += "FULL_OPTIMIZATION DEBUG_OPTIMIZATION DEBUG_BUILD"
>  BUILD_OPTIMIZATION = "${@oe.utils.vartrue('DEBUG_BUILD', '-O -g -feliminate-unused-debug-types -fno-omit-frame-pointer', '-O2', d)} -pipe"
>                                                            ^^

Another place that might have to be updated.

And the ref/dev-maunuals also need updating (they document -O as default).

cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


