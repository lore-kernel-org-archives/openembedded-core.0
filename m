Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QippJ-0004ZO-Iy
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Jul 2011 17:33:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p6IFTeJ7020782
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jul 2011 08:29:40 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 18 Jul 2011 08:29:40 -0700
Message-ID: <4E245163.4000809@windriver.com>
Date: Mon, 18 Jul 2011 10:29:39 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.18) Gecko/20110616 Thunderbird/3.1.11
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1310969462.git.dongxiao.xu@intel.com>	<c4ca6242b49eddc218fa3c0f58d172efc1601c84.1310969462.git.dongxiao.xu@intel.com>	<FE823AAC-2695-4FB2-9E90-BCD2ED38771B@dominion.thruhere.net>	<281DBDA2-688D-4559-8191-276A44DEDF70@dominion.thruhere.net>
	<4E245054.4000303@windriver.com>
In-Reply-To: <4E245054.4000303@windriver.com>
Subject: Re: [PATCH 3/4] udev: Change hard coded /usr/lib to	support multilib
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
X-List-Received-Date: Mon, 18 Jul 2011 15:33:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Replying to myself.. sorry, I misunderstood the concern.. see below for a new
explanation..

On 7/18/11 10:25 AM, Mark Hatle wrote:
> On 7/18/11 7:32 AM, Koen Kooi wrote:
>>
>> Op 18 jul 2011, om 09:08 heeft Koen Kooi het volgende geschreven:
>>
>>>
>>> Op 18 jul 2011, om 08:13 heeft Dongxiao Xu het volgende geschreven:
>>>
>>>> Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
>>>> ---
>>>> meta/recipes-core/udev/udev-164/makefile.patch |   16 ++++++++++++++++
>>>> meta/recipes-core/udev/udev-new.inc            |    1 +
>>>> meta/recipes-core/udev/udev_164.bb             |    2 +-
>>>> 3 files changed, 18 insertions(+), 1 deletions(-)
>>>> create mode 100644 meta/recipes-core/udev/udev-164/makefile.patch
>>>>
>>>> diff --git a/meta/recipes-core/udev/udev-164/makefile.patch b/meta/recipes-core/udev/udev-164/makefile.patch
>>>> new file mode 100644
>>>> index 0000000..c46ff4b
>>>> --- /dev/null
>>>> +++ b/meta/recipes-core/udev/udev-164/makefile.patch
>>>> @@ -0,0 +1,16 @@
>>>> +Upstream-Status: Inappropriate [configuration]
>>>
>>> Could you explain why it's inappropriate for upstream but why we do need it here?
>>
>> I asked the udev maintainer:
>>
>> 14:25 < koen> kay: the udev Makefile.am has 'ln -sf $(libexecdir)/udev-acl $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck', any reason for not using ${libdir} over ${prefix}/lib ?
>> 14:29 < kay> koen: libdir is /usr/lib64 here, can't use that
>>
>> So upstream is aware of multilib, but wants to put these scripts in a non-multilib dir. Since I don't have any experience with the fedora/opensuse way of multilib nor the new oe-core one, could you please explain why oe-core needs this patch, but fedora/opensuse don't?
> 
> This is likely a problem with the multilib fix.  "libexecdir" is often /usr/lib
> on many distribuions.. however as your other email mentioned.. setting it to
> /usr/lib64 is a mistake.  It should be /usr/libexec or /usr/lib64.  All of the
> associated multilib packages should work correctly and no conflicts introduced
> with this package (file contents should be identical.)
> 
> It should be permissible for libexecdir to be changed in the configuration if
> someone really wants it to be.  By default (in bitbake.conf) it is:
> 
> export libexecdir = "${exec_prefix}/libexec"

> +-	mkdir -p $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d
> +-	ln -sf $(libexecdir)/udev-acl $(DESTDIR)$(prefix)/lib/ConsoleKit/run-seat.d/udev-acl.ck
> ++	mkdir -p $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d
> ++	ln -sf $(libexecdir)/udev-acl $(DESTDIR)$(libdir)/ConsoleKit/run-seat.d/udev-acl.ck

I see libexecdir CAN be changed.. so the above is already possible..

The part they had hard coded is "/usr/lib/ConsoleKit"...  There is only one
location in the system for ConsoleKit configuration files/scripts.. and that is
distro specific.  Assuming the oe based distributions use
$(PREFIX)/lib/ConsoleKit.. then the previous was correct.

The point being it doesn't matter if it's 32-bit, 64-bit or 24-bit...  only one
ConsoleKit per system should exist.  (There are potentially other files on the
system like this.  I know a recent RPM patch went in that separated /usr/lib/rpm
and /usr/lib64/rpm..  this is also a similar mistake, I just haven't had time to
get a patch out to revert that chunk.)

--Mark

> --Mark
> 
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



