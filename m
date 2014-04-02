Return-Path: <paul.betafive@gmail.com>
Received: from mail-vc0-f173.google.com (mail-vc0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id AB7066FAC8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 17:32:12 +0000 (UTC)
Received: by mail-vc0-f173.google.com with SMTP id il7so779638vcb.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Apr 2014 10:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=qauElLYN6lAIm7HSytskUCJ1clZVwOICZSjEkzvEOqE=;
	b=LWJt8oDOEW8AweQ/ruVxDK7VtMO0DIHJaMUmP/w1SHEx+vUcS1juVRBPtZPSyN40Iv
	qtO89JbHiIMXaUMT3mN1KqKCISjSPEPnzQx6LI8sC6KRexJm5JttLJrELdLRUQxDkssk
	7YNak7Dt+XJVqEXLOkaFeDSPcgvD63l80ROoecVGIS0/7aT+aqRfcZpmjWYJYCcW2fZ3
	LrxgQrj1ncNOH7RAFsu9XbTDFHI7LFSY45nq7JmUq1DiU5+pQMCDYcWyvZDOFe5BGn1h
	5BId0/R/iFk9BYsycH0sK/OVtWsQ6/cYnOkJ3iHb8XHkm6nW7nHNO2odhBfz2vtJ3onC
	ZbJA==
X-Received: by 10.52.120.6 with SMTP id ky6mr1951698vdb.38.1396459933061; Wed,
	02 Apr 2014 10:32:13 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Wed, 2 Apr 2014 10:31:32 -0700 (PDT)
In-Reply-To: <533AC392.1000604@windriver.com>
References: <cover.1395816581.git.liezhi.yang@windriver.com>
	<7bb935ada71d07f3496a2ff8d2d73fe003e09a4f.1395816581.git.liezhi.yang@windriver.com>
	<CANyK_8dNLRkz68AzGTQhOCx_rX=rzJhAjiRfKbyzHjkA28=UQA@mail.gmail.com>
	<533A17B0.5080108@windriver.com>
	<CANyK_8cr88xbYcQTjf4hppA+nh-+3LNkwpPm7ynF+USLKo64ng@mail.gmail.com>
	<1396355498.5879.31.camel@phil-desktop.brightsign>
	<CANyK_8dUrG9BQMCSwhB3v5dzF9PWmOWndyrsrMs+-zkiWo2sug@mail.gmail.com>
	<533AC392.1000604@windriver.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Wed, 2 Apr 2014 18:31:32 +0100
X-Google-Sender-Auth: dgPcf1DMoNOT79hEu2aal9tLhBo
Message-ID: <CANyK_8cJVwOJZR5Gox6HNr5tV-=kmhWBQkPFOcz-bsHpGHBR4w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] util-linux-native: fix qsort_r for CentOS 5.10
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
X-List-Received-Date: Wed, 02 Apr 2014 17:32:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 1 April 2014 14:48, Robert Yang <liezhi.yang@windriver.com> wrote:
>
>
> On 04/01/2014 08:34 PM, Paul Barker wrote:
>>
>> On 1 April 2014 13:31, Phil Blundell <pb@pbcl.net> wrote:
>>>
>>> On Tue, 2014-04-01 at 12:41 +0100, Paul Barker wrote:
>>>>
>>>> The more I look at it the more I don't like this patch. It's probably
>>>> a very rarely used code path but it could blow up if it's called. C
>>>> provides no guarantees that calling a 3-argument function with only 2
>>>> arguments will work. Depending on calling convention it could easily
>>>> result in stack corruption on some platforms.
>>>>
>>>> I'd suggest we try reverting the relevant bits of the upstream change
>>>> from qsort to
>>>> qsort_r:
>>>> http://git.kernel.org/cgit/utils/util-linux/util-linux.git/commit/?id=c69bbca9c1f6645097bd20fe3a21f5a99a2a0698
>>>>
>>>> I think it should just be the first 3 patch hunks in that commit.
>>>
>>>
>>> It seems vanishingly unlikely that anybody is seriously going to try to
>>> use fdisk from util-linux-native to manipulate Sun partition tables and,
>>> that being the case, it's presumably going to be quite hard to test any
>>> such change.  Maybe we should just turn off support for these fringe
>>> partition table types altogether.
>>>
>>
>> That may be a much, much easier fix.
>
>
> Thank you very much, I will send a patch later:-)
>

Sorry to confuse the matter further but it seems Khem has also made a
fix for this which removes qsort_r in a more reliable way, along with
removing a few other non-posix compliant bits:
http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/musl&id=0e0d93d8d5fdcdc9cbcd9da2be1d0193a06d3188

I'm happy with that fix, could you let me know if it works for you Robert?

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

