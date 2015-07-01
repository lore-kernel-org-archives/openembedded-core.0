Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DE1167589F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jul 2015 16:55:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 01 Jul 2015 09:55:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,387,1432623600"; d="scan'208";a="738630942"
Received: from lsandov1-mobl-linux.zpn.intel.com (HELO [10.219.4.163])
	([10.219.4.163])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jul 2015 09:55:26 -0700
Message-ID: <55941B9E.3080009@linux.intel.com>
Date: Wed, 01 Jul 2015 11:55:58 -0500
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1435663180-43011-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
	<1693409.84CV3Pd8dR@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1693409.84CV3Pd8dR@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] buildhistory.bbclass: Check output folder is present before creating files-in-$pkg.txt
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
X-List-Received-Date: Wed, 01 Jul 2015 16:55:33 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Hi Paul,

On 07/01/2015 07:54 AM, Paul Eggleton wrote:
> Hi Leonardo,
>
> On Tuesday 30 June 2015 11:19:40 leonardo.sandoval.gonzalez@linux.intel.com
> wrote:
>> From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
>>
>> This is just a safe check to make sure the output folder is present, before
>> creating the files-in-$pkg.txt file.
>>
>> Signed-off-by: Leonardo Sandoval
>> <leonardo.sandoval.gonzalez@linux.intel.com> ---
>>   meta/classes/buildhistory.bbclass | 8 +++++++-
>>   1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/classes/buildhistory.bbclass
>> b/meta/classes/buildhistory.bbclass index 8fc8a3a..cad5116 100644
>> --- a/meta/classes/buildhistory.bbclass
>> +++ b/meta/classes/buildhistory.bbclass
>> @@ -444,7 +444,13 @@ buildhistory_list_pkg_files() {
>>           # Create individual files-in-package for each recipe's package
>>           for pkgdir in $(find ${PKGDEST}/* -maxdepth 0 -type d); do
>>                   pkgname=$(basename ${pkgdir})
>> -
>> outfile="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}/${file_prefix}${pkgname}.tx
>> t" +                outfolder="${BUILDHISTORY_DIR_PACKAGE}/${pkgname}" +
>>             outfile="${outfolder}/${file_prefix}${pkgname}.txt" +
>>      # Make sure the output folder, exist so we can create the
>> files-in-$pkgname.txt file +                if [ ! -d ${outfolder} ] ; then
>> +                        bbdebug 2 "Folder ${outfolder} does not exist, file
>> ${outfile} not created" +                        continue
>
> This isn't the way we normally handle this sort of situation - we should be
> simply creating the directory unconditionally before writing the file.
>
> In any case, how is it that the directory doesn't exist at this point?
>
files-in-$pkg.txt files are created and placed on top of the 
corresponding buildhistory/packages folders. By the time this task is 
done, the latter folders are *already* created, so that is why in the 
first patch version, I did not include the check. BTW, I could not 
reproduce the issue that Andre had (failed on cairo) so I will ask him 
more detail on his setup.
> Cheers,
> Paul
>

