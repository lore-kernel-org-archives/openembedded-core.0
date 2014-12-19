Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C4D7172922
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 12:42:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJCfOcZ012285; Fri, 19 Dec 2014 12:41:24 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bbgn_Jw-ZL8c; Fri, 19 Dec 2014 12:41:24 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJCfBcT012280
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Dec 2014 12:41:23 GMT
Message-ID: <1418992908.13316.14.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Dec 2014 12:41:48 +0000
In-Reply-To: <1418984914.13316.6.camel@linuxfoundation.org>
References: <1418984914.13316.6.camel@linuxfoundation.org>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: Re: Merging problems
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
X-List-Received-Date: Fri, 19 Dec 2014 12:42:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-12-19 at 10:28 +0000, Richard Purdie wrote:
> I want to give people a headsup that we're having problems merging
> changes at the moment. We've been doing our best but the number of
> things building up which are causing issues is overwheling our ability
> to fix and stablise the build. It wasn't helped that I took a long
> weekend's vacation last weekend. There are changes being made or tested
> to the autobuilder which also isn't helping.
> 
> The kernel series has several issues:
> 
>   * a random failure in do_kernel_configme [i]

I think I have a handle on this. If you look at the autobuilder failure
it says:

| [INFO] Configuring target/machine combo: "standard/qemuppc"
| [INFO] collecting configs in patches/meta-series

and what concerns me is "patches/meta-series". I my local builds it
says .meta/meta-series. Poking around kern-tools I see:

"""
# determine the meta directory name. The meta directory is at the top level
# of the repository, and is untracked.
meta_dir_options=`git ls-files -o --directory`
for m in $meta_dir_options; do
    if [ -d "$m" ]; then
	meta_dir=`echo $m | sed 's%/%%'`
    fi
done

if [ -z "$meta_dir" ]; then
    meta_dir=".meta"
fi
"""

which means that if a "patches" directory exists it will use it since
the command looks for untracked directories. I also noticed that some
places define the default as ".meta", some as "meta" and they look a bit
confused but that is probably a separate issue.

The question is then how does a "patches" directory end up in the kernel
source. I was able to create one with the commands:

MACHINE=qemuppc bitbake linux-yocto perf -c clean
MACHINE=qemuppc bitbake linux-yocto -c patch
MACHINE=qemuppc bitbake perf -c unpack
MACHINE=qemuppc bitbake linux-yocto -c kernel_configme

which doesn't fail like the autobuilder but does put the metadata into
the wrong place with the wrong data (into patches). I'm therefore
guessing this is a big horrible race.

Why does perf -c unpack create a patches directory? base.bbclass has:

do_unpack[cleandirs] = "${S}/patches"

The fix is therefore probably to not run the fetch/unpack/patch tasks in
kernelsrc.bbclass.

Cheers,

Richard



