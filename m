Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 79CA761AD1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 15:27:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5JFRhJS005723
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 19 Jun 2013 08:27:43 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Wed, 19 Jun 2013 08:27:42 -0700
Message-ID: <51C1CDED.5030003@windriver.com>
Date: Wed, 19 Jun 2013 10:27:41 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <51C11201.2010306@windriver.com> <1371628610.20823.155.camel@ted>
In-Reply-To: <1371628610.20823.155.camel@ted>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Problem with buildtools-tarball / nativesdk-ncurses / nativesdk-python
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
X-List-Received-Date: Wed, 19 Jun 2013 15:27:43 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/19/13 2:56 AM, Richard Purdie wrote:
> On Tue, 2013-06-18 at 21:05 -0500, Mark Hatle wrote:
>> My host system's python version is too old due to the recent changes.  So I
>> built a temporary python 2.7.3 version.  Built the 'buildtools-tarball' and then
>> installed it.  When I switch to the included python it no longer works.
>>
>> I did some digging, the problem in the end is related to ncurses within the
>> nativesdk.
>>
>> Running the following:
>>    py_v26_check=`python -c 'import sys; print sys.version_info >= (2,6,3)'`
>> which python
>> echo "$py_v26_check" | od -c
>>    if [ "$py_v26_check" != "True" ]; then
>>            echo "BitBake requires Python 2.7.3 or later"
>>            exit 1
>>    fi
>>
>> You can see the difference in behavior:
>>
>> TERM=xterm
>>
>> /home/lmhatle/build-qemux86_64-2/buildtools/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/python
>> 0000000 033   [   ?   1   0   3   4   h   T   r   u   e  \n
>> 0000015
>> BitBake requires Python 2.7.3 or later
>>
>> -----
>>
>> TERM=vt100
>>
>> /home/lmhatle/build-qemux86_64-2/buildtools/sysroots/x86_64-wrlinuxsdk-linux/usr/bin/python
>> 0000000   T   r   u   e  \n
>> 0000005
>>
>> -----
>>
>> So as you can see specifying a different terminal type is happily changing the
>> output of python.  When I use my locally built version, I don't get the same
>> behavior.  I always get the second version.
>>
>> So is there a problem with the nativesdk python, nativesdk ncurses or???
>>
>> (I've not yet filed a bug on this, but I will if I can't figure it out soon.)
>
> We've seen this issue but I thought we'd fixed it.
>
> Which version of master did you do this with? This was supposed to be
> fixed by
> http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=c281cd149bdbce29fc69cb34c65c4295cfed2060 and http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=534c4d0f1e287d0ac82504b273a5497d3457582a

I have verified that I have both patches applied.  I will continue debugging and 
work on the strace next...

FYI this is a x86_64 - CentOS 6.4 machine if it matters..

> If you're still having problems, please strace the above python command
> and see where its looking for terminfo...
>
> Cheers,
>
> Richard
>
>


