Return-Path: <rbilovol@cisco.com>
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
	by mail.openembedded.org (Postfix) with ESMTP id C90546178A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Mar 2020 11:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=1736; q=dns/txt; s=iport;
	t=1583409223; x=1584618823;
	h=subject:from:to:references:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=Y0r5QFXkmyk8lji0JmKsPzjOJk07JxECEThFXqIsbdQ=;
	b=JG0B41zsbDCJkoN24IA0jsFaDaNo04mRQp4+LZGXTa8hHpxSHvmmeunV
	phUyc76NhxY4l6VX4CqdAcJyqd6uycG9P+44UcFJGxjlXnbjzml71maga
	657FUOd2G43eqjoz1xnrULZlCuToixs+aRG/pfhOO1Lfo28WpwKAJK8C+ w=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D5AABB52Be/xbLJq1mGwEBAQEBAQE?=
	=?us-ascii?q?FAQEBEQEBAwMBAQGBe4MVVAEgEiqEFYkDh2olgQGaPQkBAQEMAQEfEAQBAYR?=
	=?us-ascii?q?DAoIvOBMCAwEBCwEBBQEBAQIBBQRthVYMhWQBBSMVUQsOCgICJgICVwYBDAY?=
	=?us-ascii?q?CAQGDIgGCe6w9dYEyiQyBPhR6KoxBgUE/gREnDIIsNT6EEoNKgl4El2CYQYJ?=
	=?us-ascii?q?Gh1KPDgYcg0mLR4wkjnWbTQIECwIVgWkigVgzGggbFYMnCUcYDZdYhQ8/AzA?=
	=?us-ascii?q?CjECCQwEB?=
X-IronPort-AV: E=Sophos;i="5.70,517,1574121600"; d="scan'208";a="24056553"
Received: from aer-iport-nat.cisco.com (HELO aer-core-4.cisco.com)
	([173.38.203.22])
	by aer-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA;
	05 Mar 2020 11:53:40 +0000
Received: from [10.63.15.135] ([10.63.15.135]) (authenticated bits=0)
	by aer-core-4.cisco.com (8.15.2/8.15.2) with ESMTPSA id 025Brd3d016892
	(version=TLSv1.2 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 5 Mar 2020 11:53:39 GMT
From: Ruslan Bilovol <rbilovol@cisco.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org, xe-linux-external@cisco.com
References: <1545427980-17876-1-git-send-email-rbilovol@cisco.com>
Message-ID: <91749d3c-5074-0129-ea6a-1f85d787fbd3@cisco.com>
Date: Thu, 5 Mar 2020 13:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1545427980-17876-1-git-send-email-rbilovol@cisco.com>
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Authenticated-User: rbilovol
X-Outbound-SMTP-Client: 10.63.15.135, [10.63.15.135]
X-Outbound-Node: aer-core-4.cisco.com
Subject: Re: [PATCH] openssl: pass PERL=perl environment variable to configurator
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
X-List-Received-Date: Thu, 05 Mar 2020 11:53:42 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

It seems this patch was forgotten and master moved forward.

Will resend it from latest master

Thanks,
Ruslan

On 12/21/18 11:33 PM, Ruslan Bilovol wrote:
> In our build environment we use wrapper script
> for perl in non-standard configuration with
> extra variables set (provided by custom
> buildtools-tarball).
> 
> In this case openssl fails to build because
> by default it's Configure script detects and uses
> perl executable directly (with absolute path)
> obviously missing extra settings from wrapper
> script.
> 
> Pass PERL=perl environment variable to Configure,
> so it won't try to use perl executable directly
> but will use what is provided from environment.
> 
> Signed-off-by: Ruslan Bilovol <rbilovol@cisco.com>
> ---
>   meta/recipes-connectivity/openssl/openssl_1.1.1a.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> index 5c4e69c..6a72b5c 100644
> --- a/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> +++ b/meta/recipes-connectivity/openssl/openssl_1.1.1a.bb
> @@ -112,7 +112,7 @@ do_configure () {
>   	fi
>   	# WARNING: do not set compiler/linker flags (-I/-D etc.) in EXTRA_OECONF, as they will fully replace the
>   	# environment variables set by bitbake. Adjust the environment variables instead.
> -	PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
> +	PERL=perl PERL5LIB="${S}/external/perl/Text-Template-1.46/lib/" \
>   	perl ${S}/Configure ${EXTRA_OECONF} ${PACKAGECONFIG_CONFARGS} --prefix=$useprefix --openssldir=${libdir}/ssl-1.1 --libdir=${libdir} $target
>   	perl ${B}/configdata.pm --dump
>   }
> 

