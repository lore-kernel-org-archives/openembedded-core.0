Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 46C0260125
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2016 09:45:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4J9jDmR032076
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 May 2016 02:45:13 -0700
Received: from [128.224.162.214] (128.224.162.214) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 19 May 2016 02:45:12 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <573C0726.3040402@windriver.com>
	<CA+chaQdJPWncYizZAKZ8MHOCqYRn+oKGcDuPhKVoepQhKh+LwQ@mail.gmail.com>
	<573C21EE.8040104@windriver.com> <20160518092029.GA2579@jama>
	<573C365D.3070407@windriver.com> <20160518101556.GB2579@jama>
	<573D260D.2020909@windriver.com>
	<CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <573D8B27.9020804@windriver.com>
Date: Thu, 19 May 2016 17:45:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <CA+chaQcuBXZ55wcAbzjCVEc1Xsq0UZ4obj=r5PsQt6bA57ZQAQ@mail.gmail.com>
Cc: oe-core <openembedded-core@lists.openembedded.org>
Subject: Re: PRServer's problem
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
X-List-Received-Date: Thu, 19 May 2016 09:45:15 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Martin,

On 05/19/2016 04:47 PM, Martin Jansa wrote:
> As the commit says, small change in package.bbclass also causes all packages to
> be recreated with PR bump even when the content is most likely the same.

That is another case we need work on.

>
> Fixing bug in gcc may at least provide different binaries so it might be useful
> to upgrade them on target (or at least distinguish if they were already rebuilt
> with fixed gcc-cross or not).

The binary might be different when the compiler fixed a bug, but that may don't
make any sense to the end user. AFAIK, ccache doesn't check /path/to/gcc's hash
value.

>
> Reverting the commit doesn't fix the issue that sstate handler cannot compare if
> the change in signature produced "significantly different" binaries. If it's
> reverted in oe-core I'll just revert the revert in our builds, because we care
> about reproducible builds and we already gave up on working upgrade paths, which
> are broken too often anyway.

Be less or more stricter is a hard problem, so we'd better let's leave this
choice to the end user, something like DROP_NATIVE_SIG ? = "0/1" would help.

