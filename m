Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id B376E60797
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 16:49:31 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 22 Mar 2016 09:49:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="673910084"
Received: from unknown (HELO [10.252.9.96]) ([10.252.9.96])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 09:45:47 -0700
User-Agent: Microsoft-MacOutlook/0.0.0.160212
Date: Tue, 22 Mar 2016 18:45:46 +0200
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>,
	Ross Burton <ross.burton@intel.com>
Message-ID: <E68880E6-BE8C-4694-AF55-7ED1900A3A32@linux.intel.com>
Thread-Topic: [OE-core] [PATCH v2] base.bbclass wipe ${S} before unpacking
	source
References: <1458631473-22563-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1458631473-22563-2-git-send-email-markus.lehtonen@linux.intel.com>
	<1458632871.20442.26.camel@linuxfoundation.org>
In-Reply-To: <1458632871.20442.26.camel@linuxfoundation.org>
Mime-version: 1.0
Subject: Re: [PATCH v2] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Tue, 22 Mar 2016 16:49:31 -0000
Content-type: text/plain;
	charset="UTF-8"
Content-transfer-encoding: 7bit

On 22/03/16 09:47, "Richard Purdie" <richard.purdie@linuxfoundation.org> wrote:


>On Tue, 2016-03-22 at 09:24 +0200, Markus Lehtonen wrote:
>> Make sure that we have a pristine source tree after do_unpack.
>> 
>> [YOCTO #9064]
>> 
>> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
>> ---
>>  meta/classes/base.bbclass | 12 ++----------
>>  1 file changed, 2 insertions(+), 10 deletions(-)
>> 
>> diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
>> index 1372f38..aa107d4 100644
>> --- a/meta/classes/base.bbclass
>> +++ b/meta/classes/base.bbclass
>> @@ -133,23 +133,15 @@ python base_do_fetch() {
>>  
>>  addtask unpack after do_fetch
>>  do_unpack[dirs] = "${WORKDIR}"
>> +do_unpack[cleandirs] = "${@d.getVar('S', True) if d.getVar('S',
>> True) != d.getVar('WORKDIR', True) else ''}"
>
>Should this be else '${S}/patches'?
>
>If we don't do that, there might be a case where we don't clean up the
>patches directory when we could/should compared to the existing code?

Yes, it should. Good catch, thank you Richard!

Cheers,
  Markus


