Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6310977074
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 16:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JG2P4B004040; Fri, 19 Aug 2016 17:02:25 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0OwEdrcsiWpC; Fri, 19 Aug 2016 17:02:25 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u7JG2L5i004035
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Aug 2016 17:02:22 +0100
Message-ID: <1471622541.16712.52.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Lock <joshua.g.lock@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 17:02:21 +0100
In-Reply-To: <6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
References: <cover.1471620482.git.joshua.g.lock@intel.com>
	<6e71e3206845a8eda86168634053fd3d5334201b.1471620482.git.joshua.g.lock@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 5/5] security_flags: ensure changes to SHARED_OBJECTS cause recompile
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
X-List-Received-Date: Fri, 19 Aug 2016 16:02:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2016-08-19 at 16:34 +0100, Joshua Lock wrote:
> Add the SHARED_OBJECTS variable to SECURITY_LDFLAGS vardeps so that
> changing SHARED_OBJECTS causes do_compile to re-run.
> 
> Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/conf/distro/include/security_flags.inc
> b/meta/conf/distro/include/security_flags.inc
> index 295c733..901c841 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -24,6 +24,7 @@ SECURITY_CFLAGS ?= "-fstack-protector-strong -
> -param ssp-buffer-size=4 -pie -fpi
>  SECURITY_NO_PIE_CFLAGS ?= "-fstack-protector-strong --param ssp
> -buffer-size=4 ${lcl_maybe_fortify} ${SECURITY_STRINGFORMAT}"
>  
>  SECURITY_LDFLAGS ?= "-Wl,-z,relro,-z,now${pie_ld}"
> +SECURITY_LDFLAGS[vardeps] += "SHARED_OBJECTS"

Surely you want:

pid_ld[vardeps] += "SHARED_OBJECTS"

?

Also, you mention SHARED_OBJECTS defaults to "0", where is that? I am a
little worried the variable name is also a bit generic? Setting this in
the following way:

SECURITY_SHARED_OBJECTS = "-fpie"
SECURITY_SHARED_OBJECTS_pn-XXX = ""

may be more in keeping with the way the rest of the file is written and
avoids games with base_conditional and vardeps?

I am also worried about trying to maintain a large list like this, the
idea was to reduce the number of exceptions, not build lists which will
ever increase :(. I can't see this scaling.

Cheers,

Richard

