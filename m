Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7E8807E422
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Aug 2019 02:59:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7H2wEGu013800
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 16 Aug 2019 19:58:50 -0700
Received: from [192.168.10.15] (172.25.59.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Fri, 16 Aug 2019 19:58:27 -0700
To: <richard.purdie@linuxfoundation.org>, Khem Raj <raj.khem@gmail.com>
References: <20190816210605.62377-1-jason.wessel@windriver.com>
	<CAMKF1sqc4M-0ykKNhAao+sQk9WXwetqX4P6VLh44ypCv1LZKtA@mail.gmail.com>
	<283ea4a282885878d26308925690e3428a08c841.camel@linuxfoundation.org>
	<CAMKF1sqMA37YFn4QRC7-60aKNoADsU7D8asW8Cmzu0zZhCe5iA@mail.gmail.com>
	<4c57097b88e7267dbe2123a844dfe4f014b48342.camel@linuxfoundation.org>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <03ecd668-28cb-bd79-0a66-ba8deedacba0@windriver.com>
Date: Fri, 16 Aug 2019 21:45:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <4c57097b88e7267dbe2123a844dfe4f014b48342.camel@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 1/2] cross-localedef-native: Add hardlink resolver from util-linux
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
X-List-Received-Date: Sat, 17 Aug 2019 02:59:33 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 8/16/19 4:50 PM, richard.purdie@linuxfoundation.org wrote:
> On Fri, 2019-08-16 at 14:29 -0700, Khem Raj wrote:
>> On Fri, Aug 16, 2019 at 2:25 PM Richard Purdie
>> <richard.purdie@linuxfoundation.org> wrote:
>>> This was discussed on IRC. We really really want to avoid that as a
>>> dependency if we care about build performance. Its really easy to
>>> just
>>> add that in but the implications are significant :(
>>>
>> A captured version of this utility would also mean that we have to
>> keep this in sync for bug fixes and security fixes etc. which could
>> also be considered as expense, so how much do we lose if util-linux-
>> native is brought early into dependency chain?
> The tool is being used for a specific purpose at build time. Its not
> exposed on target and its use is extremely constrained to a specific
> set of files where its behaviour should be deterministic.
>
> As such, yes there are questions about bug fixes and about security but
> I don't think its going to be a serious burden. We'd need to carry this
> until such times as the host systems we support have hardlink which is
> probably a few years out but will arrive.
>
> The impact of having util-linux-native in the dependency graph at this
> point is significant. I say that as someone who has done a lot of work
> in trimming down the times of our bootstrap process. This is exactly
> the kind of dependency I've removed and avoided.
>
> glibc is special in that its the worst choke point on the dependency
> graph. Nothing to do with target binaries happens until it is ready and
> then gcc-runtime can build. Whilst the locales are split from glibc,
> they are still connected in the task graph for packaging purposes so
> this is important.
>
> Its been pointed out there are other places where util-linux-native has
> crept in, in particular python3-native. My preference would be to
> minimise these dependencies rather than use them as a way to justify
> adding it here too.


So what is the consensus here?   Can we require the host system to have hardlink?   It is available as a stand alone binary on Ubuntu 14.04 and up and on Fedora systems, but isn't installed by default, and we'd have to check the version because the arguments sadly are slightly different.   We could certainly make util-linux a dependency, but that is why this patch existed, in order to avoid the dependency.

I did find a python version at https://raw.githubusercontent.com/akaihola/hardlinkpy/master/hardlink.py. I made a one line modification to it and it works, but it isn't nearly as efficient.  The proof is below, using the same locale-tree each time.  It is important to look at both the real and user time.  The difference gets more significant when you run it under pseudo, where we expect it to run 100% of the time.  It is roughly 10x slower to do this in python.


time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v locale-tree
Directories:         982
Objects:            7441
Regular files:      6441
Comparisons:        3331
Linked:             3109
Saved:         754675712

real    0m0.641s
user    0m0.120s
sys     0m0.518s

time python3 hardlink.py -v 0 -c locale-tree


Hard linking Statistics:
Directories           : 982
Regular files         : 6441
Comparisons           : 31884
Hardlinked this run   : 3109
Total hardlinks       : 3109
Bytes saved this run  : 744089843 (709.619 mebibytes)
Total bytes saved     : 744089843 (709.619 mebibytes)
Total run time        : 2.124422073364258 seconds

real    0m2.180s
user    0m1.220s
sys     0m0.953s


============Now lets run it under pseudo ================

time recipe-sysroot-native/usr/bin/cross-localedef-hardlink -c -v locale-tree
Directories:         982
Objects:            7441
Regular files:      6441
Comparisons:        3331
Linked:             3109
Saved:         754675712

real    0m2.505s
user    0m0.373s
sys     0m1.286s

time python3 hardlink.py -v 0 -c locale-tree


Hard linking Statistics:
Directories           : 982
Regular files         : 6441
Comparisons           : 31884
Hardlinked this run   : 3109
Total hardlinks       : 3109
Bytes saved this run  : 744089843 (709.619 mebibytes)
Total bytes saved     : 744089843 (709.619 mebibytes)
Total run time        : 12.971824884414673 seconds

real    0m13.046s
user    0m3.633s
sys     0m5.192s