I'm afraid that there is nearly nothing we can do to enhance PR server's
user experience based on the current stricter mode. Think about the
distros like Debian, CentOS, Opensuse and so on, their
"apt-get/yum/yast upgrade" never re-install all the pkgs, but the distros
built out by oe-core usually does (especially, when a patch is applied to
a native recipe, then all pkgs are downloaded and re-installed, it's very hard
to explain such a problem to the distro's user).

// Robert

>
> Reflash of "system" partitions and storing user data/configuration somewhere
> else is faster and safer since the sstate was invented (since we stopped using
> OE classic). You can find some rant e-mails from me about this e.g.
> http://lists.openembedded.org/pipermail/openembedded-core/2011-November/051354.html
> and the Yocto bug I gave you.
>
> Regards,
>
> On Thu, May 19, 2016 at 4:33 AM, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>
>     Hi Martin,
>
>     I found this patch in the bug:
>
>     http://git.openembedded.org/openembedded-core/commit/meta/lib/oe/sstatesig.py?id=336a7897e39b9e42dcfcba9e2520ea96b0c6a8d6
>
>     Too many PR bumps and rebuildings are caused by this patch. I'm
>     not very sure about what this patch tries to fix, it seems that
>     it is trying to fix problems when 32bit and 64bit uses the same
>     sstate cache? Would you please provide a simple reproducer, please?
>
>     Things will become much better after revert this patch. Be less
>     stricter or more is a hard problem, if we still need the patch,
>     can we leave such a choice to the end user? We can add some vars
>     like DROP_NATIVE_SIG ? = "0/1". This would be good to the end user
>     who uses stable release like jethro or krogoth to make their
>     distributions, and PR Service really matters here. Even if they
>     switch the build between 32 and 64 builds (This is unlikely to
>     happen for production environment) and got problems, they still
>     can fix the problem by rebuilding, this is still much better than
>     current status: run a "smart/opkg/apt-get upgrade" on the target,
>     *all* of the packages are downloaded and installed again after a
>     CVE patch applies on native recipes like pseudo-native or rpm-native,
>     but in fact, nothing is changed on the target this is really a bad
>     experience.
>
>     // Robert
>
>
>     On 05/18/2016 06:15 PM, Martin Jansa wrote:
>
>         On Wed, May 18, 2016 at 05:31:09PM +0800, Robert Yang wrote:
>
>
>
>             On 05/18/2016 05:20 PM, Martin Jansa wrote:
>
>                 On Wed, May 18, 2016 at 04:03:58PM +0800, Robert Yang wrote:
>
>                     Hi Martin,
>
>                     On 05/18/2016 03:39 PM, Martin Jansa wrote:
>
>                         See:
>                         https://bugzilla.yoctoproject.org/show_bug.cgi?id=5970
>
>                         Just using recipe checksum wont work, because the main
>                         reason for PR bumps is to
>                         automatically upgrade the packages when one of the
>                         dependencies changes .so
>                         version, which you won't detect from recipe checksum of
>                         the app which is just
>                         using the library.
>
>
>                     For the development branch like master, yes, that would
>                     happen. But for
>                     the stable release like jethro and krogoth, it is unlikely
>                     that would
>                     happen, and if if does, the user can manually bump the
>                     impacted recipe's
>                     PR to fix the problem. The current problem is that when
>                     *all* recipes'
>                     PR are bumped, there is no way to fix the problem.
>
>
>                 You can still stop using PR service and start doing manual PR
>                 bumps, but
>
>
>             We can't stop PR service and start doing manual PR bumps since we
>             need keep
>             update to date with upstream, the changes from upstream don't do the
>             manual
>             PR, and I don't think that we have to if they can be done automatically.
>
>                 it's quite annoying if you need to bump a lot of recipes you don't
>                 control :).
>
>
>             What's your opinion about only consider RDEPENDS for PR service's
>             checksum,
>             please ?
>
>
>         I would like to have separate handler as described in that bug, option
>         c).
>
>         Not only because of unnecessary EXTENDPRAUTO bumps, but also unnecessary
>         rebuilds.
>
>                         On Wed, May 18, 2016 at 8:09 AM, Robert Yang
>                         <liezhi.yang@windriver.com
>                         <mailto:liezhi.yang@windriver.com>
>                         <mailto:liezhi.yang@windriver.com
>                         <mailto:liezhi.yang@windriver.com>>> wrote:
>
>                                The PRServer bumps PR according to do_package's
>                         task hash, that
>                                causes it bumps *all* packages' PR when recipes
>                         like pseudo-native
>                                and rpm-native is changed. It is a very bad user
>                         experience when we
>                                run "smart/opkg upgrade" on running target, for
>                         example, when we apply
>                                a CVE patch to pseudo-native or rpm-native, or do
>                         some slight changes
>                                in their do_compile, "smart/opkg upgrade" will
>                         download/install *all*
>                                the packages since all of the packages' PR are
>                         bumped.
>
>                                Here are some rough suggestions to fix this
>                         problem, and please feel
>                                free to give your suggestions.
>                                1) Do not use do_package's task for bumping PR,
>                         the easiest way
>                                    is simulate manually bump PR -- only bump PR
>                         when the recipe
>                                    itself's checksum is changed.
>
>                                2) Add a new task for PRServer, redefine its task
>                         hash for bumping
>                                    PR, for example, this task hash only
>                         considers RDEPENDS (no
>                                    DEPENDS), and drop any native dependencies.
>
>                                I prefer the first way, and an alternative way
>                         maybe add a var so that
>                                the user can configure it:
>                                PR_CHECKSUM = "${BB_TASKHASH}" (current way)
>                                Or
>                                PR_CHECKSUM = "<recipe checksum>"
>
>                                --
>                                Thanks
>
>                                Robert
>                                --
>                                _______________________________________________
>                                Openembedded-core mailing list
>                         Openembedded-core@lists.openembedded.org
>                         <mailto:Openembedded-core@lists.openembedded.org>
>                                <mailto:Openembedded-core@lists.openembedded.org
>                         <mailto:Openembedded-core@lists.openembedded.org>>
>                         http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
>
>
>

