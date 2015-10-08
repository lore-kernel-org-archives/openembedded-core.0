Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id CCE3465D6E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Oct 2015 12:03:56 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 652671FCD7;
	Thu,  8 Oct 2015 14:03:53 +0200 (CEST)
To: "Belal, Awais" <Awais_Belal@mentor.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1444296133-2582-1-git-send-email-awais_belal@mentor.com>
	<56163DED.2000007@pseudoterminal.org>
	<2021B186DC632746BD5A3CE32F12BD280119A897E9@EU-MBX-02.mgc.mentorg.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <56165BA9.4090104@pseudoterminal.org>
Date: Thu, 8 Oct 2015 14:03:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <2021B186DC632746BD5A3CE32F12BD280119A897E9@EU-MBX-02.mgc.mentorg.com>
Subject: Re: [PATCH] mesa-demos: fix deadlock in sharedtex_mt
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
X-List-Received-Date: Thu, 08 Oct 2015 12:03:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

A v2 would be appropriate. The line should go like this:

Upstream-Status: Submitted [https://patchwork.freedesktop.org/patch/61350/]

Am 2015-10-08 um 12:27 schrieb Belal, Awais:
> Hi Carlos,
>
> The patch submission is available at https://patchwork.freedesktop.org/patch/61350/
> Should I simply send a new patch with the same subject line or make it a v2?
>
> BR,
> Awais
>
> ________________________________________
> From: openembedded-core-bounces@lists.openembedded.org [openembedded-core-bounces@lists.openembedded.org] on behalf of Carlos Rafael Giani [dv@pseudoterminal.org]
> Sent: Thursday, October 08, 2015 2:57 PM
> To: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] mesa-demos: fix deadlock in sharedtex_mt
>
> Since this patch got submitted, is there a link to the submission?
> Perhaps to some public bugtracker entry? Does this exist for Mesa? If
> so, add it to the Upstream-Status line.
>
> Am 2015-10-08 um 11:22 schrieb Awais Belal:
>> This patch fixes a deadlock that occurs between the main
>> thread and rendering threads of the sharedtex_mt demo.
>>
>> Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> ---
>>    ...10-sharedtex_mt-fix-rendering-thread-hang.patch | 43 ++++++++++++++++++++++
>>    meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb     |  1 +
>>    2 files changed, 44 insertions(+)
>>    create mode 100644 meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
>>
>> diff --git a/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch b/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
>> new file mode 100644
>> index 0000000..1aa893b
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/mesa-demos/0010-sharedtex_mt-fix-rendering-thread-hang.patch
>> @@ -0,0 +1,43 @@
>> +From 525fa9ded72d22b53c5eb366f61e2ac1d407a2db Mon Sep 17 00:00:00 2001
>> +From: Awais Belal <awais_belal@mentor.com>
>> +Date: Thu, 8 Oct 2015 13:49:31 +0500
>> +Subject: [PATCH] sharedtex_mt: fix rendering thread hang
>> +
>> +XNextEvent is a blocking call which locks up the display mutex
>> +this causes the rendering threads to hang when they try call
>> +glXSwapBuffers() as that tries to take the same mutex in
>> +underlying calls through XCopyArea().
>> +So we only go to XNextEvent when it has at least one event
>> +and we wouldn't lock indefinitely.
>> +
>> +Signed-off-by: Awais Belal <awais_belal@mentor.com>
>> +
>> +Upstream-Status: Submitted
>> +---
>> + src/xdemos/sharedtex_mt.c | 9 +++++++--
>> + 1 file changed, 7 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/xdemos/sharedtex_mt.c b/src/xdemos/sharedtex_mt.c
>> +index a90903a..1d503c4 100644
>> +--- a/src/xdemos/sharedtex_mt.c
>> ++++ b/src/xdemos/sharedtex_mt.c
>> +@@ -420,9 +420,14 @@ Resize(struct window *h, unsigned int width, unsigned int height)
>> + static void
>> + EventLoop(void)
>> + {
>> ++   int i;
>> ++   XEvent event;
>> +    while (1) {
>> +-      int i;
>> +-      XEvent event;
>> ++      /* Do we have an event? */
>> ++      if (XPending(gDpy) == 0) {
>> ++         usleep(10000);
>> ++         continue;
>> ++      }
>> +       XNextEvent(gDpy, &event);
>> +       for (i = 0; i < NumWindows; i++) {
>> +      struct window *h = &Windows[i];
>> +--
>> +1.9.1
>> +
>> diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
>> index e451642..0094f55 100644
>> --- a/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
>> +++ b/meta/recipes-graphics/mesa/mesa-demos_8.2.0.bb
>> @@ -19,6 +19,7 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/demos/${PV}/${BPN}-${PV}.tar.bz2 \
>>        file://0007-Install-few-more-test-programs.patch \
>>        file://0008-glsl-perf-Add-few-missing-.glsl-.vert-.frag-files-to.patch \
>>        file://0009-glsl-perf-Install-.glsl-.vert-.frag-files.patch \
>> +    file://0010-sharedtex_mt-fix-rendering-thread-hang.patch \
>>    "
>>    SRC_URI[md5sum] = "72613a2c8c013716db02e3ff59d29061"
>>    SRC_URI[sha256sum] = "e4bfecb5816ddd4b7b37c1bc876b63f1f7f06fda5879221a9774d0952f90ba92"
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


