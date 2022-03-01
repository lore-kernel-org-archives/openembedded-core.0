Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Message-ID: <411d4cd4-3be5-2b79-1341-79d326da4970@gmail.com>
Date: Tue, 1 Mar 2022 11:50:06 -0800
MIME-Version: 1.0
Subject: Re: [OE-core] [PATCH 1/1] go.bbclass: Allow network in do_compile
References: <CADkTA4N0NaDoS5e5+E92vkNXdQ9AsUxc7zH=Sd+9X=hcq3BPhQ@mail.gmail.com>
 <3986.1646150091898772204@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
In-Reply-To: <3986.1646150091898772204@lists.openembedded.org>
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: lukas.funke@weidmueller.com, openembedded-core@lists.openembedded.org



On 3/1/22 7:54 AM, lukas.funke@weidmueller.com wrote:
> On Tue, Mar 1, 2022 at 02:14 PM, Bruce Ashfield wrote:
> 
>     On Tue, Mar 1, 2022 at 6:42 AM Andrei Gherzan <andrei@gherzan.com>
>     wrote:
> 
> 
>         On Tue, 1 Mar 2022, at 01:55, Bruce Ashfield wrote:
> 
>             On Mon, Feb 28, 2022 at 8:17 PM Bruce Ashfield via
>             lists.openembedded.org
>             <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> 
> 
>                 On Mon, Feb 28, 2022 at 6:54 PM Andrei Gherzan
>                 <andrei@gherzan.com> wrote:
> 
> 
>                     From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
>                     Compile pulls in the go.mod list requiring network.
>                     Without this, do
>                     compile would fail with a similar error to the
>                     following:
> 
>                     dial tcp: lookup proxy.golang.org: Temporary failure
>                     in name resolution
> 
>                 This is something that needs to be carried in your own
>                 layers, IMHO it
>                 isn't appropriate for core.
> 
>                 It isn't about the fetching, it is the entire gap in
>                 functionality
>                 that we are missing if go starts fetching dependencies
>                 during compile.
> 
>             A further thought is that if this is for go.mod issues,
>             there is the
>             go-mod.bbclass.
> 
>             Perhaps enabling it in that class and doing a bbwarn about
>             go fetching
>             dependencies would be appropriate ?
> 
>             Otherwise, someone may not know that this is happening and
>             that a no
>             network configuration has no chance of working.
> 
>         I reckon that is reasonable. I'll personally go down the recipe
>         level to workaround this change but understanding and agreeing
>         with the reasoning behind this change, I want to invest a bit
>         into trying to find a proper solution in the core. Bruce, I know
>         you invested a fair amount of time into this already. Would you
>         be willing to sync up and see how we can work together in
>         tackling this?
> 
>     Definitely, more ideas are good. In fact, I think there are probably
>     several approaches that can co-exist, depending on what a
>     recipe/developer needs.
> 
>     I'm in the Eastern time zone here, and will try and grab folks on IRC
>     to have a level set
> 
>     Bruce
> 
>         Added Zyga to CC as he is also interested in this as part of his
>         go development activities.
> 
>         Thanks,
>         Andrei
> 
> 
> 
>     -- 
>     - Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end
>     - "Use the force Harry" - Gandalf, Star Trek II
> 
> The problem in allowing downloads during compile (e.g. by go) is, that 
> it leads to non-reproducable builds. I'm currently facing the same issue 
> and would like to have a reproducable go *offline* build.
> I would like to propose two ideas to workaround the go-compile fetching 
> issue:
> First:
> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. 
> by writing a seperate go fetcher or a wget-fetcher) and unpack the 
> dependencies into go projects 'vendor' folder. This forces go to compile 
> offline. However, one have to generate the 'modules.txt' file in the 
> vendor folder 'manually' during unpack. This is error prone, as there is 
> no official documentation how this format should look like. Anyway, I've 
> tried this approach and it works for me.
> Second:
> - Fetch go-dependencies using go.mod file from 'proxy.golang.org' (e.g. 
> by writing a seperate go fetcher) and unpack the dependencies into a 
> local (workdir) go-path. This seemed a good solution for me as the 
> go-path is well defined. But for some reason 'go'  fetches the zip-files 
> during compile into it's download-cache AGAIN, even if the source is 
> already unpacked in the go-path. I'll assume this is required to verify 
> the source files integrity?! With this approach one have to adapt 'go' 
> to suppress this download behaviour.
> Please let me know your opinion on these two approaches.
> 


Second approach is more tenable, go community has larger plans for go 
modules, so it will be good for bitbake to delegate work to it rather 
than doing parallel duplicate work, that will mean we will have to keep 
up with go mod changes always.

> 
> 
> 
