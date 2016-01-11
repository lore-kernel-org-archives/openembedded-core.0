Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A32C2607A4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 16:25:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u0BGPgKx020378
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Jan 2016 08:25:42 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 11 Jan 2016 08:25:42 -0800
To: Christopher Larson <clarson@kergoth.com>
References: <cover.1452489034.git.liezhi.yang@windriver.com>
	<4f5f10ebe2593fb40fbb637978480d87d9697f40.1452489034.git.liezhi.yang@windriver.com>
	<5693C245.7060304@gmail.com> <5693C4EE.4040507@windriver.com>
	<CABcZANkU3GRDbP0UXkFkGfD8uS7BOKk4XKFcAr9HazbYwTjPBQ@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <5693D785.90907@windriver.com>
Date: Mon, 11 Jan 2016 10:25:41 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <CABcZANkU3GRDbP0UXkFkGfD8uS7BOKk4XKFcAr9HazbYwTjPBQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] glibc-initial.inc: use relative path to run configure
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
X-List-Received-Date: Mon, 11 Jan 2016 16:25:45 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

On 1/11/16 10:18 AM, Christopher Larson wrote:
> 
> On Mon, Jan 11, 2016 at 8:06 AM, Mark Hatle <mark.hatle@windriver.com
> <mailto:mark.hatle@windriver.com>> wrote:
> 
>     On 1/11/16 8:55 AM, Trevor Woerner wrote:
>     >
>     >
>     > On 01/11/16 00:11, Robert Yang wrote:
>     >> Avoid potential build path in output files.
>     >>
>     >> [YOCTO #8894]
>     >>
>     >> Signed-off-by: Robert Yang <liezhi.yang@windriver.com <mailto:liezhi.yang@windriver.com>>
>     >> ---
>     >>  meta/recipes-core/glibc/glibc-initial.inc |    2 +-
>     >>  1 file changed, 1 insertion(+), 1 deletion(-)
>     >>
>     >> diff --git a/meta/recipes-core/glibc/glibc-initial.inc b/meta/recipes-core/glibc/glibc-initial.inc
>     >> index 8e81f09..cb2f8dd 100644
>     >> --- a/meta/recipes-core/glibc/glibc-initial.inc
>     >> +++ b/meta/recipes-core/glibc/glibc-initial.inc
>     >> @@ -11,7 +11,7 @@ TOOLCHAIN_OPTIONS = " --sysroot=${STAGING_DIR_TCBOOTSTRAP}"
>     >>  do_configure () {
>     >>      (cd ${S} && gnu-configize) || die "failure in running gnu-configize"
>     >>      find ${S} -name "configure" | xargs touch
>     >> -    ${S}/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
>     >> +    ../git/configure --host=${TARGET_SYS} --build=${BUILD_SYS} \
>     >
>     > Although I haven't tested it, this _looks_ like it might fail quite
>     > readily. I'm sure there are some recipes that play tricks with ${S}, and
>     > what about recipes that don't pull their sources from git?
>     >
>     > Maybe something like: (cd ${S} && ./configure ...) would be better?
> 
>     That won't work since it'll run configure in the S directory.
> 
>     IF we need to use relative paths here, we need to calculate the relative path
>     from B to S and use that.  It looks like patch 2/2 already does something like
>     this using the python..  we can probably do the same.  (I don't know any reason,
>     at least for glibc, that all of the items won't be in the same "WORKDIR".  So it
>     would be relative within the WORKDIR, which SHOULD be fine.)
> 
> 
> Unless we want to specifically not support externalsrc (and therefore, devtool
> modify -x) for a particular recipe, we should probably not make the assumption
> that S and B are relative to WORKDIR :)

There ya go.  I didn't realize even with externalsrc and such that the code
wasn't copied or otherwise linked into the typical 'S' inside of WORKDIR.

So relative here is still potentially useful, but the problem being solved isn't
actually being solved in the end.  We're still ended up embedded specific paths
that are triggered QA errors because of the split S/B issue.

--Mark

> -- 
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics


