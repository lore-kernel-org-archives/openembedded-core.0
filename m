Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E1ECE6ADA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 01:29:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r6C1T80G023577
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 18:29:09 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 18:29:08 -0700
Message-ID: <51DF5BE3.8090803@windriver.com>
Date: Thu, 11 Jul 2013 20:29:07 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1373590411-6276-1-git-send-email-sgw@linux.intel.com>
In-Reply-To: <1373590411-6276-1-git-send-email-sgw@linux.intel.com>
Subject: Re: [PATCH] ncurses: add xterm-256color to terminfo-base
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
X-List-Received-Date: Fri, 12 Jul 2013 01:29:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/11/13 7:53 PM, Saul Wold wrote:
> This is to address the buildtools-tarball still having problems with certain
> xterms
>
> [YOCTO #4835]

This is a reasonable workaround, but the real problem seems to be that nativesdk 
python/ncurses return crap (strings with embedded control codes) when they don't 
know what the TERM is.  I think this is the real underlying problem that needs 
to be fixed, unfortunately I have no idea what the cause is.

The alternative is to somehow enforce terminal settings when using the 
buildtools-tarball are one of the known terminals.

--Mark

> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>   meta/recipes-core/ncurses/ncurses.inc |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
> index 2ed1bba..671daf8 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -174,7 +174,7 @@ shell_do_install() {
>
>           # include some basic terminfo files
>           # stolen ;) from gentoo and modified a bit
> -        for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86
> +        for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86 xterm-256color
>           do
>                   local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
>                   local basedir="$(basename $(dirname "${termfile}"))"
>


