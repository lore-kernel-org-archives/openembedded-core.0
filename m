Return-Path: <petter@technux.se>
Received: from vsp-authed-01-02.binero.net (unknown [195.74.38.226])
	by mail.openembedded.org (Postfix) with ESMTP id 3621C605F4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 May 2014 18:13:32 +0000 (UTC)
Received: from smtp01.binero.se (unknown [195.74.38.28])
	by vsp-authed-01-02.binero.net (Halon Mail Gateway) with ESMTPS;
	Sun, 11 May 2014 20:13:45 +0200 (CEST)
Received: from [192.168.1.82] (81-229-90-163-no67.tbcn.telia.com
	[81.229.90.163]) (Authenticated sender: petter@technux.se)
	by smtp-04-01.atm.binero.net (Postfix) with ESMTPSA id 473963A11D;
	Sun, 11 May 2014 20:13:27 +0200 (CEST)
Message-ID: <536FBDC6.4090806@technux.se>
Date: Sun, 11 May 2014 20:13:26 +0200
From: =?UTF-8?B?UGV0dGVyIE1hYsOkY2tlcg==?= <petter@technux.se>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cover.1399671290.git.petter@technux.se>	
	<a517943d9b90ee7793ec9f6734a0bdd80c38d75f.1399671290.git.petter@technux.se>	
	<CAMKF1sob1+VHoBZQxjm-MkrPE02+f6JKqzGaxiNz0yNL-WA2ZQ@mail.gmail.com>	
	<df4fba969a1fcfe305dd2d3d304bfc35@technux.se>
	<1399810380.31891.110.camel@ted>
In-Reply-To: <1399810380.31891.110.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 01/13] systemtap: remove usage of FILESPATH
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
X-List-Received-Date: Sun, 11 May 2014 18:13:37 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05/11/2014 02:13 PM, Richard Purdie wrote:
> On Sun, 2014-05-11 at 00:31 +0200, petter@technux.se wrote:
>> 2014-05-10 18:58 skrev Khem Raj:
>>
>>> On Sat, May 10, 2014 at 1:05 AM, Petter Mabäcker <petter@technux.se>
>>> wrote:
>>>
>>>> +FILESEXTRAPATHS_prepend := "${THISDIR}/systemtap:"
>>> would something like
>>>
>>> FILESEXTRAPATHS =. "${FILE_DIRNAME}/systemtap:"
>>>
>>> avoid the prepend and immediate evaluation
>> I guess someone with deep bitbake knowledge can answer this better. But
>> as far as I understand, you should always use immediate evaluation when
>> using THISDIR, to be extra safe. Not sure if it's more safe to use
>> FILE_DIRNAME if you want to avoid immediate expanding when using
>> FILESEXTRAPATHS?
>>
>> The bitbake documentations says:
>>
>> "The operators "_append" and "_prepend" differ from the operators ".="
>> and "=." in that they are deferred until after parsing completes rather
>> than being immediately applied."
>>
>> Not sure if above means that "=." will also immediately expand
>> variables or not?
> They're not.
>
>> Personally I have always used FILESEXTRAPATHS_prepend :=
>> "${THISDIR}/<somename>:" like the yocto documentation recommends. But
>> sure if you can avoid immediate expanding in FILESEXTRPATHS, that would
>> mean a tiny optimization. In that case perhaps the documentation should
>> be updated as well. Looking in meta-layer both methods seems to be used.
> What Khem means is that in the case we know we're in the .bb file
> directory, we can use FILE_DIRNAME instead of using :=.
>
> Why? FILE_DIRNAME is defined as:
>
> conf/bitbake.conf:FILE_DIRNAME = "${@os.path.dirname(d.getVar('FILE'))}"
>
> FILE will point to the .bb file.
>
> Cheers,
>
> Richard
>
>
>
Ok, that makes sense. I will send up a new changeset using this method 
instead.

BR,
Petter

