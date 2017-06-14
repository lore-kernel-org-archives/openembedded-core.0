Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id E714278353
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 11:49:02 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v5EBmwTv024873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 14 Jun 2017 12:49:00 +0100
Message-ID: <1497440938.3942.48.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Amarnath Valluri <amarnath.valluri@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 12:48:58 +0100
In-Reply-To: <1497439848-29967-2-git-send-email-amarnath.valluri@intel.com>
References: <1497439848-29967-1-git-send-email-amarnath.valluri@intel.com>
	<1497439848-29967-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Wed, 14 Jun 2017 12:49:00 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v4 1/7] bitbake.conf: support for merged usr with DISTRO_FEATURE usrmerge
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
X-List-Received-Date: Wed, 14 Jun 2017 11:49:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2017-06-14 at 14:30 +0300, Amarnath Valluri wrote:
> A new configuration variable ${root_prefix} added, which shall be used by all
> base_{lib,bin,sbin}dir variables. When usrmerge DISTRO_FEATURE is enabled
> ${root_prefix} points to ${exec_prefix} otherwise to ${base_prefix}
> 
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>  meta/conf/bitbake.conf | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5d5ddec..8c497fd 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -17,11 +17,13 @@ export base_prefix = ""
>  export prefix = "/usr"
>  export exec_prefix = "${prefix}"
>  
> +export root_prefix = "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge', '${exec_prefix}', '${base_prefix}', d)}"
> +

This is a really small nitpick but with changes to the core files we
need to get this right. Could you drop the "export " above please?

The reason is that we want to ultimately reduce the number of variables
we export into the global shell environment. Where we create new ones
like this which aren't needed in the global scope, we might as well not
export them right from the start...

Cheers,

Richard


