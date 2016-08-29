Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0E87E6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 12:55:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7TCtjA8018590
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 29 Aug 2016 05:55:46 -0700 (PDT)
Received: from [128.224.56.48] (128.224.56.48) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 29 Aug 2016 05:55:45 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Ioan-Adrian Ratiu
	<adrian.ratiu@ni.com>
References: <20160829091905.1068-1-adrian.ratiu@ni.com>
	<CADkTA4MS=7NyodK3chia_1Ev-cr_jNvyMnUWKWSstZZxFMTb5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <53f27a58-40a5-7953-eb7c-9a68af4c28b8@windriver.com>
Date: Mon, 29 Aug 2016 08:55:44 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4MS=7NyodK3chia_1Ev-cr_jNvyMnUWKWSstZZxFMTb5Q@mail.gmail.com>
Cc: Yocto Project Discussion <yocto@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] [yocto-kernel-tools][PATCH] merge_configs.sh: fail loudly if make also fails
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
X-List-Received-Date: Mon, 29 Aug 2016 12:55:50 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-29 08:07 AM, Bruce Ashfield wrote:
>
>
> On Mon, Aug 29, 2016 at 5:19 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com
> <mailto:adrian.ratiu@ni.com>> wrote:
>
>     merge_configs.sh calls make on the generated kernel config from
>     the defconfig + fragments to fill in any missing symbols. make
>     can fail and this can lead to nasty errors further on in the
>     build like generating an unbootable kernel image.
>
>     Check the make return code and fail loudly if non-zero.
>
>
> We don't want merge config to fail in a scenario like this. It is up to
> whatever
> calls merge_config to add that sort of logic. Which is what I do with
> the kernel
> audit phase of linux-yocto.

I saw the other patch after replying here. So this is causing some sort
of non Kconfig related error (i.e. host contamination) ? If so, that is
a different scenario than I was thinking of when I wrote this.

Either way, like I said in my other email, I'd like to understand why
this is popping up now, since I'm not seeing anything like it in my
builds .. with my recent changes, all that I've essentially done is
expose merge_config to the actual tasks, so if this is showing an error
I jiggled something else, or it was always around.

Bruce

>
> If you do want to try and make it fail in a scenario like this, the
> patch needs to
> go to the linux kernel mailing list.
>
> Cheers,
>
> Bruce
>
>
>
>     Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com
>     <mailto:adrian.ratiu@ni.com>>
>     ---
>      tools/merge_config.sh | 5 ++++-
>      1 file changed, 4 insertions(+), 1 deletion(-)
>
>     diff --git a/tools/merge_config.sh b/tools/merge_config.sh
>     index 67d1314..5212f37 100755
>     --- a/tools/merge_config.sh
>     +++ b/tools/merge_config.sh
>     @@ -152,7 +152,10 @@ fi
>      # alldefconfig: Fills in any missing symbols with Kconfig default
>      # allnoconfig: Fills in any missing symbols with # CONFIG_* is not set
>      make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
>     -
>     +if [ "$?" -ne 0 ]; then
>     +    echo "Make failed to fill missing config symbols. Exit." >&2
>     +    exit 1
>     +fi
>
>
>      # Check all specified config values took (might have
>     missed-dependency issues)
>      for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
>     --
>     2.9.3
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>
>


