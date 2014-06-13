Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2B42D6FD7F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jun 2014 11:33:18 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s5DBWeI1009470; Fri, 13 Jun 2014 12:33:07 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id SVc-PAwByx3a; Fri, 13 Jun 2014 12:33:07 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s5DBX2pV009570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 13 Jun 2014 12:33:03 +0100
Message-ID: <1402659176.12440.478.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Max Eliaser <max.eliaser@intel.com>
Date: Fri, 13 Jun 2014 12:32:56 +0100
In-Reply-To: <4b7de930ed0850b747248daf99495d5779d7156d.1402431641.git.max.eliaser@intel.com>
References: <b97d1bf2c6f7e8d73245d24c8a2bad9d47b54e20.1402431641.git.max.eliaser@intel.com>
	<4b7de930ed0850b747248daf99495d5779d7156d.1402431641.git.max.eliaser@intel.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] texinfo.bbclass: native/cross uses dummy texinfo; target uses host's Texinfo.
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
X-List-Received-Date: Fri, 13 Jun 2014 11:33:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2014-06-10 at 13:24 -0700, Max Eliaser wrote:
> To unpack that to more than a single line: -native and -cross recipes are made
> to use the dummy Texinfo utilities provided by texinfo-dummy-native if they
> invoke those utilities at build time. The target-architecture (cross-compiled)
> recipes still use the genuine Texinfo utilites. Right now, they still use
> the host system's Texinfo utilities, but could be made to use the
> texinfo-native recipe we already ship with some config file changes.
> 
> Signed-off-by: Max Eliaser <max.eliaser@intel.com>
> ---
>  meta/classes/texinfo.bbclass | 15 ++++++++++++++-
>  meta/conf/bitbake.conf       |  1 +
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/texinfo.bbclass b/meta/classes/texinfo.bbclass
> index 60cba0f..92efbcc 100644
> --- a/meta/classes/texinfo.bbclass
> +++ b/meta/classes/texinfo.bbclass
> @@ -1,2 +1,15 @@
>  # This class is inherited by recipes whose upstream packages invoke the
> -# texinfo utilities at build-time. This class currently does nothing.
> +# texinfo utilities at build-time. Native and cross recipes are made to use the
> +# dummy scripts provided by texinfo-dummy-native, for improved performance. 
> +# Target architecture recipes use the genuine Texinfo utilities. By default, 
> +# they use the Texinfo utilities on the host system. If you want to use the
> +# Texinfo recipe shipped with yoco, you can remove texinfo-native from 
> +# ASSUME_PROVIDED and makeinfo from SANITY_REQUIRED_UTILITIES.
> +
> +TEXDEP = "texinfo-native"
> +TEXDEP_class-native = "texinfo-dummy-native"
> +TEXDEP_class-cross = "texinfo-dummy-native"
> +

I took this patch but I noticed we should have a class-crosssdk in there
too. Its not a big issue, just a completeness thing.

Cheers,

Richard


