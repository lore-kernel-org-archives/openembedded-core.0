Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9B0C06FF76
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 07:49:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K7ngES005280; Wed, 20 Jan 2016 07:49:42 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id YrEUR9NyUcxa; Wed, 20 Jan 2016 07:49:42 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0K7ndDH005276
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 20 Jan 2016 07:49:41 GMT
Message-ID: <1453276179.27999.139.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jian Liu <jian.liu@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 07:49:39 +0000
In-Reply-To: <1453270225-19279-1-git-send-email-jian.liu@windriver.com>
References: <1453270225-19279-1-git-send-email-jian.liu@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH] linux-libc-headers: not to create empty rpm
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
X-List-Received-Date: Wed, 20 Jan 2016 07:49:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-01-20 at 14:10 +0800, Jian Liu wrote:
> linux-libc-headers-dbg is empty and unset ALLOW_EMPTY
> for this sub-package.
> 
> Signed-off-by: Jian Liu <jian.liu@windriver.com>
> 
> diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc
> -headers.inc b/meta/recipes-kernel/linux-libc-headers/linux-libc
> -headers.inc
> index 2ba6ed5..75f6899 100644
> --- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> +++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers.inc
> @@ -76,3 +76,5 @@ RRECOMMENDS_${PN}-dbg = "${PN}-dev (=
> ${EXTENDPKGV})"
>  
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS += "unifdef-native"
> +
> +ALLOW_EMPTY_${PN}-dbg = "0"

It may be empty but our packaging criteria say we always generate a dbg
package since they can be part of dependency chains and we're
interested in the dependencies.

I appreciate in this case, the libc-headers are a corner case at the
end of the chains so you could argue this one can be skipped for
packaging but the system does assume all -dbg packages exist so I'd
prefer to leave this alone, unless its part of a bigger picture rethink
about -dbg packages.

Cheers,

Richard



