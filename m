Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DDA7E6E5D0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Aug 2015 02:17:14 +0000 (UTC)
Received: by ykoo205 with SMTP id o205so24459495yko.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Aug 2015 19:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VOOEWpM5zJUgCotUOi4rp5KR2slLnt2aXI11EtH6BGg=;
	b=novCmV214RRS8tKMdsI0ZCqh5b0sMUsbt5unZ/4orZlF4U6A8hTNvetOKSRMux9iH0
	TF+452p1jBK+5M6++B5T1gg86paJocxogSvw3IKe1K4UybrVR9Lck/7hMFwkrfWFbADM
	p7Wzfla++7oPPCzdS3LHEf4lkWLEOVy3yPINYyDN8SFKIlNFcM4slrv/d/e2xLeM5En1
	cYPrC7jnl98gudPBv31pYpmulOkXQHKZB4Lg641gUwBZGnbObSkaU1iTJf3xNFGw2A/2
	jrLRhq2/O6XrIi1uni6eECPR1azlTaMVahfMP99CuC8Wxct4Ru8rVopN8a4ha+En25Tg
	qdgw==
MIME-Version: 1.0
X-Received: by 10.170.89.130 with SMTP id g124mr7049750yka.60.1438741034502;
	Tue, 04 Aug 2015 19:17:14 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Tue, 4 Aug 2015 19:17:14 -0700 (PDT)
In-Reply-To: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
References: <1438674108-24258-1-git-send-email-adrian.ratiu@ni.com>
Date: Tue, 4 Aug 2015 23:17:14 -0300
Message-ID: <CADkTA4PEZCM151f7Z72jcr-4H3MQqusdPr9WkO-jwUxrufPsTw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-yocto: do_configme: Add $TOOLCHAIN_OPTIONS to CFLAGS
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
X-List-Received-Date: Wed, 05 Aug 2015 02:17:15 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 4, 2015 at 4:41 AM, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:
> The kernel configure step was broken by the sysroot poisoning in [1].

Can you be more precise here ? Configuration certainly works for me .. and
has been working since last October.

> In linux-yocto.inc this was fixed by appending $TOOLCHAIN_OPTIONS to
> KERNEL_CC, TOOLCHAIN_OPTIONS containing the needed --sysroot arg.
>
> However, [1] also breaks the yocto configure fragment generation:
> after parsing the fragments, when make is called on the merged file
> to fill in any missing symbols with default values. The call chain is:
>
> do_kernel_configme() -> configme -> merge_config.sh
> -> make KCONFIG_ALLCONFIG=$TMP_FILE
>
> This issue was uncaught until now because configme redirects all stdout
> and stderr to merge_log.txt prior to calling merge_configs.sh and there
> is no return value checking, so building continues and the silent error
> is ignored.
>
> Adding $TOOLCHAIN_OPTIONS to $CFLAGS before calling configme fixes this.
>
> TODO: In a future patch this kind of error should be made loud and cause
> the build to fail.
>

That won't be required, I already have a queue of patches that changes
things significantly.

If you can elaborate on the type of breakage you were seeing, I'll add
this to that queue.

Bruce

> [1] http://lists.openembedded.org/pipermail/openembedded-core/2014-October/098253.html
>
> Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
> ---
>  meta/classes/kernel-yocto.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
> index 231e08d..3a67238 100644
> --- a/meta/classes/kernel-yocto.bbclass
> +++ b/meta/classes/kernel-yocto.bbclass
> @@ -248,6 +248,7 @@ do_kernel_configme() {
>
>         cd ${S}
>         PATH=${PATH}:${S}/scripts/util
> +       CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}"
>         configme ${configmeflags} --reconfig --output ${B} ${LINUX_KERNEL_TYPE} ${KMACHINE}
>         if [ $? -ne 0 ]; then
>                 bbfatal_log "Could not configure ${KMACHINE}-${LINUX_KERNEL_TYPE}"
> --
> 2.1.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

