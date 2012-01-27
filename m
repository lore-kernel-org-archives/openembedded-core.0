Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Rqiob-0005Lg-W0 for openembedded-core@lists.openembedded.org;
	Fri, 27 Jan 2012 11:13:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RA65IS006835
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 10:06:05 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 06764-01 for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 10:06:00 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q0RA5udc006829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2012 10:05:57 GMT
Message-ID: <1327658759.19643.446.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jan 2012 10:05:59 +0000
In-Reply-To: <4F21AA4B.607@mentor.com>
References: <4F1F26C6.8050501@mentor.com> <4F21A9CF.3020103@mentor.com>
	<4F21AA4B.607@mentor.com>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH v2 3/3] systemtap: build and install uprobes.ko
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jan 2012 10:13:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2012-01-26 at 12:32 -0700, Wade Farnsworth wrote:
> SystemTap needs to provide uprobes.ko in order to support user space
> probing.  Build and install the module on systems that support it.
> 
> Additionally, split off common bits into systemtap_git.inc.
> 
> Signed-off-by: Wade Farnsworth <wade_farnsworth@mentor.com>
> ---
>  .../systemtap/systemtap-uprobes_git.bb             |   42 ++++++++++++++++++++
>  meta/recipes-kernel/systemtap/systemtap_git.bb     |   18 +-------
>  meta/recipes-kernel/systemtap/systemtap_git.inc    |   16 +++++++
>  3 files changed, 61 insertions(+), 15 deletions(-)
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
>  create mode 100644 meta/recipes-kernel/systemtap/systemtap_git.inc
> 
> diff --git a/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> new file mode 100644
> index 0000000..7ae9cb8
> --- /dev/null
> +++ b/meta/recipes-kernel/systemtap/systemtap-uprobes_git.bb
> @@ -0,0 +1,42 @@
> +DESCRIPTION = "UProbes kernel module for SystemTap"
> +
> +require systemtap_git.inc
> +
> +DEPENDS = "virtual/gettext systemtap virtual/kernel"
> +
> +PR = "r0"
> +
> +# On systems without CONFIG_UTRACE, this package is empty.
> +ALLOW_EMPTY = 1

This should really be:

ALLOW_EMPTY_${PN} = "1"

Cheers,

Richard



