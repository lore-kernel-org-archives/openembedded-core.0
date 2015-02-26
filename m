Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id C8F4565C7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 20:41:35 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id B53DDF811DC; Thu, 26 Feb 2015 13:41:36 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 5730AF811DB;
	Thu, 26 Feb 2015 13:41:36 -0700 (MST)
Message-ID: <54EF850E.8080303@mlbassoc.com>
Date: Thu, 26 Feb 2015 13:41:50 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1424953625-26492-1-git-send-email-gary@mlbassoc.com>
In-Reply-To: <1424953625-26492-1-git-send-email-gary@mlbassoc.com>
Subject: Re: [PATCH] sysvinit: Fix bootlogd startup
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
X-List-Received-Date: Thu, 26 Feb 2015 20:41:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-26 05:27, Gary Thomas wrote:
> The bootlogd program currently does not start correctly.  This
> is because it is being started at S07, but the program requires
> access to /dev/pts which is normally started at S38.  This yields
> an error like:
>      bootlogd: cannot allocate pseudo tty: No such file or directory
>
> Starting bootlogd at S39 fixes this.
>
> n.b. Moving the creation of /dev/pts to S06 in the initscripts
> package is an alternative solution.
>
> Signed-off-by: Gary Thomas <gary@mlbassoc.com>

Never mind.  This issue only occurs when booting a kernel which does not
implement legacy PTY devices.  If your kernel supports legacy PTY devices,
the bootlogd works as currently configured (S07)

> ---
>   meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> index 00d3333..c740bf3 100644
> --- a/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> +++ b/meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb
> @@ -91,7 +91,7 @@ do_install () {
>   	install -m 0755    ${WORKDIR}/bootlogd.init     ${D}${sysconfdir}/init.d/bootlogd
>   	ln -sf bootlogd ${D}${sysconfdir}/init.d/stop-bootlogd
>
> -	update-rc.d -r ${D} bootlogd start 07 S .
> +	update-rc.d -r ${D} bootlogd start 39 S .
>   	update-rc.d -r ${D} stop-bootlogd start 99 2 3 4 5 .
>
>   	install -d ${D}${sysconfdir}/default/volatiles
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

