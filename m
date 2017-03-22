Return-Path: <twoerner@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF6777AA7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 17:00:41 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id j64so16101330vkg.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 10:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=DJwBYLVEsHfkhtMbu8IZQgLusk7JUHncq+/3TKyfPjg=;
	b=jIWksuVa3veKnuViygUIMEpFRabT9nBCLui5VFVyYq0jwmXOubyd9Q0U3NTPjqQ6gk
	mUPbntg5PPaJ8whoNsNr4M6eL7A62H2RTohbu6sJe75zQI+4CWN0xOhdU0QVkmUYx0NZ
	IgQqqNFGHfjujMhQeVq1umo2yenN27ocenDqAHr2AeiOs2aEjJ6yiYOZdwvpWTz8sx4M
	wGk3Fg0OGlQrjtnD4+IZKc0vllEMbRAFLnizhqMpMSPCn+IB216vM+01YSReO0ye4eFP
	eO/A/jOrhPVO9Bq/Az4LklIaoK9LHt/WwGiC4LpAWslQtLYbouW2ElqVhnya08MMMMYJ
	1y3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=DJwBYLVEsHfkhtMbu8IZQgLusk7JUHncq+/3TKyfPjg=;
	b=EiTgf+CkaqodYpEVrh2RGX4uRzIPW0iNQUidKI1cgUW3QfthywwN6wH/DbDyDK1dNL
	Ec2N/I2K2cX39i7G9NQso4c0vP0S0mJuLOaAE3G/xk2sou18aI6EUM2z1UE8/K42TOP4
	oQn1qYhlFKOUEerNQIVxaWl7Y3wVp4/ErVPqxpcv5lgZM1mpXebwdPKIuryjMzA9F7lI
	VI7AZeKUA+ECbI2NBNnf6AWi/991fMUXqklguzMbDdoQHdJcS39KYP0TrK7P8uiniyvt
	7APRaxSbkX8dKJkGKDSqHIGEp21pBrz40zj2avM9bjOzqoCDO4PfT9dzJyy0TEzP9qgJ
	WOug==
X-Gm-Message-State: AFeK/H1KcN01GbFFDnNLD6w9rYwc6S3q1poXhLpUMWiRf+D+/EUK8WEsi7saVzSrT+hrIbeJaopZf5t5DkUazA==
X-Received: by 10.176.93.30 with SMTP id u30mr17954184uaf.179.1490202042201;
	Wed, 22 Mar 2017 10:00:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.43.65 with HTTP; Wed, 22 Mar 2017 10:00:41 -0700 (PDT)
In-Reply-To: <20170321190513.21469-2-twoerner@gmail.com>
References: <20170321190513.21469-1-twoerner@gmail.com>
	<20170321190513.21469-2-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Date: Wed, 22 Mar 2017 13:00:41 -0400
Message-ID: <CAHUNapTcmaHNCCSC+iK9j43ff-x2cmC3WqRrm9kssO84rWSrSw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] meta/classes/kernel.bbclass: revert 56fe5300ab5
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
X-List-Received-Date: Wed, 22 Mar 2017 17:00:42 -0000
Content-Type: text/plain; charset=UTF-8

Please don't add this patch, I've found a test case where I see the
"+" being added.
(Is there a stronger way of doing this via patchwork?)

On Tue, Mar 21, 2017 at 3:05 PM, Trevor Woerner <twoerner@gmail.com> wrote:
> This commit effectively reverts 56fe5300ab5 (except doing a revert at this
> point is not clean).
>
> The Linux kernel contains a configuration option called
> CONFIG_LOCALVERSION_AUTO which, if enabled, will change the boot
> log and "uname -a" from, for example, "4.10.2-yocto-standard" to
> "4.10.2-yocto-standard-00368-g827a1164b155".
>
> According to the log message for 56fe5300ab5, the Linux kernel's
> scripts/setlocalversion script was leaving or appending a '+' to the end of
> directory names (e.g. /lib/modules/2.6.37+). This conversation can be seen at:
>
>         http://lists.openembedded.org/pipermail/openembedded-core/2011-December/053263.html
>
> The solution was to touch an empty .scmversion file, which causes the kernel's
> CONFIG_LOCALVERSION_AUTO logic to be entirely circumvented. This seems like
> a very big hammer to use in order to fix a trailing '+'. If users were
> enabling this kernel option, it wasn't having any effect. Also, by default,
> CONFIG_LOCALVERSION_AUTO is disabled in linux-yocto kernels.
>
> Commit 56fe5300ab5 was many years ago, and my current testing with
> CONFIG_LOCALVERSION_AUTO enabled and 56fe5300ab5 reverted doesn't appear to
> cause trailing '+' characters to be appended to filenames in /lib/modules
> anymore. It appears as though the problem has been fixed somewhere else along
> the way. In which case, enable this functionality so setting this kernel
> option gives users the expected result.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta/classes/kernel.bbclass | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 1e0646a437..c44978808b 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -451,12 +451,6 @@ check_oldest_kernel[vardepsexclude] += "OLDEST_KERNEL KERNEL_VERSION"
>  do_configure[prefuncs] += "check_oldest_kernel"
>
>  kernel_do_configure() {
> -       # fixes extra + in /lib/modules/2.6.37+
> -       # $ scripts/setlocalversion . => +
> -       # $ make kernelversion => 2.6.37
> -       # $ make kernelrelease => 2.6.37+
> -       touch ${B}/.scmversion ${S}/.scmversion
> -
>         if [ "${S}" != "${B}" ] && [ -f "${S}/.config" ] && [ ! -f "${B}/.config" ]; then
>                 mv "${S}/.config" "${B}/.config"
>         fi
> --
> 2.12.0.rc1.48.g076c053
>

