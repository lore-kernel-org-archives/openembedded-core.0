Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QatoT-0006aX-MY
	for openembedded-core@lists.openembedded.org;
	Sun, 26 Jun 2011 20:12:05 +0200
Received: by pvf24 with SMTP id 24so2653146pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jun 2011 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+dFQ2BMsbVr+Rjhzc5x1xRcoP+4/xsea+JgjCcpWrf0=;
	b=R2b+jksdjst+15OoCkcZMRdY5q4D1xj2+sQ5AT7jJcAFbby+/T9HNOIyxjAQvfSdmQ
	CW70eHTNeCc5dg3JF/nvxDxEJLBgAAwQbdYzS/6apxl9SRbSi24Zu3NAyydSZHJPgGT6
	XtFUWjQkXq17EpQk/KEz60N8vmbWXLSRLyuOo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=VGVT2ZcChWHQQMVjnNoEACmoviEc/D7CplQX1py4NAC2my2ywGRZR/3TqNS7lSmKZQ
	y71KEd/lvNt4JpHmZJraRgyv8BjYcG1GpQGcdDTKEDksga5ACMRP7jKZ2SX/zNMorxg4
	k507kslLnu8R7kmHue94Hx1NlqFVWsVPvROAU=
Received: by 10.142.128.11 with SMTP id a11mr995379wfd.248.1309111705195;
	Sun, 26 Jun 2011 11:08:25 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w24sm3981571wfd.17.2011.06.26.11.08.24
	(version=SSLv3 cipher=OTHER); Sun, 26 Jun 2011 11:08:24 -0700 (PDT)
Message-ID: <4E077597.5090607@gmail.com>
Date: Sun, 26 Jun 2011 11:08:23 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1308592651.git.josh@linux.intel.com>	<909a6c756247a7a0f68f60a64477d4e8419ca74c.1308593086.git.josh@linux.intel.com>	<4E068312.5090507@linux.intel.com>
	<4E069A74.1070402@gmail.com> <1309109868.2120.3.camel@scimitar>
In-Reply-To: <1309109868.2120.3.camel@scimitar>
Subject: Re: [PATCH 2/2] sanity: implement network connectivity test
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
X-List-Received-Date: Sun, 26 Jun 2011 18:12:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/26/2011 10:37 AM, Joshua Lock wrote:
> On Sat, 2011-06-25 at 19:33 -0700, Khem Raj wrote:
>> On 6/25/2011 5:53 PM, Saul Wold wrote:
>>> On 06/20/2011 11:09 AM, Joshua Lock wrote:
>>>> Sanity test to verify files can be fetched from the network using git,
>>>> http
>>>> and https fetchers point users at a page to help get set up in the
>>>> case of a
>>>> failure.
>>>>
>>>> Addresses [YOCTO #933]
>>>>
>>>> Signed-off-by: Joshua Lock<josh@linux.intel.com>
>>>> ---
>>>> meta/classes/sanity.bbclass | 34 ++++++++++++++++++++++++++++++++++
>>>> 1 files changed, 34 insertions(+), 0 deletions(-)
>>>>
>>>> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
>>>> index bffa4f5..650df5f 100644
>>>> --- a/meta/classes/sanity.bbclass
>>>> +++ b/meta/classes/sanity.bbclass
>>>> @@ -35,6 +35,8 @@ def check_sanity_tmpdir_change(tmpdir, data):
>>>>
>>>> # Check that TMPDIR isn't on a filesystem with limited filename length
>>>> (eg. eCryptFS)
>>>> testmsg = check_create_long_filename(tmpdir, "TMPDIR")
>>>> + # Check that we can fetch from various network transports
>>>> + testmsg = testmsg + check_connectivity(data)
>>>> return testmsg
>>>>
>>>> def check_sanity_version_change(data):
>>>> @@ -75,6 +77,38 @@ def check_create_long_filename(filepath, pathname):
>>>> return "Failed to create a file in %s: %s" % (pathname, strerror)
>>>> return ""
>>>>
>>>> +def check_connectivity(d):
>>>> + # URI's to check can be set in the CONNECTIVITY_CHECK_URIS variable
>>>> using
>>>> + # the same syntax as SRC_URI.
>>>> + test_uris = (bb.data.getVar('CONNECTIVITY_CHECK_URIS', d, True) or
>>>> "").split()
>>>> + # If no URI's set, fallback to some default ones we know of
>>>> + if len(test_uris) == 0:
>>>> + test_uris = ["http://yoctoproject.org/about",
>>>> +
>>>> "https://eula-downloads.yoctoproject.org/crownbay/crownbay-bernard-5.0.0",
>>>>
>>>> + "git://git.yoctoproject.org/yocto-firewall-test;protocol=git;rev=HEAD"]
>>>> + retval = ""
>>
>> imo this change is yocto specific doesnt belong to core
>
> Are you objecting to the feature (testing whether the fetchers can work
> on a newly configured tmpdir) or the implementation (using
> yoctoproject.org URI's)?

the latter
>
> I can change this patch to only run the check when the
> CONNECTIVITY_CHECK_URI's and remove the default uri's. Would that make
> the change less objectionable?

yes that would be better.
>
> Joshua



