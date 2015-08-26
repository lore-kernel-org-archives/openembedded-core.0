Return-Path: <joshua.lock@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [93.93.135.160])
	by mail.openembedded.org (Postfix) with ESMTP id 56A5F734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Aug 2015 08:41:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: joshuagl) with ESMTPSA id 131B0608F40
To: openembedded-core@lists.openembedded.org
References: <1440521935.12105.438.camel@linuxfoundation.org>
From: Joshua Lock <joshua.lock@collabora.co.uk>
Message-ID: <55DD7BAD.8040505@collabora.co.uk>
Date: Wed, 26 Aug 2015 09:41:17 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <1440521935.12105.438.camel@linuxfoundation.org>
Subject: Re: [PATCH] os-release: Exclude DATETIME from sstate signature
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
X-List-Received-Date: Wed, 26 Aug 2015 08:41:23 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 25/08/15 17:58, Richard Purdie wrote:
> I'm torn over this, I can see someone wanting this to vary in each
> build. What pushed me to believe its incorrect in its current form
> is that it changes for every MACHINE build, making a complete mess
> if you try and generate package feeds using it.

It's also worth pointing out that the BUILD_ID isn't included in the 
generated os-release file unless you add BUILD_ID to OS_RELEASE_FIELDS.

I'm personally not certain whether DATETIME makes sense as BUILD_ID a 
multi-MACHINE distro anyway.

Cheers,

Joshua

> The alternative would be to give up on allarch in this case and make
> it MACHINE specific which at least would then be more consistent when
> the package makes it to a package feed. If someone wants to do that,
> the can propose another patch but this change at least make package
> feed usage 'sane' again and avoids the perpetual rebuilds.
>
> Incidentally, its worth noting that changes in source metadata revision
> used for the build and included in this recipe would still trigger
> rebuilds which is likely the common use case people actually care about.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> diff --git a/meta/recipes-core/os-release/os-release.bb b/meta/recipes-core/os-release/os-release.bb
> index 87fea6f..10a4570 100644
> --- a/meta/recipes-core/os-release/os-release.bb
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -21,6 +21,7 @@ VERSION = "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if 'DISTRO_CODENAME' in
>   VERSION_ID = "${DISTRO_VERSION}"
>   PRETTY_NAME = "${DISTRO_NAME} ${VERSION}"
>   BUILD_ID ?= "${DATETIME}"
> +BUILD_ID[vardepsexclude] = "DATETIME"
>
>   python do_compile () {
>       with open(d.expand('${B}/os-release'), 'w') as f:
>
>


