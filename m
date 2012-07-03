Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sm6pH-0001vO-A4
	for openembedded-core@lists.openembedded.org;
	Tue, 03 Jul 2012 19:23:47 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 03 Jul 2012 10:12:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="163645874"
Received: from unknown (HELO [10.255.12.182]) ([10.255.12.182])
	by azsmga001.ch.intel.com with ESMTP; 03 Jul 2012 10:12:43 -0700
Message-ID: <4FF3280B.3020008@linux.intel.com>
Date: Tue, 03 Jul 2012 10:12:43 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1341276037-32076-1-git-send-email-sgw@linux.intel.com>
	<CABcZANnVy0B_wFyVhxz_JsipTf_PXL2ZzLU4hnNGbObDbZRDLw@mail.gmail.com>
In-Reply-To: <CABcZANnVy0B_wFyVhxz_JsipTf_PXL2ZzLU4hnNGbObDbZRDLw@mail.gmail.com>
Cc: Chris Larson <clarson@kergoth.com>
Subject: Re: [RFC v2] package.bbclass: enable the use of package_qa_handle_error
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
X-List-Received-Date: Tue, 03 Jul 2012 17:23:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/03/2012 06:55 AM, Chris Larson wrote:
> On Mon, Jul 2, 2012 at 5:40 PM, Saul Wold<sgw@linux.intel.com>  wrote:
>> This will allow the reporting of these errors as either WARNINGs (default)
>> or ERRORs if installed_vs_shipped is added to the ERROR_QA of the policy
>> file (such as a<distro_name>.conf file.
>>
>> V2: found the code I had intended to send instead of that other junk,
>>      was just not watching what I pushed on that one, sorry. (this is edit in
>>      no in the actual commit message)
>>
>> Signed-off-by: Saul Wold<sgw@linux.intel.com>
>> ---
>>   meta/classes/package.bbclass |   11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
>> index 0b98c6b..ff2ec96 100644
>> --- a/meta/classes/package.bbclass
>> +++ b/meta/classes/package.bbclass
>> @@ -988,9 +988,14 @@ python populate_packages () {
>>                                  unshipped.append(path)
>>
>>          if unshipped != []:
>> -               bb.warn("For recipe %s, the following files/directories were installed but not shipped in any package:" % pn)
>> -               for f in unshipped:
>> -                       bb.warn("  " + f)
>> +               msg = pn + ": Files/directories were installed but not shipped"
>> +               skip = (d.getVar('INSANE_SKIP_' + pn, True) or "").split()
>> +               if "installed_vs_shipped" in skip:
>> +                       bb.note("Package %s skipping QA tests: installed_vs_shipped" % pn)
>> +               else:
>> +                       package_qa_handle_error("installed_vs_shipped", msg, d)
>> +                       for f in unshipped:
>> +                               package_qa_handle_error("installed_vs_shipped", "  " + f, d)
>
> Hmm, I wonder if this is best, or if it should assemble a single
> message with newlines separating the files. *thinks*

So that would cause only 1 ERROR or WARNING count, vs N ERRORs or 
WARNIGS in the final count for every file that is listed, I think it's 
good to have the larger count it signal's something went wrong if that 
count increases greatly when a recipe is changed.

Could work either way, but I like the exaggerated count.

Sau!


