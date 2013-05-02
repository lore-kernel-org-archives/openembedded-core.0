Received: from mail-pb0-f49.google.com ([209.85.160.49])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UXvMl-0003JF-1v
	for openembedded-core@lists.openembedded.org;
	Thu, 02 May 2013 17:24:19 +0200
Received: by mail-pb0-f49.google.com with SMTP id rp8so389283pbb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 May 2013 08:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=7bRuaKDDjWqKpkw6++27kxqkvWT1HgAsdAK4rx0Bioc=;
	b=ZGwIxFFpJ0stt/UAXYP4vkz2AQDXqj3p6npr0eN8eEPnKKaVHdfnYnalGqxeYjEpZ2
	Ga7x1RFfDdtFT3dH0ej4+R/r3iCgkep+KZO2mtC+CxclV1uoE22VwJfbbnW19JaXcYF5
	mICSawjwtHOUVBePGM0ma6NyJwF6yXd9ZtwOfvwzrkHp22xOROQrlLwRfU+H7ScNp3Kw
	NieGM8vgQZ4sIJD6X/F74SlZWtG+JTVevNR6orCiP000YFHEUgADPpd/VitAJqyvpUCD
	vFbuNcvXMxc/9m6CT1V05+ro00b3VeCRZI8KRRNj5dLubc10MFR0iiQBiHH1NGQLA2bZ
	cWRA==
X-Received: by 10.68.114.100 with SMTP id jf4mr9262206pbb.144.1367507180461;
	Thu, 02 May 2013 08:06:20 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id z8sm7663819pbt.23.2013.05.02.08.06.17
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 02 May 2013 08:06:19 -0700 (PDT)
Message-ID: <51827FD1.603@gmail.com>
Date: Fri, 03 May 2013 01:01:37 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: ml@communistcode.co.uk
References: <CAJTo0LZ2ox=zgiAHS=DnbF9cv+vofjZpbqy8i0KEa6t1gezJPw@mail.gmail.com>
	<5102423C.4010408@intel.com> <511CF540.6090302@communistcode.co.uk>
	<CAJTo0LYa4cR+7-v91dhKieEttJOq0eMUEW3Yoz_aP9KaU06AfQ@mail.gmail.com>
	<511D0669.6020903@communistcode.co.uk>
	<20130221222728.GA1833@sakrah.homelinux.org>
	<512738BF.9000404@communistcode.co.uk>
	<51277D87.3090703@communistcode.co.uk>
	<512785CE.5020508@communistcode.co.uk>
	<516BF98C.2080603@communistcode.co.uk>
	<20130415131058.GB10628@jama.dyndns-home.com>
	<516C0484.7050402@communistcode.co.uk>
In-Reply-To: <516C0484.7050402@communistcode.co.uk>
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: systemd: /run directory not created
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 May 2013 15:24:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 15/04/2013 11:45 PM, Jack Mitchell wrote:
> On 15/04/13 14:10, Martin Jansa wrote:
>> On Mon, Apr 15, 2013 at 01:58:52PM +0100, Jack Mitchell wrote:
>>> Ok, I have just come back to trying out the new systemd implementation,
>>> and this bug still exists.
>>>
>>> Exactly the same error as before:
>>>
>>> [    2.390730] systemd[1]: Failed to mount /run: No such file or 
>>> directory
>>>
>>> Can we shed any light on why this directory is failing to be created 
>>> and
>>> what can be done to fix it. Having looked in my final target filesystem
>>> there are no links to the volatiles in /var/voltatile/* to /*, should
>>> there be? The base-files packages looks like it should do it but
>>> obviously something is going wrong.
>>>
>>>     for d in ${volatiles}; do
>>>       ln -sf volatile/$d ${D}${localstatedir}/$d
>>>     done
>> We're using base-files bbappend to create it and also replacing few
>> symlinks to volatile with real directories (not mandatory for systemd
>> iirc, but useful in some cases).
>>
>> https://github.com/shr-distribution/meta-smartphone/commit/24161eed3c185867b2fd91aab6532f370d327cdd 
>>
>>
>
> Ok, manually adding /run to 775dirs in a base-files append fixed this 
> for me. I still don't understand why this should be needed as an 
> addition though...
>
I get this error booting hdddirect/vmdk image (no initrd) but not when 
booting hddimg (uses initrd).

Regards,
Jonathan


