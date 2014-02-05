Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 73B8C6D16E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 18:15:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s15IEwtE004072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Feb 2014 10:14:58 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Wed, 5 Feb 2014 10:14:58 -0800
Message-ID: <52F27FA1.50906@windriver.com>
Date: Wed, 5 Feb 2014 12:14:57 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1391555891.git.mark.hatle@windriver.com>
	<89dd3d4afb4616f47edf488f5d828a123c6c11ba.1391555891.git.mark.hatle@windriver.com>
	<52F27C6C.3030408@linux.intel.com>
In-Reply-To: <52F27C6C.3030408@linux.intel.com>
Subject: Re: [v2 PATCH 2/2] useradd.bbclass: Add ability to select a static uid/gid automatically
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
X-List-Received-Date: Wed, 05 Feb 2014 18:15:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 2/5/14, 12:01 PM, Saul Wold wrote:
> On 02/04/2014 03:39 PM, Mark Hatle wrote:
>> [YOCTO #5436]
>>
>> Automatic selection of static uid/gid is needed for a dynamically generated
>> passwd and group file to have a deterministic outcome.
>>
>> When a package is installed and instructs the system to add a new user or
>> group, unless it selects a static uid/gid value, the next available uid/gid
>> will be used.  The order in which packages are installed is dynamically
>> computed, and may change from one installation to the next.  This results
>> in a non-deterministic set of uid/gid values.
>>
>> Enabling USERADD_REWRITE_PARAMS, and providing a preconfigured passwd/group
>> file will allow the continued dynamic generation of the passwd/group file
>> on the target, but ensure a deterministic outcome.  (Dynamic generation is
>> desired so that user and groups that have no corresponding functionality
>> are not present within the final system image.)
>>
>> The rewrite params function will override each of the fields in the
>> useradd and groupadd calls with the values specified.  Note, the password
>> field is ignored as is the member groups field in the group file.  If the
>> field is empty, the value will not be overridden.  (Note, there is no way
>> to 'blank' a field, as this would only generally affect the 'comment' field
>> and there really is no reason to blank it.)
>>
>> Enabling USERADD_ERROR_DYNAMIC will cause packages without static uid/gid
>> to generate an error and be skipped for the purpose of building.  This is
>> used to prevent non-deterministic behavior.
>>
>> USERADD_UID_TABLES and USERADD_GID_TABLES may be used to specify the name
>> of the passwd and group files.  By default they are assumed to be
>> 'files/passwd' and 'files/group'.  Layers are searched in BBPATH order.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>    meta/classes/useradd.bbclass         | 258 +++++++++++++++++++++++++++++++++++
>>    meta/conf/local.conf.sample.extended |  24 ++++
>>    2 files changed, 282 insertions(+)
>>
>
> This need to be split to 2 patches one for oe-core and the
> local.conf.sample.extended for poky.
>

This patch is specific to oe-core, and was NOT generated to apply to poky.

This includes the changes to the local.conf.sample.extended (located in 
meta/conf on oe-core).

http://git.openembedded.org/openembedded-core/tree/meta/conf/local.conf.sample.extended

Once this goes into oe-core, I can work on a patch for meta-yocto if desired, 
likely the hunk will just apply there as well.

--Mark


