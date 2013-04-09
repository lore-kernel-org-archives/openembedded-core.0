Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1UPb49-0004aP-BI
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 18:06:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r39FnFpT029933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Apr 2013 08:49:15 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 9 Apr 2013 08:49:16 -0700
Message-ID: <51643879.30605@windriver.com>
Date: Tue, 9 Apr 2013 10:49:13 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1365438555-19397-1-git-send-email-radu.moisan@intel.com>
	<1365510909.12407.79.camel@ted>
	<CAP9ODKqEJCS56UaKT3M1cPpA-escn5f7d_kEBL2kasnLYN2avQ@mail.gmail.com>
	<3528EE5E-C07B-4EBC-83E2-B425A1DD5F22@dominion.thruhere.net>
	<BD05C246-767C-4B72-A7B7-0776A5E98355@dominion.thruhere.net>
	<1365520076.12407.88.camel@ted>
In-Reply-To: <1365520076.12407.88.camel@ted>
Subject: Re: [PATCH v2] udev: Move udevd back to /sbin
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
X-List-Received-Date: Tue, 09 Apr 2013 16:06:51 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/13 10:07 AM, Richard Purdie wrote:
> On Tue, 2013-04-09 at 16:44 +0200, Koen Kooi wrote:
>> Op 9 apr. 2013, om 16:41 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>>
>>>
>>> Op 9 apr. 2013, om 16:36 heeft Otavio Salvador <otavio@ossystems.com.br> het volgende geschreven:
>>>
>>>> On Tue, Apr 9, 2013 at 9:35 AM, Richard Purdie
>>>> <richard.purdie@linuxfoundation.org> wrote:
>>>>> On Mon, 2013-04-08 at 19:29 +0300, Radu Moisan wrote:
>>>>>> Along with v182 upgrade udevd was moved to ${base_libdir}
>>>>>> making scripts like init-live.sh to fail in finding udevd
>>>>>>
>>>>>> Fixes [Yocto #4046]
>>>>>>
>>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>>>>>> ---
>>>>>> meta/recipes-core/udev/udev.inc    |    3 ++-
>>>>>> meta/recipes-core/udev/udev_182.bb |    2 +-
>>>>>> 2 files changed, 3 insertions(+), 2 deletions(-)
>>>>>
>>>>> We needed a decision on this. I've rewritten the commit message and
>>>>> merged it. Most of the feedback was about the commit message, not the
>>>>> patch itself. There were also no better proposals for how we could
>>>>> actually fix the bugs we were seeing.
>>>>
>>>> If I read the thread right, it had two NACK's. So it wasn't a cosmetic
>>>> commit log issue.
>>>
>>> 4 replies to the patch:
>>>
>>> 1) me asking about the commit log
>>> 2) me NACK'ing the patch
>
> Without any constructive way of fixing the issues. As I've said,
> "fixing" the other scripts does not work. Nobody has proposed any
> reasonable realistic way of unbreaking the multilib support which worked
> prior to the udev upgrade. Nobody has actually taken the time to even
> understand what is breaking as far as I can tell.

Let me task a whack at this.  If the binary belongs in /usr/lib/udevd/ (or 
/lib/udevd/) then that tells me it's being treated as a libexecdir and not a 
"libdir".  So the 64-bit versions of udev should NOT be installing into 
/usr/lib64/...  (nor /usr/lib32/...)

If that is the case, and all multilibs end up in /usr/lib/udevd (or /lib/udevd) 
then the multilib system should continue to work as expected.

(Note, prefer /lib/udevd myself... but that is a separate issue.)

If this sounds reasonable, I can try to make the changes and test the multilib 
config.  But I am far from a systemd/udev expert!

--Mark

>>> 3) Otavio NACK'ing the ptch
>
> Again, not constructively. People saying "no" just because they dislike
> it doesn't really work.
>
>>> 4) RP mentioning other discussions
>>
>> And by the way, does anyone actually bother testing patches to important infrastructure like udev?
>>
>> [koen@rrMBP udev]$ git log --oneline -1
>> a866e1e udev: Move udevd back to /sbin
>>
>> [koen@rrMBP udev]$ git grep /lib/udev/udevd
>> udev/init:[ -x /lib/udev/udevd ] || exit 1
>> udev/init:    /lib/udev/udevd -d
>> udev/udev-cache:[ -x /lib/udev/udevd ] || exit 1
>>
>> So the patch broke the sysvinit script, congratulations!
>
> Patch screw up :(. This will get fixed shortly, sorry about that.
>
> Cheers,
>
> Richard
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



