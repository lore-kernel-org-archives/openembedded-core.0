Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id A6A02608BB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Oct 2014 12:01:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 89260314F16D;
	Fri, 24 Oct 2014 14:01:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id HCbHtn0P9xsO; Fri, 24 Oct 2014 14:01:06 +0200 (CEST)
Received: from [172.22.22.61] (55d47408.access.ecotel.net [85.212.116.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id F21E1314F16E;
	Fri, 24 Oct 2014 14:01:05 +0200 (CEST)
Message-ID: <544A3F81.7050508@opendreambox.org>
Date: Fri, 24 Oct 2014 14:01:05 +0200
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	"Burton, Ross" <ross.burton@intel.com>
References: <543ef52e.0879c20a.1785.4076SMTPIN_ADDED_BROKEN@mx.google.com>	<CANyK_8cVJEBpBWG2Nes705+1mdmT3W86izEnqYreiaCTD5yBdA@mail.gmail.com>	<CAJTo0LaPRdCw5EatHYZ0TKd1EQvy17XsfPZorC+qVocyquyUeA@mail.gmail.com>
	<CANyK_8dA9inDGDhDhb6TcZ-AbTHD5NbCJ-zB6e8m-H+TW2XFHw@mail.gmail.com>
In-Reply-To: <CANyK_8dA9inDGDhDhb6TcZ-AbTHD5NbCJ-zB6e8m-H+TW2XFHw@mail.gmail.com>
Cc: Peter Urbanec <openembedded-devel@urbanec.net>,
	OE Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3] opkg: Call prerm and postrm scripts on package upgrade.
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
X-List-Received-Date: Fri, 24 Oct 2014 12:01:17 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 24.10.2014 12:49, Paul Barker wrote:
> On 22 October 2014 23:54, Burton, Ross <ross.burton@intel.com> wrote:
>>
>> On 21 October 2014 16:40, Paul Barker <paul@paulbarker.me.uk> wrote:
>>>
>>> Sorry Peter, it looks like this patch has been corrupted as well as
>>> the one sent to the opkg-devel list. In this case I think it's mostly
>>> lines like the above which have been incorrectly wrapped.
>>>
>>> Could you resend this using 'git send-email' if possible?
>>
>>
>> Alternatively (and preferably for large numbers of patches), push your
>> changes to a git repo somewhere.
>>
>> Ross
> 
> This patch can now be marked as a backport if it is resent.
> 
> I'd probably say it shouldn't be applied in oe-core until after the
> 1.7 branch now as it's so close to release and if any prerm/postrm
> scripts don't check for an "upgrade" argument they may end up doing
> the wrong thing.
> 
> Cheers,
> 

As already pointed out in the discussion about the other patch ("Better
support for upgrading packages in opkg and update-rc.d.bbclass"),
OE-Core expects prerm and postrm scripts not to run on upgrade. Not only
with opkg, but with rpm and apt/dpkg, too. So unless we're going to
accept breaking virtually every prerm and postrm script in the OE-Core
ecosystem, somebody will need to come up with a good plan before
applying this patch, even after the release.

FWIW, it would be safe to apply if preceded by a patch making
package_ipk.bbclass inject code to skip these scripts upgrades as rpm
and deb do, effectively turning this patch into a no-op, but bringing
all package managers in line before any further changes.

Regards,
Andreas

