Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1R6jyS-00067G-KH
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Sep 2011 16:10:00 +0200
Received: by wyh5 with SMTP id 5so3332789wyh.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Sep 2011 07:04:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=HOodtX8Ap5d34s8BKNspyUeAn6w7nPNgbHWrKZw4B6c=;
	b=iciSewRBVnXbLSJ3ATMLq+/f1gE5Yyrx2jXshS8H6CwQFj2kHlGPTXVtZkmszbzz9W
	rGkhbf8Mv8O1gEzJ4N63kxfdeOq9kdGhcnmSRLDKgI25XwI2ts6I//kLGGWIxzY3a6R1
	FJrXVslSeCa4F0+jh0YZKnSZWssaOomAa52bs=
MIME-Version: 1.0
Received: by 10.227.2.129 with SMTP id 1mr2298223wbj.39.1316700281082; Thu, 22
	Sep 2011 07:04:41 -0700 (PDT)
Received: by 10.180.100.165 with HTTP; Thu, 22 Sep 2011 07:04:41 -0700 (PDT)
In-Reply-To: <0AEFA847-426C-4F4C-9099-A0A3B8990BE5@dominion.thruhere.net>
References: <1316297897-698-1-git-send-email-dbaryshkov@gmail.com>
	<CAP9ODKqwxc7TcZhgNtuZfan_Kbdn2hJ7UELfy=BeFtGS3iGKGQ@mail.gmail.com>
	<j5f9i0$9uf$1@dough.gmane.org>
	<95C58349-35C4-4027-BDEA-7841ED3B4A16@dominion.thruhere.net>
	<j5fbi7$opp$1@dough.gmane.org>
	<C9AF5103-2487-4DA1-A348-1E28411FAD29@dominion.thruhere.net>
	<CADkTA4Pn7enn_ocpzwAeX7si=u-+UAabjrJDwBDoC1ODQqiQZg@mail.gmail.com>
	<0AEFA847-426C-4F4C-9099-A0A3B8990BE5@dominion.thruhere.net>
Date: Thu, 22 Sep 2011 10:04:41 -0400
Message-ID: <CADkTA4PTvVVjvtCmyscG-zu-RcyTTT0Jg+8H_tL7_w4NYTk+SQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] kernel.bbclass: blacklist 'perf-dbg' as well for the modules metapackage
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 14:10:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 22, 2011 at 9:56 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
>
> Op 22 sep. 2011, om 15:28 heeft Bruce Ashfield het volgende geschreven:
>
>> On Thu, Sep 22, 2011 at 9:17 AM, Koen Kooi <koen@dominion.thruhere.net> =
wrote:
>>>
>>> Op 22 sep. 2011, om 15:00 heeft Dmitry Eremin-Solenikov het volgende ge=
schreven:
>>>
>>>> On 09/22/2011 04:35 PM, Koen Kooi wrote:
>>>>>
>>>>> Op 22 sep. 2011, om 14:25 heeft Dmitry Eremin-Solenikov het volgende =
geschreven:
>>>>>
>>>>>> On 09/18/2011 02:23 AM, Otavio Salvador wrote:
>>>>>>> I have sent this in July and it was nacked. See at
>>>>>>> https://github.com/OSSystems/oe-core/commit/5c53cbf951a11ed92fb2ad0=
837991db256c11489
>>>>>>
>>>>>> Answering the original question by Saul:
>>>>>> A possible better question is why perf-dbg is getting generated and =
what's in it?
>>>>>>
>>>>>> perf and perf-dbg are generated to contain perf tool if it's not dir=
ectly enabled (AFAIK), but you can compile it by running make in tools/perf=
. It has some additional depends (like binutils-dev, elfutils-dev, news-dev=
, etc., so it's not enabled by default. Probably we should enable it though=
.
>>>>>
>>>>> the oe core kernel.bbclass builds perf by default
>>>>
>>>> according to kernel.bbclass: "perf must be enabled in individual kerne=
l recipes"
>>>
>>> And pretty much everything uses recipes-kernel/linux/linux-tools.inc, w=
hich enables it. I had to add do_compile_perf() { : } to my old kernel reci=
pes that have a broken perf, so it's opt-out, not opt-in.
>>
>> We can always flip this around if required. When I initially did the ker=
nel
>> tree based builds for perf it was right in a specific kernel recipe, and=
 then
>> pulled it out into linux-tools.inc for easier reuse it was the intention=
 that
>> just including/requiring that .inc file would trigger a build of perf.
>
>
> I'm not complaining about perf being built, I'm complaining that the patc=
h is held up on a question why perf-dbg is getting built. If 'perf' is in t=
he blacklist, 'perf-dbg' should be in as well. If 'perf-dbg' isn't allowed =
in, take out 'perf' as well, since they are a matched pair.

Aha. Yes, I see that now. I'm generally quite bad at packaging so I sometim=
es
need to be pointed right at something :)

As for getting it in or out of the tree, I'm only one voice, but I
don't see a downside
to this being on the blacklist as well.

Cheers,

Bruce

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


