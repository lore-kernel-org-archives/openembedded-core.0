Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Qqwob-0000BC-Hl
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 02:38:33 +0200
Received: from mail-gy0-f180.google.com ([209.85.160.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 09 Aug 2011 17:32:55 -0700
Received: by gyc15 with SMTP id 15so704845gyc.25
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 17:32:55 -0700 (PDT)
Received: by 10.42.168.136 with SMTP id w8mr7719673icy.267.1312936374523;
	Tue, 09 Aug 2011 17:32:54 -0700 (PDT)
Received: from [192.168.1.12] (c-98-246-165-28.hsd1.or.comcast.net
	[98.246.165.28])
	by mx.google.com with ESMTPS id v3sm289380ibh.50.2011.08.09.17.32.52
	(version=SSLv3 cipher=OTHER); Tue, 09 Aug 2011 17:32:52 -0700 (PDT)
Message-ID: <4E41D1B3.4090703@intel.com>
Date: Tue, 09 Aug 2011 17:32:51 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
In-Reply-To: <1312855453-23258-1-git-send-email-james@digitalmatter.com.au>
Subject: Re: [PATCH] bitbake.conf: Changed PSEUDO_LOCALSTATEDIR assignment to unconditional.
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
X-List-Received-Date: Wed, 10 Aug 2011 00:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2011 07:04 PM, James Limbouris wrote:
> The pseudo executable sets the PSEUDO_LOCALSTATEDIR environment variable
> to point to a sysroot location. During an initial cache build, in which
> pseudo is not used as it is being built, the PSEUDO_LOCALSTATEDIR is set
> to a per-package location by bitbake.conf, and baked into the cache.
> If the cache is subsequently invalidated, bitbake may run under pseudo,
> and rebuild it with the sysroot location baked into the cache. This
> results in all packages using the same, persistent db, even on package
> rebuild, which leads to permissions errors. Making the assignment
> unconditional corrects this problem.

I can't tell if this change would impact the use of useradd.bbclass, 
which also sets PSEUDO_LOCALSTATEDIR in certain circumstances. Mark, can 
you comment on whether this is a valid concern?

Scott

>
> Signed-off-by: James Limbouris<james@digitalmatter.com.au>
> ---
>   meta/conf/bitbake.conf |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 6f0b42c..9a9ab53 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -557,7 +557,7 @@ SRCPV = "${@bb.fetch2.get_srcrev(d)}"
>   SRC_URI = "file://${FILE}"
>
>   # Use pseudo as the fakeroot implementation
> -PSEUDO_LOCALSTATEDIR ?= "${WORKDIR}/pseudo/"
> +PSEUDO_LOCALSTATEDIR = "${WORKDIR}/pseudo/"
>   FAKEROOTENV = "PSEUDO_PREFIX=${STAGING_DIR_NATIVE}${prefix_native} PSEUDO_LOCALSTATEDIR=${PSEUDO_LOCALSTATEDIR} PSEUDO_PASSWD=${STAGING_DIR_TARGET} PSEUDO_NOSYMLINKEXP=1 PSEUDO_DISABLED=0"
>   FAKEROOTDIRS = "${PSEUDO_LOCALSTATEDIR}"
>   PREFERRED_PROVIDER_virtual/fakeroot-native ?= "pseudo-native"


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


