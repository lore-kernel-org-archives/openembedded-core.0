Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 097526B3F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 14:46:17 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6UEkIKR029427
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jul 2013 07:46:18 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.230) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 30 Jul 2013 07:46:18 -0700
Message-ID: <51F7D1BB.8010405@windriver.com>
Date: Tue, 30 Jul 2013 09:46:19 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1375136787-18139-1-git-send-email-otavio@ossystems.com.br>
	<14478313.i1FmA8Di2T@helios>
	<CAP9ODKogS69N51YxJ54-saCXbS0orquD8cbFCWWKLosE_TjSeg@mail.gmail.com>
	<1375186489.13247.55.camel@phil-desktop.brightsign>
	<CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
In-Reply-To: <CAP9ODKrC8koJjy-1P82wJ5UrP8Yqp_sQhCFDqqjsGe_Gyv-NSQ@mail.gmail.com>
Subject: Re: [PATCH] base.bbclass: Add support to EXTRA_DISTRO_FEATURES
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
X-List-Received-Date: Tue, 30 Jul 2013 14:46:18 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/30/13 7:24 AM, Otavio Salvador wrote:
> On Tue, Jul 30, 2013 at 9:14 AM, Phil Blundell <pb@pbcl.net> wrote:
>> On Tue, 2013-07-30 at 09:00 -0300, Otavio Salvador wrote:
>>> To make this, we cannot reuse Poky distro for example as it
>>> /unconditionally/ appends to DISTRO_FEATURES. Besides it is easier for
>>> test to be able to override it using local.conf. For products I agree
>>> we'll end adding a distro to make it reprodicable but for development
>>> stage this trick makes life much easier.
>>
>> Surely for one-off tests you can just write out the whole intended value
>> of DISTRO_FEATURES in your local.conf.  It doesn't seem as though this
>> variable is unwieldy enough that it really needs mechanical handling.
>>
>> As for poky appending to DISTRO_FEATURES rather than just setting it,
>> that sounds like it's arguably a bug in poky and you should perhaps take
>> it up with those guys.  Of course, they might take the view that poky
>> itself is meant to be determining what DISTRO_FEATURES it wants and they
>> don't want to support or encourage random frobbing of flags by third
>> parties, and I think that'd be an understandable position.
>>
>>> We call it and /finalize/ the database so it has _append/_prepend
>>> resolved before mangling the list.
>>
>> That seems a bit unwholesome in itself.  Are you sure there are no
>> potential bad consequences from calling finalize() there?
>
> No; I am not sure. What I know is it has been being used by meta-metro
> and O.S. Systems distribution without issues for a while and it solves
> the problem I have.
>
> Adding /full/ distro features list is ugly and easy to get wrong. This
> seems much better for user IMO.

I agree with the previous folks that the design of the distribution setting the 
one and true value is the right technical answer for this.  HOWEVER, in my 
experience, this is NOT what end users want.

They want a method similar to the one posted by Otavio in order to tailor the 
system.  End users never want to create a new distribution, they simply want to 
start with one and tweak it.

So with that said, my opinion is to enable this code, allowing end users to 
tweak their distribution settings.  But make it a stated policy that 
distribution layers should only "set" the value of DISTRO_FEATURES, and should 
never modify/update this new EXTRA_DISTRO_FEATURES value.  (Of course, I doubt 
there is a way to police that, other then state it's policy.)

This is the same type of reason that end users was a "don't install this 
package" feature as well.  While anyone can write a new image recipe, nobody 
wants to, especially when they only want one or two less packages in their image.

--Mark

> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://projetos.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


