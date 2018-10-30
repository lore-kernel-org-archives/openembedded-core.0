Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2234979C22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2018 21:26:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w9ULPU8N030048
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 30 Oct 2018 14:25:46 -0700
Received: from server.local (128.224.22.151) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 30 Oct 2018 14:25:24 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1540870764-17849-1-git-send-email-bruce.ashfield@windriver.com>
	<CAJ86T=VNvLG06TaqUFpjJ6gqrY=H=eGrW5=FH+QxoCt5hbP0Pw@mail.gmail.com>
	<8b1fa587-7104-b842-72a5-7a175e9f137f@windriver.com>
	<CAJ86T=Wwwzjyp5bY1bsjHVD0dgoLCPJgFdTo_M1z0iWywEnkPw@mail.gmail.com>
	<CA+chaQcSu65UQbGQ-4NPZ4UHc-kFGyzRrrEkWG76j1ewMEQVng@mail.gmail.com>
	<ddd324b6-7d63-f5fa-f882-7b595ca93b78@windriver.com>
	<CA+chaQfXH50yrUqN_yTwEizOtwsqfMv9oBWm0nMZrMhtgFMr0g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b596f761-9af2-92e0-2a38-bcf8e94d5fb0@windriver.com>
Date: Tue, 30 Oct 2018 17:25:23 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQfXH50yrUqN_yTwEizOtwsqfMv9oBWm0nMZrMhtgFMr0g@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2][master-next] kernel: use olddefconfig as the primary target for KERNEL_CONFIG_COMMAND
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
X-List-Received-Date: Tue, 30 Oct 2018 21:26:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2018-10-30 5:13 PM, Martin Jansa wrote:
> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S} CC="${KERNEL_CC}" 
> O=${B} olddefconfig || yes '' | oe_runmake -C ${S} O=${B} 
> CC="${KERNEL_CC}" oldnoconfig"
> 
> It's the 2 apostrophes after "yes", which look like double quotes in the 
> font used in gmail, sorry.
> 

gotcha. No worries. They looked odd to me as well, so I stared
at the diff to be sure.

Bruce

> 
> On Tue, Oct 30, 2018 at 7:58 PM Bruce Ashfield 
> <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>> wrote:
> 
>     On 2018-10-30 2:51 PM, Martin Jansa wrote:
>        Agreed with Andre, also the quotes in new version don't match, which
>      > makes me wonder how well this was actually tested.
> 
>     Where are you seeing the non matching quotes ? The CC="" blocks
>     have been there for a while, and haven't caused any issues.
>     Other than that, I'm seeing matched "", '' and the entire command
>     wrapped in "".
> 
>     It was tested by running configure, definitely worked here.
> 
>     The 'yes' in the pipeline is just in case there is some kernel
>     somewhere with a patch, and the pipeline could stall. Since it
>     is the last option in the compound statement, I definitely wanted
>     it to complete.
> 
>     I can drop the yes, but I'm pretty sure the extra overhead wouldn't
>     have harmed anyone.
> 
>      >
>      > Using apostrophes inside quoted string value would make it easier
>     to see
>      > that there is extra " after the useless yes call.
> 
>     I'm still not seeing the extra quote.
> 
>     Bruce
> 
>      >
>      > On Tue, Oct 30, 2018 at 6:31 PM Andre McCurdy
>     <armccurdy@gmail.com <mailto:armccurdy@gmail.com>
>      > <mailto:armccurdy@gmail.com <mailto:armccurdy@gmail.com>>> wrote:
>      >
>      >     On Tue, Oct 30, 2018 at 10:17 AM Bruce Ashfield
>      >     <bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>
>     <mailto:bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>>>
>      >     wrote:
>      >      >
>      >      > On 10/30/18 1:02 PM, Andre McCurdy wrote:
>      >      > > On Mon, Oct 29, 2018 at 8:39 PM Bruce Ashfield
>      >      > > <bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>
>      >     <mailto:bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>>> wrote:
>      >      > >>
>      >      > >> As was warned by commit 312ee68752fa [kconfig: announce
>     removal of
>      >      > >> oldnoconfig if used], oldnoconfig has been removed from the
>      >     4.20 kernel.
>      >      > >>
>      >      > >> So we switch our default mode to olddefconfig.
>      >      > >>
>      >      > >> commit fb16d8912 [kconfig: replace 'oldnoconfig' with
>      >     'olddefconfig',
>      >      > >> and keep the old name as an alias] introduced
>     olddefconfig in
>      >     the 3.10
>      >      > >> kernel, we shuffle oldnoconfig to the fallback target.
>      >      > >>
>      >      > >> The fallback mode allows kernels between 3.10 and the
>      >     currently listed
>      >      > >> oldest kernel of 3.2 to continue to configure.
>      >      > >>
>      >      > >> Signed-off-by: Bruce Ashfield
>     <bruce.ashfield@windriver.com <mailto:bruce.ashfield@windriver.com>
>      >     <mailto:bruce.ashfield@windriver.com
>     <mailto:bruce.ashfield@windriver.com>>>
>      >      > >> ---
>      >      > >>
>      >      > >> v2: Tweaked to add a fallback mode as suggested by
>     Andre McCurdy
>      >      > >>
>      >      > >> Not for the release, just wanted to get this in the
>     queue for
>      >      > >> when master reopens so we'll be ready for 4.20+ kernel
>     versions
>      >      > >>
>      >      > >> Bruce
>      >      > >>
>      >      > >>
>      >      > >>   meta/classes/kernel.bbclass | 2 +-
>      >      > >>   1 file changed, 1 insertion(+), 1 deletion(-)
>      >      > >>
>      >      > >> diff --git a/meta/classes/kernel.bbclass
>      >     b/meta/classes/kernel.bbclass
>      >      > >> index e04d2fe00434..8fe207165ae8 100644
>      >      > >> --- a/meta/classes/kernel.bbclass
>      >      > >> +++ b/meta/classes/kernel.bbclass
>      >      > >> @@ -492,7 +492,7 @@ sysroot_stage_all () {
>      >      > >>          :
>      >      > >>   }
>      >      > >>
>      >      > >> -KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S}
>      >     CC="${KERNEL_CC}" O=${B} oldnoconfig"
>      >      > >> +KERNEL_CONFIG_COMMAND ?= "oe_runmake_call -C ${S}
>      >     CC="${KERNEL_CC}" O=${B} olddefconfig || yes '' | oe_runmake
>     -C ${S}
>      >     O=${B} CC="${KERNEL_CC}" oldnoconfig"
>      >      > >
>      >      > > There's no "yes" needed with oldnoconfig. The new fallback
>      >     should just
>      >      > > be the existing default command.
>      >      >
>      >      > *shrug*
>      >      >
>      >      > I'll leave this as is, since it works as tested. Feel free to
>      >      > send followups.
>      >
>      >     "make oldnoconfig" without the "yes" has been well tested for
>     the past
>      >     few OE releases so it's just odd you decided to change it.
>     Why did
>      >     you?
>      >
>      >      > >>   python check_oldest_kernel() {
>      >      > >>       oldest_kernel = d.getVar('OLDEST_KERNEL')
>      >      > >> --
>      >      > >> 2.5.0
>      >      > >>
>      >      > >> --
>      >      > >> _______________________________________________
>      >      > >> Openembedded-core mailing list
>      >      > >> Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>      >     <mailto:Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>>
>      >      > >>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>      >      >
>      >     --
>      >     _______________________________________________
>      >     Openembedded-core mailing list
>      > Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>      >     <mailto:Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>>
>      > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>      >
> 


