Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CF98273D9A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 May 2015 02:32:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4F2WmGZ005128
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 14 May 2015 19:32:48 -0700 (PDT)
Received: from [128.224.163.153] (128.224.163.153) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 14 May 2015 19:32:48 -0700
Message-ID: <55555AD3.5090105@windriver.com>
Date: Fri, 15 May 2015 10:32:51 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, Randy Witt
	<randy.e.witt@linux.intel.com>
References: <cover.1431569867.git.Qi.Chen@windriver.com>
	<630a1e0551f0431f8d513f979198ee752653a5e3.1431569867.git.Qi.Chen@windriver.com>
	<5554D22E.8080900@linux.intel.com>
	<1985625.Iot5ytRCnX@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1985625.Iot5ytRCnX@peggleto-mobl.ger.corp.intel.com>
X-Originating-IP: [128.224.163.153]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/1] populate_sdk_ext: set noexec flag for some tasks
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
X-List-Received-Date: Fri, 15 May 2015 02:32:54 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/15/2015 01:10 AM, Paul Eggleton wrote:
> On Thursday 14 May 2015 09:49:50 Randy Witt wrote:
>> On 05/13/2015 07:19 PM, Chen Qi wrote:
>>> For the SDK, what we are interested in is the sysroot part. So the
>>> only useful task is do_populate_sysroot. Other tasks like do_package
>>> don't need to run. So mark them as 'noexec' for SDK.
>>>
>>> This would result in two benefits:
>>> 1) The size of extensible SDK is larged reduced. For example, extensible
>>>
>>>      SDK for core-image-minimal is reduced from 1.8G to 793M.
>>>
>>> 2) The installation time is reduced as a lot of tasks are not run.
>>>
>>> [YOCTO #7590]
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>
>>>    meta/classes/populate_sdk_ext.bbclass | 12 +++++++++++-
>>>    1 file changed, 11 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/populate_sdk_ext.bbclass
>>> b/meta/classes/populate_sdk_ext.bbclass index dc2c58e..6c265b8 100644
>>> --- a/meta/classes/populate_sdk_ext.bbclass
>>> +++ b/meta/classes/populate_sdk_ext.bbclass
>>> @@ -141,8 +141,18 @@ python copy_buildsystem () {
>>>
>>>        sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
>>>        oe.copy_buildsystem.generate_locked_sigs(sigfile, d)
>>>
>>> +    # Mark tasks to be 'noexec' for the SDK as we only need the sysroot
>>> part +    base_class_path = os.path.join(baseoutpath, core_meta_subdir,
>>> 'classes', 'base.bbclass')
>> Qi, I don't like the idea of modifying the source that is copied into the
>> sdk. Also, this will continue to persist if the user ever wants to start
>> generating images.
>>
>> Ideally, we would only modify the behavior while setting up the sdk. And
>> then the behavior afterward would remain as when using a regular bitbake
>> workspace.
> Right. In order to fix this bug we really ought to only affect what happens at
> SDK install time. If we need to inject things into the configuration just for
> that execution, one way to do that would be to create a pre/post configuration
> file and pass that into the command that gets run with -r/-R.
>
> Re allowed_tasks, don't you also need to change the recrdeptask value?
>
> I'd also like to see this configurable at SDK construction time, so you can set
> a variable to provide and install the artifacts for the rest of the tasks if
> you want to.
>
> Cheers,
> Paul
>

Hi Paul and Randy,

Thanks for your feedback.
I totally agree with you.

And I'm going to follow Paul's suggestions and make a new patch.

Best Regards,
Chen Qi


