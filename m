Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 45DB8730E3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Mar 2017 16:50:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v2DGoNMw028436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Mar 2017 09:50:23 -0700 (PDT)
Received: from soho-mhatle-m.local (172.25.36.230) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 13 Mar 2017 09:50:23 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20170311052758.19671-1-pkj@axis.com>
	<6a4f5fdd-18ea-4851-b2ec-4e889d7c012f@windriver.com>
	<3589dcdb5a884da8a4aafc12a7122959@XBOX02.axis.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <45145706-6456-2045-feec-b2d68e355908@windriver.com>
Date: Mon, 13 Mar 2017 11:50:22 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <3589dcdb5a884da8a4aafc12a7122959@XBOX02.axis.com>
Subject: Re: [PATCH] useradd-staticids.bbclass: Support recipes specifying static IDs
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
X-List-Received-Date: Mon, 13 Mar 2017 16:50:27 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 3/13/17 11:11 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: Mark Hatle [mailto:mark.hatle@windriver.com]
>> Sent: den 13 mars 2017 14:56
>> To: Peter Kjellerstedt; openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH] useradd-staticids.bbclass: Support
>> recipes specifying static IDs
>>
>> On 3/10/17 11:27 PM, Peter Kjellerstedt wrote:
>>> If this bblcass is used and a recipe specifies a static ID for a
>>> user/group as part of the USERADD_PARAM_${PN} or GROUPADD_PARAM_${PN},
>>> the build would fail with and error like this if there was no
>>> corresponding ID in the passwd/group files specified via
>>> USERADD_UID_TABLES/USERADD_GID_TABLES:
>>
>> If the system is set in warning mode, it should warn if this is done
>> (but allow it).
>>
>> If the system is set to error mode, it should error.
>>
>> The useradd-staticids class is expecting the files (tables) to contain
>> all of the entries.  This is specifically to avoid the situation where 
>> a new recipe is introduced that adds a new user or group (dynamic or 
>> static -- static because it could conflict with one of your existing 
>> static entries.)
> 
> AFAICT, even before my rewrite of much of this code in 3149319a and 
> subsequent correction in adc0f830, if a static ID was specified as part 
> of USERADD_PARAM_${PN} then no error would be issued. However, we can 
> certainly change the code to always fail/warn if no ID is specified 
> in any of the passwd/groups files. It should just be a matter of 
> removing the if statements preceding the calls to handle_missing_id() 
> below. (I will do some verification and send an updated patch tomorrow 
> if this is the way the class should work.)

The intention was always that the uname/gname had to be specified in the useradd
tables in some way, or a warning/error would occur.

If the fields were blank in the tables, the system would use the versions
located in the recipe -- otherwise it would use the version in the table.  (At
one point, but I don't think this was ever pushed in -- if a static ID was set
in the recipe, there was a verification that the static version in both the
recipe and the table files was the same -- otherwise it could indicate the
package may not be built properly.)

>> I agree the error message below looks wrong, do the existing warning/
>> error messages about it not being defined int he useradd tables still 
>> occur with this patch?
> 
> The error message below occurred because before my fix it forgot all 
> the parameters that were specified in USERADD_PARAM_${PN} when it took 
> the continue.

Ok, we need to fix that bug first then.

We should then verify the second issue and fix it in a subsequent commit.  The
key being that of the user/group was not in the table we warn them (or error) --
preventing unexpected users from showing up.

The check both static IDs are the same could very well be a TODO item (that is
never done) -- but something that should be considered.

Thanks!
--Mark

>> --Mark
>>
>>>   ERROR: meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb:
>>>   meta-oe/recipes-support/postgresql/postgresql_9.4.11.bb inherits
>>>   useradd but doesn't set USERADD_PARAM, GROUPADD_PARAM or
>>>   GROUPMEMS_PARAM for package postgresql
>>>
>>> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>>> ---
>>>  meta/classes/useradd-staticids.bbclass | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/meta/classes/useradd-staticids.bbclass
>> b/meta/classes/useradd-staticids.bbclass
>>> index a65c3f69cb..9b194df490 100644
>>> --- a/meta/classes/useradd-staticids.bbclass
>>> +++ b/meta/classes/useradd-staticids.bbclass
>>> @@ -125,6 +125,7 @@ def update_useradd_static_config(d):
>>>              if uaargs.LOGIN not in users:
>>>                  if not uaargs.uid or not uaargs.uid.isdigit() or not uaargs.gid:
>>>                      handle_missing_id(uaargs.LOGIN, 'user', pkg)
>>> +                newparams.append(param)
>>>                  continue
>>>
>>>              field = users[uaargs.LOGIN]
>>> @@ -260,6 +261,7 @@ def update_useradd_static_config(d):
>>>              if gaargs.GROUP not in groups:
>>>                  if not gaargs.gid or not gaargs.gid.isdigit():
>>>                      handle_missing_id(gaargs.GROUP, 'group', pkg)
>>> +                newparams.append(param)
>>>                  continue
>>>
>>>              field = groups[gaargs.GROUP]
>>>
> 


