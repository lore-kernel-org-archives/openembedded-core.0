Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1293E7E684
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Sep 2019 17:52:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x8PHqBp8003673
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Sep 2019 10:52:12 -0700 (PDT)
Received: from [172.25.44.5] (172.25.44.5) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 25 Sep 2019 10:52:11 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <20190924024508.9175-1-Randy.MacLeod@windriver.com>
	<20190924101823.GC16793@localhost>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <f0d73756-d4ad-e011-5dcd-8ac21f54a6f1@windriver.com>
Date: Wed, 25 Sep 2019 13:52:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190924101823.GC16793@localhost>
X-Originating-IP: [172.25.44.5]
Cc: stevenrwalter@gmail.com, cardoe@cardoe.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH 0/3] Move rust from meta-rust to oe-core
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
X-List-Received-Date: Wed, 25 Sep 2019 17:52:22 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 9/24/19 6:18 AM, Adrian Bunk wrote:
> On Mon, Sep 23, 2019 at 10:45:05PM -0400, Randy MacLeod wrote:
>> I moved the Rust support from meta-rust to oe-core.
>>
>> As you'd expect, it's still building rust-hello-world for all qemus
>> (except riscv64 which may never have worked).
>> Rust-hello-world runs for me on qemu:
>>     x86-64, arm, arm64
>> It may run on other machines but that's what I've tested so far.
>>
>> We need a list of meta-rust issues that should be resolved
>> in order to get the code accepted in oe-core. I opened an issue
>> to track that:
>>     https://github.com/meta-rust/meta-rust/issues/251
>> but there haven't been any comments yet. I'd rather track
>> issues in github than in the YP Bugzilla:
>>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675
>>
>> Here, in no particular order, are some of
>> the defects that I believe need to be fixed:
>>
>> 1. build system is assumed to be linux-x86_64
>>     https://github.com/meta-rust/meta-rust/issues/23
>>
>> 2. Make rust-native build in parallel (it's very slow!)
>>     (meta-rust issue/PR to be created by Randy)
>>
>> 3. Document developer workflows such as cargo-bitbake.
> 
> Is there consensus on how libraries should be handled in general for
> various ecosystems?
> 
> Precedent with C, Python and Perl are recipes for each library,
> but vendoring seems to be a popular option now.

I'm not sure what vendoring means here.
I assume that you don't want the list of crates to be part of
package FOO's SRC_URI but instead want recipes for each crate.
For languages that do dynamic module linking by default, this saves
storage space, build time and maintenance. Rust is not such a language
by default but I need to learn more about it's dynamic
linking support:  https://doc.rust-lang.org/reference/linkage.html

I'm not sure if storage would be duplicated with the cargo
class managing downloads for Rust packages. I'll check on that.
Separate recipes would be significantly more work but we certainly
need to understand how to fix a bug in one crate and have that
applied to all N users of the crate without modifying N recipes.

Doug Goldstein, wrote most of cargo-bitbake,
so it would be good to hear his point of view.

FYI: Cargo-bitbake ( https://github.com/cardoe/cargo-bitbake )
is a "cargo extension that can generate BitBake recipes
       utilizing the classes from meta-rust"
There is a 'simple' example in:
   https://github.com/cardoe/cargo-bitbake/blob/master/README.md

> 
> There are also related topics like how to provide security support
> for vendored libraries - this is the main reason why vendored libraries
> shipped by upstream are rarely used by distributions in the C ecosystem.

Yes, we need to have a plan for security and bug fixes.
Of course Rust is largely impervious to such 20th century problems.
(mostly joking!)

> 
>> 4. Build offline ( BB_NO_NETWORK = '1' )
>>
>> 5. make rust-hello-world install for qemuriscv64
>>     https://github.com/meta-rust/meta-rust/issues/252
> 
> LLVM in meta-rust is too old for RISC-V.

Right.
I'm away Thursday to Sunday but
I'll work on a fix for that when I'm back.

> 
> Using an own LLVM recipe might makes sense for an external layer, but in
> oe-core the llvm recipe that is already there should be used instead of
> another copy of LLVM.

I agree that the goal should be to have a single llvm package but
it's an upstream Rust decision. I did look at the differences between
the 'forks' and they are significant. The good news is that  the
llvm-rust code is maintained on it's own branch with the master
branch being pristine so it's possible that we could use the rust
repo to save on download time and storage and have the different recipes
checkout their respective branches until the unification takes place.
See: https://github.com/llvm/llvm-project/branches

> 
>> 6. ... build rustc and cargo for target (nice to have, only).
>>     https://github.com/meta-rust/meta-rust/issues/81
>>
>> 7. Bootstrap from C as an option?
>>     See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=12675#c2
>>
>> 8. Update librsvg to latest (2.46) which uses rust.
> 
> 2.44 built for me a few months ago with meta-rust.

Can you share the recipe so I can use it and update it to 2.46?

> 
>> What have I missed?
>> ...
> 
> 9. Ensure that there are no non-optional dependencies on the target
>     librsvg since users will build for targets not supported by Rust.
>     The one in webkitgtk seems to be optional or obsolete.

I don't understand what you are referring to. Perhaps a link to a line
in your 2.44 recipe, would help.

Good point about Rust's more limited target support:
    https://forge.rust-lang.org/release/platform-support.html
To get started in oe-core, we just need to fix riscv64 it seems.

To deal with such targets, we'd keep the old version of librsvg
around for a while longer. That could cascade into several
packages with duplicate versions in oe-core so it may be best handled
with a separate layer.
> 
> 10. Review the whole contents of the layer.
>      There are several things where I hope there are better solutions,
>      and I expect that what will land in oe-core will look quite
>      different from the current meta-rust.
>      See item 5 above for an example.

Yes, if we require separate bitbake recipes for each package
that would require significant changes to the current layer.


Thanks,

../Randy

> 
>> ../Randy
>> ...
> 
> cu
> Adrian
> 


-- 
# Randy MacLeod
# Wind River Linux

