Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RApzh-000223-VC
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 23:24:14 +0200
Received: by yxj17 with SMTP id 17so3888260yxj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 14:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1aFXYSoEOzCQl4iE0lGrF/+xHENCRCFr/JRR1SpElPY=;
	b=gTIgwGz5+8Y8DjIxVipCWrlmRs5pe/ftGeC6RD4ncrnvm2IkMKvy2YvhwVWGWqv4bE
	CQh+hfFuXk4yTN1qGfSH6oqzjowVpFRqBWgNai5xxphCLc8ujc5aGnNjwBFlLBT5HUXS
	JQyxIK58bDlrypv0OHwRqSBq+ORpKwlv2sfzg=
Received: by 10.236.157.161 with SMTP id o21mr2543183yhk.72.1317676720978;
	Mon, 03 Oct 2011 14:18:40 -0700 (PDT)
Received: from [172.23.2.133] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id p14sm39480258anh.25.2011.10.03.14.18.39
	(version=SSLv3 cipher=OTHER); Mon, 03 Oct 2011 14:18:40 -0700 (PDT)
Message-ID: <4E8A26AD.3060101@gmail.com>
Date: Mon, 03 Oct 2011 14:18:37 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1317660469.13337.16.camel@phil-desktop>
	<CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
In-Reply-To: <CAEsOVNcZbs3TBQiBYnpzk4UgbfSwFYNHfkChhjN3FOcjnp4qUw@mail.gmail.com>
Subject: Re: sstate_clean() overzealous?
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
X-List-Received-Date: Mon, 03 Oct 2011 21:24:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/3/2011 2:11 PM, McClintock Matthew-B29882 wrote:
> On Mon, Oct 3, 2011 at 11:47 AM, Phil Blundell<philb@gnu.org>  wrote:
>> The sstate_clean() function in sstate.bbclass is doing (inter alia):
>>
>>     stfile = d.getVar("STAMP", True) + ".do_" + ss['task']
>>     [...]
>>     oe.path.remove(stfile + ".*")
>>     oe.path.remove(stfile + "_setscene" + ".*")
>>
>> which means that, for tasks which set the stamp-extra-info flag to
>> ${MACHINE}, it ends up blowing away the stamps for all machines rather
>> than just the current one.  The net effect of this seems to be that
>> there is no way to have the setscene stamps populated for more than one
>> MACHINE at any time, and hence all those tasks get rerun every time you
>> change MACHINE even if nothing else has been altered.
>>
>> Is this behaviour deliberate?  It is certainly a little bit annoying but
>> I don't understand the internals of sstate well enough to judge what
>> exactly that glob is trying to accomplish.
>
> I've noticed that changing the MACHINE will also invalidate the
> -native stuff as well.

hmmm so we can not share sstate parts for two machines in same tmpdir ?

>
> -M
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



