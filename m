Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Q6vZ1-0003po-M6
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 04:00:15 +0200
Received: by pzk35 with SMTP id 35so1513013pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Apr 2011 18:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=hMT7FhSZyB1I5dN8e9m/XIo5u4Ctqzoo0C1peKeXeKY=;
	b=JohoNUeilwQvFUEQ/ySnaVHcKqTi3KNOWgwAtoh5qlQvM4Do543vFXRS/dn+kNGX6m
	FrJ4pZEMzrm6eEm+FuAKezQT0euyfvrmdAJsmHbHlwA3W3pLFfKLiYQL8dwyvJtnnYZ6
	RT4QzJ/8xawmzehGmFBf1xE6/8Y1ESab51N4Y=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=wDuZfMwECDfkzSvtZvGzR/fZJRcTis70xbvZ4PD4aieOCpuyPxtW4i4k2zqn812VYS
	JZNhFA1DelNx69bYvaq0sfm3OHcRUZ3TY63wnE5+EVfMJqY0/oy0YKnl701AsLwy3WGz
	aDNMNTuz39Mf1+9PAY5FLtZunI/rIygpSacKo=
Received: by 10.142.242.12 with SMTP id p12mr635411wfh.413.1301968689587;
	Mon, 04 Apr 2011 18:58:09 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id n4sm8321271wfl.2.2011.04.04.18.58.07
	(version=SSLv3 cipher=OTHER); Mon, 04 Apr 2011 18:58:08 -0700 (PDT)
Message-ID: <4D9A772C.4070409@gmail.com>
Date: Mon, 04 Apr 2011 18:58:04 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1301665368.git.josh@linux.intel.com>
	<43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
In-Reply-To: <43e615baf63929e99aacd8d2a0927c9d3f342fb6.1301665368.git.josh@linux.intel.com>
Subject: Re: [PATCH 1/7] elfutils: fix builds with gcc 4.6
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
X-List-Received-Date: Tue, 05 Apr 2011 02:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/2011 6:51 AM, Joshua Lock wrote:
> From: Joshua Lock<josh@linux.intel.com>
>
> gcc 4.6 (as used in Fedora 15) adds some extra warnings which are
> included with Werror. The new unused-but-set variable warning causes
> an error in libasm of elfutils. Work around this by removing
> unused-but-set from Werror.
>
> Signed-off-by: Joshua Lock<josh@linux.intel.com>
> ---
>   meta/recipes-devtools/elfutils/elfutils_0.148.bb |    4 ++++
>   1 files changed, 4 insertions(+), 0 deletions(-)
>
> diff --git a/meta/recipes-devtools/elfutils/elfutils_0.148.bb b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> index b2f700e..c395be8 100644
> --- a/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> +++ b/meta/recipes-devtools/elfutils/elfutils_0.148.bb
> @@ -40,6 +40,10 @@ SRC_URI += "\
>
>   inherit autotools
>
> +# GCC 4.6.0 raises an unused-but-set warning in libasm, for now remove
> +# this warning from Werror
> +CFLAGS_virtclass-native += "-Wno-error=unused-but-set-variable"
> +

unused-but-set-variable is a new option in gcc 4.6 which means this will 
cause problems with older gcc's as they wont recognize this option and 
not all distros have gcc 4.6
as base compiler. Have you tried compiling this patchset on a build 
machine which has older gcc ? say 4.5

>   EXTRA_OECONF = "--program-prefix=eu-"
>
>   do_configure_prepend() {



