Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 013DD706D9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jan 2015 09:20:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t089K1im019790; Thu, 8 Jan 2015 09:20:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 6_zGte6SbHFa; Thu,  8 Jan 2015 09:20:01 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t089JkHk019785
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 8 Jan 2015 09:19:57 GMT
Message-ID: <1420708823.25779.81.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Thu, 08 Jan 2015 09:20:23 +0000
In-Reply-To: <3fa1980018e080c112b0a92e98805a66beaa235c.1420642464.git.liezhi.yang@windriver.com>
References: <cover.1420642464.git.liezhi.yang@windriver.com>
	<3fa1980018e080c112b0a92e98805a66beaa235c.1420642464.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] guile: fixed installed-vs-shipped error
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
X-List-Received-Date: Thu, 08 Jan 2015 09:20:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-01-07 at 06:55 -0800, Robert Yang wrote:
> Fixed:
> guile-2.0.11: guile: Files/directories were installed but not shipped
>   /usr/lib64/libguile-2.0*-gdb.scm [installed-vs-shipped]
> 
> This is because when there is no file in the directory:
> for f in libguile-2.0*; do
>     [snip]
> done
> 
> The f would be libguile-2.0* itself, make sure the libs are installed
> firstly will fix the problem.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  .../guile/files/libguile-Makefile.am-depends.patch |   39 ++++++++++++++++++++
>  meta/recipes-devtools/guile/guile_2.0.11.bb        |    1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/guile/files/libguile-Makefile.am-depends.patch

Not sure if this is as a result of this patch or a different issue but
we saw:

https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64-lsb/builds/153/steps/BuildImages_1/logs/stdio

in a build containing this patch. Looks like some dependency is missing
and its trying to install the lib twice?

Cheers,

Richard


