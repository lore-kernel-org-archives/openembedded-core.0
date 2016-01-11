Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f195.google.com (mail-io0-f195.google.com
	[209.85.223.195])
	by mail.openembedded.org (Postfix) with ESMTP id A29B360124
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 14:55:05 +0000 (UTC)
Received: by mail-io0-f195.google.com with SMTP id k127so42855951iok.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 06:55:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=UQp7dSYDV0sLRKV0h8W2xBg2ivl74l6tC6Z6O5V5Kdg=;
	b=alXFxudTf1sY+Kgxi/jbkqXd/kEQg6S/+cB3xaK3yTIh5ZDPLVFHn+2B3nM1uahmwy
	MuG/KzHAcLrh5LhwsLaOp5KdInP2o+NzfWNjGmujrJp/l0mGA1lvSDemhNSUWbkyL/qj
	LMyUYDnWZphUXVS3CJ9B2vi+iTrSTAMceO4hr/9RX6waGY3NK11mTdklvjuYx+yONXPD
	Tug2z/zCma/A9ydMKGldEdltvvsf8yXYXtbI54wIeCGfdXksQQF1UaI5DSF1MQIiBUMc
	haOq1Y3/PcmFwncKK//lyQOBn4Zfig6GI7cuSwPtGChDAfgp061viyCYMGd1aMcVGBc+
	6WOA==
X-Received: by 10.107.132.162 with SMTP id o34mr110749413ioi.13.1452524106283; 
	Mon, 11 Jan 2016 06:55:06 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	mu8sm4688075igb.16.2016.01.11.06.55.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 06:55:05 -0800 (PST)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1452489034.git.liezhi.yang@windriver.com>
	<4f5f10ebe2593fb40fbb637978480d87d9697f40.1452489034.git.liezhi.yang@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5693C245.7060304@gmail.com>
Date: Mon, 11 Jan 2016 09:55:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <4f5f10ebe2593fb40fbb637978480d87d9697f40.1452489034.git.liezhi.yang@windriver.com>
Subject: Re: [PATCH 1/2] glibc-initial.inc: use relative path to run configure
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
X-List-Received-Date: Mon, 11 Jan 2016 14:55:06 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 01/11/16 00:11, Robert Yang wrote:
> Avoid potential build path in output files.
>
> [YOCTO #8894]
>
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/recipes-core/glibc/glibc-initial.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
> index 8e81f09..cb2f8dd 100644
> --- a/meta/recipes-core/glibc/glibc-initial.inc
> +++ b/meta/recipes-core/glibc/glibc-initial.inc
> @@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
>  do_configure () {
>  	(cd ${S} && gnu-configize) || die "failure in running gnu-configize"
>  	find ${S} -name "configure" | xargs touch
> -	${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
> +	../git/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \

Although I haven't tested it, this _looks_ like it might fail quite
readily. I'm sure there are some recipes that play tricks with ${S}, and
what about recipes that don't pull their sources from git?

Maybe something like: (cd ${S} && ./configure ...) would be better?

>  		--prefix=/usr \
>  		--without-cvs --disable-sanity-checks \
>  		--with-headers=${STAGING_DIR_TARGET}${includedir} \


